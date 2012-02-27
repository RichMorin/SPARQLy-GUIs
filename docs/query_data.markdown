---
# docs/query_data.markdown

layout:   default
title:    Query Data
---

The `$.getJSON` function (used for SPARQL queries) calls a specified
function (eg, `do_output`) with a JSON-derived data structure.
The data "rows" look like:

<ul>
  <pre>
[
  {
    "param":   {
      "datatype":  "http://www.w3.org/2001/XMLSchema#int",
      "type":      "typed-literal",
      "value":     "127960000"
    },

    "label":  {
      "type":      "literal",
      "xml:lang":  "en",
      "value":     "Japan"
    }
  },

  ...
]
  </pre>
</ul>