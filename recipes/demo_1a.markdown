---
layout:     demo_1
title:      Demo 1a
---

This page demonstrates a relatively simple SPARQLy GUIs recipe.
It accepts user input, creates and sends a SPARQL query to DBpedia,
then displays the results in tabular and graphic form.

The query asks for the most populous countries in the world,
based on the `populationEstimate` attribute.
To give the demonstration a try, set the Row Limit (if desired),
then click the "Run Query" button.

<ul>
  <b>Row Limit:</b>
  <select name="limit" id="set_limit">
    <option>5</option>
    <option>10</option>
    <option selected="selected">20</option>
    <option>40</option>
  </select>
  &nbsp;
  <button id="run_query">Run Query</button>
</ul>


## Output

DBpedia's information is harvested from Wikipedia,
which is hand-edited by volunteers.
So, certain values below may be incorrect or even missing.
For example, some of the listed "countries" below may look peculiar
and some expected countries (eg, USA) may not be present.

### Table

<ul>
  <div id="sparql_table">
    This will be a table...
  </div>
</ul>

### Graph

To keep the graph headings reasonable,
we divide the values by 1,000,000 and round the result.
So, for example, a heading of 600 represents
a human population estimate of 600,000,000.

<ul>
  <div id="sparql_graph">
    This will be a bar graph...
  </div>
</ul>


## Implementation Notes


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
* the `param` (eg, `populationEstimate`)
* the `limit` (eg, 20) on `rows`

{% include demo_1/sparql_template_a.html %}

*Note:*
Jekyll, used by GitHub Pages, handles inclusion processing (etc)
by means of Liquid.
Unfortunately, some of the syntax used by Liquid and Handlebars
(eg, <tt>{&#123; ... &#125;}</tt>, <tt>{&#123;{ ... }&#125;}</tt>) collides.
So, we are using a slightly modified version of the Handlebars syntax
(eg, <tt>{| ... |}</tt>, <tt>{|| ... ||}</tt>).


### SPARQL query

Here is the actual SPARQL query, as sent to DBpedia:

<blockquote>
  <div id="sparql_query">
    This will be a SPARQL query...
  </div>
</blockquote>
