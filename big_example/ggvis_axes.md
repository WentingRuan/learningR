# Axes and Legends
Ethel Ruan  
2017-02-11  



# Axes and Legends

When polishing graphics for production you often spend a lot of time getting the axes and legends looking exactly right. This vignette describes the ggvis functions that allow you to control plot guides: `axes` and `legends`.

In ggvis, axes and legends are related to `scales`, but are described separately. This is different to ggplot2, where the scale objects controlled both the details of the mapping and how it should be displayed on the plot. This makes ggvis a little more verbose, but it also makes it more flexible.

Currently, ggvis guides are a close map to their vega equivalents. For reference, you may also want to read the vega documentation for the underlying `axis` and `legend` components.

# Common properties

Axes and legends have relatively few components in common, but the ones that they share are particularly important.

##scale 

scale(axis), and stroke/fill/size/shape (legend) describe which scale (or scales in the case of a legend) will be displayed on the guide
```
    add_axis(vis, "x")
    add_axis(vis, "y")
    add_legend(vis, "stroke")
    add_legend(vis, "size")
    # Display multiple scales in one legend:
    add_legend(vis, "stroke", "size")
```
## title

title,a string describing the guide
```
    add_axis(vis, "x", title = "My x variable")
    add_legend(vis, "fill", title = "Some interesting colours")
```
## values

value, used to override the default placement of ticks on an axis or gradient legend, or visible legend labels.

## format

format,a d3 **formatting specification** that controls how values are converted to strings.

# Custom styles

Finally, both axes and legends share `properties`, which is a named list of `props()` that is applied to specified components of the axis or legend. For axes, you can set the properties of the ticks (or majorTicks and minorTicks separately), the labels and axis. For legends, you can set properties of the title, label, symbols (for categorical scales), gradient (for continuous scales), and legend.


```r
library(ggvis)
```

```
## Warning: package 'ggvis' was built under R version 3.3.2
```

```r
mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_points() %>%
  add_axis("x", properties = axis_props(
    axis = list(stroke = "red", strokeWidth = 5),
    grid = list(stroke = "blue"),
    ticks = list(stroke = "blue", strokeWidth = 2),
    labels = list(angle = 45, align = "left", fontSize = 20)
  ))
```

<!--html_preserve--><div id="plot_id646348783-container" class="ggvis-output-container">
<div id="plot_id646348783" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id646348783_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id646348783" data-renderer="svg">SVG</a>
 | 
<a id="plot_id646348783_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id646348783" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id646348783_download" class="ggvis-download" data-plot-id="plot_id646348783">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id646348783_spec = {
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
      "properties": {
        "ticks": {
          "stroke": {
            "value": "blue"
          },
          "strokeWidth": {
            "value": 2
          }
        },
        "grid": {
          "stroke": {
            "value": "blue"
          }
        },
        "labels": {
          "angle": {
            "value": 45
          },
          "align": {
            "value": "left"
          },
          "fontSize": {
            "value": 20
          }
        },
        "axis": {
          "stroke": {
            "value": "red"
          },
          "strokeWidth": {
            "value": 5
          }
        }
      },
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
ggvis.getPlot("plot_id646348783").parseSpec(plot_id646348783_spec);
</script><!--/html_preserve-->


# Axis


```r
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
```

<!--html_preserve--><div id="plot_id745418886-container" class="ggvis-output-container">
<div id="plot_id745418886" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id745418886_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id745418886" data-renderer="svg">SVG</a>
 | 
<a id="plot_id745418886_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id745418886" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id745418886_download" class="ggvis-download" data-plot-id="plot_id745418886">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id745418886_spec = {
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
ggvis.getPlot("plot_id745418886").parseSpec(plot_id745418886_spec);
</script><!--/html_preserve-->


```r
##   add title to axis
##  add offset to push titles further
##  control orient
##  You can even put multiple scales on one side:

mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_points() %>%
  add_axis("x", orient = "bottom",title = "top wt",title_offset = 30) %>%
  add_axis("x", orient = "top",title = "bottom wt",title_offset = 40) %>% 
  add_axis("y",orient ="left" ,title = "left mpg",title_offset = 50) %>%
  add_axis("y",orient = "right",title = "right mpg",title_offset = 60,grid = FALSE) %>%
  add_axis("x",title = "mpg~2",title_offset = 30,offset = 60,grid = FALSE)
```

<!--html_preserve--><div id="plot_id512881604-container" class="ggvis-output-container">
<div id="plot_id512881604" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id512881604_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id512881604" data-renderer="svg">SVG</a>
 | 
<a id="plot_id512881604_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id512881604" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id512881604_download" class="ggvis-download" data-plot-id="plot_id512881604">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id512881604_spec = {
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
      "title": "top wt",
      "titleOffset": 30,
      "layer": "back",
      "grid": true
    },
    {
      "type": "x",
      "scale": "x",
      "orient": "top",
      "title": "bottom wt",
      "titleOffset": 40,
      "layer": "back",
      "grid": true
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "title": "left mpg",
      "titleOffset": 50,
      "layer": "back",
      "grid": true
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "right",
      "title": "right mpg",
      "titleOffset": 60,
      "layer": "back",
      "grid": false
    },
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "title": "mpg~2",
      "titleOffset": 30,
      "offset": 60,
      "layer": "back",
      "grid": false
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
ggvis.getPlot("plot_id512881604").parseSpec(plot_id512881604_spec);
</script><!--/html_preserve-->


This is probably more useful if you have multiple x or y position scales, but I’ve already discussed that enough times in these vignettes given how much I dislike them.

# Tick sizes and padding

There are five options that control the appearance of ticks:

 - `subdivide`: the number of minor ticks between each major tick.

 - `tick_padding`: the padding between ticks and labels (in pixels)

 - `tick_size_major`, `tick_size_minor` ,`tick_size_end`: the size of the major, minor and end ticks. By default they are all the same size as the major ticks, but you can set them separately.

```r
# Change ticks and subdivide with minor ticks
# Make the minor ticks smaller and the end ticks longer

mtcars %>% ggvis(~wt, ~mpg) %>%
layer_points() %>%
add_axis("x", subdivide = 9, values = 1:6, tick_size_major = 20,
tick_size_minor = 5, tick_size_end = 35, tick_padding = 20) %>%
add_axis("y", subdivide = 1, values = seq(10, 34, by = 2))
```

<!--html_preserve--><div id="plot_id266018493-container" class="ggvis-output-container">
<div id="plot_id266018493" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id266018493_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id266018493" data-renderer="svg">SVG</a>
 | 
<a id="plot_id266018493_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id266018493" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id266018493_download" class="ggvis-download" data-plot-id="plot_id266018493">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id266018493_spec = {
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
      "values": [1, 2, 3, 4, 5, 6],
      "subdivide": 9,
      "tickPadding": 20,
      "tickSizeMajor": 20,
      "tickSizeMinor": 5,
      "tickSizeEnd": 35,
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "values": [10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34],
      "subdivide": 1,
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
ggvis.getPlot("plot_id266018493").parseSpec(plot_id266018493_spec);
</script><!--/html_preserve-->

# Legends

Combining legends

Unlike ggplot2, by default, ggvis will not combine scales based on the same underlying variables into a single legend. Instead you must do this yourself by supplying the name of multiple scales to one legend:


```r
mtcars2 <- mtcars %>% dplyr::mutate(cyl = ordered(mtcars$cyl))
mtcars2 %>% ggvis(~mpg, ~wt, size = ~cyl, fill = ~cyl) %>% layer_points()
```

<!--html_preserve--><div id="plot_id901523819-container" class="ggvis-output-container">
<div id="plot_id901523819" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id901523819_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id901523819" data-renderer="svg">SVG</a>
 | 
<a id="plot_id901523819_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id901523819" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id901523819_download" class="ggvis-download" data-plot-id="plot_id901523819">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id901523819_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "mpg": "number",
          "wt": "number"
        }
      },
      "values": "\"cyl\",\"mpg\",\"wt\"\n\"6\",21,2.62\n\"6\",21,2.875\n\"4\",22.8,2.32\n\"6\",21.4,3.215\n\"8\",18.7,3.44\n\"6\",18.1,3.46\n\"8\",14.3,3.57\n\"4\",24.4,3.19\n\"4\",22.8,3.15\n\"6\",19.2,3.44\n\"6\",17.8,3.44\n\"8\",16.4,4.07\n\"8\",17.3,3.73\n\"8\",15.2,3.78\n\"8\",10.4,5.25\n\"8\",10.4,5.424\n\"8\",14.7,5.345\n\"4\",32.4,2.2\n\"4\",30.4,1.615\n\"4\",33.9,1.835\n\"4\",21.5,2.465\n\"8\",15.5,3.52\n\"8\",15.2,3.435\n\"8\",13.3,3.84\n\"8\",19.2,3.845\n\"4\",27.3,1.935\n\"4\",26,2.14\n\"4\",30.4,1.513\n\"8\",15.8,3.17\n\"6\",19.7,2.77\n\"8\",15,3.57\n\"4\",21.4,2.78"
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"4\"\n\"6\"\n\"8\""
    },
    {
      "name": "scale/size",
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
      "values": "\"domain\"\n9.225\n35.075"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    }
  ],
  "scales": [
    {
      "name": "fill",
      "type": "ordinal",
      "domain": {
        "data": "scale/fill",
        "field": "data.domain"
      },
      "points": true,
      "sort": false,
      "range": "category10"
    },
    {
      "name": "size",
      "type": "ordinal",
      "domain": {
        "data": "scale/size",
        "field": "data.domain"
      },
      "points": true,
      "sort": false,
      "range": [10, 100]
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
      "type": "symbol",
      "properties": {
        "update": {
          "size": {
            "scale": "size",
            "field": "data.cyl"
          },
          "fill": {
            "scale": "fill",
            "field": "data.cyl"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.wt"
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
      "title": "cyl"
    },
    {
      "orient": "right",
      "size": "size",
      "title": "cyl"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "wt"
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
ggvis.getPlot("plot_id901523819").parseSpec(plot_id901523819_spec);
</script><!--/html_preserve-->


```r
mtcars2 %>% ggvis(~mpg, ~wt, size = ~cyl, fill = ~cyl) %>% layer_points() %>%
  add_legend(c("size", "fill"))
```

<!--html_preserve--><div id="plot_id500335724-container" class="ggvis-output-container">
<div id="plot_id500335724" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id500335724_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id500335724" data-renderer="svg">SVG</a>
 | 
<a id="plot_id500335724_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id500335724" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id500335724_download" class="ggvis-download" data-plot-id="plot_id500335724">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id500335724_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "mpg": "number",
          "wt": "number"
        }
      },
      "values": "\"cyl\",\"mpg\",\"wt\"\n\"6\",21,2.62\n\"6\",21,2.875\n\"4\",22.8,2.32\n\"6\",21.4,3.215\n\"8\",18.7,3.44\n\"6\",18.1,3.46\n\"8\",14.3,3.57\n\"4\",24.4,3.19\n\"4\",22.8,3.15\n\"6\",19.2,3.44\n\"6\",17.8,3.44\n\"8\",16.4,4.07\n\"8\",17.3,3.73\n\"8\",15.2,3.78\n\"8\",10.4,5.25\n\"8\",10.4,5.424\n\"8\",14.7,5.345\n\"4\",32.4,2.2\n\"4\",30.4,1.615\n\"4\",33.9,1.835\n\"4\",21.5,2.465\n\"8\",15.5,3.52\n\"8\",15.2,3.435\n\"8\",13.3,3.84\n\"8\",19.2,3.845\n\"4\",27.3,1.935\n\"4\",26,2.14\n\"4\",30.4,1.513\n\"8\",15.8,3.17\n\"6\",19.7,2.77\n\"8\",15,3.57\n\"4\",21.4,2.78"
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"4\"\n\"6\"\n\"8\""
    },
    {
      "name": "scale/size",
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
      "values": "\"domain\"\n9.225\n35.075"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    }
  ],
  "scales": [
    {
      "name": "fill",
      "type": "ordinal",
      "domain": {
        "data": "scale/fill",
        "field": "data.domain"
      },
      "points": true,
      "sort": false,
      "range": "category10"
    },
    {
      "name": "size",
      "type": "ordinal",
      "domain": {
        "data": "scale/size",
        "field": "data.domain"
      },
      "points": true,
      "sort": false,
      "range": [10, 100]
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
      "type": "symbol",
      "properties": {
        "update": {
          "size": {
            "scale": "size",
            "field": "data.cyl"
          },
          "fill": {
            "scale": "fill",
            "field": "data.cyl"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.wt"
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
      "size": "size",
      "fill": "fill",
      "title": "cyl"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "wt"
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
ggvis.getPlot("plot_id500335724").parseSpec(plot_id500335724_spec);
</script><!--/html_preserve-->


 
