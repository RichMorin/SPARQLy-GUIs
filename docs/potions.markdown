---
# docs/potions.markdown

layout:   default
title:    Potions
---

There are some tasks which need to be handled before Jekyll runs.
So, we have some small scripts (ie, potions) that perform these tasks

## `_bin/layouts` - create recipe-specific layout files

Each recipe has specific requirements
(eg, CoffeeScript and CSS files, external JavaScript libraries).
The most reasonable way to provide this information to Jekyll
is in the form of a recipe-specific "layout" file.

However, maintaining these files by hand is tedious and error-prone.
So, `layouts`) performs this task.
When run, it examines the `_potions` directory,
looking for YAML control files (eg, `demo_2.yml`).

The `layouts` section of these files tells the script
what need to be done for the corresponding recipe.
The generic input files (eg, `g_demo.html`)
and specific output files (eg, `s_demo_2.html`)
are stored in the `_layouts` directory.
