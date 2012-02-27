# _includes/demo_1/lib_table.coffee - table support functions
#
# This file contains CoffeeScript code to support table creation.
#
# Written by Rich Morin, CFCL, 2012.

  do_table = (data) ->
  #
  # Create a table from data returned from the SPARQL query.

#   alert('do_table') #T

    names     = data.head.vars
    rows      = data.results.bindings

    base_html = '<table></table>'
    table_div = $('#sparql_table')
    table_div.html(base_html)

    table     = $('#sparql_table table')
    table.append( get_hdr_html() )
    table.append( get_row_html(row) ) for i, row of rows


  get_hdr_html = () ->
  #
  # Generate HTML for a table header row.

    html = '''
      <th align="right">param</th>
      <th>&nbsp;&nbsp;</th>
      <th align="left" >label</th>
    '''

    $('<tr></tr>').append(html)


  get_row_html = (row) ->
  #
  # Generate HTML for a table data row.

    label   = row['label']['value']
    param   = add_commas( row['param']['value'] )

    html = """
      <td align='right'>#{ param }</td>
      <td>&nbsp;&nbsp;</td>
      <td align='left' >#{ label }</td>
    """

    $('<tr></tr>').append(html)
