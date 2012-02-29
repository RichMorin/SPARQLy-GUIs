---
# docs/wish_list.markdown

layout:   default
title:    Wish List
---

## Development and Production modes

Development mode should be optimized for debugging.
Production mode should be optimized
for rapid execution and minimal load on the server.


### Development mode

* External libraries should be loaded as full versions.

* Internal libraries should be compiled from JavaScript,
  either on the server or (optionally) the client.


### Production mode

* External libraries should be stored and loaded
  in a filtered, minified, and catenated format.

* Internal libraries should be loaded from JavaScript.


### Current status

* The `external` directory contains minified and full versions
  of most of the external libraries we use.

* The `layouts` script generates specific layouts,
  based on `_potions/*.yml`.
  It attempts to use the requested type (eg, `dev`),
  but falls back to other types if need be.

* Internal libraries are used in CoffeeScript form.
