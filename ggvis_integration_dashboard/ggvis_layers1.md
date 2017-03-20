# Layers
Ethel Ruan  
2017-02-11  



In ggvis, there are two types of layers. Simple layers correspond directly to vega marks and represent geometric primitives like points, lines and rectangles. Compound layers combine data transformations with one or more simple layers.

#Marks

Marks are the fundamental building block. Each type of mark represents a different type of geometric object, and so in some sense they are the equivalent of geoms in ggplot2. However, there are a far fewer marks than geoms because marks tend to be more capable, and because they never perform any statistical transformation.

Most of the time you don’t use marks directly - you instead use their layer wrappers. That’s because most of the time you don’t want to think about the difference between simple and compound layers - you just want to make a plot. But if you want to understand more deeply how things work, or create your own layer functions, it’s important to understand the distinction.

`ggvis` exposes **five vega marks** that have very similar ggplot2 equivalents:

```
    mark_area() = geom_ribbon(), geom_area()
    mark_path() = geom_path(), geom_line()
    mark_rect() = geom_rect(), geom_bar(), geom_tile()
    mark_point() = geom_point()
    mark_text() = geom_text()
```
There are two marks that have no equivalent in ggplot2:

   -  `mark_arc()` allows you to draw **arcs**. You could accomplish something similar in ggplot2 with `geom_rect(`) with `coord_polar()` but it was relatively inflexible and required contorting your brain a bit.

  - `mark_image()` allows you to place arbitrary images on a plot. There is currently little additional support for this in ggvis, so you’ll need to make sure the images are publicly available somewhere. If you’ve found a compelling use-case for `layer_image()`, let us know so we can consider how to better support it.

And two vega marks that are not currently implemented in ggvis:

   - Support for the group mark will be added in a future major release that will add support for facetting/subplots.

   - I can’t currently see any use for the path mark, which takes svg path specifications as input.

All marks take two optional arguments which are only needed if you want to override the values inherited from parent:

   - props, a `props()` object used to add any custom override for this layer
   - data, an optional dataset to override the data inherited from the parent

#Adding a layer to a plot

For example, the following two plots are equivalent. In the first one, the data and props are defined at the top level and inherited by the mark, and in the second, they are defined in the mark itself. Note that the order of the arguments to ggvis() and the mark function are different: this is because you’ll usually set the data in top-level plot object, and usually only override（重载） props in the mark.

```r
library(ggvis)
```

```
## Warning: package 'ggvis' was built under R version 3.3.2
```

```r
# the data and props are defined at the top level and inherited by the mark
mtcars %>% ggvis(x = ~wt, y = ~mpg, stroke := "red") %>% layer_points()
```

<!--html_preserve--><div id="plot_id773858196-container" class="ggvis-output-container">
<div id="plot_id773858196" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id773858196_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id773858196" data-renderer="svg">SVG</a>
 | 
<a id="plot_id773858196_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id773858196" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id773858196_download" class="ggvis-download" data-plot-id="plot_id773858196">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id773858196_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "stroke": {
            "value": "red"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id773858196").parseSpec(plot_id773858196_spec);
</script><!--/html_preserve-->

```r
#data and props are defined in the mark itself
mtcars %>% ggvis() %>% layer_points(x = ~wt, y = ~mpg, stroke := "red")
```

<!--html_preserve--><div id="plot_id844344776-container" class="ggvis-output-container">
<div id="plot_id844344776" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id844344776_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id844344776" data-renderer="svg">SVG</a>
 | 
<a id="plot_id844344776_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id844344776" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id844344776_download" class="ggvis-download" data-plot-id="plot_id844344776">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id844344776_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "stroke": {
            "value": "red"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id844344776").parseSpec(plot_id844344776_spec);
</script><!--/html_preserve-->

#Mark details

The following sections describe particular details related to individual marks.

##`layer_rects`

**Must set two of x, x2, and width, and two of y, y2 and height.**

If you have an ordinal scale, set width and/or height to `prop_band()` to occupy the complete band corresponding to that categorical value.

```r
hec <- as.data.frame(xtabs(Freq ~ Hair + Eye, HairEyeColor))
hec %>% ggvis(~Hair, ~Eye, fill = ~Freq) %>% 
  layer_rects(width = band(), height = band())
```

<!--html_preserve--><div id="plot_id900873837-container" class="ggvis-output-container">
<div id="plot_id900873837" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id900873837_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id900873837" data-renderer="svg">SVG</a>
 | 
<a id="plot_id900873837_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id900873837" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id900873837_download" class="ggvis-download" data-plot-id="plot_id900873837">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id900873837_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "Freq": "number"
        }
      },
      "values": "\"Freq\",\"Hair\",\"Eye\"\n68,\"Black\",\"Brown\"\n119,\"Brown\",\"Brown\"\n26,\"Red\",\"Brown\"\n7,\"Blond\",\"Brown\"\n20,\"Black\",\"Blue\"\n84,\"Brown\",\"Blue\"\n17,\"Red\",\"Blue\"\n94,\"Blond\",\"Blue\"\n15,\"Black\",\"Hazel\"\n54,\"Brown\",\"Hazel\"\n14,\"Red\",\"Hazel\"\n10,\"Blond\",\"Hazel\"\n5,\"Black\",\"Green\"\n29,\"Brown\",\"Green\"\n14,\"Red\",\"Green\"\n16,\"Blond\",\"Green\""
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n5\n119"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"Black\"\n\"Brown\"\n\"Red\"\n\"Blond\""
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"Brown\"\n\"Blue\"\n\"Hazel\"\n\"Green\""
    }
  ],
  "scales": [
    {
      "name": "fill",
      "domain": {
        "data": "scale/fill",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": ["#132B43", "#56B1F7"]
    },
    {
      "type": "ordinal",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "name": "x",
      "points": false,
      "sort": false,
      "range": "width",
      "padding": 0.1
    },
    {
      "type": "ordinal",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "name": "y",
      "points": false,
      "sort": false,
      "range": "height",
      "padding": 0.1
    }
  ],
  "marks": [
    {
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "fill": {
            "scale": "fill",
            "field": "data.Freq"
          },
          "x": {
            "scale": "x",
            "field": "data.Hair"
          },
          "y": {
            "scale": "y",
            "field": "data.Eye"
          },
          "width": {
            "scale": "x",
            "band": true
          },
          "height": {
            "scale": "y",
            "band": true
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [
    {
      "orient": "right",
      "fill": "fill",
      "title": "Freq"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "Hair"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "Eye"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id900873837").parseSpec(plot_id900873837_spec);
</script><!--/html_preserve-->



```r
hec %>% 
ggvis(~Hair, ~Eye, fill = ~Freq) %>% 
layer_rects(width = band(), height = band()) %>%
scale_nominal("x", padding = 0, points = FALSE) %>%
scale_nominal("y", padding = 0, points = FALSE)
```

<!--html_preserve--><div id="plot_id964862139-container" class="ggvis-output-container">
<div id="plot_id964862139" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id964862139_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id964862139" data-renderer="svg">SVG</a>
 | 
<a id="plot_id964862139_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id964862139" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id964862139_download" class="ggvis-download" data-plot-id="plot_id964862139">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id964862139_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "Freq": "number"
        }
      },
      "values": "\"Freq\",\"Hair\",\"Eye\"\n68,\"Black\",\"Brown\"\n119,\"Brown\",\"Brown\"\n26,\"Red\",\"Brown\"\n7,\"Blond\",\"Brown\"\n20,\"Black\",\"Blue\"\n84,\"Brown\",\"Blue\"\n17,\"Red\",\"Blue\"\n94,\"Blond\",\"Blue\"\n15,\"Black\",\"Hazel\"\n54,\"Brown\",\"Hazel\"\n14,\"Red\",\"Hazel\"\n10,\"Blond\",\"Hazel\"\n5,\"Black\",\"Green\"\n29,\"Brown\",\"Green\"\n14,\"Red\",\"Green\"\n16,\"Blond\",\"Green\""
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n5\n119"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"Black\"\n\"Brown\"\n\"Red\"\n\"Blond\""
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"Brown\"\n\"Blue\"\n\"Hazel\"\n\"Green\""
    }
  ],
  "scales": [
    {
      "name": "fill",
      "domain": {
        "data": "scale/fill",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": ["#132B43", "#56B1F7"]
    },
    {
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "name": "x",
      "type": "ordinal",
      "points": false,
      "padding": 0,
      "sort": false,
      "range": "width"
    },
    {
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "name": "y",
      "type": "ordinal",
      "points": false,
      "padding": 0,
      "sort": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "fill": {
            "scale": "fill",
            "field": "data.Freq"
          },
          "x": {
            "scale": "x",
            "field": "data.Hair"
          },
          "y": {
            "scale": "y",
            "field": "data.Eye"
          },
          "width": {
            "scale": "x",
            "band": true
          },
          "height": {
            "scale": "y",
            "band": true
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [
    {
      "orient": "right",
      "fill": "fill",
      "title": "Freq"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "Hair"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "Eye"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id964862139").parseSpec(plot_id964862139_spec);
</script><!--/html_preserve-->


###padding


```r
hec %>% 
  ggvis(~Hair, ~Eye, fill = ~Freq) %>% 
  layer_rects(width = band(), height = band()) %>%
  #左右间隔0.05
  scale_nominal("x", padding = 0.05, points = FALSE) %>%
  #上下间隔0.5
  scale_nominal("y", padding = 0.5, points = FALSE)
```

<!--html_preserve--><div id="plot_id703760389-container" class="ggvis-output-container">
<div id="plot_id703760389" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id703760389_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id703760389" data-renderer="svg">SVG</a>
 | 
<a id="plot_id703760389_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id703760389" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id703760389_download" class="ggvis-download" data-plot-id="plot_id703760389">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id703760389_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "Freq": "number"
        }
      },
      "values": "\"Freq\",\"Hair\",\"Eye\"\n68,\"Black\",\"Brown\"\n119,\"Brown\",\"Brown\"\n26,\"Red\",\"Brown\"\n7,\"Blond\",\"Brown\"\n20,\"Black\",\"Blue\"\n84,\"Brown\",\"Blue\"\n17,\"Red\",\"Blue\"\n94,\"Blond\",\"Blue\"\n15,\"Black\",\"Hazel\"\n54,\"Brown\",\"Hazel\"\n14,\"Red\",\"Hazel\"\n10,\"Blond\",\"Hazel\"\n5,\"Black\",\"Green\"\n29,\"Brown\",\"Green\"\n14,\"Red\",\"Green\"\n16,\"Blond\",\"Green\""
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n5\n119"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"Black\"\n\"Brown\"\n\"Red\"\n\"Blond\""
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"Brown\"\n\"Blue\"\n\"Hazel\"\n\"Green\""
    }
  ],
  "scales": [
    {
      "name": "fill",
      "domain": {
        "data": "scale/fill",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": ["#132B43", "#56B1F7"]
    },
    {
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "name": "x",
      "type": "ordinal",
      "points": false,
      "padding": 0.05,
      "sort": false,
      "range": "width"
    },
    {
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "name": "y",
      "type": "ordinal",
      "points": false,
      "padding": 0.5,
      "sort": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "fill": {
            "scale": "fill",
            "field": "data.Freq"
          },
          "x": {
            "scale": "x",
            "field": "data.Hair"
          },
          "y": {
            "scale": "y",
            "field": "data.Eye"
          },
          "width": {
            "scale": "x",
            "band": true
          },
          "height": {
            "scale": "y",
            "band": true
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [
    {
      "orient": "right",
      "fill": "fill",
      "title": "Freq"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "Hair"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "Eye"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id703760389").parseSpec(plot_id703760389_spec);
</script><!--/html_preserve-->

##`layer_paths`

`layer_path` produces lines if fill is empty, and polygons if it is set to a value.

```r
#Add a fill and a stroke to make it a polygon
df <- data.frame(x = c(1, 1, 2, 2), y = c(2, 1, 1, 2))
df %>% ggvis(~x, ~y, stroke := "red",fill := "blue") %>% layer_paths()
```

<!--html_preserve--><div id="plot_id753885004-container" class="ggvis-output-container">
<div id="plot_id753885004" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id753885004_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id753885004" data-renderer="svg">SVG</a>
 | 
<a id="plot_id753885004_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id753885004" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id753885004_download" class="ggvis-download" data-plot-id="plot_id753885004">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id753885004_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n1,2\n1,1\n2,1\n2,2"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.95\n2.05"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.95\n2.05"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "red"
          },
          "fill": {
            "value": "blue"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id753885004").parseSpec(plot_id753885004_spec);
</script><!--/html_preserve-->

You can not currently set the component of lines to different colours: track progress at <https://github.com/trifacta/vega/issues/122>

To create a line that spans the complete range of the plot, use `prop_group()`)`:
```
ggvis() %>%
  layer_points(x = ~disp, y = ~wt, data = mtcars) %>%
  layer_paths(x := 0, y = ~mean(mtcars$wt, x2 := prop_group())) %>%
  layer_paths(x = ~mean(mtcars$disp), y := 0, y2 := prop_group())
```
Note that this won’t work because `prop_group()` hasn’t been written yet: track progress at <https://github.com/rstudio/ggvis/issues/38>.

##`layer_ribbons`

You need to set two of `y`, `y2` and `height`:

```r
df %>% ggvis(~x, ~y, y2 := 0) %>% layer_ribbons()
```

<!--html_preserve--><div id="plot_id783909265-container" class="ggvis-output-container">
<div id="plot_id783909265" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id783909265_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id783909265" data-renderer="svg">SVG</a>
 | 
<a id="plot_id783909265_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id783909265" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id783909265_download" class="ggvis-download" data-plot-id="plot_id783909265">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id783909265_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n1,2\n1,1\n2,1\n2,2"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.95\n2.05"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.95\n2.05"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "area",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "y2": {
            "value": 0
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id783909265").parseSpec(plot_id783909265_spec);
</script><!--/html_preserve-->


```r
# Set height in pixels
df %>% ggvis(~x, ~y,height := 20) %>% layer_ribbons()
```

<!--html_preserve--><div id="plot_id294774924-container" class="ggvis-output-container">
<div id="plot_id294774924" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id294774924_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id294774924" data-renderer="svg">SVG</a>
 | 
<a id="plot_id294774924_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id294774924" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id294774924_download" class="ggvis-download" data-plot-id="plot_id294774924">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id294774924_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n1,2\n1,1\n2,1\n2,2"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.95\n2.05"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.95\n2.05"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "area",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "height": {
            "value": 20
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id294774924").parseSpec(plot_id294774924_spec);
</script><!--/html_preserve-->


Height can only be mapped to a constant, because it does not have an obvious scale associated with it. You could force height to use the y scale, but that doesn’t work - the area hangs below the y line, and increasing the value of height makes the area narrower! What’s going on is that the underlying graphics device has (0, 0) in the top-left corner, and so the y-scale is upside down. As you increase height, it’s mapped like a y variable so bigger values are further away.

```r
df %>% ggvis(~x, ~y, prop("height", 80, scale = "y")) %>% layer_ribbons()
```

<!--html_preserve--><div id="plot_id207519965-container" class="ggvis-output-container">
<div id="plot_id207519965" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id207519965_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id207519965" data-renderer="svg">SVG</a>
 | 
<a id="plot_id207519965_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id207519965" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id207519965_download" class="ggvis-download" data-plot-id="plot_id207519965">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id207519965_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n1,2\n1,1\n2,1\n2,2"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.95\n2.05"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-2.95\n83.95"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "area",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "height": {
            "scale": "y",
            "value": 80
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id207519965").parseSpec(plot_id207519965_spec);
</script><!--/html_preserve-->

```r
#scale it
df <- data.frame(x = 1:10, y = (1:10) ^ 2)
df %>% ggvis(~x, ~y) %>%
  layer_ribbons(prop("height", input_slider(0, 100), scale = "y")) %>%
  layer_paths(stroke := "red", strokeWidth := 10)
```

```
## Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
## Generating a static (non-dynamic, non-interactive) version of the plot.
```

<!--html_preserve--><div id="plot_id395623785-container" class="ggvis-output-container">
<div id="plot_id395623785" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id395623785_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id395623785" data-renderer="svg">SVG</a>
 | 
<a id="plot_id395623785_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id395623785" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id395623785_download" class="ggvis-download" data-plot-id="plot_id395623785">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id395623785_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number",
          "reactive_490878397": "number"
        }
      },
      "values": "\"x\",\"y\",\"reactive_490878397\"\n1,1,50\n2,4,50\n3,9,50\n4,16,50\n5,25,50\n6,36,50\n7,49,50\n8,64,50\n9,81,50\n10,100,50"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.55\n10.45"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-3.95\n104.95"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "area",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          },
          "height": {
            "scale": "y",
            "field": "data.reactive_490878397"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          },
          "stroke": {
            "value": "red"
          },
          "strokeWidth": {
            "value": 10
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id395623785").parseSpec(plot_id395623785_spec);
</script><!--/html_preserve-->

```r
#> Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
#> Generating a static (non-dynamic, non-interactive) version of the plot.
```


If you want to set the height in data units, you need to compute the offsets yourself:

```r
df %>% ggvis(~x, y = ~y - 10, y2 = ~y + 2) %>% layer_ribbons()
```

<!--html_preserve--><div id="plot_id178356882-container" class="ggvis-output-container">
<div id="plot_id178356882" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id178356882_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id178356882" data-renderer="svg">SVG</a>
 | 
<a id="plot_id178356882_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id178356882" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id178356882_download" class="ggvis-download" data-plot-id="plot_id178356882">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id178356882_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "y - 10": "number",
          "y + 2": "number",
          "x": "number"
        }
      },
      "values": "\"y - 10\",\"y + 2\",\"x\"\n-9,3,1\n-6,6,2\n-1,11,3\n6,18,4\n15,27,5\n26,38,6\n39,51,7\n54,66,8\n71,83,9\n90,102,10"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.55\n10.45"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-14.55\n107.55"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "area",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "y": {
            "scale": "y",
            "field": "data.y - 10"
          },
          "y2": {
            "scale": "y",
            "field": "data.y + 2"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y + 2"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id178356882").parseSpec(plot_id178356882_spec);
</script><!--/html_preserve-->


The distinction between dimension and location is important in other graphics system, and a grid vignette `vignette("locndimn", package = "grid")` has a little more information about how things work in grid.

#Grouping

In ggplot2, grouping was a special aesthetic; in ggvis, grouping is a data transformation: use `group_by()` to split your data up into pieces given a specified variable, or `auto_split()` to split up by any categorical variable included in the plot:

```r
mtcars %>% ggvis() %>%
  layer_points(~wt, ~mpg,stroke := "red") %>%
  layer_paths(~wt, ~mpg,stroke := "red") %>%
  group_by(cyl) %>%
  layer_points(~wt, ~mpg,stroke := "blue") %>%
layer_paths(~wt, ~mpg,stroke := "blue") %>%
  auto_group() 
```

<!--html_preserve--><div id="plot_id348987901-container" class="ggvis-output-container">
<div id="plot_id348987901" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id348987901_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id348987901" data-renderer="svg">SVG</a>
 | 
<a id="plot_id348987901_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id348987901" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id348987901_download" class="ggvis-download" data-plot-id="plot_id348987901">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id348987901_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": ".0/group_by1_flat",
      "format": {
        "type": "csv",
        "parse": {
          "cyl": "number",
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"cyl\",\"wt\",\"mpg\"\n4,2.32,22.8\n4,3.19,24.4\n4,3.15,22.8\n4,2.2,32.4\n4,1.615,30.4\n4,1.835,33.9\n4,2.465,21.5\n4,1.935,27.3\n4,2.14,26\n4,1.513,30.4\n4,2.78,21.4\n6,2.62,21\n6,2.875,21\n6,3.215,21.4\n6,3.46,18.1\n6,3.44,19.2\n6,3.44,17.8\n6,2.77,19.7\n8,3.44,18.7\n8,3.57,14.3\n8,4.07,16.4\n8,3.73,17.3\n8,3.78,15.2\n8,5.25,10.4\n8,5.424,10.4\n8,5.345,14.7\n8,3.52,15.5\n8,3.435,15.2\n8,3.84,13.3\n8,3.845,19.2\n8,3.17,15.8\n8,3.57,15"
    },
    {
      "name": ".0/group_by1",
      "source": ".0/group_by1_flat",
      "transform": [
        {
          "type": "treefacet",
          "keys": [
            "data.cyl"
          ]
        }
      ]
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "stroke": {
            "value": "red"
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "red"
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    },
    {
      "type": "group",
      "from": {
        "data": ".0/group_by1"
      },
      "marks": [
        {
          "type": "symbol",
          "properties": {
            "update": {
              "fill": {
                "value": "#000000"
              },
              "size": {
                "value": 50
              },
              "stroke": {
                "value": "blue"
              },
              "x": {
                "scale": "x",
                "field": "data.wt"
              },
              "y": {
                "scale": "y",
                "field": "data.mpg"
              }
            },
            "ggvis": {
              "data": {
                "value": ".0/group_by1"
              }
            }
          }
        }
      ]
    },
    {
      "type": "group",
      "from": {
        "data": ".0/group_by1"
      },
      "marks": [
        {
          "type": "line",
          "properties": {
            "update": {
              "stroke": {
                "value": "blue"
              },
              "x": {
                "scale": "x",
                "field": "data.wt"
              },
              "y": {
                "scale": "y",
                "field": "data.mpg"
              }
            },
            "ggvis": {
              "data": {
                "value": ".0/group_by1"
              }
            }
          }
        }
      ]
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id348987901").parseSpec(plot_id348987901_spec);
</script><!--/html_preserve-->

Some layers, like `layer_line()`, include `auto_split()` so will split automatically:

```r
mtcars %>% 
  dplyr::mutate(cyl2 = factor(cyl)) %>% 
  ggvis(~wt, ~mpg, stroke = ~cyl2) %>% 
  layer_lines()
```

<!--html_preserve--><div id="plot_id798974864-container" class="ggvis-output-container">
<div id="plot_id798974864" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id798974864_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id798974864" data-renderer="svg">SVG</a>
 | 
<a id="plot_id798974864_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id798974864" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id798974864_download" class="ggvis-download" data-plot-id="plot_id798974864">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id798974864_spec = {
  "data": [
    {
      "name": ".0/group_by1/arrange2_flat",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"cyl2\",\"wt\",\"mpg\"\n\"4\",1.513,30.4\n\"4\",1.615,30.4\n\"4\",1.835,33.9\n\"4\",1.935,27.3\n\"4\",2.14,26\n\"4\",2.2,32.4\n\"4\",2.32,22.8\n\"4\",2.465,21.5\n\"4\",2.78,21.4\n\"4\",3.15,22.8\n\"4\",3.19,24.4\n\"6\",2.62,21\n\"6\",2.77,19.7\n\"6\",2.875,21\n\"6\",3.215,21.4\n\"6\",3.44,19.2\n\"6\",3.44,17.8\n\"6\",3.46,18.1\n\"8\",3.17,15.8\n\"8\",3.435,15.2\n\"8\",3.44,18.7\n\"8\",3.52,15.5\n\"8\",3.57,14.3\n\"8\",3.57,15\n\"8\",3.73,17.3\n\"8\",3.78,15.2\n\"8\",3.84,13.3\n\"8\",3.845,19.2\n\"8\",4.07,16.4\n\"8\",5.25,10.4\n\"8\",5.345,14.7\n\"8\",5.424,10.4"
    },
    {
      "name": ".0/group_by1/arrange2",
      "source": ".0/group_by1/arrange2_flat",
      "transform": [
        {
          "type": "treefacet",
          "keys": [
            "data.cyl2"
          ]
        }
      ]
    },
    {
      "name": "scale/stroke",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"4\"\n\"6\"\n\"8\""
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "stroke",
      "type": "ordinal",
      "domain": {
        "data": "scale/stroke",
        "field": "data.domain"
      },
      "points": true,
      "sort": false,
      "range": "category10"
    },
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "group",
      "from": {
        "data": ".0/group_by1/arrange2"
      },
      "marks": [
        {
          "type": "line",
          "properties": {
            "update": {
              "stroke": {
                "scale": "stroke",
                "field": "data.cyl2"
              },
              "x": {
                "scale": "x",
                "field": "data.wt"
              },
              "y": {
                "scale": "y",
                "field": "data.mpg"
              }
            },
            "ggvis": {
              "data": {
                "value": ".0/group_by1/arrange2"
              }
            }
          }
        }
      ]
    }
  ],
  "legends": [
    {
      "orient": "right",
      "stroke": "stroke",
      "title": "cyl2"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id798974864").parseSpec(plot_id798974864_spec);
</script><!--/html_preserve-->

#Compound layers

Simple layers map directly to vega’s primitive drawing functions (marks). Compound layers combine data transformation and simple layers (potentially multiple of each) to more sophisticated graphics. For example:
```
    layer_histogram() = transform_bin() + mark_rect()
    layer_freqpoly() = transform_bin() + mark_path()
    layer_smooth() = transform_smooth() + (mark_path() + mark_area())
```
All layers start with `layer_`. The source is usually relatively simple `-` the complexity generally comes when figuring out how to map properties supplied to the layer to individual marks:



```r
layer_smooths
```

```
## function (vis, ..., span = 0.75, se = FALSE) 
## {
##     formula <- guess_formula(vis$cur_props, "loess", quiet = TRUE)
##     layer_model_predictions(vis, ..., model = "loess", formula = formula, 
##         model_args = list(span = span), se = se)
## }
## <environment: namespace:ggvis>
```


```r
layer_histograms
```

```
## function (vis, ..., width = NULL, center = NULL, boundary = NULL, 
##     closed = c("right", "left"), stack = TRUE, binwidth) 
## {
##     if (!missing(binwidth)) {
##         width <- binwidth
##         deprecated("binwidth", "width", version = "0.3.0")
##     }
##     closed <- match.arg(closed)
##     new_props <- merge_props(cur_props(vis), props(...))
##     check_unsupported_props(new_props, c("x", "y", "x2", "y2"), 
##         c("enter", "exit", "hover"), "layer_histograms")
##     x_var <- find_prop_var(new_props, "x.update")
##     x_val <- eval_vector(cur_data(vis), x_var)
##     vis <- set_scale_label(vis, "x", prop_label(new_props$x.update))
##     vis <- scale_numeric(vis, "y", domain = c(0, NA), expand = c(0, 
##         0.05), label = "count")
##     layer_f(vis, function(x) {
##         x <- compute_bin(x, x_var, width = width, center = center, 
##             boundary = boundary, closed = closed)
##         if (stack) {
##             x <- compute_stack(x, stack_var = ~count_, group_var = ~x_)
##             rect_props <- merge_props(new_props, props(x = ~xmin_, 
##                 x2 = ~xmax_, y = ~stack_upr_, y2 = ~stack_lwr_))
##             x <- emit_rects(x, rect_props)
##         }
##         else {
##             rect_props <- merge_props(new_props, props(x = ~xmin_, 
##                 x2 = ~xmax_, y = ~count_, y2 = 0))
##             x <- emit_rects(x, rect_props)
##         }
##         x
##     })
## }
## <environment: namespace:ggvis>
```
If you find yourself using a set of marks commonly, it might be worth writing your own layer function.

#Conversion from ggplot2

The following list provides a conversion from ggplot2 geoms to vega marks. However, because ggvis currently provides few transformations, many translations don’t currently exists - but they are on the roadmap and will be added over time.
```
    geom_abline
    geom_area = layer_ribbons with y = ~0
    geom_bar = layer_rects with y = ~ 0, width = band()
    geom_bin2d = layer_rects + transform_bin2d
    geom_blank
    geom_boxplot
    geom_contour
    geom_crossbar
    geom_density = layer_densities = layer_paths + compute_density
    geom_density2d
    geom_dotplot
    geom_errorbar
    geom_errorbarh
    geom_freqpoly
    geom_hex
    geom_histogram = layer_histograms = layer_bar + transform_bin
    geom_hline = = layer_paths + x2 ~ prop_group("width")).
    geom_jitter
    geom_line = layer_lines = layer_paths + compute_sort
    geom_linerange
    geom_map
    geom_path = layer_paths
    geom_point = layer_points
    geom_pointrange
    geom_polygon = layer_paths
    geom_quantile = layer_paths + compute_quantreg
    geom_raster
    geom_rect = layer_rects
    geom_ribbon = layer_areas
    geom_rug
    geom_segment
    geom_smooth = layer_smooths = layer_ribbon + layer_paths + compute_smooth
    geom_step = layer_paths + transform_step
    geom_text = layer_text
    geom_tile = layer_rects + width = band(), height = band())
    geom_violin
    geom_vline = layer_paths + y2 = prop_group("height")
```

  
