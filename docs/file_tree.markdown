---
# docs/file_tree.markdown

layout:   docs
title:    File Tree
---

Our file tree layout is fairly regular, if a bit sprawly.
In part, this reflects our use of DRY (Don't Repeat Yourself) approaches
and "convention over configuration" (both inspired from Ruby on Rails).

The use of lots of directories and files has good and bad points.
The structure is easy to navigate, once learned,
but learning it could be a challenge for newcomers.
However, the following notes may help...

<ul>
  <pre>
_bin
| _includes/            # used by Liquid's "include" directive
| | scripts/            # eg, CoffeeScript, JavaScript
| | | demo_1/*.coffee   # CoffeeScript used by demo_1
| | | ...
| | styles/             # eg, CSS, SASS
| | | default.html      # used by ordinary pages
| | | demo_2.html       # used by demo_2
| | text/               # eg, Markdown
| | | demo_1/           # text files used by demo_1
| | | | copy_1.txt      # textual "copy"
| | | | ...
| | | | tmpl_sq_b.txt   # SPARQL query templates
| _layouts/
| | default.html        # used by ordinary pages
| | g_demo.html         # generic layout template
| | s_demo_*.html       # specific layouts
| _potions/
| | _ext_js.yml         # layout file path mappings
| | demo_*.yml          # layout configurations
| _site/                # static site, from Jekyll
| | docs/               # processed documentation pages
| | external/           # copied (etc) JS files from ../docs
| | recipes/            # processed recipe pages
| docs/*.markdown       # top-level code for docs
| external/*.js         # external JavaScript libraries
| recipes/*.markdown    # top-level code for recipes
  </pre>
</ul>
