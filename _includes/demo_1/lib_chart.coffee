# demo_1/lib_chart.coffee - chart support functions
#
# This file contains CoffeeScript code to support chart creation.
# It is included by Demo_1, a "SPARQLy GUIs" recipe.
#
# The code uses the D3.js library to generate SVG nodes.
# It was adapted from "A Bar Chart, Part 1", by Mike Bostock.
# Written by Rich Morin, CFCL, 2012.

# The do_chart method is called with a JSON-derived data structure, eg:
#
#   [
#     {
#       "param":   {
#         "datatype":  "http://www.w3.org/2001/XMLSchema#int",
#         "type":      "typed-literal",
#         "value":     "127960000"
#       },
#   
#       "label":  {
#         "type":      "literal",
#         "xml:lang":  "en",
#         "value":     "Japan"
#       }
#     }, ...
#   ]

  do_chart = (data) ->
  #
  # Create a chart (ie, bar graph, histogram) from data
  # returned from the SPARQL query.

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
    add_x_axis_lines(c1, xf, y_lim)
    add_x_axis_names(c1, xf)
    add_bar_rects(c1, rows, xf, yf)
    add_x_axis_start(c1, y_lim)

  new_chart = (pattern, x_lim, y_lim) ->
  #
  # Create a chart object (ie, SVG node for D3).

    $(pattern).html('')
    d3.select(pattern).append('svg')
      .attr('class',              'chart')
      .attr('width',              x_lim + 20)
      .attr('height',             y_lim + 20)
      .style('font',              '10px sans-serif')
      .style('shape-rendering',   'crispEdges')
      .append('g')
      .attr('transform', 'translate(10,15)')

  add_x_axis_lines = (chart, xf, y_lim) ->
  #
  # Add lines to annotate the x-axis.

    chart.selectAll('line')
      .data(xf.ticks(10))
      .enter().append('line')
      .attr('x1',                 xf)
      .attr('x2',                 xf)
      .attr('y1',                 0)
      .attr('y2',                 y_lim)
      .style('stroke',            '#ccc')

  add_x_axis_names = (chart, xf) ->
  #
  # Add names to annotate the x-axis.

    chart.selectAll('.rule')
      .data(xf.ticks(10))
      .enter().append('text')
      .attr('x',                  xf)
      .attr('y',                  0)
      .attr('dy',                 -3)
      .attr('text-anchor',        'middle')
      .text(String)

  add_x_axis_start = (chart, y_lim) ->
  #
  # Add a line at the start of the x-axis.

    chart.append('line')
      .attr('y1',                 0)
      .attr('y2',                 y_lim)
      .style('stroke',            '#000')

  add_bar_rects = (chart, rows, xf, yf) ->
  #
  # Add rectangles to serve as bars.

    title = (d) ->
      label   = d['label']['value']
      param   = d['param']['value']
      "#{ label } (#{ add_commas(param) })"

    xfl   = (d) ->  xf( d['param']['scaled'] )
    yfl   = (d) ->  yf( d['param']['scaled'] )

    chart.selectAll('rect')
      .data(rows)
      .enter().append('rect')
      .attr('y',                  yfl)
      .attr('width',              xfl)
      .attr('height',             yf.rangeBand())
      .style('stroke',            'white')
      .style('fill',              'steelblue')
      .append('title')
      .text(title)

  add_commas = (value) ->
  #
  # Add commas to a value (eg, "1,234")
  #
  # Adapted from formatCommas() function,
  # in Danny Goodman's "JavaScript & DHTML Cookbook".

    re  = /(-?\d+)(\d{3})/
    while re.test(value)
      value = value.replace(re, "$1,$2")
    value