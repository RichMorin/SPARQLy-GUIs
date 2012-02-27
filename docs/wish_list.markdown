---
# docs/wish_list.markdown

layout:   level_1
title:    Wish List
---

## Deployment and development modes

Deployment mode should be optimized for rapid execution
and minimal load on the server.
Development mode should be optimized for debugging.

In Deployment mode:

* External libraries should be stored and loaded
  in a filtered, minified, and catenated format.

* Internal libraries should be loaded from JavaScript.

In Development mode:

* External libraries should be loaded as full versions.

* Internal libraries should be compiled from JavaScript,
  either on the server or (optionally) the client.
