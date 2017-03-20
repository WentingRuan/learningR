# ggvis basis
Ethel Ruan  
2017-02-11  



#Introduction

The goal of ggvis is to make it easy to build interactive graphics for exploratory data analysis. ggvis has a **similar underlying theory to  (the grammar of graphics)**, but it’s expressed a little differently, and adds new features to make your plots interactive. **ggvis also incorporates shiny’s reactive programming model and dplyr’s grammar of data transformation**. Sees at <http://ggvis.rstudio.com/ggvis-basics.html>.

The graphics produced by ggvis are fundamentally **web graphics and work very differently** from traditional R graphics. This allows us to implement exciting new features like interactivity, but it comes at a **cost**. For example, every interactive ggvis plot must **** (static plots do not need a running R session to be viewed). This is great for exploration, because you can do anything in your interactive plot you can do in R, but it’s not so great for publication. We will overcome these issues in time, but for now be aware that we have many existing tools to reimplement before you can do everything with ggvis that you can do with base graphics.

This vignette is divided into four main sections:

 - Dive into plotting with `ggvis()`.
 - Add interactivity with the mouse and keyboard.
 - Create more types of graphic by controlling the layer type.
 - Build up rich graphics with multiple layers.
 - Each section will introduce to a major idea in ggvis, and point to more detailed explanation in other vignettes.

#`ggvis()`

Every ggvis graphic starts with a call to `ggvis()`. The **first argument is the data set that you want to plot**, and the **other arguments describe how to map variables to visual properties**.

```r
library(ggvis)
```

```
## Warning: package 'ggvis' was built under R version 3.3.2
```

```r
p <- ggvis(mtcars, x = ~wt, y = ~mpg)
```
This doesn’t actually plot anything because you haven’t told ggvis how to display your data. You do that by layering visual elements, for example with `layer_points()`:

```r
layer_points(p)
```

<!--html_preserve--><div id="plot_id794019150-container" class="ggvis-output-container">
<div id="plot_id794019150" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id794019150_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id794019150" data-renderer="svg">SVG</a>
 | 
<a id="plot_id794019150_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id794019150" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id794019150_download" class="ggvis-download" data-plot-id="plot_id794019150">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id794019150_spec = {
  "data": [
    {
      "name": "mtcars0",
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
            "value": "mtcars0"
          }
        }
      },
      "from": {
        "data": "mtcars0"
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
ggvis.getPlot("plot_id794019150").parseSpec(plot_id794019150_spec);
</script><!--/html_preserve-->

(If you’re not using RStudio, you’ll notice that this plot opens in your web browser. That’s because all ggvis graphics are web graphics, and need to be shown in the browser. RStudio includes a built-in browser so it can show you the plots directly.)

All ggvis functions take the visualisation as the first argument and return a modified visualisation. This seems a little bit awkward. Either you have to create temporary variables and modify them, or you have to use a lot of parentheses:

```r
layer_points(ggvis(mtcars, x = ~wt, y = ~mpg))
```

<!--html_preserve--><div id="plot_id468085339-container" class="ggvis-output-container">
<div id="plot_id468085339" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id468085339_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id468085339" data-renderer="svg">SVG</a>
 | 
<a id="plot_id468085339_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id468085339" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id468085339_download" class="ggvis-download" data-plot-id="plot_id468085339">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id468085339_spec = {
  "data": [
    {
      "name": "mtcars0",
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
            "value": "mtcars0"
          }
        }
      },
      "from": {
        "data": "mtcars0"
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
ggvis.getPlot("plot_id468085339").parseSpec(plot_id468085339_spec);
</script><!--/html_preserve-->


To make life easier ggvis uses the `%>%` (pronounced pipe) function from the magrittr package. That allows you to rewrite the previous function call as:

```r
mtcars %>%
  ggvis(x = ~wt, y = ~mpg) %>%
  layer_points()
```

<!--html_preserve--><div id="plot_id819438807-container" class="ggvis-output-container">
<div id="plot_id819438807" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id819438807_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id819438807" data-renderer="svg">SVG</a>
 | 
<a id="plot_id819438807_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id819438807" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id819438807_download" class="ggvis-download" data-plot-id="plot_id819438807">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id819438807_spec = {
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
ggvis.getPlot("plot_id819438807").parseSpec(plot_id819438807_spec);
</script><!--/html_preserve-->


Don’t worry if this looks a little strange at first. You’ll soon get used to it This style of programming also allows gives you a lot of power when you start creating a lot of power, and allows you to seemlessly intermingle ggvis and dplyr code:


```r
library(dplyr)
```

```
## Warning: package 'dplyr' was built under R version 3.3.2
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
mtcars %>%
  ggvis(x = ~mpg, y = ~disp) %>%
  mutate(disp = disp / 61.0237) %>% # convert engine displacment to litres
  layer_points()
```

<!--html_preserve--><div id="plot_id691896748-container" class="ggvis-output-container">
<div id="plot_id691896748" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id691896748_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id691896748" data-renderer="svg">SVG</a>
 | 
<a id="plot_id691896748_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id691896748" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id691896748_download" class="ggvis-download" data-plot-id="plot_id691896748">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id691896748_spec = {
  "data": [
    {
      "name": ".0/mutate1",
      "format": {
        "type": "csv",
        "parse": {
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"mpg\",\"disp\"\n21,2.62193213456411\n21,2.62193213456411\n22.8,1.76980419083078\n21.4,4.22786556698463\n18.7,5.89934730276925\n18.1,3.68709206423078\n14.3,5.89934730276925\n24.4,2.40398402587847\n22.8,2.30730027841642\n19.2,2.74647391095591\n17.8,2.74647391095591\n16.4,4.51955551695489\n17.3,4.51955551695489\n15.2,4.51955551695489\n10.4,7.73469979696413\n10.4,7.53805488687182\n14.7,7.21031337005131\n32.4,1.28966286868872\n30.4,1.24050164116565\n33.9,1.16512109229693\n21.5,1.96808780850719\n15.5,5.21109011744617\n15.2,4.98167105567181\n13.3,5.735476544359\n19.2,6.55483033641028\n27.3,1.29457899144103\n26,1.97136522367539\n30.4,1.55841091248154\n15.8,5.75186362020002\n19.7,2.37612599694873\n15,4.93250982814874\n21.4,1.98283617676411"
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
      "values": "\"domain\"\n0.836642157063567\n8.06317873219749"
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
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/mutate1"
          }
        }
      },
      "from": {
        "data": ".0/mutate1"
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
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "disp"
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
ggvis.getPlot("plot_id691896748").parseSpec(plot_id691896748_spec);
</script><!--/html_preserve-->


#Format

The format of the visual properties needs a little explanation. We use `~` before the variable name to **indicate that we don’t want to literally use the value of the mpg variable (which doesn’t exist), but instead we want we want to use the mpg variable inside in the dataset**. This is **a common pattern** in ggvis: **we’ll always use formulas to refer to variables inside the dataset.**

The first two arguments to `ggvis()` are usually the **position**, so by convention you can drop x and y:

```r
mtcars %>%
  ggvis(~mpg, ~disp) %>%
  layer_points()
```

<!--html_preserve--><div id="plot_id302026349-container" class="ggvis-output-container">
<div id="plot_id302026349" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id302026349_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id302026349" data-renderer="svg">SVG</a>
 | 
<a id="plot_id302026349_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id302026349" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id302026349_download" class="ggvis-download" data-plot-id="plot_id302026349">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id302026349_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"mpg\",\"disp\"\n21,160\n21,160\n22.8,108\n21.4,258\n18.7,360\n18.1,225\n14.3,360\n24.4,146.7\n22.8,140.8\n19.2,167.6\n17.8,167.6\n16.4,275.8\n17.3,275.8\n15.2,275.8\n10.4,472\n10.4,460\n14.7,440\n32.4,78.7\n30.4,75.7\n33.9,71.1\n21.5,120.1\n15.5,318\n15.2,304\n13.3,350\n19.2,400\n27.3,79\n26,120.3\n30.4,95.1\n15.8,351\n19.7,145\n15,301\n21.4,121"
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
      "values": "\"domain\"\n51.055\n492.045"
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
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
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
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "disp"
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
ggvis.getPlot("plot_id302026349").parseSpec(plot_id302026349_spec);
</script><!--/html_preserve-->


You can add more variables to the plot by mapping them to other visual properties like `fill`, `stroke`, `size` and `shape`.

```r
mtcars %>% ggvis(~mpg, ~disp, stroke = ~vs) %>% layer_points()
```

<!--html_preserve--><div id="plot_id191865510-container" class="ggvis-output-container">
<div id="plot_id191865510" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id191865510_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id191865510" data-renderer="svg">SVG</a>
 | 
<a id="plot_id191865510_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id191865510" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id191865510_download" class="ggvis-download" data-plot-id="plot_id191865510">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id191865510_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "vs": "number",
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"vs\",\"mpg\",\"disp\"\n0,21,160\n0,21,160\n1,22.8,108\n1,21.4,258\n0,18.7,360\n1,18.1,225\n0,14.3,360\n1,24.4,146.7\n1,22.8,140.8\n1,19.2,167.6\n1,17.8,167.6\n0,16.4,275.8\n0,17.3,275.8\n0,15.2,275.8\n0,10.4,472\n0,10.4,460\n0,14.7,440\n1,32.4,78.7\n1,30.4,75.7\n1,33.9,71.1\n1,21.5,120.1\n0,15.5,318\n0,15.2,304\n0,13.3,350\n0,19.2,400\n1,27.3,79\n0,26,120.3\n1,30.4,95.1\n0,15.8,351\n0,19.7,145\n0,15,301\n1,21.4,121"
    },
    {
      "name": "scale/stroke",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n1"
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
      "values": "\"domain\"\n51.055\n492.045"
    }
  ],
  "scales": [
    {
      "name": "stroke",
      "domain": {
        "data": "scale/stroke",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": ["#132B43", "#56B1F7"]
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
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "stroke": {
            "scale": "stroke",
            "field": "data.vs"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
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
      "stroke": "stroke",
      "title": "vs"
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
      "title": "disp"
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
ggvis.getPlot("plot_id191865510").parseSpec(plot_id191865510_spec);
</script><!--/html_preserve-->


```r
 mtcars %>% ggvis(~mpg, ~disp, fill = ~vs) %>% layer_points()
```

<!--html_preserve--><div id="plot_id811588953-container" class="ggvis-output-container">
<div id="plot_id811588953" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id811588953_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id811588953" data-renderer="svg">SVG</a>
 | 
<a id="plot_id811588953_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id811588953" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id811588953_download" class="ggvis-download" data-plot-id="plot_id811588953">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id811588953_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "vs": "number",
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"vs\",\"mpg\",\"disp\"\n0,21,160\n0,21,160\n1,22.8,108\n1,21.4,258\n0,18.7,360\n1,18.1,225\n0,14.3,360\n1,24.4,146.7\n1,22.8,140.8\n1,19.2,167.6\n1,17.8,167.6\n0,16.4,275.8\n0,17.3,275.8\n0,15.2,275.8\n0,10.4,472\n0,10.4,460\n0,14.7,440\n1,32.4,78.7\n1,30.4,75.7\n1,33.9,71.1\n1,21.5,120.1\n0,15.5,318\n0,15.2,304\n0,13.3,350\n0,19.2,400\n1,27.3,79\n0,26,120.3\n1,30.4,95.1\n0,15.8,351\n0,19.7,145\n0,15,301\n1,21.4,121"
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n1"
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
      "values": "\"domain\"\n51.055\n492.045"
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
            "value": 50
          },
          "fill": {
            "scale": "fill",
            "field": "data.vs"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
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
      "title": "vs"
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
      "title": "disp"
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
ggvis.getPlot("plot_id811588953").parseSpec(plot_id811588953_spec);
</script><!--/html_preserve-->


```r
 mtcars %>% ggvis(~mpg, ~disp, size = ~vs) %>% layer_points()
```

<!--html_preserve--><div id="plot_id886521967-container" class="ggvis-output-container">
<div id="plot_id886521967" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id886521967_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id886521967" data-renderer="svg">SVG</a>
 | 
<a id="plot_id886521967_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id886521967" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id886521967_download" class="ggvis-download" data-plot-id="plot_id886521967">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id886521967_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "vs": "number",
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"vs\",\"mpg\",\"disp\"\n0,21,160\n0,21,160\n1,22.8,108\n1,21.4,258\n0,18.7,360\n1,18.1,225\n0,14.3,360\n1,24.4,146.7\n1,22.8,140.8\n1,19.2,167.6\n1,17.8,167.6\n0,16.4,275.8\n0,17.3,275.8\n0,15.2,275.8\n0,10.4,472\n0,10.4,460\n0,14.7,440\n1,32.4,78.7\n1,30.4,75.7\n1,33.9,71.1\n1,21.5,120.1\n0,15.5,318\n0,15.2,304\n0,13.3,350\n0,19.2,400\n1,27.3,79\n0,26,120.3\n1,30.4,95.1\n0,15.8,351\n0,19.7,145\n0,15,301\n1,21.4,121"
    },
    {
      "name": "scale/size",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n1"
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
      "values": "\"domain\"\n51.055\n492.045"
    }
  ],
  "scales": [
    {
      "name": "size",
      "domain": {
        "data": "scale/size",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": [20, 100]
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
          "fill": {
            "value": "#000000"
          },
          "size": {
            "scale": "size",
            "field": "data.vs"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
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
      "title": "vs"
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
      "title": "disp"
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
ggvis.getPlot("plot_id886521967").parseSpec(plot_id886521967_spec);
</script><!--/html_preserve-->


```r
 mtcars %>% ggvis(~mpg, ~disp, shape = ~factor(cyl)) %>% layer_points()
```

<!--html_preserve--><div id="plot_id117223334-container" class="ggvis-output-container">
<div id="plot_id117223334" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id117223334_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id117223334" data-renderer="svg">SVG</a>
 | 
<a id="plot_id117223334_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id117223334" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id117223334_download" class="ggvis-download" data-plot-id="plot_id117223334">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id117223334_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"factor(cyl)\",\"mpg\",\"disp\"\n\"6\",21,160\n\"6\",21,160\n\"4\",22.8,108\n\"6\",21.4,258\n\"8\",18.7,360\n\"6\",18.1,225\n\"8\",14.3,360\n\"4\",24.4,146.7\n\"4\",22.8,140.8\n\"6\",19.2,167.6\n\"6\",17.8,167.6\n\"8\",16.4,275.8\n\"8\",17.3,275.8\n\"8\",15.2,275.8\n\"8\",10.4,472\n\"8\",10.4,460\n\"8\",14.7,440\n\"4\",32.4,78.7\n\"4\",30.4,75.7\n\"4\",33.9,71.1\n\"4\",21.5,120.1\n\"8\",15.5,318\n\"8\",15.2,304\n\"8\",13.3,350\n\"8\",19.2,400\n\"4\",27.3,79\n\"4\",26,120.3\n\"4\",30.4,95.1\n\"8\",15.8,351\n\"6\",19.7,145\n\"8\",15,301\n\"4\",21.4,121"
    },
    {
      "name": "scale/shape",
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
      "values": "\"domain\"\n51.055\n492.045"
    }
  ],
  "scales": [
    {
      "name": "shape",
      "type": "ordinal",
      "domain": {
        "data": "scale/shape",
        "field": "data.domain"
      },
      "points": true,
      "sort": false,
      "range": "shapes"
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
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "shape": {
            "scale": "shape",
            "field": "data.factor(cyl)"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
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
      "shape": "shape",
      "title": "factor(cyl)"
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
      "title": "disp"
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
ggvis.getPlot("plot_id117223334").parseSpec(plot_id117223334_spec);
</script><!--/html_preserve-->


#fixed color or size

(size,stroke,fill,opacity,shape,  `：=`)

If you want to make the points a fixed colour or size, you need to use `:=` instead of `=`. The `:=` operator means to use a raw, unscaled value. This seems like something that `ggvis()` should be able to figure out by itself, but making it explicit allows you to create some useful plots that you couldn’t otherwise. See the properties and scales for more details.

```r
mtcars %>% ggvis(~wt, ~mpg, fill := "red", stroke := "black") %>% layer_points()
```

<!--html_preserve--><div id="plot_id254792363-container" class="ggvis-output-container">
<div id="plot_id254792363" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id254792363_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id254792363" data-renderer="svg">SVG</a>
 | 
<a id="plot_id254792363_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id254792363" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id254792363_download" class="ggvis-download" data-plot-id="plot_id254792363">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id254792363_spec = {
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
          "size": {
            "value": 50
          },
          "fill": {
            "value": "red"
          },
          "stroke": {
            "value": "black"
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
ggvis.getPlot("plot_id254792363").parseSpec(plot_id254792363_spec);
</script><!--/html_preserve-->



```r
mtcars %>% ggvis(~wt, ~mpg, size := 300, opacity := 0.4) %>% layer_points()
```

<!--html_preserve--><div id="plot_id633153114-container" class="ggvis-output-container">
<div id="plot_id633153114" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id633153114_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id633153114" data-renderer="svg">SVG</a>
 | 
<a id="plot_id633153114_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id633153114" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id633153114_download" class="ggvis-download" data-plot-id="plot_id633153114">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id633153114_spec = {
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
            "value": 300
          },
          "opacity": {
            "value": 0.4
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
ggvis.getPlot("plot_id633153114").parseSpec(plot_id633153114_spec);
</script><!--/html_preserve-->



```r
mtcars %>% ggvis(~wt, ~mpg, shape := "cross") %>% layer_points()
```

<!--html_preserve--><div id="plot_id652521353-container" class="ggvis-output-container">
<div id="plot_id652521353" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id652521353_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id652521353" data-renderer="svg">SVG</a>
 | 
<a id="plot_id652521353_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id652521353" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id652521353_download" class="ggvis-download" data-plot-id="plot_id652521353">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id652521353_spec = {
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
          "shape": {
            "value": "cross"
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
ggvis.getPlot("plot_id652521353").parseSpec(plot_id652521353_spec);
</script><!--/html_preserve-->


#Interaction

As well as mapping visual properties to variables or setting them to specific values, you can also connect them to interactive controls.

The following example allows you to control the size and opacity of points with two sliders:

```r
mtcars %>% 
ggvis(~wt, ~mpg, 
size := input_slider(10, 100),
opacity := input_slider(0, 1)
) %>% 
layer_points()
```

```
## Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
## Generating a static (non-dynamic, non-interactive) version of the plot.
```

<!--html_preserve--><div id="plot_id548803938-container" class="ggvis-output-container">
<div id="plot_id548803938" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id548803938_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id548803938" data-renderer="svg">SVG</a>
 | 
<a id="plot_id548803938_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id548803938" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id548803938_download" class="ggvis-download" data-plot-id="plot_id548803938">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id548803938_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "reactive_357542127": "number",
          "reactive_925993527": "number",
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"reactive_357542127\",\"reactive_925993527\",\"wt\",\"mpg\"\n55,0.5,2.62,21\n55,0.5,2.875,21\n55,0.5,2.32,22.8\n55,0.5,3.215,21.4\n55,0.5,3.44,18.7\n55,0.5,3.46,18.1\n55,0.5,3.57,14.3\n55,0.5,3.19,24.4\n55,0.5,3.15,22.8\n55,0.5,3.44,19.2\n55,0.5,3.44,17.8\n55,0.5,4.07,16.4\n55,0.5,3.73,17.3\n55,0.5,3.78,15.2\n55,0.5,5.25,10.4\n55,0.5,5.424,10.4\n55,0.5,5.345,14.7\n55,0.5,2.2,32.4\n55,0.5,1.615,30.4\n55,0.5,1.835,33.9\n55,0.5,2.465,21.5\n55,0.5,3.52,15.5\n55,0.5,3.435,15.2\n55,0.5,3.84,13.3\n55,0.5,3.845,19.2\n55,0.5,1.935,27.3\n55,0.5,2.14,26\n55,0.5,1.513,30.4\n55,0.5,3.17,15.8\n55,0.5,2.77,19.7\n55,0.5,3.57,15\n55,0.5,2.78,21.4"
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
            "field": "data.reactive_357542127"
          },
          "opacity": {
            "field": "data.reactive_925993527"
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
ggvis.getPlot("plot_id548803938").parseSpec(plot_id548803938_spec);
</script><!--/html_preserve-->


You can also connect interactive components to other plot parameters like the width and centers of histogram bins:

```r
mtcars %>% 
  ggvis(~wt) %>% 
  layer_histograms(width =  input_slider(0, 2, step = 0.10, label = "width"),
                   center = input_slider(0, 2, step = 0.05, label = "center"))
```

```
## Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
## Generating a static (non-dynamic, non-interactive) version of the plot.
```

<!--html_preserve--><div id="plot_id822296913-container" class="ggvis-output-container">
<div id="plot_id822296913" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id822296913_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id822296913" data-renderer="svg">SVG</a>
 | 
<a id="plot_id822296913_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id822296913" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id822296913_download" class="ggvis-download" data-plot-id="plot_id822296913">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id822296913_spec = {
  "data": [
    {
      "name": ".0/bin1/stack2",
      "format": {
        "type": "csv",
        "parse": {
          "xmin_": "number",
          "xmax_": "number",
          "stack_upr_": "number",
          "stack_lwr_": "number"
        }
      },
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n1.5,2.5,8,0\n2.5,3.5,13,0\n3.5,4.5,8,0\n4.5,5.5,3,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.3\n5.7"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n13.65"
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
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "fill": {
            "value": "#333333"
          },
          "x": {
            "scale": "x",
            "field": "data.xmin_"
          },
          "x2": {
            "scale": "x",
            "field": "data.xmax_"
          },
          "y": {
            "scale": "y",
            "field": "data.stack_upr_"
          },
          "y2": {
            "scale": "y",
            "field": "data.stack_lwr_"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/bin1/stack2"
          }
        }
      },
      "from": {
        "data": ".0/bin1/stack2"
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
      "title": "count"
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
ggvis.getPlot("plot_id822296913").parseSpec(plot_id822296913_spec);
</script><!--/html_preserve-->


##built with shiny

Behind the scenes, interactive plots are built with shiny, and you can currently only have one running at a time in a given R session. To finish with a plot, press the stop button in Rstudio, or close the browser window and then press `Escape` or `Ctrl + C in R`.

As well as `input_slider()`, ggvis provides `input_checkbox()`, `input_checkboxgroup()`, `input_numeric()`, `input_radiobuttons()`, `input_select()` and `input_text()`. See the examples in the documentation for how you might use each one.

You can also use keyboard controls with `left_right()` and `up_down()`. Press the left and right arrows to control the size of the points in the next example.

```r
keys_s <- left_right(10, 1000, step = 50)
mtcars %>% ggvis(~wt, ~mpg, size := keys_s, opacity := 0.5) %>% layer_points()
```

```
## Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
## Generating a static (non-dynamic, non-interactive) version of the plot.
```

<!--html_preserve--><div id="plot_id750997200-container" class="ggvis-output-container">
<div id="plot_id750997200" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id750997200_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id750997200" data-renderer="svg">SVG</a>
 | 
<a id="plot_id750997200_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id750997200" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id750997200_download" class="ggvis-download" data-plot-id="plot_id750997200">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id750997200_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "reactive_791085517": "number",
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"reactive_791085517\",\"wt\",\"mpg\"\n505,2.62,21\n505,2.875,21\n505,2.32,22.8\n505,3.215,21.4\n505,3.44,18.7\n505,3.46,18.1\n505,3.57,14.3\n505,3.19,24.4\n505,3.15,22.8\n505,3.44,19.2\n505,3.44,17.8\n505,4.07,16.4\n505,3.73,17.3\n505,3.78,15.2\n505,5.25,10.4\n505,5.424,10.4\n505,5.345,14.7\n505,2.2,32.4\n505,1.615,30.4\n505,1.835,33.9\n505,2.465,21.5\n505,3.52,15.5\n505,3.435,15.2\n505,3.84,13.3\n505,3.845,19.2\n505,1.935,27.3\n505,2.14,26\n505,1.513,30.4\n505,3.17,15.8\n505,2.77,19.7\n505,3.57,15\n505,2.78,21.4"
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
            "field": "data.reactive_791085517"
          },
          "opacity": {
            "value": 0.5
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
ggvis.getPlot("plot_id750997200").parseSpec(plot_id750997200_spec);
</script><!--/html_preserve-->

```r
#> Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
#> Generating a static (non-dynamic, non-interactive) version of the plot.
```


You can also add on more complex types of interaction like tooltips:

```r
mtcars %>% ggvis(~wt, ~mpg) %>% 
  layer_points() %>% 
  add_tooltip(function(df) df$wt)
```

```
## Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
## Generating a static (non-dynamic, non-interactive) version of the plot.
```

<!--html_preserve--><div id="plot_id807713619-container" class="ggvis-output-container">
<div id="plot_id807713619" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id807713619_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id807713619" data-renderer="svg">SVG</a>
 | 
<a id="plot_id807713619_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id807713619" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id807713619_download" class="ggvis-download" data-plot-id="plot_id807713619">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id807713619_spec = {
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
ggvis.getPlot("plot_id807713619").parseSpec(plot_id807713619_spec);
</script><!--/html_preserve-->


##learn more about 

You’ll learn more about complex interaction in the **interactivity vignette**.

#Layers

So far, you seen two layer functions: `layer_points()` and `layer_histograms()`. There are many other layers, and they can be roughly categorised into two types:

 - Simple, which include primitives like points, lines and rectangles.
   
 - Compound, which combine data transformations with one or more simple layers.

All layer functions use the plural, not the singular. Think the verb, not the noun: I’m going to layer some points onto my plot.

##Simple layers

There are five simple layers:

###Points:  `layer_points()`
`layer_points()`, with properties `x`, `y`, `shape`, `stroke`, `fill`, `strokeOpacity`, `fillOpacity`, and `opacity`.

```r
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
```

<!--html_preserve--><div id="plot_id749794544-container" class="ggvis-output-container">
<div id="plot_id749794544" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id749794544_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id749794544" data-renderer="svg">SVG</a>
 | 
<a id="plot_id749794544_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id749794544" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id749794544_download" class="ggvis-download" data-plot-id="plot_id749794544">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id749794544_spec = {
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
ggvis.getPlot("plot_id749794544").parseSpec(plot_id749794544_spec);
</script><!--/html_preserve-->


###Paths and polygons: `layer_paths()`

`layer_paths()`.

```r
df <- data.frame(x = 1:10, y = runif(10))
df %>% ggvis(~x, ~y) %>% layer_paths()
```

<!--html_preserve--><div id="plot_id998320794-container" class="ggvis-output-container">
<div id="plot_id998320794" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id998320794_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id998320794" data-renderer="svg">SVG</a>
 | 
<a id="plot_id998320794_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id998320794" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id998320794_download" class="ggvis-download" data-plot-id="plot_id998320794">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id998320794_spec = {
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
      "values": "\"x\",\"y\"\n1,0.893473600037396\n2,0.533622919814661\n3,0.572827662341297\n4,0.221859511220828\n5,0.203718439908698\n6,0.98485678085126\n7,0.750871059251949\n8,0.917927149450406\n9,0.906925568124279\n10,0.424437581794336"
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
      "values": "\"domain\"\n0.16466152286157\n1.02391369789839"
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
            "value": "#000000"
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
ggvis.getPlot("plot_id998320794").parseSpec(plot_id998320794_spec);
</script><!--/html_preserve-->

If you supply a fill, you’ll get a polygon


```r
t <- seq(0, 2 * pi, length = 100)
df <- data.frame(x = sin(t), y = cos(t))
df %>% ggvis(~x, ~y) %>% layer_paths(fill := "red")
```

<!--html_preserve--><div id="plot_id850056796-container" class="ggvis-output-container">
<div id="plot_id850056796" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id850056796_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id850056796" data-renderer="svg">SVG</a>
 | 
<a id="plot_id850056796_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id850056796" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id850056796_download" class="ggvis-download" data-plot-id="plot_id850056796">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id850056796_spec = {
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
      "values": "\"x\",\"y\"\n0,1\n0.0634239196565645,0.997986676471884\n0.126592453573749,0.991954812830795\n0.18925124436041,0.981928697262707\n0.251147987181079,0.967948701396356\n0.312033445698487,0.950071117740945\n0.371662455660328,0.928367933016073\n0.429794912089172,0.902926538286621\n0.486196736100469,0.873849377069785\n0.540640817455598,0.841253532831181\n0.59290792905464,0.805270257531059\n0.642787609686539,0.766044443118978\n0.690079011482112,0.72373403810507\n0.734591708657533,0.678509411557132\n0.776146464291757,0.630552667084523\n0.814575952050336,0.580056909571198\n0.849725429949514,0.527225467610502\n0.881453363447582,0.472271074772683\n0.909631995354518,0.415415013001886\n0.934147860265107,0.356886221591872\n0.954902241444074,0.296920375328275\n0.971811568323542,0.235758935509427\n0.984807753012208,0.17364817766693\n0.993838464461254,0.110838199901011\n0.998867339183008,0.0475819158237422\n0.999874127673875,-0.015865963834808\n0.996854775951942,-0.0792499568567885\n0.989821441880933,-0.142314838273285\n0.978802446214779,-0.204806668065191\n0.963842158559942,-0.266473813690035\n0.945000818714668,-0.327067963317422\n0.922354294104581,-0.386345125693129\n0.895993774291336,-0.444066612605774\n0.866025403784438,-0.5\n0.832569854634771,-0.55392006386611\n0.795761840530832,-0.605609687137667\n0.755749574354258,-0.654860733945285\n0.712694171378863,-0.701474887706321\n0.666769000516292,-0.745264449675755\n0.618158986220605,-0.786053094742788\n0.567059863862771,-0.823676581429833\n0.513677391573406,-0.857983413234977\n0.458226521727411,-0.888835448654923\n0.400930535406614,-0.91610845743207\n0.342020143325669,-0.939692620785908\n0.28173255684143,-0.959492973614497\n0.220310532786541,-0.975429786885407\n0.15800139597335,-0.987438888676394\n0.0950560433041824,-0.995471922573085\n0.0317279334980677,-0.999496542383185\n-0.0317279334980679,-0.999496542383185\n-0.0950560433041826,-0.995471922573085\n-0.15800139597335,-0.987438888676394\n-0.220310532786541,-0.975429786885407\n-0.28173255684143,-0.959492973614497\n-0.342020143325669,-0.939692620785908\n-0.400930535406614,-0.91610845743207\n-0.45822652172741,-0.888835448654923\n-0.513677391573406,-0.857983413234977\n-0.567059863862771,-0.823676581429833\n-0.618158986220605,-0.786053094742787\n-0.666769000516292,-0.745264449675755\n-0.712694171378863,-0.701474887706321\n-0.755749574354258,-0.654860733945285\n-0.795761840530832,-0.605609687137667\n-0.832569854634771,-0.55392006386611\n-0.866025403784439,-0.5\n-0.895993774291336,-0.444066612605774\n-0.922354294104581,-0.386345125693129\n-0.945000818714668,-0.327067963317422\n-0.963842158559942,-0.266473813690035\n-0.978802446214779,-0.204806668065191\n-0.989821441880933,-0.142314838273285\n-0.996854775951942,-0.0792499568567888\n-0.999874127673875,-0.0158659638348076\n-0.998867339183008,0.0475819158237424\n-0.993838464461254,0.110838199901011\n-0.984807753012208,0.17364817766693\n-0.971811568323542,0.235758935509427\n-0.954902241444074,0.296920375328275\n-0.934147860265107,0.356886221591872\n-0.909631995354518,0.415415013001887\n-0.881453363447582,0.472271074772683\n-0.849725429949514,0.527225467610502\n-0.814575952050336,0.580056909571198\n-0.776146464291757,0.630552667084523\n-0.734591708657533,0.678509411557132\n-0.690079011482112,0.72373403810507\n-0.64278760968654,0.766044443118978\n-0.59290792905464,0.805270257531059\n-0.540640817455597,0.841253532831181\n-0.486196736100469,0.873849377069785\n-0.429794912089172,0.902926538286621\n-0.371662455660327,0.928367933016073\n-0.312033445698487,0.950071117740945\n-0.251147987181079,0.967948701396356\n-0.18925124436041,0.981928697262707\n-0.126592453573749,0.991954812830795\n-0.0634239196565645,0.997986676471884\n-2.44921270764475e-16,1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09986154044126\n1.09986154044126"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09947136950234\n1.09997482711916"
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
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          },
          "fill": {
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
ggvis.getPlot("plot_id850056796").parseSpec(plot_id850056796_spec);
</script><!--/html_preserve-->


###Filled areas (y & ):  `layer_ribbons()`
`layer_ribbons()`. Use properties `y` and `y2` to control the extent of the area.

```r
df <- data.frame(x = 1:10, y = runif(10))
df %>% ggvis(~x, ~y) %>% layer_ribbons()
```

<!--html_preserve--><div id="plot_id511055498-container" class="ggvis-output-container">
<div id="plot_id511055498" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id511055498_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id511055498" data-renderer="svg">SVG</a>
 | 
<a id="plot_id511055498_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id511055498" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id511055498_download" class="ggvis-download" data-plot-id="plot_id511055498">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id511055498_spec = {
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
      "values": "\"x\",\"y\"\n1,0.231784231262282\n2,0.803864125162363\n3,0.856240791967139\n4,0.463786928448826\n5,0.46228484949097\n6,0.645972561789677\n7,0.714923724764958\n8,0.147978612687439\n9,0.864124236162752\n10,0.447495342697948"
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
      "values": "\"domain\"\n0.112171331513673\n0.899931517336518"
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
ggvis.getPlot("plot_id511055498").parseSpec(plot_id511055498_spec);
</script><!--/html_preserve-->



```r
df <- data.frame(x = 1:10, y = runif(10))
df %>% ggvis(~x, ~y + 0.1, y2 = ~y - 0.1) %>% layer_ribbons()
```

<!--html_preserve--><div id="plot_id113552476-container" class="ggvis-output-container">
<div id="plot_id113552476" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id113552476_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id113552476" data-renderer="svg">SVG</a>
 | 
<a id="plot_id113552476_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id113552476" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id113552476_download" class="ggvis-download" data-plot-id="plot_id113552476">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id113552476_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "y - 0.1": "number",
          "x": "number",
          "y + 0.1": "number"
        }
      },
      "values": "\"y - 0.1\",\"x\",\"y + 0.1\"\n0.852484639594331,1,1.05248463959433\n0.287191070243716,2,0.487191070243716\n0.0698714108206332,3,0.269871410820633\n0.84635304925032,4,1.04635304925032\n0.00808614734560251,5,0.208086147345603\n0.524748879112303,6,0.724748879112303\n0.128204193757847,7,0.328204193757847\n0.719084604037926,8,0.919084604037926\n0.454624196141958,9,0.654624196141958\n0.685401259316131,10,0.885401259316131"
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
      "values": "\"domain\"\n-0.0441337772668339\n1.10470456420677"
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
            "scale": "y",
            "field": "data.y - 0\\.1"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y + 0\\.1"
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
      "title": "y + 0.1"
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
ggvis.getPlot("plot_id113552476").parseSpec(plot_id113552476_spec);
</script><!--/html_preserve-->


```r
df <- data.frame(x = sin(t), y = cos(t))
df %>% ggvis(~x, ~y + 0.1, y2 = ~y - 0.1) %>% layer_ribbons()
```

<!--html_preserve--><div id="plot_id503225077-container" class="ggvis-output-container">
<div id="plot_id503225077" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id503225077_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id503225077" data-renderer="svg">SVG</a>
 | 
<a id="plot_id503225077_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id503225077" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id503225077_download" class="ggvis-download" data-plot-id="plot_id503225077">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id503225077_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "y - 0.1": "number",
          "x": "number",
          "y + 0.1": "number"
        }
      },
      "values": "\"y - 0.1\",\"x\",\"y + 0.1\"\n0.9,0,1.1\n0.897986676471884,0.0634239196565645,1.09798667647188\n0.891954812830795,0.126592453573749,1.0919548128308\n0.881928697262707,0.18925124436041,1.08192869726271\n0.867948701396356,0.251147987181079,1.06794870139636\n0.850071117740945,0.312033445698487,1.05007111774095\n0.828367933016073,0.371662455660328,1.02836793301607\n0.802926538286621,0.429794912089172,1.00292653828662\n0.773849377069785,0.486196736100469,0.973849377069785\n0.741253532831181,0.540640817455598,0.941253532831181\n0.705270257531059,0.59290792905464,0.905270257531059\n0.666044443118978,0.642787609686539,0.866044443118978\n0.62373403810507,0.690079011482112,0.82373403810507\n0.578509411557132,0.734591708657533,0.778509411557132\n0.530552667084523,0.776146464291757,0.730552667084522\n0.480056909571198,0.814575952050336,0.680056909571198\n0.427225467610502,0.849725429949514,0.627225467610502\n0.372271074772683,0.881453363447582,0.572271074772683\n0.315415013001886,0.909631995354518,0.515415013001886\n0.256886221591872,0.934147860265107,0.456886221591872\n0.196920375328275,0.954902241444074,0.396920375328275\n0.135758935509427,0.971811568323542,0.335758935509427\n0.0736481776669304,0.984807753012208,0.27364817766693\n0.0108381999010111,0.993838464461254,0.210838199901011\n-0.0524180841762578,0.998867339183008,0.147581915823742\n-0.115865963834808,0.999874127673875,0.084134036165192\n-0.179249956856789,0.996854775951942,0.0207500431432115\n-0.242314838273285,0.989821441880933,-0.0423148382732852\n-0.304806668065191,0.978802446214779,-0.104806668065191\n-0.366473813690035,0.963842158559942,-0.166473813690035\n-0.427067963317422,0.945000818714668,-0.227067963317422\n-0.486345125693129,0.922354294104581,-0.286345125693129\n-0.544066612605774,0.895993774291336,-0.344066612605774\n-0.6,0.866025403784438,-0.4\n-0.65392006386611,0.832569854634771,-0.45392006386611\n-0.705609687137667,0.795761840530832,-0.505609687137667\n-0.754860733945285,0.755749574354258,-0.554860733945285\n-0.801474887706321,0.712694171378863,-0.601474887706321\n-0.845264449675755,0.666769000516292,-0.645264449675755\n-0.886053094742787,0.618158986220605,-0.686053094742788\n-0.923676581429833,0.567059863862771,-0.723676581429833\n-0.957983413234977,0.513677391573406,-0.757983413234977\n-0.988835448654923,0.458226521727411,-0.788835448654923\n-1.01610845743207,0.400930535406614,-0.81610845743207\n-1.03969262078591,0.342020143325669,-0.839692620785908\n-1.0594929736145,0.28173255684143,-0.859492973614497\n-1.07542978688541,0.220310532786541,-0.875429786885407\n-1.08743888867639,0.15800139597335,-0.887438888676394\n-1.09547192257308,0.0950560433041824,-0.895471922573085\n-1.09949654238319,0.0317279334980677,-0.899496542383185\n-1.09949654238319,-0.0317279334980679,-0.899496542383185\n-1.09547192257308,-0.0950560433041826,-0.895471922573085\n-1.08743888867639,-0.15800139597335,-0.887438888676394\n-1.07542978688541,-0.220310532786541,-0.875429786885407\n-1.0594929736145,-0.28173255684143,-0.859492973614497\n-1.03969262078591,-0.342020143325669,-0.839692620785908\n-1.01610845743207,-0.400930535406614,-0.81610845743207\n-0.988835448654923,-0.45822652172741,-0.788835448654923\n-0.957983413234977,-0.513677391573406,-0.757983413234977\n-0.923676581429833,-0.567059863862771,-0.723676581429833\n-0.886053094742787,-0.618158986220605,-0.686053094742787\n-0.845264449675755,-0.666769000516292,-0.645264449675755\n-0.801474887706321,-0.712694171378863,-0.601474887706321\n-0.754860733945285,-0.755749574354258,-0.554860733945285\n-0.705609687137667,-0.795761840530832,-0.505609687137667\n-0.65392006386611,-0.832569854634771,-0.453920063866111\n-0.6,-0.866025403784439,-0.4\n-0.544066612605774,-0.895993774291336,-0.344066612605774\n-0.486345125693129,-0.922354294104581,-0.286345125693129\n-0.427067963317422,-0.945000818714668,-0.227067963317422\n-0.366473813690035,-0.963842158559942,-0.166473813690035\n-0.304806668065191,-0.978802446214779,-0.104806668065191\n-0.242314838273285,-0.989821441880933,-0.0423148382732852\n-0.179249956856789,-0.996854775951942,0.0207500431432112\n-0.115865963834808,-0.999874127673875,0.0841340361651924\n-0.0524180841762576,-0.998867339183008,0.147581915823742\n0.0108381999010109,-0.993838464461254,0.210838199901011\n0.07364817766693,-0.984807753012208,0.27364817766693\n0.135758935509427,-0.971811568323542,0.335758935509427\n0.196920375328275,-0.954902241444074,0.396920375328275\n0.256886221591872,-0.934147860265107,0.456886221591872\n0.315415013001887,-0.909631995354518,0.515415013001887\n0.372271074772683,-0.881453363447582,0.572271074772683\n0.427225467610502,-0.849725429949514,0.627225467610502\n0.480056909571198,-0.814575952050336,0.680056909571198\n0.530552667084523,-0.776146464291757,0.730552667084523\n0.578509411557132,-0.734591708657533,0.778509411557132\n0.62373403810507,-0.690079011482112,0.82373403810507\n0.666044443118978,-0.64278760968654,0.866044443118978\n0.705270257531059,-0.59290792905464,0.905270257531059\n0.741253532831181,-0.540640817455597,0.941253532831181\n0.773849377069785,-0.486196736100469,0.973849377069785\n0.802926538286621,-0.429794912089172,1.00292653828662\n0.828367933016073,-0.371662455660327,1.02836793301607\n0.850071117740945,-0.312033445698487,1.05007111774095\n0.867948701396356,-0.251147987181079,1.06794870139636\n0.881928697262707,-0.18925124436041,1.08192869726271\n0.891954812830795,-0.126592453573749,1.0919548128308\n0.897986676471884,-0.0634239196565645,1.09798667647188\n0.9,-2.44921270764475e-16,1.1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09986154044126\n1.09986154044126"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.20947136950234\n1.20997482711916"
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
            "scale": "y",
            "field": "data.y - 0\\.1"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y + 0\\.1"
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
      "title": "y + 0.1"
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
ggvis.getPlot("plot_id503225077").parseSpec(plot_id503225077_spec);
</script><!--/html_preserve-->


###Rectangles

(x,,y,):  `layer_rects()`

`layer_rects()`. The location and size of the rectangle is controlled by the `x`, `x2`, `y `and `y2` properties.



```r
set.seed(1014)
df <- data.frame(x1 = runif(5), x2 = runif(5), y1 = runif(5), y2 = runif(5))
df %>% ggvis(~x1, ~y1, x2 = ~x2, y2 = ~y2, fillOpacity := 0.1) %>% layer_rects()
```

<!--html_preserve--><div id="plot_id360903065-container" class="ggvis-output-container">
<div id="plot_id360903065" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id360903065_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id360903065" data-renderer="svg">SVG</a>
 | 
<a id="plot_id360903065_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id360903065" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id360903065_download" class="ggvis-download" data-plot-id="plot_id360903065">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id360903065_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x2": "number",
          "y2": "number",
          "x1": "number",
          "y1": "number"
        }
      },
      "values": "\"x2\",\"y2\",\"x1\",\"y1\"\n0.466393497306854,0.195669834734872,0.0807501375675201,0.874600660754368\n0.497777388663962,0.403538117418066,0.834333037259057,0.174940626835451\n0.289767244597897,0.0636614572722465,0.600760886212811,0.0342413326725364\n0.732881987001747,0.388701313175261,0.157208441523835,0.320385730825365\n0.772521511185914,0.975547835230827,0.0073994412086904,0.402328238356858"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.0339472385938279\n0.875679717061576"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.0128239924553782\n1.02261316035874"
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
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "fill": {
            "value": "#333333"
          },
          "x2": {
            "scale": "x",
            "field": "data.x2"
          },
          "y2": {
            "scale": "y",
            "field": "data.y2"
          },
          "fillOpacity": {
            "value": 0.1
          },
          "x": {
            "scale": "x",
            "field": "data.x1"
          },
          "y": {
            "scale": "y",
            "field": "data.y1"
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
      "title": "x1"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y1"
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
ggvis.getPlot("plot_id360903065").parseSpec(plot_id360903065_spec);
</script><!--/html_preserve-->


###Text

(Text and its css):  `layer_text()`

`layer_text()`. The text layer has many new options to control the apperance of the text: `text` (the label), `dx` and `dy` (margin in pixels between text and anchor point), `angle` (rotate the text), `font` (font name), `fontSize` (size in pixels), `fontWeight` (e.g. bold or normal), `fontStyle` (e.g. italic or normal.)

```r
df <- data.frame(x = 3:1, y = c(1, 3, 2), label = c("a", "b", "c"))
df %>% ggvis(~x, ~y, text := ~label) %>% layer_text()
```

<!--html_preserve--><div id="plot_id710542383-container" class="ggvis-output-container">
<div id="plot_id710542383" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id710542383_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id710542383" data-renderer="svg">SVG</a>
 | 
<a id="plot_id710542383_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id710542383" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id710542383_download" class="ggvis-download" data-plot-id="plot_id710542383">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id710542383_spec = {
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
      "values": "\"label\",\"x\",\"y\"\n\"a\",3,1\n\"b\",2,3\n\"c\",1,2"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.9\n3.1"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.9\n3.1"
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
      "type": "text",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "text": {
            "field": "data.label"
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
ggvis.getPlot("plot_id710542383").parseSpec(plot_id710542383_spec);
</script><!--/html_preserve-->



```r
df %>% ggvis(~x, ~y, text := ~label) %>% layer_text(fontSize := 50,angle:= 45)
```

<!--html_preserve--><div id="plot_id761787638-container" class="ggvis-output-container">
<div id="plot_id761787638" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id761787638_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id761787638" data-renderer="svg">SVG</a>
 | 
<a id="plot_id761787638_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id761787638" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id761787638_download" class="ggvis-download" data-plot-id="plot_id761787638">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id761787638_spec = {
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
      "values": "\"label\",\"x\",\"y\"\n\"a\",3,1\n\"b\",2,3\n\"c\",1,2"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.9\n3.1"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.9\n3.1"
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
      "type": "text",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "text": {
            "field": "data.label"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          },
          "fontSize": {
            "value": 50
          },
          "angle": {
            "value": 45
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
ggvis.getPlot("plot_id761787638").parseSpec(plot_id761787638_spec);
</script><!--/html_preserve-->


##Compound layers

The four most common compound layers are:
### `layer_lines()` 
which automatically orders by the x variable:

```r
    t <- seq(0, 2 * pi, length = 20)
    df <- data.frame(x = sin(t), y = cos(t))
    df %>% ggvis(~x, ~y) %>% layer_paths()
```

<!--html_preserve--><div id="plot_id276361059-container" class="ggvis-output-container">
<div id="plot_id276361059" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id276361059_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id276361059" data-renderer="svg">SVG</a>
 | 
<a id="plot_id276361059_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id276361059" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id276361059_download" class="ggvis-download" data-plot-id="plot_id276361059">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id276361059_spec = {
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
      "values": "\"x\",\"y\"\n0,1\n0.324699469204683,0.945817241700635\n0.614212712689668,0.789140509396394\n0.837166478262529,0.546948158122427\n0.96940026593933,0.245485487140799\n0.99658449300667,-0.0825793454723323\n0.915773326655058,-0.401695424652969\n0.735723910673132,-0.677281571625741\n0.475947393037074,-0.879473751206489\n0.164594590280734,-0.986361303402722\n-0.164594590280734,-0.986361303402722\n-0.475947393037074,-0.879473751206489\n-0.735723910673131,-0.677281571625741\n-0.915773326655057,-0.40169542465297\n-0.99658449300667,-0.0825793454723327\n-0.96940026593933,0.245485487140799\n-0.837166478262529,0.546948158122427\n-0.614212712689668,0.789140509396393\n-0.324699469204684,0.945817241700635\n-2.44921270764475e-16,1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09624294230734\n1.09624294230734"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.08567936857286\n1.09931806517014"
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
            "value": "#000000"
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
ggvis.getPlot("plot_id276361059").parseSpec(plot_id276361059_spec);
</script><!--/html_preserve-->


```r
df %>% ggvis(~x, ~y) %>% layer_lines()
```

<!--html_preserve--><div id="plot_id982485706-container" class="ggvis-output-container">
<div id="plot_id982485706" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id982485706_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id982485706" data-renderer="svg">SVG</a>
 | 
<a id="plot_id982485706_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id982485706" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id982485706_download" class="ggvis-download" data-plot-id="plot_id982485706">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id982485706_spec = {
  "data": [
    {
      "name": ".0/arrange1",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n-0.99658449300667,-0.0825793454723327\n-0.96940026593933,0.245485487140799\n-0.915773326655057,-0.40169542465297\n-0.837166478262529,0.546948158122427\n-0.735723910673131,-0.677281571625741\n-0.614212712689668,0.789140509396393\n-0.475947393037074,-0.879473751206489\n-0.324699469204684,0.945817241700635\n-0.164594590280734,-0.986361303402722\n-2.44921270764475e-16,1\n0,1\n0.164594590280734,-0.986361303402722\n0.324699469204683,0.945817241700635\n0.475947393037074,-0.879473751206489\n0.614212712689668,0.789140509396394\n0.735723910673132,-0.677281571625741\n0.837166478262529,0.546948158122427\n0.915773326655058,-0.401695424652969\n0.96940026593933,0.245485487140799\n0.99658449300667,-0.0825793454723323"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09624294230734\n1.09624294230734"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.08567936857286\n1.09931806517014"
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
            "value": "#000000"
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
            "value": ".0/arrange1"
          }
        }
      },
      "from": {
        "data": ".0/arrange1"
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
ggvis.getPlot("plot_id982485706").parseSpec(plot_id982485706_spec);
</script><!--/html_preserve-->


```r
df %>% ggvis(~x, ~y) %>% layer_lines() %>% layer_paths()
```

<!--html_preserve--><div id="plot_id767369375-container" class="ggvis-output-container">
<div id="plot_id767369375" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id767369375_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id767369375" data-renderer="svg">SVG</a>
 | 
<a id="plot_id767369375_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id767369375" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id767369375_download" class="ggvis-download" data-plot-id="plot_id767369375">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id767369375_spec = {
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
      "values": "\"x\",\"y\"\n0,1\n0.324699469204683,0.945817241700635\n0.614212712689668,0.789140509396394\n0.837166478262529,0.546948158122427\n0.96940026593933,0.245485487140799\n0.99658449300667,-0.0825793454723323\n0.915773326655058,-0.401695424652969\n0.735723910673132,-0.677281571625741\n0.475947393037074,-0.879473751206489\n0.164594590280734,-0.986361303402722\n-0.164594590280734,-0.986361303402722\n-0.475947393037074,-0.879473751206489\n-0.735723910673131,-0.677281571625741\n-0.915773326655057,-0.40169542465297\n-0.99658449300667,-0.0825793454723327\n-0.96940026593933,0.245485487140799\n-0.837166478262529,0.546948158122427\n-0.614212712689668,0.789140509396393\n-0.324699469204684,0.945817241700635\n-2.44921270764475e-16,1"
    },
    {
      "name": ".0/arrange1",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n-0.99658449300667,-0.0825793454723327\n-0.96940026593933,0.245485487140799\n-0.915773326655057,-0.40169542465297\n-0.837166478262529,0.546948158122427\n-0.735723910673131,-0.677281571625741\n-0.614212712689668,0.789140509396393\n-0.475947393037074,-0.879473751206489\n-0.324699469204684,0.945817241700635\n-0.164594590280734,-0.986361303402722\n-2.44921270764475e-16,1\n0,1\n0.164594590280734,-0.986361303402722\n0.324699469204683,0.945817241700635\n0.475947393037074,-0.879473751206489\n0.614212712689668,0.789140509396394\n0.735723910673132,-0.677281571625741\n0.837166478262529,0.546948158122427\n0.915773326655058,-0.401695424652969\n0.96940026593933,0.245485487140799\n0.99658449300667,-0.0825793454723323"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09624294230734\n1.09624294230734"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.08567936857286\n1.09931806517014"
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
            "value": "#000000"
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
            "value": ".0/arrange1"
          }
        }
      },
      "from": {
        "data": ".0/arrange1"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
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
ggvis.getPlot("plot_id767369375").parseSpec(plot_id767369375_spec);
</script><!--/html_preserve-->


`layer_lines()` is equivalent to `arrange()` + `layer_paths()`:

```r
df %>% ggvis(~x, ~y) %>% arrange(x) %>% layer_paths()
```

<!--html_preserve--><div id="plot_id146301648-container" class="ggvis-output-container">
<div id="plot_id146301648" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id146301648_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id146301648" data-renderer="svg">SVG</a>
 | 
<a id="plot_id146301648_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id146301648" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id146301648_download" class="ggvis-download" data-plot-id="plot_id146301648">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id146301648_spec = {
  "data": [
    {
      "name": ".0/arrange1",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n-0.99658449300667,-0.0825793454723327\n-0.96940026593933,0.245485487140799\n-0.915773326655057,-0.40169542465297\n-0.837166478262529,0.546948158122427\n-0.735723910673131,-0.677281571625741\n-0.614212712689668,0.789140509396393\n-0.475947393037074,-0.879473751206489\n-0.324699469204684,0.945817241700635\n-0.164594590280734,-0.986361303402722\n-2.44921270764475e-16,1\n0,1\n0.164594590280734,-0.986361303402722\n0.324699469204683,0.945817241700635\n0.475947393037074,-0.879473751206489\n0.614212712689668,0.789140509396394\n0.735723910673132,-0.677281571625741\n0.837166478262529,0.546948158122427\n0.915773326655058,-0.401695424652969\n0.96940026593933,0.245485487140799\n0.99658449300667,-0.0825793454723323"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09624294230734\n1.09624294230734"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.08567936857286\n1.09931806517014"
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
            "value": "#000000"
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
            "value": ".0/arrange1"
          }
        }
      },
      "from": {
        "data": ".0/arrange1"
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
ggvis.getPlot("plot_id146301648").parseSpec(plot_id146301648_spec);
</script><!--/html_preserve-->


###`layer_histograms() and layer_freqpolys()` 

which allows you to explore the distribution of continuous. Both layers first bin the data with `compute_bin()` then display the results with either rects or lines.

```r
mtcars %>% ggvis(~mpg) %>% layer_histograms()
```

```
## Guessing width = 1 # range / 24
```

<!--html_preserve--><div id="plot_id577191216-container" class="ggvis-output-container">
<div id="plot_id577191216" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id577191216_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id577191216" data-renderer="svg">SVG</a>
 | 
<a id="plot_id577191216_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id577191216" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id577191216_download" class="ggvis-download" data-plot-id="plot_id577191216">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id577191216_spec = {
  "data": [
    {
      "name": ".0/bin1/stack2",
      "format": {
        "type": "csv",
        "parse": {
          "xmin_": "number",
          "xmax_": "number",
          "stack_upr_": "number",
          "stack_lwr_": "number"
        }
      },
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n9.5,10.5,2,0\n10.5,11.5,0,0\n11.5,12.5,0,0\n12.5,13.5,1,0\n13.5,14.5,1,0\n14.5,15.5,5,0\n15.5,16.5,2,0\n16.5,17.5,1,0\n17.5,18.5,2,0\n18.5,19.5,3,0\n19.5,20.5,1,0\n20.5,21.5,5,0\n21.5,22.5,0,0\n22.5,23.5,2,0\n23.5,24.5,1,0\n24.5,25.5,0,0\n25.5,26.5,1,0\n26.5,27.5,1,0\n27.5,28.5,0,0\n28.5,29.5,0,0\n29.5,30.5,2,0\n30.5,31.5,0,0\n31.5,32.5,1,0\n32.5,33.5,0,0\n33.5,34.5,1,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n8.25\n35.75"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n5.25"
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
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "fill": {
            "value": "#333333"
          },
          "x": {
            "scale": "x",
            "field": "data.xmin_"
          },
          "x2": {
            "scale": "x",
            "field": "data.xmax_"
          },
          "y": {
            "scale": "y",
            "field": "data.stack_upr_"
          },
          "y2": {
            "scale": "y",
            "field": "data.stack_lwr_"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/bin1/stack2"
          }
        }
      },
      "from": {
        "data": ".0/bin1/stack2"
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
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "count"
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
ggvis.getPlot("plot_id577191216").parseSpec(plot_id577191216_spec);
</script><!--/html_preserve-->


```r
binned <- mtcars %>% compute_bin(~mpg) 
```

```
## Guessing width = 1 # range / 24
```

```r
binned %>% ggvis(x = ~xmin_, x2 = ~xmax_, y2 = 0, y = ~count_, fill := "black") %>% layer_rects()
```

<!--html_preserve--><div id="plot_id726241490-container" class="ggvis-output-container">
<div id="plot_id726241490" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id726241490_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id726241490" data-renderer="svg">SVG</a>
 | 
<a id="plot_id726241490_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id726241490" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id726241490_download" class="ggvis-download" data-plot-id="plot_id726241490">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id726241490_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "xmin_": "number",
          "xmax_": "number",
          "count_": "number"
        }
      },
      "values": "\"xmin_\",\"xmax_\",\"count_\"\n9.5,10.5,2\n10.5,11.5,0\n11.5,12.5,0\n12.5,13.5,1\n13.5,14.5,1\n14.5,15.5,5\n15.5,16.5,2\n16.5,17.5,1\n17.5,18.5,2\n18.5,19.5,3\n19.5,20.5,1\n20.5,21.5,5\n21.5,22.5,0\n22.5,23.5,2\n23.5,24.5,1\n24.5,25.5,0\n25.5,26.5,1\n26.5,27.5,1\n27.5,28.5,0\n28.5,29.5,0\n29.5,30.5,2\n30.5,31.5,0\n31.5,32.5,1\n32.5,33.5,0\n33.5,34.5,1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n8.25\n35.75"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.25\n5.25"
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
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.xmin_"
          },
          "x2": {
            "scale": "x",
            "field": "data.xmax_"
          },
          "y2": {
            "scale": "y",
            "value": 0
          },
          "y": {
            "scale": "y",
            "field": "data.count_"
          },
          "fill": {
            "value": "black"
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
      "grid": true
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true
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
ggvis.getPlot("plot_id726241490").parseSpec(plot_id726241490_spec);
</script><!--/html_preserve-->



```r
binned %>%  ggvis(x = ~xmin_, x2 = ~xmax_, y2 = 1, y = ~count_, fill := "black") %>% layer_rects()
```

<!--html_preserve--><div id="plot_id719700402-container" class="ggvis-output-container">
<div id="plot_id719700402" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id719700402_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id719700402" data-renderer="svg">SVG</a>
 | 
<a id="plot_id719700402_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id719700402" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id719700402_download" class="ggvis-download" data-plot-id="plot_id719700402">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id719700402_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "xmin_": "number",
          "xmax_": "number",
          "count_": "number"
        }
      },
      "values": "\"xmin_\",\"xmax_\",\"count_\"\n9.5,10.5,2\n10.5,11.5,0\n11.5,12.5,0\n12.5,13.5,1\n13.5,14.5,1\n14.5,15.5,5\n15.5,16.5,2\n16.5,17.5,1\n17.5,18.5,2\n18.5,19.5,3\n19.5,20.5,1\n20.5,21.5,5\n21.5,22.5,0\n22.5,23.5,2\n23.5,24.5,1\n24.5,25.5,0\n25.5,26.5,1\n26.5,27.5,1\n27.5,28.5,0\n28.5,29.5,0\n29.5,30.5,2\n30.5,31.5,0\n31.5,32.5,1\n32.5,33.5,0\n33.5,34.5,1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n8.25\n35.75"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.25\n5.25"
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
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.xmin_"
          },
          "x2": {
            "scale": "x",
            "field": "data.xmax_"
          },
          "y2": {
            "scale": "y",
            "value": 1
          },
          "y": {
            "scale": "y",
            "field": "data.count_"
          },
          "fill": {
            "value": "black"
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
      "grid": true
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true
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
ggvis.getPlot("plot_id719700402").parseSpec(plot_id719700402_spec);
</script><!--/html_preserve-->


###`layer_smooths()`

fits a smooth model to the data, and displays predictions with a line. It’s used to highlight the trend in noisy data:

```r
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()
```

<!--html_preserve--><div id="plot_id128107292-container" class="ggvis-output-container">
<div id="plot_id128107292" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id128107292_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id128107292" data-renderer="svg">SVG</a>
 | 
<a id="plot_id128107292_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id128107292" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id128107292_download" class="ggvis-download" data-plot-id="plot_id128107292">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id128107292_spec = {
  "data": [
    {
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,32.08897233857\n1.56250632911392,31.6878645869701\n1.61201265822785,31.2816303797919\n1.66151898734177,30.8703709543688\n1.7110253164557,30.4541875480347\n1.76053164556962,30.0331813981232\n1.81003797468354,29.6074537419678\n1.85954430379747,29.1771058169022\n1.90905063291139,28.7422388602601\n1.95855696202532,28.3001719301537\n2.00806329113924,27.834621969428\n2.05756962025316,27.3476575600419\n2.10707594936709,26.84497968394\n2.15658227848101,26.3322893230667\n2.20608860759494,25.8152874593666\n2.25559493670886,25.2996750747841\n2.30510126582278,24.7911531512637\n2.35460759493671,24.29542267075\n2.40411392405063,23.8181846151875\n2.45362025316456,23.3651399665205\n2.50312658227848,22.955253039598\n2.55263291139241,22.6138488714952\n2.60213924050633,22.3275852300224\n2.65164556962025,22.0817586181852\n2.70115189873418,21.8616655389892\n2.7506582278481,21.65260249544\n2.80016455696203,21.4398659905432\n2.84967088607595,21.2087525273044\n2.89917721518987,20.953335722037\n2.9486835443038,20.7158424594628\n2.99818987341772,20.4957065225374\n3.04769620253165,20.2829337645837\n3.09720253164557,20.0675300389245\n3.14670886075949,19.8395011988825\n3.19621518987342,19.5888530977805\n3.24572151898734,19.2971559094315\n3.29522784810127,18.9444093670088\n3.34473417721519,18.5670026794964\n3.39424050632911,18.2056968860288\n3.44374683544304,17.9009022641924\n3.49325316455696,17.620602502374\n3.54275949367089,17.3400153015964\n3.59226582278481,17.079077805285\n3.64177215189873,16.8175887231322\n3.69127848101266,16.5575726926136\n3.74078481012658,16.3083303048321\n3.79029113924051,16.0791621508901\n3.83979746835443,15.8793688218903\n3.88930379746835,15.7018119854881\n3.93881012658228,15.5259429561214\n3.9883164556962,15.3517253848296\n4.03782278481013,15.1793328075288\n4.08732911392405,15.0089387601353\n4.13683544303798,14.8407167785652\n4.1863417721519,14.6748403987346\n4.23584810126582,14.5114831565596\n4.28535443037975,14.3508185879563\n4.33486075949367,14.193020228841\n4.3843670886076,14.0382616151298\n4.43387341772152,13.8867162827388\n4.48337974683544,13.7385577675841\n4.53288607594937,13.5939596055819\n4.58239240506329,13.4530953326483\n4.63189873417722,13.3161384846995\n4.68140506329114,13.1832625976516\n4.73091139240506,13.0546412074207\n4.78041772151899,12.930447849923\n4.82992405063291,12.8108560610747\n4.87943037974684,12.6960393767918\n4.92893670886076,12.5861713329905\n4.97844303797468,12.4814254655869\n5.02794936708861,12.3819753104973\n5.07745569620253,12.2879944036376\n5.12696202531646,12.1996562809241\n5.17646835443038,12.117134478273\n5.2259746835443,12.0406025316002\n5.27548101265823,11.9702339768221\n5.32498734177215,11.9062023498547\n5.37449367088608,11.8486811866141\n5.424,11.7978440230166"
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
      "values": "\"domain\"\n10.7832876072389\n33.1035287543477"
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
            "value": "#000000"
          },
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
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
ggvis.getPlot("plot_id128107292").parseSpec(plot_id128107292_spec);
</script><!--/html_preserve-->

```r
# Or equivalently
smoothed <- mtcars %>% compute_smooth(mpg ~ wt)
smoothed %>% ggvis(~pred_, ~resp_) %>% layer_paths()
```

<!--html_preserve--><div id="plot_id303006280-container" class="ggvis-output-container">
<div id="plot_id303006280" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id303006280_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id303006280" data-renderer="svg">SVG</a>
 | 
<a id="plot_id303006280_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id303006280" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id303006280_download" class="ggvis-download" data-plot-id="plot_id303006280">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id303006280_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,32.08897233857\n1.56250632911392,31.6878645869701\n1.61201265822785,31.2816303797919\n1.66151898734177,30.8703709543688\n1.7110253164557,30.4541875480347\n1.76053164556962,30.0331813981232\n1.81003797468354,29.6074537419678\n1.85954430379747,29.1771058169022\n1.90905063291139,28.7422388602601\n1.95855696202532,28.3001719301537\n2.00806329113924,27.834621969428\n2.05756962025316,27.3476575600419\n2.10707594936709,26.84497968394\n2.15658227848101,26.3322893230667\n2.20608860759494,25.8152874593666\n2.25559493670886,25.2996750747841\n2.30510126582278,24.7911531512637\n2.35460759493671,24.29542267075\n2.40411392405063,23.8181846151875\n2.45362025316456,23.3651399665205\n2.50312658227848,22.955253039598\n2.55263291139241,22.6138488714952\n2.60213924050633,22.3275852300224\n2.65164556962025,22.0817586181852\n2.70115189873418,21.8616655389892\n2.7506582278481,21.65260249544\n2.80016455696203,21.4398659905432\n2.84967088607595,21.2087525273044\n2.89917721518987,20.953335722037\n2.9486835443038,20.7158424594628\n2.99818987341772,20.4957065225374\n3.04769620253165,20.2829337645837\n3.09720253164557,20.0675300389245\n3.14670886075949,19.8395011988825\n3.19621518987342,19.5888530977805\n3.24572151898734,19.2971559094315\n3.29522784810127,18.9444093670088\n3.34473417721519,18.5670026794964\n3.39424050632911,18.2056968860288\n3.44374683544304,17.9009022641924\n3.49325316455696,17.620602502374\n3.54275949367089,17.3400153015964\n3.59226582278481,17.079077805285\n3.64177215189873,16.8175887231322\n3.69127848101266,16.5575726926136\n3.74078481012658,16.3083303048321\n3.79029113924051,16.0791621508901\n3.83979746835443,15.8793688218903\n3.88930379746835,15.7018119854881\n3.93881012658228,15.5259429561214\n3.9883164556962,15.3517253848296\n4.03782278481013,15.1793328075288\n4.08732911392405,15.0089387601353\n4.13683544303798,14.8407167785652\n4.1863417721519,14.6748403987346\n4.23584810126582,14.5114831565596\n4.28535443037975,14.3508185879563\n4.33486075949367,14.193020228841\n4.3843670886076,14.0382616151298\n4.43387341772152,13.8867162827388\n4.48337974683544,13.7385577675841\n4.53288607594937,13.5939596055819\n4.58239240506329,13.4530953326483\n4.63189873417722,13.3161384846995\n4.68140506329114,13.1832625976516\n4.73091139240506,13.0546412074207\n4.78041772151899,12.930447849923\n4.82992405063291,12.8108560610747\n4.87943037974684,12.6960393767918\n4.92893670886076,12.5861713329905\n4.97844303797468,12.4814254655869\n5.02794936708861,12.3819753104973\n5.07745569620253,12.2879944036376\n5.12696202531646,12.1996562809241\n5.17646835443038,12.117134478273\n5.2259746835443,12.0406025316002\n5.27548101265823,11.9702339768221\n5.32498734177215,11.9062023498547\n5.37449367088608,11.8486811866141\n5.424,11.7978440230166"
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
      "values": "\"domain\"\n10.7832876072389\n33.1035287543477"
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
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
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
      "grid": true
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true
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
ggvis.getPlot("plot_id303006280").parseSpec(plot_id303006280_spec);
</script><!--/html_preserve-->


You can control the degree of wiggliness with the span parameter:
```
span <- input_slider(0.2, 1, value = 0.75)
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths(span = span)

#> Warning: Can't output dynamic/interactive ggvis plots in a knitr document.
#> Generating a static (non-dynamic, non-interactive) version of the plot.
```

###more about layers

You can learn more about layers in the **layers vignette**.

#Multiple layers

Rich graphics can be created by combining multiple layers on the same plot. This easier to do: just layer on multiple elements:

```r
mtcars %>% 
  ggvis(~wt, ~mpg) %>% 
  layer_smooths() %>% 
  layer_points()
```

<!--html_preserve--><div id="plot_id370747725-container" class="ggvis-output-container">
<div id="plot_id370747725" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id370747725_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id370747725" data-renderer="svg">SVG</a>
 | 
<a id="plot_id370747725_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id370747725" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id370747725_download" class="ggvis-download" data-plot-id="plot_id370747725">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id370747725_spec = {
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
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,32.08897233857\n1.56250632911392,31.6878645869701\n1.61201265822785,31.2816303797919\n1.66151898734177,30.8703709543688\n1.7110253164557,30.4541875480347\n1.76053164556962,30.0331813981232\n1.81003797468354,29.6074537419678\n1.85954430379747,29.1771058169022\n1.90905063291139,28.7422388602601\n1.95855696202532,28.3001719301537\n2.00806329113924,27.834621969428\n2.05756962025316,27.3476575600419\n2.10707594936709,26.84497968394\n2.15658227848101,26.3322893230667\n2.20608860759494,25.8152874593666\n2.25559493670886,25.2996750747841\n2.30510126582278,24.7911531512637\n2.35460759493671,24.29542267075\n2.40411392405063,23.8181846151875\n2.45362025316456,23.3651399665205\n2.50312658227848,22.955253039598\n2.55263291139241,22.6138488714952\n2.60213924050633,22.3275852300224\n2.65164556962025,22.0817586181852\n2.70115189873418,21.8616655389892\n2.7506582278481,21.65260249544\n2.80016455696203,21.4398659905432\n2.84967088607595,21.2087525273044\n2.89917721518987,20.953335722037\n2.9486835443038,20.7158424594628\n2.99818987341772,20.4957065225374\n3.04769620253165,20.2829337645837\n3.09720253164557,20.0675300389245\n3.14670886075949,19.8395011988825\n3.19621518987342,19.5888530977805\n3.24572151898734,19.2971559094315\n3.29522784810127,18.9444093670088\n3.34473417721519,18.5670026794964\n3.39424050632911,18.2056968860288\n3.44374683544304,17.9009022641924\n3.49325316455696,17.620602502374\n3.54275949367089,17.3400153015964\n3.59226582278481,17.079077805285\n3.64177215189873,16.8175887231322\n3.69127848101266,16.5575726926136\n3.74078481012658,16.3083303048321\n3.79029113924051,16.0791621508901\n3.83979746835443,15.8793688218903\n3.88930379746835,15.7018119854881\n3.93881012658228,15.5259429561214\n3.9883164556962,15.3517253848296\n4.03782278481013,15.1793328075288\n4.08732911392405,15.0089387601353\n4.13683544303798,14.8407167785652\n4.1863417721519,14.6748403987346\n4.23584810126582,14.5114831565596\n4.28535443037975,14.3508185879563\n4.33486075949367,14.193020228841\n4.3843670886076,14.0382616151298\n4.43387341772152,13.8867162827388\n4.48337974683544,13.7385577675841\n4.53288607594937,13.5939596055819\n4.58239240506329,13.4530953326483\n4.63189873417722,13.3161384846995\n4.68140506329114,13.1832625976516\n4.73091139240506,13.0546412074207\n4.78041772151899,12.930447849923\n4.82992405063291,12.8108560610747\n4.87943037974684,12.6960393767918\n4.92893670886076,12.5861713329905\n4.97844303797468,12.4814254655869\n5.02794936708861,12.3819753104973\n5.07745569620253,12.2879944036376\n5.12696202531646,12.1996562809241\n5.17646835443038,12.117134478273\n5.2259746835443,12.0406025316002\n5.27548101265823,11.9702339768221\n5.32498734177215,11.9062023498547\n5.37449367088608,11.8486811866141\n5.424,11.7978440230166"
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
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
      }
    },
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
ggvis.getPlot("plot_id370747725").parseSpec(plot_id370747725_spec);
</script><!--/html_preserve-->

You could use this approach to add two smoothers with varying degrees of wiggliness:

```r
mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_smooths(span = 1) %>%
  layer_smooths(span = 0.3, stroke := "red")
```

<!--html_preserve--><div id="plot_id672819052-container" class="ggvis-output-container">
<div id="plot_id672819052" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id672819052_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id672819052" data-renderer="svg">SVG</a>
 | 
<a id="plot_id672819052_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id672819052" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id672819052_download" class="ggvis-download" data-plot-id="plot_id672819052">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id672819052_spec = {
  "data": [
    {
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,32.3559076033652\n1.56250632911392,31.8753059433938\n1.61201265822785,31.4002837186303\n1.66151898734177,30.9307786143783\n1.7110253164557,30.4667283159411\n1.76053164556962,30.0080705086221\n1.81003797468354,29.5547428777247\n1.85954430379747,29.1066831085523\n1.90905063291139,28.6638288864083\n1.95855696202532,28.2261593300757\n2.00806329113924,27.7939085521993\n2.05756962025316,27.3671227416083\n2.10707594936709,26.9458006046978\n2.15658227848101,26.5299408478625\n2.20608860759494,26.1195421774975\n2.25559493670886,25.7146032999975\n2.30510126582278,25.3151229217576\n2.35460759493671,24.9210997491726\n2.40411392405063,24.5325324886374\n2.45362025316456,24.1494198465469\n2.50312658227848,23.7704013112288\n2.55263291139241,23.3930410310992\n2.60213924050633,23.0184854507692\n2.65164556962025,22.648013375053\n2.70115189873418,22.2829036087647\n2.7506582278481,21.9244349567186\n2.80016455696203,21.5738862237289\n2.84967088607595,21.2325362146096\n2.89917721518987,20.8994648774453\n2.9486835443038,20.563314278298\n2.99818987341772,20.2260322794124\n3.04769620253165,19.8921207313051\n3.09720253164557,19.5660814844932\n3.14670886075949,19.2524163894935\n3.19621518987342,18.9556272968227\n3.24572151898734,18.6776819657173\n3.29522784810127,18.4109241123963\n3.34473417721519,18.1533810871694\n3.39424050632911,17.9038917888661\n3.44374683544304,17.6613801039195\n3.49325316455696,17.4367412601373\n3.54275949367089,17.2198928657746\n3.59226582278481,16.9885817927012\n3.64177215189873,16.7560619903523\n3.69127848101266,16.5274875375278\n3.74078481012658,16.3032371340526\n3.79029113924051,16.0836894797512\n3.83979746835443,15.8692232744485\n3.88930379746835,15.6600927173047\n3.93881012658228,15.4562638006676\n3.9883164556962,15.2577332064667\n4.03782278481013,15.064498632161\n4.08732911392405,14.8765577752094\n4.13683544303798,14.6939083330709\n4.1863417721519,14.5165480032044\n4.23584810126582,14.344474483069\n4.28535443037975,14.1776854701235\n4.33486075949367,14.016178661827\n4.3843670886076,13.8599517556385\n4.43387341772152,13.7090024490167\n4.48337974683544,13.5633284394209\n4.53288607594937,13.4229274243098\n4.58239240506329,13.2877971011425\n4.63189873417722,13.157935167378\n4.68140506329114,13.0333393204751\n4.73091139240506,12.9140072578929\n4.78041772151899,12.7999366770903\n4.82992405063291,12.6911252755264\n4.87943037974684,12.58757075066\n4.92893670886076,12.4892707999501\n4.97844303797468,12.3962231208557\n5.02794936708861,12.3084254108357\n5.07745569620253,12.2258753673492\n5.12696202531646,12.148570687855\n5.17646835443038,12.0765090698122\n5.2259746835443,12.0096882106797\n5.27548101265823,11.9481058079165\n5.32498734177215,11.8917595589815\n5.37449367088608,11.8406471613337\n5.424,11.7947663124321"
    },
    {
      "name": ".0/model_prediction2",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,30.3528219184399\n1.56250632911392,30.6813491639329\n1.61201265822785,30.9240279407622\n1.66151898734177,31.0840794539856\n1.7110253164557,31.1631154036184\n1.76053164556962,31.159151627668\n1.81003797468354,31.0701942224979\n1.85954430379747,30.9035377873267\n1.90905063291139,30.6817149751938\n1.95855696202532,30.3275430113279\n2.00806329113924,29.7946392799927\n2.05756962025316,29.1406588639895\n2.10707594936709,28.4330772541569\n2.15658227848101,27.7216611334163\n2.20608860759494,26.9527448874162\n2.25559493670886,26.2467425628351\n2.30510126582278,25.4977429623696\n2.35460759493671,24.4843623615219\n2.40411392405063,23.1117647143157\n2.45362025316456,21.9336896820517\n2.50312658227848,21.2607437724578\n2.55263291139241,20.7548408771298\n2.60213924050633,20.4118891420239\n2.65164556962025,20.3006993090861\n2.70115189873418,20.48600311683\n2.7506582278481,20.6900837446194\n2.80016455696203,20.7082261939936\n2.84967088607595,20.7377120826661\n2.89917721518987,20.7255362806169\n2.9486835443038,20.5172244269693\n2.99818987341772,20.2292494002164\n3.04769620253165,20.0172422880359\n3.09720253164557,20.0368341781057\n3.14670886075949,20.4436561581034\n3.19621518987342,21.3977884988471\n3.24572151898734,21.6762765675943\n3.29522784810127,20.8353925819041\n3.34473417721519,19.4634658229779\n3.39424050632911,18.2173081543554\n3.44374683544304,17.7139891153616\n3.49325316455696,16.8900114461437\n3.54275949367089,15.4046339999842\n3.59226582278481,14.4298295635723\n3.64177215189873,14.8530726748503\n3.69127848101266,15.7187465076159\n3.74078481012658,16.1456038160851\n3.79029113924051,16.2329096529683\n3.83979746835443,16.3041713942188\n3.88930379746835,16.3820100701269\n3.93881012658228,16.4227436392274\n3.9883164556962,16.4308850916567\n4.03782278481013,16.412135435139\n4.08732911392405,16.3714426419233\n4.13683544303798,16.3045097281056\n4.1863417721519,16.2112110370203\n4.23584810126582,16.0937725710335\n4.28535443037975,15.954420332511\n4.33486075949367,15.7953803238189\n4.3843670886076,15.6188785473231\n4.43387341772152,15.4271410053896\n4.48337974683544,15.2223937003843\n4.53288607594937,15.0068626346732\n4.58239240506329,14.7827738106223\n4.63189873417722,14.5523532305975\n4.68140506329114,14.3178268969648\n4.73091139240506,14.0814208120903\n4.78041772151899,13.8453609783397\n4.82992405063291,13.6118733980792\n4.87943037974684,13.3831840736747\n4.92893670886076,13.1615190074921\n4.97844303797468,12.9491042018974\n5.02794936708861,12.7481656592566\n5.07745569620253,12.5609293819356\n5.12696202531646,12.3896213723005\n5.17646835443038,12.2364676327171\n5.2259746835443,12.1036941655515\n5.27548101265823,11.9895270705648\n5.32498734177215,11.879947255423\n5.37449367088608,11.7878631009542\n5.424,11.7108087802481"
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
      "values": "\"domain\"\n10.6785538390922\n33.3881625445211"
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
            "value": "#000000"
          },
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "stroke": {
            "value": "red"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction2"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction2"
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
ggvis.getPlot("plot_id672819052").parseSpec(plot_id672819052_spec);
</script><!--/html_preserve-->


## more about rich hierarchical graphics

You’ll learn more about building up **rich hierarchical graphics** in data hierarchy.

#More details (scales, legends and axes)

There are other optional components that you can include:

    `scales`, to control the mapping between data and visual properties. These are described in the **properties and scales vignette**.

    `legends and axes` to control the appearance of the guides produced by the scales. See the **axes and legends vignette** for more details.
