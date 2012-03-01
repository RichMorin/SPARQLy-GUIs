---
# docs/howto.markdown

layout:   docs
title:    HowTo
---

## Dependencies

### JavaScript

The framework only uses client-side JavaScript,
so it doesn't require node.js, etc.
It uses several JavaScript libraries, but includes copies of them.
So, nothing to see here; move along...


### Ruby

Recent releases of Mac OS X (10.5 or later) include solid,
if somewhat dated, Ruby environments:

* Leopard (10.5) includes version 1.8.6.
* Snow Leopard and Lion include version 1.8.7.

So, for simplicity, we suggest that you use only version 1.8.6 features
unless there is a compelling reason to use something from a later version.


### Ruby Gems

* Jekyll requires the `classifier`, `directory_watcher`, `liquid`,
  `maruku`, and `open4` gems.
  These are automatically installed by the `gem install jekyll` command.

* `_bin/layouts` requires the `yaml` gem.


## Installation

* Make sure you have the dependencies.

* Go to GitHub and fork a copy of the project.

* Clone the fork to your development machine.


## Trial use

* Start a "shell" window (eg, in Terminal).

* `cd` to the project directory.

* run `jekyll --server`

* In a browser, go to http://0.0.0.0:4000

You should see the same "Index" page that appears on GitHub Pages.
Try a demo or two, as a further sanity check...


## Trial modification

* Edit a Markdown file (eg, `index.markdown`)
  making a minor, but visible change in its rendered appearance.

* run `_bin/layouts`

* run `jekyll --server`

* In a browser, go to http://0.0.0.0:4000

You should see the modified "Index" page.
