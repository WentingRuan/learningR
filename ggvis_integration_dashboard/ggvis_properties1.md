# Properties and Scales
Ethel Ruan  
2017-02-11  




Understanding how properties and scales work in ggvis an important step to mastering basic static plots, and is also necessary for great interactive graphics.

In this chapter, you will learn:

 - the convenient `props()` wrapper which makes the most common types of property mappings available through a concise interface

 - the `prop()` function, which is more verbose, but gives you full control over all options

 - what scales do, how properties and scales are connected, how you can override the defaults.

Note that unlike ggplot2, scales do not control the appearance of their guides: see the **axes and legends vignette** <http://ggvis.rstudio.com/axes-legends.html> for how to customise their display.

#The `props()` wrapper

Every ggvis mark is associated with a set of properties that governs how it is displayed. These properties can be constant values (like 5, “blue”, or “square”), or mapped to variables in your dataset. ggplot2 syntax made a distinction between mapping variables and setting constants. 
For example, in ggplot2, you might say:
```

geom_point(aes(x = wt, y = mpg), colour = "red", size = 5)

```
But in ggvis, everything is a property:
```
layer_paths(x = ~wt, y = ~mpg, stroke := "red", strokeWidth := 5)
```
This section introduces `props()`, a convenient function for creating property objects and binding them to property names. The next chapter shows you how to create the property objects by hand, giving you more control over the specification at the cost of some extra typing.

#Mapping vs setting (scaled vs unscaled)

In a data graphic, there is a **mapping** between **values and visual properties**. A value is something like 5, or “red”, or the numbers in a column of a data frame. A visual property is something like the x-position, y-position, size, or color of a point, rectangle, or other visual object.

Compared to ggplot2, the controls in ggvis may be a little confusing. However, ggplot2 has a number of special cases that are handled under the hood. Once you get the hang of `props()`, you should find it simpler than `aes()` and various ways of setting aesthetics in ggplot2.

The `props()` function creates objects that govern the relationship between values and properties. One important characteristic is whether the value-property relationship is scaled or unscaled. These are sometimes called mapping (for scaled values) and setting (unscaled values). When the relationship is scaled, the data values go through a mapping function that results in values in the visual property space.

For example, suppose that you want to use a variable in a data set on the x axis, and the data values are numbers from 55 to 75. If the relationship is scaled, then the data value 55 is typically mapped to an x position on the left side of the plot, the data value 75 is mapped to an x position on the right side of the plot, and values in between are linearly mapped somewhere between those positions.

If the relationship is unscaled, then the data values 55 to 75 would be used directly by the rendering engine. In the case of ggvis and Vega, a value of 55 means “55 pixels from the left edge”, and a value of 75 means “75 pixels from the left edge”. No matter how the plot is resized, those pixel positions would remain the same.

## `=` `：=`

The `props()` function uses the `=` operate for **mapping** (**scaled**), and the `:=` operator for **setting (unscaled)**. It also uses the `~` operator to indicate that an expression should be evaluated in the data (and in ggvis, the data can change); **without the `~` operator, the expression is evaluated immediately in the current environment**. Generally speaking, you’ll want to use `~`for variables in the data, and not use it for constant values.

Here are some examples of how to use = (mapping) and := (setting), as well as ~ (evaluated in data) or not.

 - `props(x = ~displ, y = ~mpg)`: map engine displacement (in the data) to x and miles per gallon to y

 - `props(stroke := "red", fill := "blue")`: set the stroke colour to red and the fill colour to blue.

 -  `props(x = ~displ, y := 10)`: map displacement to xand set the y position to 10 pixels (for unscaled y values, the origin is at the top).

Those examples follow a common pattern: `=` is always scaled, and `:=` is never scaled. `~` is always used with the name of the variable. What if you try the opposite?

 - `props(x = 0)`: sets the x position to the data value 0

It’s also possible provide a scaled constant instead of a raw constant. That’s useful when you want to label different layers in a plot:


```r
library(ggvis)
```

```
## Warning: package 'ggvis' was built under R version 3.3.2
```

```r
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points() %>%
  layer_model_predictions(model = "lm", stroke = "lm") %>%
  layer_smooths(stroke = "loess")
```

```
## Guessing formula = mpg ~ wt
```

<!--html_preserve--><div id="plot_id951809417-container" class="ggvis-output-container">
<div id="plot_id951809417" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id951809417_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id951809417" data-renderer="svg">SVG</a>
 | 
<a id="plot_id951809417_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id951809417" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id951809417_download" class="ggvis-download" data-plot-id="plot_id951809417">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id951809417_spec = {
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
      "values": "\"pred_\",\"resp_\"\n1.513,29.1989406778126\n1.56250632911392,28.9343555091934\n1.61201265822785,28.6697703405742\n1.66151898734177,28.4051851719549\n1.7110253164557,28.1406000033357\n1.76053164556962,27.8760148347165\n1.81003797468354,27.6114296660973\n1.85954430379747,27.3468444974781\n1.90905063291139,27.0822593288588\n1.95855696202532,26.8176741602396\n2.00806329113924,26.5530889916204\n2.05756962025316,26.2885038230012\n2.10707594936709,26.023918654382\n2.15658227848101,25.7593334857627\n2.20608860759494,25.4947483171435\n2.25559493670886,25.2301631485243\n2.30510126582278,24.9655779799051\n2.35460759493671,24.7009928112859\n2.40411392405063,24.4364076426666\n2.45362025316456,24.1718224740474\n2.50312658227848,23.9072373054282\n2.55263291139241,23.642652136809\n2.60213924050633,23.3780669681898\n2.65164556962025,23.1134817995705\n2.70115189873418,22.8488966309513\n2.7506582278481,22.5843114623321\n2.80016455696203,22.3197262937129\n2.84967088607595,22.0551411250937\n2.89917721518987,21.7905559564744\n2.9486835443038,21.5259707878552\n2.99818987341772,21.261385619236\n3.04769620253165,20.9968004506168\n3.09720253164557,20.7322152819976\n3.14670886075949,20.4676301133783\n3.19621518987342,20.2030449447591\n3.24572151898734,19.9384597761399\n3.29522784810127,19.6738746075207\n3.34473417721519,19.4092894389015\n3.39424050632911,19.1447042702822\n3.44374683544304,18.880119101663\n3.49325316455696,18.6155339330438\n3.54275949367089,18.3509487644246\n3.59226582278481,18.0863635958054\n3.64177215189873,17.8217784271861\n3.69127848101266,17.5571932585669\n3.74078481012658,17.2926080899477\n3.79029113924051,17.0280229213285\n3.83979746835443,16.7634377527093\n3.88930379746835,16.49885258409\n3.93881012658228,16.2342674154708\n3.9883164556962,15.9696822468516\n4.03782278481013,15.7050970782324\n4.08732911392405,15.4405119096132\n4.13683544303798,15.1759267409939\n4.1863417721519,14.9113415723747\n4.23584810126582,14.6467564037555\n4.28535443037975,14.3821712351363\n4.33486075949367,14.1175860665171\n4.3843670886076,13.8530008978978\n4.43387341772152,13.5884157292786\n4.48337974683544,13.3238305606594\n4.53288607594937,13.0592453920402\n4.58239240506329,12.794660223421\n4.63189873417722,12.5300750548017\n4.68140506329114,12.2654898861825\n4.73091139240506,12.0009047175633\n4.78041772151899,11.7363195489441\n4.82992405063291,11.4717343803249\n4.87943037974684,11.2071492117056\n4.92893670886076,10.9425640430864\n4.97844303797468,10.6779788744672\n5.02794936708861,10.413393705848\n5.07745569620253,10.1488085372288\n5.12696202531646,9.88422336860955\n5.17646835443038,9.61963819999033\n5.2259746835443,9.35505303137111\n5.27548101265823,9.09046786275189\n5.32498734177215,8.82588269413267\n5.37449367088608,8.56129752551345\n5.424,8.29671235689423"
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
      "values": "\"pred_\",\"resp_\"\n1.513,32.08897233857\n1.56250632911392,31.6878645869701\n1.61201265822785,31.2816303797919\n1.66151898734177,30.8703709543688\n1.7110253164557,30.4541875480347\n1.76053164556962,30.0331813981232\n1.81003797468354,29.6074537419678\n1.85954430379747,29.1771058169022\n1.90905063291139,28.7422388602601\n1.95855696202532,28.3001719301537\n2.00806329113924,27.834621969428\n2.05756962025316,27.3476575600419\n2.10707594936709,26.84497968394\n2.15658227848101,26.3322893230667\n2.20608860759494,25.8152874593666\n2.25559493670886,25.2996750747841\n2.30510126582278,24.7911531512637\n2.35460759493671,24.29542267075\n2.40411392405063,23.8181846151875\n2.45362025316456,23.3651399665205\n2.50312658227848,22.955253039598\n2.55263291139241,22.6138488714952\n2.60213924050633,22.3275852300224\n2.65164556962025,22.0817586181852\n2.70115189873418,21.8616655389892\n2.7506582278481,21.65260249544\n2.80016455696203,21.4398659905432\n2.84967088607595,21.2087525273044\n2.89917721518987,20.953335722037\n2.9486835443038,20.7158424594628\n2.99818987341772,20.4957065225374\n3.04769620253165,20.2829337645837\n3.09720253164557,20.0675300389245\n3.14670886075949,19.8395011988825\n3.19621518987342,19.5888530977805\n3.24572151898734,19.2971559094315\n3.29522784810127,18.9444093670088\n3.34473417721519,18.5670026794964\n3.39424050632911,18.2056968860288\n3.44374683544304,17.9009022641924\n3.49325316455696,17.620602502374\n3.54275949367089,17.3400153015964\n3.59226582278481,17.079077805285\n3.64177215189873,16.8175887231322\n3.69127848101266,16.5575726926136\n3.74078481012658,16.3083303048321\n3.79029113924051,16.0791621508901\n3.83979746835443,15.8793688218903\n3.88930379746835,15.7018119854881\n3.93881012658228,15.5259429561214\n3.9883164556962,15.3517253848296\n4.03782278481013,15.1793328075288\n4.08732911392405,15.0089387601353\n4.13683544303798,14.8407167785652\n4.1863417721519,14.6748403987346\n4.23584810126582,14.5114831565596\n4.28535443037975,14.3508185879563\n4.33486075949367,14.193020228841\n4.3843670886076,14.0382616151298\n4.43387341772152,13.8867162827388\n4.48337974683544,13.7385577675841\n4.53288607594937,13.5939596055819\n4.58239240506329,13.4530953326483\n4.63189873417722,13.3161384846995\n4.68140506329114,13.1832625976516\n4.73091139240506,13.0546412074207\n4.78041772151899,12.930447849923\n4.82992405063291,12.8108560610747\n4.87943037974684,12.6960393767918\n4.92893670886076,12.5861713329905\n4.97844303797468,12.4814254655869\n5.02794936708861,12.3819753104973\n5.07745569620253,12.2879944036376\n5.12696202531646,12.1996562809241\n5.17646835443038,12.117134478273\n5.2259746835443,12.0406025316002\n5.27548101265823,11.9702339768221\n5.32498734177215,11.9062023498547\n5.37449367088608,11.8486811866141\n5.424,11.7978440230166"
    },
    {
      "name": "scale/stroke",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"lm\"\n\"loess\""
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
      "values": "\"domain\"\n7.01654797473894\n35.1801643821553"
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
            "scale": "stroke",
            "value": "lm"
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
            "scale": "stroke",
            "value": "loess"
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
  "legends": [
    {
      "orient": "right",
      "stroke": "stroke"
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
ggvis.getPlot("plot_id951809417").parseSpec(plot_id951809417_spec);
</script><!--/html_preserve-->
(Note: this isn’t currently supported in ggvis because of a limitation of vega. See https://github.com/rstudio/ggvis/issues/29 for progress.)

#Valid properties

Not all marks support all properties. The complete list of all properties is available in `?marks`, and mark functions will check that you’ve supplied them valid properties, and will endeavour to provide you a helpful suggestion:

```
mtcars %>% ggvis() %>% layer_lines(strke = ~cyl)
#> Error: Unknown properties: strke. Did you mean: stroke?
mtcars %>% ggvis(strke = ~cyl) %>% layer_lines()
#> Error: Unknown properties: strke. Did you mean: stroke?
```
#Capture of local variables

Variable properties can refer to both variables in the dataset and variables in the local environment:

```r
df <- data.frame(x = 1:10)
f <- function(n) {
  df %>% ggvis(x = ~x, y = ~x ^ n) %>% layer_paths()
}
```


```r
df %>% ggvis(x = ~ x, y = ~ x ^ 1) %>% 
  layer_paths() %>% 
  layer_paths(x = ~x, y = ~ x ^ 2) %>%
  layer_paths(x = ~ x, y = ~ x ^ 3) %>%
  layer_paths(x = ~x, y = ~x ^ 4) 
```

<!--html_preserve--><div id="plot_id527654185-container" class="ggvis-output-container">
<div id="plot_id527654185" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id527654185_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id527654185" data-renderer="svg">SVG</a>
 | 
<a id="plot_id527654185_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id527654185" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id527654185_download" class="ggvis-download" data-plot-id="plot_id527654185">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id527654185_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "x^1": "number",
          "x^2": "number",
          "x^3": "number",
          "x^4": "number"
        }
      },
      "values": "\"x\",\"x^1\",\"x^2\",\"x^3\",\"x^4\"\n1,1,1,1,1\n2,2,4,8,16\n3,3,9,27,81\n4,4,16,64,256\n5,5,25,125,625\n6,6,36,216,1296\n7,7,49,343,2401\n8,8,64,512,4096\n9,9,81,729,6561\n10,10,100,1000,10000"
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
      "values": "\"domain\"\n-498.95\n10499.95"
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
            "field": "data.x^1"
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
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.x^2"
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
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.x^3"
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
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.x^4"
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
      "title": "x^4"
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
ggvis.getPlot("plot_id527654185").parseSpec(plot_id527654185_spec);
</script><!--/html_preserve-->


```r
f(1)
```

<!--html_preserve--><div id="plot_id327662705-container" class="ggvis-output-container">
<div id="plot_id327662705" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id327662705_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id327662705" data-renderer="svg">SVG</a>
 | 
<a id="plot_id327662705_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id327662705" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id327662705_download" class="ggvis-download" data-plot-id="plot_id327662705">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id327662705_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "x^n": "number"
        }
      },
      "values": "\"x\",\"x^n\"\n1,1\n2,2\n3,3\n4,4\n5,5\n6,6\n7,7\n8,8\n9,9\n10,10"
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
      "values": "\"domain\"\n0.55\n10.45"
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
            "field": "data.x^n"
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
      "title": "x^n"
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
ggvis.getPlot("plot_id327662705").parseSpec(plot_id327662705_spec);
</script><!--/html_preserve-->


```r
f(2)
```

<!--html_preserve--><div id="plot_id221666332-container" class="ggvis-output-container">
<div id="plot_id221666332" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id221666332_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id221666332" data-renderer="svg">SVG</a>
 | 
<a id="plot_id221666332_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id221666332" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id221666332_download" class="ggvis-download" data-plot-id="plot_id221666332">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id221666332_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "x^n": "number"
        }
      },
      "values": "\"x\",\"x^n\"\n1,1\n2,4\n3,9\n4,16\n5,25\n6,36\n7,49\n8,64\n9,81\n10,100"
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
            "field": "data.x^n"
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
      "title": "x^n"
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
ggvis.getPlot("plot_id221666332").parseSpec(plot_id221666332_spec);
</script><!--/html_preserve-->

Technically, ggvis uses the environment captured by the formula when it is created, which may be important if you’re generating formulas in one function and using them in another. You can always override the environment by calling prop() and supplying the env argument.

`prop()`

A prop has two key properties:

 - value: which can be a constant, the name of a variable (or an expression involving one or more variables), or an interactive input. An interactive input must yield either a constant, or an variable name/expression.

 - the scale: if scaled, a vega scale is in charge of converting the data value to something that makes sense as a visual property. If unscaled, the value is used as is.

Unscaled is the equivalent of using `scale_identity` in ggplot2.


#Special evaluation and variables

`prop()` doesn’t do any special evaluation which means that you if you want a variable, you need to supply the name of a property, and a quoted expression or a one-sided formula:

```r
prop("x", quote(mpg))
```

```
## <variable> mpg (property: x, scale: x, event: update)
```


```r
prop("y", ~cyl)
```

```
## <variable> cyl (property: y, scale: y, event: update)
```
If you have the name of a variable as a string, you can convert it a name with `as.name()`:

```r
var <- "mpg"
prop("x", as.name(var))
```

```
## <variable> mpg (property: x, scale: x, event: update)
```
If you have an R expression as a string, `parse()` it then extract the first element of the result:

```r
expr <- "mpg / wt"
prop("x", parse(text = expr)[[1]])
```

```
## <variable> mpg/wt (property: x, scale: x, event: update)
```

#Properties -> scales

Like in ggplot2, scales control the mapping between data values and values interpreted by the drawing device. **Scales are added to the top-level plot specification** and are usually created with `dscale` (short for default scale):

```r
# Override the default data limits:
mtcars %>% ggvis(~disp, ~wt) %>%
  layer_points() %>%
  scale_numeric("x", domain = c(50, 500), nice = FALSE) %>%
  scale_numeric("y", domain = c(0, 6), nice = FALSE)
```

<!--html_preserve--><div id="plot_id670137295-container" class="ggvis-output-container">
<div id="plot_id670137295" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id670137295_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id670137295" data-renderer="svg">SVG</a>
 | 
<a id="plot_id670137295_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id670137295" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id670137295_download" class="ggvis-download" data-plot-id="plot_id670137295">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id670137295_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "disp": "number",
          "wt": "number"
        }
      },
      "values": "\"disp\",\"wt\"\n160,2.62\n160,2.875\n108,2.32\n258,3.215\n360,3.44\n225,3.46\n360,3.57\n146.7,3.19\n140.8,3.15\n167.6,3.44\n167.6,3.44\n275.8,4.07\n275.8,3.73\n275.8,3.78\n472,5.25\n460,5.424\n440,5.345\n78.7,2.2\n75.7,1.615\n71.1,1.835\n120.1,2.465\n318,3.52\n304,3.435\n350,3.84\n400,3.845\n79,1.935\n120.3,2.14\n95.1,1.513\n351,3.17\n145,2.77\n301,3.57\n121,2.78"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n27.5\n522.5"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.3\n6.3"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "nice": false,
      "zero": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "nice": false,
      "zero": false,
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
            "field": "data.disp"
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
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "disp"
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
ggvis.getPlot("plot_id670137295").parseSpec(plot_id670137295_spec);
</script><!--/html_preserve-->

Compared to ggplot2, ggvis has far fewer scales (3 vs 70), with each function doing much more. The three basic scales in ggvis, corresponding to the **three basic vega scales** <https://github.com/trifacta/vega/wiki> are:

 - `scale_quantitative`: for quantitative, numeric values
 - `scale_ordinal`: for qualitative, categorical values
 - `scale_time`: for date/time values

The vega scales are in turn relatively simple wrappers for **D3 scales** <https://github.com/d3/d3/wiki/Scales> so if you can’t find the details in these docs, or in the vega docs, you may need to look in the D3 docs. Fortunately the arguments are by and large named the same across all three systems, although ggvis uses underscores while vega and D3 use camelCase.

Each (scaled) property needs a scale. By default, scales are added so that every scaled property gets a scale with the same name as the property (with a few exceptions `y2` to `y`, `x2` to `x`, fillOpacity and strokeOpacity to opacity and so on.). See `?add_default_scales` for details.

#Scale arguments

The scales share the following arguments:

  -  `name`: a string identifier for the scale. By default, this is the name of the property it is associated with - i.e. the scale for the x values is called “x”, but it doesn’t have to be, and the examples below show some cases where you need this extra flexibility.

  - `domain`: the input data values to the scale. If left blank, these will be learned from the properties that use this scale. But you can override it if you want to expand or restrict, or you want to match domains across multiple plots so that they’re easier to compare. domain is equivalent to limits in R graphics. For quantiative scales, you can use a missing value to only constrain one side of the domain.

  -  `range`: the output visual values from the scale. For quantiative scales this is usually a vector of length two, for ordinal scales, it’s a vector the same length as the domain. Vega interprets some special values: “width”, “height”, “shapes”, “category10” (10 categorical colours).

  - `reverse`: a boolean flag that will flip the order of the range.

`scale_quantitative` and `scale_time` also share a few other properties:

 - `nice`: use nice axis labels? The algorithm is described in the D3 document

 - `zero`: include a zero in the scale?

 -  `clamp`: clamp any values outside the domain to the min/max?

#Default scales

Because the range of a scale is usually determined by the type of variable, ggvis provides the dscale function to automatically retrieve a default scale given a property name and variable type:
```
scale_numeric(vis, "x")
scale_numeric(vis, "y")
scale_nominal(vis, "shape")
```
You can also provide other arguments to the underlying scale:
```
scale_numeric(vis, "x", domain = c(10, 100))
scale_numeric(vis, "x", trans = "log")
```
So `dscale()` is usually a better way to create new scales that starting from the underlying scale objects.

#Custom scales

You can add your own scales for properties that don’t otherwise have defaults. For example, imagine you wanted to use the font of a label to represent some data. There’s no default scale for font, but you could create one yourself:

```r
df <- data.frame(x = runif(5), y = runif(5),
  labels = c("a", "b", "b", "a", "b"))
df %>% ggvis(~x, ~y, text := ~labels, font = ~labels, fontSize := 40) %>%
  layer_text() %>%
  scale_ordinal("font", range = c("Helvetica Neue", "Times New Roman"))
```

<!--html_preserve--><div id="plot_id364457990-container" class="ggvis-output-container">
<div id="plot_id364457990" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id364457990_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id364457990" data-renderer="svg">SVG</a>
 | 
<a id="plot_id364457990_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id364457990" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id364457990_download" class="ggvis-download" data-plot-id="plot_id364457990">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id364457990_spec = {
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
      "values": "\"labels\",\"x\",\"y\"\n\"a\",0.808186612091959,0.877318544546142\n\"b\",0.480084663257003,0.737749160965905\n\"b\",0.546345801092684,0.399223890621215\n\"a\",0.267373011447489,0.504188205115497\n\"b\",0.132088312879205,0.0938910928089172"
    },
    {
      "name": "scale/font",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"a\"\n\"b\""
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.0982833979185671\n0.841991527052596"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.0547197202220559\n0.916489917133003"
    }
  ],
  "scales": [
    {
      "domain": {
        "data": "scale/font",
        "field": "data.domain"
      },
      "name": "font",
      "type": "ordinal",
      "range": ["Helvetica Neue", "Times New Roman"],
      "points": true,
      "sort": false
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
      "type": "text",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "font": {
            "scale": "font",
            "field": "data.labels"
          },
          "text": {
            "field": "data.labels"
          },
          "fontSize": {
            "value": 40
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
ggvis.getPlot("plot_id364457990").parseSpec(plot_id364457990_spec);
</script><!--/html_preserve-->
Note the use of text `:= ~labels:` we don’t want to scale the labels - the raw values already make sense in the visual space.

#Multiple scales for one property

Generally, you will override the default name of a scale in order to use more scales than the default. You could do this in order to create a dual-axis chart (which is generally a bad idea - read **this paper**<https://www.lri.fr/~isenberg/publications/papers/Isenberg_2011_ASO.pdf> for more details). If you do this, you will also need to add a scale object.

```r
mtcars %>% ggvis(y = ~mpg) %>%
  layer_points(prop("x", ~disp, scale = "xdisp")) %>%
  layer_points(prop("x", ~wt, scale = "xwt"), fill := "blue") %>%
  add_axis("x", "xdisp", orient = "bottom") %>%
  add_axis("x", "xwt", orient = "bottom", offset = 20,
    properties = axis_props(labels = list(fill = "blue")))
```

<!--html_preserve--><div id="plot_id670799663-container" class="ggvis-output-container">
<div id="plot_id670799663" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id670799663_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id670799663" data-renderer="svg">SVG</a>
 | 
<a id="plot_id670799663_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id670799663" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id670799663_download" class="ggvis-download" data-plot-id="plot_id670799663">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id670799663_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "mpg": "number",
          "disp": "number",
          "wt": "number"
        }
      },
      "values": "\"mpg\",\"disp\",\"wt\"\n21,160,2.62\n21,160,2.875\n22.8,108,2.32\n21.4,258,3.215\n18.7,360,3.44\n18.1,225,3.46\n14.3,360,3.57\n24.4,146.7,3.19\n22.8,140.8,3.15\n19.2,167.6,3.44\n17.8,167.6,3.44\n16.4,275.8,4.07\n17.3,275.8,3.73\n15.2,275.8,3.78\n10.4,472,5.25\n10.4,460,5.424\n14.7,440,5.345\n32.4,78.7,2.2\n30.4,75.7,1.615\n33.9,71.1,1.835\n21.5,120.1,2.465\n15.5,318,3.52\n15.2,304,3.435\n13.3,350,3.84\n19.2,400,3.845\n27.3,79,1.935\n26,120.3,2.14\n30.4,95.1,1.513\n15.8,351,3.17\n19.7,145,2.77\n15,301,3.57\n21.4,121,2.78"
    },
    {
      "name": "scale/xdisp",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n51.055\n492.045"
    },
    {
      "name": "scale/xwt",
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
      "name": "xdisp",
      "domain": {
        "data": "scale/xdisp",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "xwt",
      "domain": {
        "data": "scale/xwt",
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
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "x": {
            "scale": "xdisp",
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
    },
    {
      "type": "symbol",
      "properties": {
        "update": {
          "size": {
            "value": 50
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "x": {
            "scale": "xwt",
            "field": "data.wt"
          },
          "fill": {
            "value": "blue"
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
      "scale": "xdisp",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "disp"
    },
    {
      "type": "x",
      "scale": "xwt",
      "orient": "bottom",
      "offset": 20,
      "layer": "back",
      "grid": true,
      "properties": {
        "labels": {
          "fill": {
            "value": "blue"
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
ggvis.getPlot("plot_id670799663").parseSpec(plot_id670799663_spec);
</script><!--/html_preserve-->
![image_1b3nan5f8193n1a8317k81gqt12sj37.png-32kB][12]
Multiple properties for one scale

You could also force ggplot2 to use the same scale for properties that would otherwise use different scales. I’m not sure of a useful example of this, except to force stroke and fill to use the same scale:

```r
df <- data.frame(x = 1:5, y = 1:5, a = runif(5), b = -runif(5))

df %>% 
  ggvis(x = ~x, y = ~y, stroke = ~a, fill = ~b, 
    strokeWidth := 5, size := 1000) %>%
  layer_points() %>%
  add_legend("stroke", properties = legend_props(legend = list(y = 50)))
```

<!--html_preserve--><div id="plot_id664505150-container" class="ggvis-output-container">
<div id="plot_id664505150" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id664505150_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id664505150" data-renderer="svg">SVG</a>
 | 
<a id="plot_id664505150_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id664505150" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id664505150_download" class="ggvis-download" data-plot-id="plot_id664505150">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id664505150_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number",
          "a": "number",
          "b": "number"
        }
      },
      "values": "\"x\",\"y\",\"a\",\"b\"\n1,1,0.969845121260732,-0.482410267228261\n2,2,0.299019878963009,-0.972396527649835\n3,3,0.308253571158275,-0.0833294233307242\n4,4,0.286755156470463,-0.205294912448153\n5,5,0.941711489344016,-0.183652113657445"
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.972396527649835\n-0.0833294233307242"
    },
    {
      "name": "scale/stroke",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.286755156470463\n0.969845121260732"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.8\n5.2"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.8\n5.2"
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
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          },
          "stroke": {
            "scale": "stroke",
            "field": "data.a"
          },
          "fill": {
            "scale": "fill",
            "field": "data.b"
          },
          "strokeWidth": {
            "value": 5
          },
          "size": {
            "value": 1000
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
      "properties": {
        "legend": {
          "y": {
            "value": 50
          }
        }
      },
      "stroke": "stroke",
      "title": "a"
    },
    {
      "orient": "right",
      "fill": "fill",
      "title": "b"
    }
  ],
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
ggvis.getPlot("plot_id664505150").parseSpec(plot_id664505150_spec);
</script><!--/html_preserve-->


```r
df %>% 
  ggvis(x = ~x, y = ~y, stroke = ~a, prop("fill", ~b, scale = "stroke"),
    strokeWidth := 5, size := 1000) %>%
  layer_points() %>%
  add_legend("stroke", properties = legend_props(legend = list(y = 50)))
```

<!--html_preserve--><div id="plot_id506042712-container" class="ggvis-output-container">
<div id="plot_id506042712" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id506042712_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id506042712" data-renderer="svg">SVG</a>
 | 
<a id="plot_id506042712_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id506042712" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id506042712_download" class="ggvis-download" data-plot-id="plot_id506042712">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id506042712_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number",
          "a": "number",
          "b": "number"
        }
      },
      "values": "\"x\",\"y\",\"a\",\"b\"\n1,1,0.969845121260732,-0.482410267228261\n2,2,0.299019878963009,-0.972396527649835\n3,3,0.308253571158275,-0.0833294233307242\n4,4,0.286755156470463,-0.205294912448153\n5,5,0.941711489344016,-0.183652113657445"
    },
    {
      "name": "scale/stroke",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.972396527649835\n0.969845121260732"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.8\n5.2"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.8\n5.2"
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
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          },
          "stroke": {
            "scale": "stroke",
            "field": "data.a"
          },
          "fill": {
            "scale": "stroke",
            "field": "data.b"
          },
          "strokeWidth": {
            "value": 5
          },
          "size": {
            "value": 1000
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
      "properties": {
        "legend": {
          "y": {
            "value": 50
          }
        }
      },
      "fill": "stroke",
      "title": "b"
    }
  ],
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
ggvis.getPlot("plot_id506042712").parseSpec(plot_id506042712_spec);
</script><!--/html_preserve-->
In this case we don’t need to manually add the correct scale, because ggvis has detected it for us automatically.
Property values

Vega renders either svg or canvas, but fortunately most properties are shared across svg or canvas. The following list describes what the property values mean and the set of allowable values.

- `x`, `x2`, `width`, `y`, `y2`, `height`, `strokeWidth`, `innerRadius`, `outerRadius`:pixels. Note that by convention (0, 0) is located in the top-left, so y values are relative to the top of the screen and x values are relative to the left of the screen (as opposed to R where (0,0) is on the bottom right). Pixel positions should be greater than 0.
   
 - `size`: area, in pixels. Greater than 0.
   
 - `opacity`, fillOpacity, strokeOpacity: a number between 0 and 1
   
 - `stroke`, fill: colours
   
 - `startAngle`, `endAngle`: angle in radians
    
- `interpolate`: “linear”, “step-before”, “step-after”, “basis”, “basis-open”, “cardinal”, “cardinal-open”, “monotone”. See the D3 - docs for what they mean.
   
 - `tension`: a number between 0 and 1 that controls a tension parameter to some interpolants.See the D3 docs for more details.
   
 - `url`: a url.
   
 - `align`: “left”, “right”, “center”.
   
 - `baseline`: “top”, “middle”, “bottom”
   
 - `text`: a string
   
- `dx`, `dy`: pixel offsets from anchor point
   
 - `angle`: an angle in degrees
   
 - `font`: the name of a font available from the browser.
   
 - `fontWeight`: a font weight, as a string (“normal”, “bold”, “lighter”, “bolder”) or number (100, 200, 300, 400, 500, 600, 700, 800, 900).
   
 - `fontStyle`: “normal”, “italic”, “oblique”

 
