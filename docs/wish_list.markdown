---
# docs/wish_list.markdown

layout:   docs
title:    Wish List
---

## Development and Production modes

Development mode should be optimized for debugging.
Production mode should be optimized for rapid loading
and minimal impact on the server (ie, GitHub Pages).


### Development mode

* External libraries should be loaded as full versions.

* Internal libraries should be compiled into JavaScript on the server.


### Production mode

* All libraries should be stored and loaded in minified, catenated format.


### Current status

* The `external` directory contains minified and full versions
  of most of the external libraries we use.

* The `layouts` script generates specific layouts,
  based on `_potions/*.yml`.
  It attempts to use the requested type (eg, `dev`, `prod`),
  bailing out if it can't find the needed information, etc.

* Internal libraries are loaded in full CoffeeScript form
  and compiled on the client.
