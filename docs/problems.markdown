---
# docs/problems.markdown

layout:   default
title:    Known Problems
---

## Jekyll server can't handle `--auto` option

A current Jekyll server, running on OSX 10.6.8 and Ruby 1.8.7,
prints a nastygram when the `--auto` option is used:

<ul><pre>
$ jekyll --pygments --safe --server --auto

Configuration from .../Jekyll/_config.yml
/Library/Ruby/Gems/1.8/gems/directory_watcher-1.4.1/lib/directory_watcher/
  em_scanner.rb:10:in `send':
    undefined method `kqueue' for EventMachine:Module (NoMethodError)
  from .../directory_watcher/em_scanner.rb:10
  ...
</pre></ul>


## Syntax collisions between Liquid and Handlebars

Both Liquid (used by Jekyll) and Handlebars
use the "{&#123; ... &#125;}" notation.

Getting these strings past Liquid to Handlebars can be done,
but it's a nuisance.
Our current workaround, for example,
is to use "{| ... |}" and "{|| ... ||}"
in place of "{&#123; ... &#123;}" and "{&#123;{ ... }&#123;}".

Liquid's `raw` tag provides a reasonably convenient solution,
but the version of Liquid used by Jekyll on GitHub Pages
does not yet support this tag.


## SPARQL query time-outs on server

It's not unusual for a SPARQL query to time out on the server.
Demo_1, for example, timed out occasionally when we were searching
for the Cities with the highest elevation.

WIP: Catch time-outs and display a nastygram.
