# demo_2/lib_chart.coffee - chart support functions
#
# This file contains CoffeeScript code to support chart creation.
# It is included by Demo_1, a "SPARQLy GUIs" recipe.
#
# The code uses the D3.js library to generate SVG nodes.
# It was adapted from "A Bar Chart, Part 1", by Mike Bostock.
# Written by Rich Morin, CFCL, 2012.


  bar_rects = (chart, rows, xf, yf) ->
  #
  # Add rectangles to serve as bars.
  #
  # @param  chart   [String]        CSS selector pattern
  # @param  rows    [Array<Hash>]   data rows
  # @param  xf      [Function]      X scaling function
  # @param  yf      [Function]      Y scaling function
  # @return         [void]

    title = (d) ->
      label   = d['label']['value']
      param   = d['param']['value']
      "#{ label } (#{ add_commas(param) })"

    xfl   = (d) ->  xf( d['param']['scaled'] )
    yfl   = (d) ->  yf( d['param']['scaled'] )

    bar_attrs =
      class:      'bar'
      height:     yf.rangeBand()
      width:      xfl
      y:          yfl

    chart.selectAll('rect.bar')
      .data(rows)
      .enter().append('rect')
      .call(set_attrs, bar_attrs)
      .append('title').text(title)


  do_chart = (data) ->
  #
  # Create a chart (ie, bar graph, histogram).
  #
  # @param  data    [Object]  data from getJSON call
  # @return         [void]

#   alert('do_chart') #T
#   alert( JSON.stringify(data) ) #T

    rows    = data.results.bindings

    for row in rows
      value   = parseInt(row['param']['value'])
      scaled  = Math.round(value/1000000)
      row['param']['scaled'] = scaled

    vals    = (row['param']['scaled'] for row in rows)
    x_lim   = 420
    y_lim   = vals.length * 10

    xf      = d3.scale.linear()
                .domain([0, d3.max(vals)])
                .range( [0, x_lim])

    yf      = d3.scale.ordinal()
                .domain(vals)
                .rangeBands([0, y_lim])

    c1  = new_chart('#sparql_graph', x_lim, y_lim)

    x_axis_lines(c1, xf, y_lim)
    x_axis_names(c1, xf)
    bar_rects(c1, rows, xf, yf)
    x_start_line(c1, y_lim)


  new_chart = (pattern, x_lim, y_lim) ->
  #
  # Create a chart object (ie, SVG node for D3)
  #
  # @param  pattern   [String]   CSS selector pattern
  # @param  x_lim     [Integer]  X limit, in pixels
  # @param  y_lim     [Integer]  Y limit, in pixels
  # @return           [void]

    $(pattern).html('')

    svg = d3.select(pattern).append('svg')
      .attr('class',              'chart')
      .attr('height',             y_lim + 20)
      .attr('width',              x_lim + 20)

    svg.append('g')
      .attr('transform', 'translate(10,15)')


  set_attrs = (object, hash) ->
  #
  # Set multiple attributes for a D3 object, based on a hash.
  #
  # @param  object  [Object]  input object
  # @param  hash    [Object]  input hash
  # @return         [void]

    object.attr(key, val) for key, val of hash


  x_axis_lines = (chart, xf, y_lim) ->
  #
  # Add lines to annotate the x-axis.
  #
  # @param  chart   [String]    CSS selector pattern
  # @param  xf      [Function]  X scaling function
  # @param  y_lim   [Integer]   Y limit, in pixels
  # @return         [void]

    line_attrs =
      class:              'x_axis'
      x1:                 xf
      x2:                 xf
      y1:                 0
      y2:                 y_lim

    chart.selectAll('line.x_axis')
      .data(xf.ticks(10))
      .enter().append('line')
      .call(set_attrs, line_attrs)


  x_axis_names = (chart, xf) ->
  #
  # Add names to annotate the X-axis.
  #
  # @param  chart   [String]    CSS selector pattern
  # @param  xf      [Function]  X scaling function
  # @return         [void]

    text_attrs =
      class:            'x_axis'
      dy:               -3
      'text-anchor':    'middle'
      x:                xf
      y:                0

    chart.selectAll('text.x_axis')
      .data(xf.ticks(10))
      .enter().append('text')
      .call(set_attrs, text_attrs)
      .text(String)


  x_start_line = (chart, y_lim) ->
  #
  # Add a line at the start of the X-axis.
  #
  # @param  chart   [String]    CSS selector pattern
  # @param  y_lim   [Integer]   Y limit, in pixels
  # @return         [void]

    line_attrs =
      class:            'x_start'
      y1:               0
      y2:               y_lim

    chart.append('line')
      .call(set_attrs, line_attrs)
