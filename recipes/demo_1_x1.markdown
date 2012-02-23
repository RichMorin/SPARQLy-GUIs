---
layout:     recipe_x1
title:      Demo 1

_cs_code:   |
  <script type="text/coffeescript">
  # <![CDATA[
  {% include demo_1/lib_chart.coffee %}
  {% include demo_1/lib_query.coffee %}
  {% include demo_1/lib_table.coffee %}
  {% include demo_1/main.coffee %}
  # ]]>
  </script>

_foozle:    Foozle!
---

This page demonstrates a relatively simple SPARQLy GUIs recipe.
It accepts user input, creates and sends a SPARQL request to DBpedia,
and displays the results in tabular and graphic form.

To give the demonstration a try, set the row limit (if desired),
then click the "Run Query" button.

<ul>
  <b>Row limit:</b>
  <select name="limit" id="set_limit">
    <option>10</option>
    <option>15</option>
  </select>
  &nbsp;
  <button id="run_query">Run Query</button>
</ul>


## Output

### Table

<ul>
  <div id="sparql_table">
    This will be a table...
  </div>
</ul>

### Graph

Query results are quite likely to be noisy.
This isn't a problem for a table, but it can confuse the graphing code.
So, a bit of filtering may be needed.
In this case, we only accept values under 15000.

<ul>
  <div id="sparql_graph">
    This will be a bar graph...
  </div>
</ul>


## Implementation

### SPARQL template

Like SQL queries, each SPARQL query has a fixed function.
In order to use queries for varying tasks,
we'll need a way to generate appropriate queries.

We do this by means of a query template,
written in a combination of SPARQL and Handlebars.
Variable information is provided by client-side code,
based on user input, etc.

The following template, in particular, defines several parts of the query:

* definitions for `prefixes`
* the `param` (eg, `elevationFt`)
* the `limit` (eg, 10) on `rows`

{% include demo_1/sparql_template.html %}

*Note:*
Jekyll, used by GitHub Pages, handles inclusion processing (etc)
by means of Liquid.
Unfortunately, some of the syntax used by Liquid and Handlebars
(eg, <tr>{&#123; ... &#125;}</tr>) collides.
So, we are using a slightly modified version of the Handlebars syntax
(eg, <tr>{| ... |}</tr>, <tr>{|| ... ||}</tr>).

### SPARQL query

Here is the actual SPARQL query, as sent to DBpedia:

<blockquote>
  <div id="sparql_query">
    This will be a SPARQL query...
  </div>
</blockquote>
