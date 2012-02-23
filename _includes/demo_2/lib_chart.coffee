# lib_chart.coffee - chart support for demo_2
#
# This file contains CoffeeScript code to support chart creation.
# It is included by Demo_1, a "SPARQLy GUIs" recipe.
#
# The code uses the D3.js library to generate SVG nodes.
# It was adapted from A Bar Chart, Part 1, by Mike Bostock.
# Written by Rich Morin, CFCL, 2012.

  do_chart = (data) ->
  #
  # Create a chart (ie, bar graph, histogram) from data
  # returned from the SPARQL query.

#   alert('do_chart') #T

    rows    = data.results.bindings
    vals    = (parseInt(row['param']['value']) for row in rows)
    vals    = (val for val in vals when val < 15000)

    x_lim   = 420
    y_lim   = vals.length * 20

    xf      = d3.scale.linear()
                .domain([0, d3.max(vals)])
                .range( [0, x_lim])

    yf      = d3.scale.ordinal()
                .domain(vals)
                .rangeBands([0, y_lim])

    c1  = new_chart('#sparql_graph', x_lim, y_lim)
    add_x_axis_lines(c1, xf, y_lim)
    add_x_axis_names(c1, xf)
    add_bar_rects(c1, vals, xf, yf)
    add_bar_text( c1, vals, xf, yf)
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

  add_bar_rects = (chart, data, xf, yf) ->
  #
  # Add rectangles to serve as bars.

    chart.selectAll('rect')
      .data(data)
      .enter().append('rect')
      .attr('y',                  yf)
      .attr('width',              xf)
      .attr('height',             yf.rangeBand())
      .style('stroke',            'white')
      .style('fill',              'steelblue')

  add_bar_text = (chart, data, xf, yf) ->
  #
  # Add text to annotate bars.

    chart.selectAll('.bar')
      .data(data)
      .enter().append('text')
      .attr('class',              'bar')
      .attr('x',                  xf)
      .attr('y',                  (d) -> yf(d) + yf.rangeBand() / 2 )
      .attr('dx',                 -3)
      .attr('dy',                 '.35em')
      .attr('text-anchor',        'end')
      .style('fill',              'white')
      .text(String)
