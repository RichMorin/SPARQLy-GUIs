---
layout:   default
title:    Resources

_cs:      http://coffeescript.org

_dj:      http://mbostock.github.com/d3

_ej:      http://emberjs.com

_gdu:     https://github.com/documentcloud/underscore
_gmj:     https://github.com/mojombo/jekyll
_gsl:     https://github.com/Shopify/liquid
_gwh:     https://github.com/wycats/handlebars.js

_jq:      http://jquery.com
_jqa:     http://api.jquery.com
_jqd:     http://docs.jquery.com

_md:      http://daringfireball.net/projects/markdown

_rj:      http://requirejs.org

_rsql:    http://www.w3.org/TR/rdf-sparql-query
_rsqt:    'SPARQL Query Language for RDF'

_us:      http://underscorejs.org
_us_cs:   http://jashkenas.github.com/coffee-script/documentation/docs/underscore.html
_us_js:   http://documentcloud.github.com/underscore/docs/underscore.html

_wp:      http://en.wikipedia.org/wiki
---

This project uses a number of external resources
(eg, infrastructure, JavaScript libraries):

* Infrastructure:
  [GitHub             ](#github),
  [Jekyll             ](#jekyll),
  [Liquid             ](#liquid),
  [Markdown           ](#markdown),
  [Semantic Web       ](#semantic_web)

* JavaScript:
  [CoffeeScript       ](#coffeescript),
  [D3                 ](#d3),
  [Ember              ](#ember),
  [Handlebars         ](#handlebars),
  [jQuery             ](#jquery)
  [Underscore         ](#underscore),

See below for specific information, links, etc.


## Specifics


### CoffeeScript

I prefer CoffeeScript to JavaScript.
The syntax is cleaner, more powerful, and safer (by default).
That said, JavaScript is certainly allowed in recipes.

* [CoffeeScript             ]({{ page._cs }})


### D3

D3 is an extremely flexible library for generating graphics,
based on dynamic DOM manipulation, SVG, etc.

* [D3                       ]({{ page._dj }})

* [API                      ]({{ page._dj }}/api)


### Ember

Ember is a very promising framework for single-page web applications.
We are watching it closely,
but at present we are only using the Handlebars component.

* [Ember                    ]({{ page._ej }})


### GitHub

GitHub is a collaborative workspace for software development, etc.
It is very popular among Open Source projects (eg, Linux, Ruby).
GitHub Pages publishes selected sets of GitHub files as web pages;
we use this to publish our recipes, documentation, etc.

* [GitHub                   ](https://github.com/)
* [GitHub Pages             ](http://pages.github.com/)


### Handlebars

Handlebars (actually, part of Ember)
is a client-side semantic templating system.
I use it to generate SPARQL queries, reports, etc.


* [Handlebars             ](http://handlebarsjs.com)

* [wycats/handlebars.js   ]({{ page._gwh }})


### Jekyll

Jekyll is an automated system for processing sets of files
into web content, using Liquid, Markdown, etc.

* [mojombo/jekyll         ]({{ page._gmj }})

* [mojombo/jekyll/wiki    ]({{ page._gmj }}/wiki)

  * [Configuration        ]({{ page._gmj }}/wiki/configuration)
  * [Liquid Extensions    ]({{ page._gmj }}/wiki/liquid-extensions)
  * [Usage                ]({{ page._gmj }}/wiki/usage)
  * [Template Data        ]({{ page._gmj }}/wiki/Template-Data)
  * [YAML Front Matter    ]({{ page._gmj }}/wiki/yaml-front-matter)


### jQuery

jQuery is the Swiss Army Knife of JavaScript.
It greatly simplifies many web development tasks.

* [jQuery                 ]({{ page._jq }})

* [API                    ]({{ page._jqa }})

  * [jQuery.get           ]({{ page._jqa }}/jQuery.get)

* [Documentation          ]({{ page._jqd }}/Main_Page)


### Liquid

Liquid provides server-side includes, variable interpolation, etc.

* [Liquid                 ](http://liquidmarkup.org/)

* [Shopify/liquid         ]({{ page._gsl }})

* [Shopify/liquid/wiki    ]({{ page._gsl }}/wiki)

  * [Liquid Extensions    ]({{ page._gsl }}/wiki/liquid-for-designers)


### Markdown

Markdown is a simple, attractive markup syntax for generating HTML.
When it runs out of steam, raw HTML can be included.

* [Markdown               ]({{ page._md }})

  * [Basics               ]({{ page._md }}/basics)
  * [Dingus               ]({{ page._md }}/dingus)
  * [License              ]({{ page._md }}/license)
  * [Syntax               ]({{ page._md }}/syntax)


### Semantic Web

[JSON-LD          ]({{ page._wp }}/JSON-LD) is a
[JSON             ]({{ page._wp }}/JSON) dialect for use with
[Linked Data      ]({{ page._wp }}/Linked_data).
[SPARQL           ]({{ page._wp }}/SPARQL) is a
[Semantic Web     ]({{ page._wp }}/Semantic_Web)
[query language   ]({{ page._wp }}/query_language) supported by
[RDF              ]({{ page._wp }}/RDF)
[Triplestores     ]({{ page._wp }}/Triplestore).


### Underscore

Underscore provides a nice set of convenience functions,
borrowed from functional programming, Ruby, etc.

* [Underscore               ]({{ page._us }})

* Annotated source code
  *  [underscore.cs ]({{ page._us_cs }})
  *  [underscore.js ]({{ page._us_js }})
