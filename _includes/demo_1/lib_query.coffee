# lib_query.coffee - query support for demo_1
#
# This file contains CoffeeScript code to support SPARQL queries.
# It is included by Demo_1, a "SPARQLy GUIs" recipe.
#
# Written by Rich Morin, CFCL, 2012.

# The do_output method is called with a JSON-derived data structure, eg:
#
#   [
#     {
#       "param":   {
#         "datatype":  "http://www.w3.org/2001/XMLSchema#int",
#         "type":      "typed-literal",
#         "value":     "70007000"
#       },
#   
#       "label":  {
#         "type":      "literal",
#         "xml:lang":  "en",
#         "value":     "Coshocton, Ohio"
#       }
#     }, ...
#   ]

  do_output = (data) ->
  #
  # Create all of the desired output.

    do_chart(data)
    do_table(data)

  do_query = (event) ->
  #
  # Create and send the query, then process the result.

#   alert('do_query') #T

    $('#sparql_table').html('Working...')
    $('#sparql_graph').html('Working...')

    # Assemble the Handlebars context structure,
    # then create a SPARQL query from the template.

    limit = $('select#set_limit').attr('value')

    context    =
      limit:      limit
      param:      'dbpp:elevationFt'
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
  # Convert our markup into Handlebars format.

    b2  = '{' + '{'
    b3  = '{' + '{' + '{'

    text.replace(/\{\|\|/g,   b3)
        .replace(/\|\|}/g,    '}}}')
        .replace(/\{\|/g,     b2)
        .replace(/\|}/g,      '}}')

  get_src = (pattern) ->
  #
  # Get HTMLized source code, killing entities.

    $(pattern).html().replace(/&amp;/g, '&')
                     .replace(/&lt;/g,  '<')
                     .replace(/&gt;/g,  '>')

  put_esc = (pattern, code_raw) ->
  #
  # Set HTMLized source code, adding entities.

    code_esc  = code_raw.replace(/</g, '&lt;')
    $(pattern).html("<pre>#{ code_esc }</pre>")

  query_url = (base_url, query) ->
  #
  # Create the (GET) URL for the SPARQL query.

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
