---
# index.markdown

layout:   default
title:    Index

_gsg:     https://github.com/RichMorin/SPARQLy-GUIs

_osll:    University_of_Illinois/NCSA_Open_Source_License
_oslt:    University of Illinois / NCSA Open Source License

_rsg:     http://richmorin.github.com/SPARQLy-GUIs

_wp:      http://en.wikipedia.org/wiki
---

## Description

These pages are a start on a collaborative testbed for interactive "recipes",
using a mix of web-based [resources](docs/resources.html).
It should be possible to use any recipe by navigating to its generated page.


## Recipes

* [Demo_1a      ](recipes/demo_1a.html)
  <p/>
  Creates a SPARQL query, sends it to DBpedia,
  and displays the results as a table and a bar chart.

* [Demo_1b      ](recipes/demo_1b.html)
  <p/>
  Same as Demo_1a, but uses Liquid's `raw` tag instead
  of modified syntax (eg,  `{| ... |}`)
  to get around the Handlebars/Liquid syntax conflict.
  <p/>
  *Note:* As of 2012.0223, this demo does not work on GitHub Pages.

* [Demo_2       ](recipes/demo_2.html)
  <p/>
  Same as Demo_1a, but refactored and annotated.


## Implementation

The recipe source code is stored in the `gh-pages` branch
of a GitHub project, eg:

> [{{ page._gsg }}/tree/gh-pages]({{ page._gsg }}/tree/gh-pages)

When the project is updated,
GitHub generates a corresponding set of HTML (etc) files, eg:

> [{{ page._rsg }}]({{ page._rsg }})

Once these files are loaded into the browser, they act independently.

More documentation is available [here](docs).

### Dependencies

Each recipe has its own dependencies,
depending on the task(s) it is intended to perform.
See each recipe's source code for specifics.

Common dependencies include:

* JavaScript Libraries
  <p/>
  [CoffeeScript   ](http://coffeescript.org/),
  [D3             ](http://mbostock.github.com/d3),
  [Ember          ](http://emberjs.com),
  [jQuery         ](http://jquery.com),
  [Mustache       ]({{ page._wp }}/Mustache_%28template_system%29),
  [Underscore     ](http://underscorejs.org/),
  ...

* Linked Data and Semantic Web tools
  <p/>
  [JSON-LD        ](http://json-ld.org/),
  [SPARQL         ]({{ page._wp }}/SPARQL),
  ...


### Modification

Recipes can be forked and modified, as desired.
You can download this project in either
[zip]({{ page._gsg }}/zipball/master) or
[tar]({{ page._gsg }}/tarball/master) format.
You can also clone the project
with <a href="http://git-scm.com">Git</a> by running:

<pre>
  $ git clone git://github.com/RichMorin/SPARQLy-GUIs
</pre>

Get/view the source code on GitHub:
[RichMorin/SPARQLy-GUIs ]({{ page._gsg }})


## Administrivia


### Author / Contact

Rich Morin (rdm@cfcl.com)


### License

[{{ page._osll }}]({{ page._wp }}/{{ page._osll }})
