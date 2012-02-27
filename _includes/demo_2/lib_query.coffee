# _includes/demo_2/lib_query.coffee - query support functions
#
# This file contains CoffeeScript code to support SPARQL queries.
# It is included by Demo_1, a "SPARQLy GUIs" recipe.
#
# Written by Rich Morin, CFCL, 2012.


  add_commas = (value) ->
  #
  # Add commas to a value (eg, "1,234").
  #
  # @param  value   [String]  input value
  # @return         [String]  modified value
  #
  # Adapted from formatCommas() function,
  # in Danny Goodman's "JavaScript & DHTML Cookbook".
 
    reg_exp  = /(-?\d+)(\d{3})/

    while reg_exp.test(value)
      value = value.replace(reg_exp, "$1,$2")

    value


  do_output = (data) ->
  #
  # Create all of the desired output.
  #
  # @param  data    [Object]  data from getJSON call
  # @return         [void]

    do_chart(data)
    do_table(data)


  do_query = (event) ->
  #
  # Create and send the query, then process the result.
  #
  # @param  event   [Event?]  input e
  # @return         [void]

#   alert('do_query') #T

    $('#sparql_table').html('Working...')
    $('#sparql_graph').html('Working...')

    # Assemble the Handlebars context structure,
    # then create a SPARQL query from the template.

    limit = $('select#set_limit').attr('value')

    context    =
      limit:      limit
      param:      'dbpp:populationEstimate'
      prefixes:   [
        'dbpo:  <http://dbpedia.org/ontology/>'
        'dbpp:  <http://dbpedia.org/property/>'
      ]

    base_url   = 'http://DBpedia.org/sparql'
    tmpl_src   = get_src('pre#sparql_template')
    tmpl_src   = fix_markup(tmpl_src)
    tmpl_bin   = Handlebars.compile(tmpl_src)
    query      = tmpl_bin(context)
    put_esc('div#sparql_query', query)

    try
      $.getJSON(query_url(base_url, query), {}, do_output)
    catch error
      alert(error)


  fix_markup = (text) ->
  #
  # Convert our markup (if need be) into Handlebars format.
  #
  # @param  text    [String]  input markup text
  # @return         [String]  converted markup text

    b2  = '{' + '{'
    b3  = '{' + '{' + '{'

    text.replace(/\{\|\|/g,   b3)
        .replace(/\|\|}/g,    '}}}')
        .replace(/\{\|/g,     b2)
        .replace(/\|}/g,      '}}')


  get_src = (pattern) ->
  #
  # Get HTMLized source code, killing entities.
  #
  # @param  pattern   [String]  CSS selector pattern
  # @return           [String]  HTMLized source code

    $(pattern).html().replace(/&amp;/g, '&')
                     .replace(/&lt;/g,  '<')
                     .replace(/&gt;/g,  '>')


  put_esc = (pattern, code_raw) ->
  #
  # Set HTMLized source code, adding entities.
  #
  # @param  pattern   [String]  CSS selector pattern
  # @param  code_raw  [String]  "raw" source code
  # @return           [void]

    code_esc  = code_raw.replace(/</g, '&lt;')
    $(pattern).html("<pre>#{ code_esc }</pre>")


  query_url = (base_url, query) ->
  #
  # Create the (GET) URL for the SPARQL query.
  #
  # @param  base_url  [String]  base for output URL
  # @param  query     [String]  SPARQL query
  # @return           [String]  generated URL

    params   =
      debug:                'on'
      'default-graph-uri':  'http://dbpedia.org'
      fname:                ''
      format:               'application/sparql-results+json'
      query:                query
      save:                 'display'

    out = base_url + '?'

    for key, val of params
      out += "#{ key }=#{ encodeURIComponent(val) }&"

    out
