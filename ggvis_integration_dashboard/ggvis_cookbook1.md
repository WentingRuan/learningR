# ggvis Cookbook
Ethel Ruan  
2017-02-05  



The following examples show you how to create a selection of common graphics with ggvis. First, load ggvis and dplyr:


```r
library(ggvis)
```

```
## Warning: package 'ggvis' was built under R version 3.3.2
```

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

##Scatterplots

We’ll use the built-in `mtcars` data set, and look at two columns of interest, `mpg` ,and `wt`:

```r
# The first few rows of mtcars
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```


```r
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
```

<!--html_preserve--><div id="plot_id547435472-container" class="ggvis-output-container">
<div id="plot_id547435472" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id547435472_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id547435472" data-renderer="svg">SVG</a>
 | 
<a id="plot_id547435472_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id547435472" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id547435472_download" class="ggvis-download" data-plot-id="plot_id547435472">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id547435472_spec = {
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
ggvis.getPlot("plot_id547435472").parseSpec(plot_id547435472_spec);
</script><!--/html_preserve-->
                   

Smaller points, a different shape, a different outline (stroke) color, and empty fill:


```r
mtcars %>% 
  ggvis(~wt, ~mpg) %>% 
  layer_points(size := 25, shape := "diamond", stroke := "red", fill := NA)
```

<!--html_preserve--><div id="plot_id533519578-container" class="ggvis-output-container">
<div id="plot_id533519578" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id533519578_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id533519578" data-renderer="svg">SVG</a>
 | 
<a id="plot_id533519578_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id533519578" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id533519578_download" class="ggvis-download" data-plot-id="plot_id533519578">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id533519578_spec = {
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
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "size": {
            "value": 25
          },
          "shape": {
            "value": "diamond"
          },
          "stroke": {
            "value": "red"
          },
          "fill": {
            "value": null
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
ggvis.getPlot("plot_id533519578").parseSpec(plot_id533519578_spec);
</script><!--/html_preserve-->


# Regression lines

Adding a smooth line


```r
mtcars %>% 
  ggvis(~wt, ~mpg) %>% 
  layer_points() %>% 
  layer_smooths()
```

<!--html_preserve--><div id="plot_id167091832-container" class="ggvis-output-container">
<div id="plot_id167091832" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id167091832_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id167091832" data-renderer="svg">SVG</a>
 | 
<a id="plot_id167091832_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id167091832" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id167091832_download" class="ggvis-download" data-plot-id="plot_id167091832">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id167091832_spec = {
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
ggvis.getPlot("plot_id167091832").parseSpec(plot_id167091832_spec);
</script><!--/html_preserve-->


With a linear model, and 95% confidence interval for the model:


```r
mtcars %>% 
  ggvis(~wt, ~mpg) %>% 
  layer_points() %>% 
  layer_model_predictions(model = "lm", se = TRUE)
```

```
## Guessing formula = mpg ~ wt
```

<!--html_preserve--><div id="plot_id968909948-container" class="ggvis-output-container">
<div id="plot_id968909948" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id968909948_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id968909948" data-renderer="svg">SVG</a>
 | 
<a id="plot_id968909948_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id968909948" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id968909948_download" class="ggvis-download" data-plot-id="plot_id968909948">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id968909948_spec = {
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
          "resp_upr_": "number",
          "pred_": "number",
          "resp_lwr_": "number",
          "resp_": "number"
        }
      },
      "values": "\"resp_upr_\",\"pred_\",\"resp_lwr_\",\"resp_\"\n31.4341217313206,1.513,26.9637596243046,29.1989406778126\n31.1204993874088,1.56250632911392,26.748211630978,28.9343555091934\n30.8072470380303,1.61201265822785,26.532293643118,28.6697703405742\n30.4943905399572,1.66151898734177,26.3159798039527,28.4051851719549\n30.1819579750846,1.7110253164557,26.0992420315869,28.1406000033357\n29.8699798618842,1.76053164556962,25.8820498075489,27.8760148347165\n29.5584893857579,1.81003797468354,25.6643699464367,27.6114296660973\n29.2475226490581,1.85954430379747,25.4461663458981,27.3468444974781\n28.9371189411946,1.90905063291139,25.2273997165231,27.0822593288588\n28.6273210287383,1.95855696202532,25.0080272917409,26.8176741602396\n28.3181754647066,2.00806329113924,24.7880025185342,26.5530889916204\n28.0097329152165,2.05756962025316,24.5672747307859,26.2885038230012\n27.7020485003464,2.10707594936709,24.3457888084175,26.023918654382\n27.3951821442752,2.15658227848101,24.1234848272503,25.7593334857627\n27.0891989274822,2.20608860759494,23.9002977068049,25.4947483171435\n26.7841694309033,2.25559493670886,23.6761568661453,25.2301631485243\n26.4801700583702,2.30510126582278,23.4509859014399,24.9655779799051\n26.1772833193625,2.35460759493671,23.2247023032092,24.7009928112859\n25.8755980490886,2.40411392405063,22.9972172362447,24.4364076426666\n25.5752095372801,2.45362025316456,22.7684354108148,24.1718224740474\n25.276219531088,2.50312658227848,22.5382550797684,23.9072373054282\n24.9787360715631,2.55263291139241,22.3065682020549,23.642652136809\n24.6828731181045,2.60213924050633,22.073260818275,23.3780669681898\n24.3887499120139,2.65164556962025,21.8382136871272,23.1134817995705\n24.096490030255,2.70115189873418,21.6013032316477,22.8488966309513\n23.8062200853351,2.7506582278481,21.3624028393291,22.5843114623321\n23.5180680386105,2.80016455696203,21.1213845488153,22.3197262937129\n23.2321611137817,2.84967088607595,20.8781211364057,22.0551411250937\n22.9486233256676,2.89917721518987,20.6324885872813,21.7905559564744\n22.6675726760022,2.9486835443038,20.3843688997083,21.5259707878552\n22.3891181105935,2.99818987341772,20.1336531278785,21.261385619236\n22.1133563760938,3.04769620253165,19.8802445251398,20.9968004506168\n21.8403689531932,3.09720253164557,19.624061610802,20.7322152819976\n21.5702192684414,3.14670886075949,19.3650409583153,20.4676301133783\n21.3029503917649,3.19621518987342,19.1031394977534,20.2030449447591\n21.0385834062175,3.24572151898734,18.8383361460623,19.9384597761399\n20.7771165901197,3.29522784810127,18.5706326249216,19.6738746075207\n20.5185254843377,3.34473417721519,18.3000533934652,19.4092894389015\n20.2627638386563,3.39424050632911,18.0266447019082,19.1447042702822\n20.0097653533643,3.44374683544304,17.7504728499618,18.880119101663\n19.7594460674074,3.49325316455696,17.4716217986802,18.6155339330438\n19.5117072017912,3.54275949367089,17.190190327058,18.3509487644246\n19.266438250352,3.59226582278481,16.9062889412588,18.0863635958054\n19.023520118358,3.64177215189873,16.6200367360143,17.8217784271861\n18.7828281372767,3.69127848101266,16.3315583798572,17.5571932585669\n18.5442348238948,3.74078481012658,16.0409813560006,17.2926080899477\n18.307612296075,3.79029113924051,15.748433546582,17.0280229213285\n18.0728342993708,3.83979746835443,15.4540412060478,16.7634377527093\n17.8397778342311,3.88930379746835,15.157927333949,16.49885258409\n17.6083244005099,3.93881012658228,14.8602104304317,16.2342674154708\n17.3783608941716,3.9883164556962,14.5610035995316,15.9696822468516\n17.1497802013801,4.03782278481013,14.2604139550846,15.7050970782324\n16.9224815391307,4.08732911392405,13.9585422800956,15.4405119096132\n16.6963705909696,4.13683544303798,13.6554828910183,15.1759267409939\n16.4713594827389,4.1863417721519,13.3513236620105,14.9113415723747\n16.2473666380091,4.23584810126582,13.0461461695019,14.6467564037555\n16.0243165469005,4.28535443037975,12.740025923372,14.3821712351363\n15.8021394760335,4.33486075949367,12.4330326570007,14.1175860665171\n15.5807711417929,4.3843670886076,12.1252306540028,13.8530008978978\n15.3601523641871,4.43387341772152,11.8166790943701,13.5884157292786\n15.1402287143902,4.48337974683544,11.5074324069286,13.3238305606594\n14.9209501655981,4.53288607594937,11.1975406184823,13.0592453920402\n14.7022707540356,4.58239240506329,10.8870496928064,12.794660223421\n14.4841482547477,4.63189873417722,10.5760018548558,12.5300750548017\n14.266543875108,4.68140506329114,10.2644358972571,12.2654898861825\n14.0494219676868,4.73091139240506,9.95238746743981,12.0009047175633\n13.8327497631713,4.78041772151899,9.6398893347169,11.7363195489441\n13.6164971233358,4.82992405063291,9.32697163731397,11.4717343803249\n13.400636313583,4.87943037974684,9.01366210982825,11.2071492117056\n13.185141794249,4.92893670886076,8.69998629192387,10.9425640430864\n12.96999002966,4.97844303797468,8.38596771927446,10.6779788744672\n12.7551593138153,5.02794936708861,8.07162809788066,10.413393705848\n12.5406296115153,5.07745569620253,7.75698746294225,10.1488085372288\n12.3263824137488,5.12696202531646,7.44206432347029,9.88422336860955\n12.1124006061819,5.17646835443038,7.1268757937988,9.61963819999033\n11.8986683496337,5.2259746835443,6.81143771310854,9.35505303137111\n11.685170971489,5.27548101265823,6.49576475401476,9.09046786275189\n11.4718948670624,5.32498734177215,6.17987052120298,8.82588269413267\n11.2588274100015,5.37449367088608,5.86376764102542,8.56129752551345\n11.0459568708893,5.424,5.5474678428992,8.29671235689423"
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
      "values": "\"domain\"\n4.12984123504415\n35.317626607855"
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
    },
    {
      "type": "area",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "y2": {
            "scale": "y",
            "field": "data.resp_upr_"
          },
          "fillOpacity": {
            "value": 0.2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_lwr_"
          },
          "stroke": {
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
ggvis.getPlot("plot_id968909948").parseSpec(plot_id968909948_spec);
</script><!--/html_preserve-->


#Scatter plots with grouping

Coloring points by a variable:

```r
mtcars %>% 
  ggvis(~wt, ~mpg) %>% 
  layer_points(fill = ~factor(cyl))
```

<!--html_preserve--><div id="plot_id403090429-container" class="ggvis-output-container">
<div id="plot_id403090429" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id403090429_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id403090429" data-renderer="svg">SVG</a>
 | 
<a id="plot_id403090429_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id403090429" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id403090429_download" class="ggvis-download" data-plot-id="plot_id403090429">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id403090429_spec = {
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
      "values": "\"wt\",\"mpg\",\"factor(cyl)\"\n2.62,21,\"6\"\n2.875,21,\"6\"\n2.32,22.8,\"4\"\n3.215,21.4,\"6\"\n3.44,18.7,\"8\"\n3.46,18.1,\"6\"\n3.57,14.3,\"8\"\n3.19,24.4,\"4\"\n3.15,22.8,\"4\"\n3.44,19.2,\"6\"\n3.44,17.8,\"6\"\n4.07,16.4,\"8\"\n3.73,17.3,\"8\"\n3.78,15.2,\"8\"\n5.25,10.4,\"8\"\n5.424,10.4,\"8\"\n5.345,14.7,\"8\"\n2.2,32.4,\"4\"\n1.615,30.4,\"4\"\n1.835,33.9,\"4\"\n2.465,21.5,\"4\"\n3.52,15.5,\"8\"\n3.435,15.2,\"8\"\n3.84,13.3,\"8\"\n3.845,19.2,\"8\"\n1.935,27.3,\"4\"\n2.14,26,\"4\"\n1.513,30.4,\"4\"\n3.17,15.8,\"8\"\n2.77,19.7,\"6\"\n3.57,15,\"8\"\n2.78,21.4,\"4\""
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
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "fill": {
            "scale": "fill",
            "field": "data.factor(cyl)"
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
ggvis.getPlot("plot_id403090429").parseSpec(plot_id403090429_spec);
</script><!--/html_preserve-->

```r
  #or
   mtcars %>% 
    ggvis(~wt, ~mpg,fill = ~factor(cyl)) %>% 
    layer_points()
```

<!--html_preserve--><div id="plot_id187943824-container" class="ggvis-output-container">
<div id="plot_id187943824" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id187943824_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id187943824" data-renderer="svg">SVG</a>
 | 
<a id="plot_id187943824_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id187943824" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id187943824_download" class="ggvis-download" data-plot-id="plot_id187943824">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id187943824_spec = {
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
      "values": "\"factor(cyl)\",\"wt\",\"mpg\"\n\"6\",2.62,21\n\"6\",2.875,21\n\"4\",2.32,22.8\n\"6\",3.215,21.4\n\"8\",3.44,18.7\n\"6\",3.46,18.1\n\"8\",3.57,14.3\n\"4\",3.19,24.4\n\"4\",3.15,22.8\n\"6\",3.44,19.2\n\"6\",3.44,17.8\n\"8\",4.07,16.4\n\"8\",3.73,17.3\n\"8\",3.78,15.2\n\"8\",5.25,10.4\n\"8\",5.424,10.4\n\"8\",5.345,14.7\n\"4\",2.2,32.4\n\"4\",1.615,30.4\n\"4\",1.835,33.9\n\"4\",2.465,21.5\n\"8\",3.52,15.5\n\"8\",3.435,15.2\n\"8\",3.84,13.3\n\"8\",3.845,19.2\n\"4\",1.935,27.3\n\"4\",2.14,26\n\"4\",1.513,30.4\n\"8\",3.17,15.8\n\"6\",2.77,19.7\n\"8\",3.57,15\n\"4\",2.78,21.4"
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
            "field": "data.factor(cyl)"
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
  "legends": [
    {
      "orient": "right",
      "fill": "fill",
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
ggvis.getPlot("plot_id187943824").parseSpec(plot_id187943824_spec);
</script><!--/html_preserve-->


Coloring points, and adding a smoother for each group. 
The grouping variable (which is applied before the transform_smooth is calculated) must be specified with `group_by()`:


```r
mtcars %>% 
  ggvis(~wt, ~mpg, fill = ~factor(cyl)) %>% 
  layer_points() %>% 
  group_by(cyl) %>% 
  layer_model_predictions(model = "lm")
```

```
## Guessing formula = mpg ~ wt
```

<!--html_preserve--><div id="plot_id231731962-container" class="ggvis-output-container">
<div id="plot_id231731962" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id231731962_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id231731962" data-renderer="svg">SVG</a>
 | 
<a id="plot_id231731962_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id231731962" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id231731962_download" class="ggvis-download" data-plot-id="plot_id231731962">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id231731962_spec = {
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
      "values": "\"factor(cyl)\",\"wt\",\"mpg\"\n\"6\",2.62,21\n\"6\",2.875,21\n\"4\",2.32,22.8\n\"6\",3.215,21.4\n\"8\",3.44,18.7\n\"6\",3.46,18.1\n\"8\",3.57,14.3\n\"4\",3.19,24.4\n\"4\",3.15,22.8\n\"6\",3.44,19.2\n\"6\",3.44,17.8\n\"8\",4.07,16.4\n\"8\",3.73,17.3\n\"8\",3.78,15.2\n\"8\",5.25,10.4\n\"8\",5.424,10.4\n\"8\",5.345,14.7\n\"4\",2.2,32.4\n\"4\",1.615,30.4\n\"4\",1.835,33.9\n\"4\",2.465,21.5\n\"8\",3.52,15.5\n\"8\",3.435,15.2\n\"8\",3.84,13.3\n\"8\",3.845,19.2\n\"4\",1.935,27.3\n\"4\",2.14,26\n\"4\",1.513,30.4\n\"8\",3.17,15.8\n\"6\",2.77,19.7\n\"8\",3.57,15\n\"4\",2.78,21.4"
    },
    {
      "name": ".0/group_by1/model_prediction2_flat",
      "format": {
        "type": "csv",
        "parse": {
          "cyl": "number",
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"cyl\",\"pred_\",\"resp_\"\n4,1.513,31.0272467927781\n4,1.53422784810127,30.9073725983085\n4,1.55545569620253,30.7874984038388\n4,1.5766835443038,30.6676242093691\n4,1.59791139240506,30.5477500148995\n4,1.61913924050633,30.4278758204298\n4,1.64036708860759,30.3080016259602\n4,1.66159493670886,30.1881274314905\n4,1.68282278481013,30.0682532370208\n4,1.70405063291139,29.9483790425512\n4,1.72527848101266,29.8285048480815\n4,1.74650632911392,29.7086306536118\n4,1.76773417721519,29.5887564591422\n4,1.78896202531646,29.4688822646725\n4,1.81018987341772,29.3490080702029\n4,1.83141772151899,29.2291338757332\n4,1.85264556962025,29.1092596812635\n4,1.87387341772152,28.9893854867939\n4,1.89510126582278,28.8695112923242\n4,1.91632911392405,28.7496370978545\n4,1.93755696202532,28.6297629033849\n4,1.95878481012658,28.5098887089152\n4,1.98001265822785,28.3900145144456\n4,2.00124050632911,28.2701403199759\n4,2.02246835443038,28.1502661255062\n4,2.04369620253165,28.0303919310366\n4,2.06492405063291,27.9105177365669\n4,2.08615189873418,27.7906435420973\n4,2.10737974683544,27.6707693476276\n4,2.12860759493671,27.5508951531579\n4,2.14983544303797,27.4310209586883\n4,2.17106329113924,27.3111467642186\n4,2.19229113924051,27.1912725697489\n4,2.21351898734177,27.0713983752793\n4,2.23474683544304,26.9515241808096\n4,2.2559746835443,26.83164998634\n4,2.27720253164557,26.7117757918703\n4,2.29843037974684,26.5919015974006\n4,2.3196582278481,26.472027402931\n4,2.34088607594937,26.3521532084613\n4,2.36211392405063,26.2322790139917\n4,2.3833417721519,26.112404819522\n4,2.40456962025316,25.9925306250523\n4,2.42579746835443,25.8726564305827\n4,2.4470253164557,25.752782236113\n4,2.46825316455696,25.6329080416433\n4,2.48948101265823,25.5130338471737\n4,2.51070886075949,25.393159652704\n4,2.53193670886076,25.2732854582344\n4,2.55316455696203,25.1534112637647\n4,2.57439240506329,25.033537069295\n4,2.59562025316456,24.9136628748254\n4,2.61684810126582,24.7937886803557\n4,2.63807594936709,24.673914485886\n4,2.65930379746835,24.5540402914164\n4,2.68053164556962,24.4341660969467\n4,2.70175949367089,24.3142919024771\n4,2.72298734177215,24.1944177080074\n4,2.74421518987342,24.0745435135377\n4,2.76544303797468,23.9546693190681\n4,2.78667088607595,23.8347951245984\n4,2.80789873417721,23.7149209301288\n4,2.82912658227848,23.5950467356591\n4,2.85035443037975,23.4751725411894\n4,2.87158227848101,23.3552983467198\n4,2.89281012658228,23.2354241522501\n4,2.91403797468354,23.1155499577804\n4,2.93526582278481,22.9956757633108\n4,2.95649367088608,22.8758015688411\n4,2.97772151898734,22.7559273743715\n4,2.99894936708861,22.6360531799018\n4,3.02017721518987,22.5161789854321\n4,3.04140506329114,22.3963047909625\n4,3.0626329113924,22.2764305964928\n4,3.08386075949367,22.1565564020232\n4,3.10508860759494,22.0366822075535\n4,3.1263164556962,21.9168080130838\n4,3.14754430379747,21.7969338186142\n4,3.16877215189873,21.6770596241445\n4,3.19,21.5571854296748\n6,2.62,21.1249669526086\n6,2.6306329113924,21.0954063324961\n6,2.64126582278481,21.0658457123835\n6,2.65189873417722,21.036285092271\n6,2.66253164556962,21.0067244721585\n6,2.67316455696203,20.9771638520459\n6,2.68379746835443,20.9476032319334\n6,2.69443037974684,20.9180426118209\n6,2.70506329113924,20.8884819917083\n6,2.71569620253165,20.8589213715958\n6,2.72632911392405,20.8293607514833\n6,2.73696202531646,20.7998001313707\n6,2.74759493670886,20.7702395112582\n6,2.75822784810127,20.7406788911456\n6,2.76886075949367,20.7111182710331\n6,2.77949367088608,20.6815576509206\n6,2.79012658227848,20.651997030808\n6,2.80075949367089,20.6224364106955\n6,2.81139240506329,20.592875790583\n6,2.8220253164557,20.5633151704704\n6,2.8326582278481,20.5337545503579\n6,2.84329113924051,20.5041939302453\n6,2.85392405063291,20.4746333101328\n6,2.86455696202532,20.4450726900203\n6,2.87518987341772,20.4155120699077\n6,2.88582278481013,20.3859514497952\n6,2.89645569620253,20.3563908296827\n6,2.90708860759494,20.3268302095701\n6,2.91772151898734,20.2972695894576\n6,2.92835443037975,20.267708969345\n6,2.93898734177215,20.2381483492325\n6,2.94962025316456,20.20858772912\n6,2.96025316455696,20.1790271090074\n6,2.97088607594937,20.1494664888949\n6,2.98151898734177,20.1199058687824\n6,2.99215189873418,20.0903452486698\n6,3.00278481012658,20.0607846285573\n6,3.01341772151899,20.0312240084447\n6,3.02405063291139,20.0016633883322\n6,3.0346835443038,19.9721027682197\n6,3.0453164556962,19.9425421481071\n6,3.05594936708861,19.9129815279946\n6,3.06658227848101,19.8834209078821\n6,3.07721518987342,19.8538602877695\n6,3.08784810126582,19.824299667657\n6,3.09848101265823,19.7947390475445\n6,3.10911392405063,19.7651784274319\n6,3.11974683544304,19.7356178073194\n6,3.13037974683544,19.7060571872068\n6,3.14101265822785,19.6764965670943\n6,3.15164556962025,19.6469359469818\n6,3.16227848101266,19.6173753268692\n6,3.17291139240506,19.5878147067567\n6,3.18354430379747,19.5582540866442\n6,3.19417721518987,19.5286934665316\n6,3.20481012658228,19.4991328464191\n6,3.21544303797468,19.4695722263065\n6,3.22607594936709,19.440011606194\n6,3.23670886075949,19.4104509860815\n6,3.2473417721519,19.3808903659689\n6,3.2579746835443,19.3513297458564\n6,3.26860759493671,19.3217691257439\n6,3.27924050632911,19.2922085056313\n6,3.28987341772152,19.2626478855188\n6,3.30050632911392,19.2330872654062\n6,3.31113924050633,19.2035266452937\n6,3.32177215189873,19.1739660251812\n6,3.33240506329114,19.1444054050686\n6,3.34303797468354,19.1148447849561\n6,3.35367088607595,19.0852841648436\n6,3.36430379746835,19.055723544731\n6,3.37493670886076,19.0261629246185\n6,3.38556962025316,18.9966023045059\n6,3.39620253164557,18.9670416843934\n6,3.40683544303797,18.9374810642809\n6,3.41746835443038,18.9079204441683\n6,3.42810126582278,18.8783598240558\n6,3.43873417721519,18.8487992039433\n6,3.44936708860759,18.8192385838307\n6,3.46,18.7896779637182\n8,3.17,16.9180008491539\n8,3.19853164556962,16.8554469873031\n8,3.22706329113924,16.7928931254522\n8,3.25559493670886,16.7303392636013\n8,3.28412658227848,16.6677854017505\n8,3.3126582278481,16.6052315398996\n8,3.34118987341772,16.5426776780488\n8,3.36972151898734,16.4801238161979\n8,3.39825316455696,16.4175699543471\n8,3.42678481012658,16.3550160924962\n8,3.4553164556962,16.2924622306453\n8,3.48384810126582,16.2299083687945\n8,3.51237974683544,16.1673545069436\n8,3.54091139240506,16.1048006450928\n8,3.56944303797468,16.0422467832419\n8,3.5979746835443,15.9796929213911\n8,3.62650632911392,15.9171390595402\n8,3.65503797468354,15.8545851976894\n8,3.68356962025316,15.7920313358385\n8,3.71210126582278,15.7294774739876\n8,3.7406329113924,15.6669236121368\n8,3.76916455696203,15.6043697502859\n8,3.79769620253165,15.5418158884351\n8,3.82622784810127,15.4792620265842\n8,3.85475949367089,15.4167081647334\n8,3.88329113924051,15.3541543028825\n8,3.91182278481013,15.2916004410316\n8,3.94035443037975,15.2290465791808\n8,3.96888607594937,15.1664927173299\n8,3.99741772151899,15.1039388554791\n8,4.02594936708861,15.0413849936282\n8,4.05448101265823,14.9788311317774\n8,4.08301265822785,14.9162772699265\n8,4.11154430379747,14.8537234080756\n8,4.14007594936709,14.7911695462248\n8,4.16860759493671,14.7286156843739\n8,4.19713924050633,14.6660618225231\n8,4.22567088607595,14.6035079606722\n8,4.25420253164557,14.5409540988214\n8,4.28273417721519,14.4784002369705\n8,4.31126582278481,14.4158463751197\n8,4.33979746835443,14.3532925132688\n8,4.36832911392405,14.2907386514179\n8,4.39686075949367,14.2281847895671\n8,4.42539240506329,14.1656309277162\n8,4.45392405063291,14.1030770658654\n8,4.48245569620253,14.0405232040145\n8,4.51098734177215,13.9779693421637\n8,4.53951898734177,13.9154154803128\n8,4.56805063291139,13.8528616184619\n8,4.59658227848101,13.7903077566111\n8,4.62511392405063,13.7277538947602\n8,4.65364556962025,13.6652000329094\n8,4.68217721518987,13.6026461710585\n8,4.71070886075949,13.5400923092077\n8,4.73924050632911,13.4775384473568\n8,4.76777215189873,13.4149845855059\n8,4.79630379746835,13.3524307236551\n8,4.82483544303797,13.2898768618042\n8,4.8533670886076,13.2273229999534\n8,4.88189873417722,13.1647691381025\n8,4.91043037974684,13.1022152762517\n8,4.93896202531646,13.0396614144008\n8,4.96749367088608,12.97710755255\n8,4.9960253164557,12.9145536906991\n8,5.02455696202532,12.8519998288482\n8,5.05308860759494,12.7894459669974\n8,5.08162025316456,12.7268921051465\n8,5.11015189873418,12.6643382432957\n8,5.1386835443038,12.6017843814448\n8,5.16721518987342,12.539230519594\n8,5.19574683544304,12.4766766577431\n8,5.22427848101266,12.4141227958922\n8,5.25281012658228,12.3515689340414\n8,5.2813417721519,12.2890150721905\n8,5.30987341772152,12.2264612103397\n8,5.33840506329114,12.1639073484888\n8,5.36693670886076,12.101353486638\n8,5.39546835443038,12.0387996247871\n8,5.424,11.9762457629362"
    },
    {
      "name": ".0/group_by1/model_prediction2",
      "source": ".0/group_by1/model_prediction2_flat",
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
      "name": "scale/fill",
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
            "field": "data.factor(cyl)"
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
        "data": ".0/group_by1/model_prediction2"
      },
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
                "value": ".0/group_by1/model_prediction2"
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
      "fill": "fill",
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
ggvis.getPlot("plot_id231731962").parseSpec(plot_id231731962_spec);
</script><!--/html_preserve-->

or
```
mtcars %>% 
     ggvis(~wt, ~mpg ) %>% 
     layer_points(fill = ~factor(cyl)) %>% 
     group_by(cyl) %>% 
    layer_model_predictions(model = "lm")
    
```

## Bar graphs

We’ll use the built-in pressure data set for these examples:

```r
  # The first few rows

head(pressure)
```

```
##   temperature pressure
## 1           0   0.0002
## 2          20   0.0012
## 3          40   0.0060
## 4          60   0.0300
## 5          80   0.0900
## 6         100   0.2700
```


When the variable on the x axis is continuous (e.g., numeric or date-time):

```r
pressure %>% 
  ggvis(~temperature, ~pressure) %>% 
  layer_bars()
```

<!--html_preserve--><div id="plot_id680502167-container" class="ggvis-output-container">
<div id="plot_id680502167" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id680502167_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id680502167" data-renderer="svg">SVG</a>
 | 
<a id="plot_id680502167_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id680502167" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id680502167_download" class="ggvis-download" data-plot-id="plot_id680502167">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id680502167_spec = {
  "data": [
    {
      "name": ".0/count1/align2/stack3",
      "format": {
        "type": "csv",
        "parse": {
          "xmin_": "number",
          "xmax_": "number",
          "stack_upr_": "number",
          "stack_lwr_": "number"
        }
      },
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n-10,10,2e-04,0\n10,30,0.0012,0\n30,50,0.006,0\n50,70,0.03,0\n70,90,0.09,0\n90,110,0.27,0\n110,130,0.75,0\n130,150,1.85,0\n150,170,4.2,0\n170,190,8.8,0\n190,210,17.3,0\n210,230,32.1,0\n230,250,57,0\n250,270,96,0\n270,290,157,0\n290,310,247,0\n310,330,376,0\n330,350,558,0\n350,370,806,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-29\n389"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n846.3"
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
            "value": ".0/count1/align2/stack3"
          }
        }
      },
      "from": {
        "data": ".0/count1/align2/stack3"
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
      "title": "temperature"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "pressure"
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
ggvis.getPlot("plot_id680502167").parseSpec(plot_id680502167_spec);
</script><!--/html_preserve-->

It’s possible to specify the `width` of the bars:


```r
pressure %>% 
  ggvis(~temperature, ~pressure) %>% 
  layer_bars(width = 10)
```

<!--html_preserve--><div id="plot_id501747825-container" class="ggvis-output-container">
<div id="plot_id501747825" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id501747825_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id501747825" data-renderer="svg">SVG</a>
 | 
<a id="plot_id501747825_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id501747825" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id501747825_download" class="ggvis-download" data-plot-id="plot_id501747825">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id501747825_spec = {
  "data": [
    {
      "name": ".0/count1/align2/stack3",
      "format": {
        "type": "csv",
        "parse": {
          "xmin_": "number",
          "xmax_": "number",
          "stack_upr_": "number",
          "stack_lwr_": "number"
        }
      },
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n-5,5,2e-04,0\n15,25,0.0012,0\n35,45,0.006,0\n55,65,0.03,0\n75,85,0.09,0\n95,105,0.27,0\n115,125,0.75,0\n135,145,1.85,0\n155,165,4.2,0\n175,185,8.8,0\n195,205,17.3,0\n215,225,32.1,0\n235,245,57,0\n255,265,96,0\n275,285,157,0\n295,305,247,0\n315,325,376,0\n335,345,558,0\n355,365,806,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-23.5\n383.5"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n846.3"
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
            "value": ".0/count1/align2/stack3"
          }
        }
      },
      "from": {
        "data": ".0/count1/align2/stack3"
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
      "title": "temperature"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "pressure"
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
ggvis.getPlot("plot_id501747825").parseSpec(plot_id501747825_spec);
</script><!--/html_preserve-->


When the variable on the x axis is categorical (e.g., factor or character):


```r
  #First, modify the pressure data set so that the x variable is a factor

pressur <- pressure %>% mutate(temperature = factor(temperature))
pressure
```

```
##    temperature pressure
## 1            0   0.0002
## 2           20   0.0012
## 3           40   0.0060
## 4           60   0.0300
## 5           80   0.0900
## 6          100   0.2700
## 7          120   0.7500
## 8          140   1.8500
## 9          160   4.2000
## 10         180   8.8000
## 11         200  17.3000
## 12         220  32.1000
## 13         240  57.0000
## 14         260  96.0000
## 15         280 157.0000
## 16         300 247.0000
## 17         320 376.0000
## 18         340 558.0000
## 19         360 806.0000
```

```r
pressur %>% ggvis(~temperature, ~pressure) %>% 
  layer_bars()
```

<!--html_preserve--><div id="plot_id288542369-container" class="ggvis-output-container">
<div id="plot_id288542369" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id288542369_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id288542369" data-renderer="svg">SVG</a>
 | 
<a id="plot_id288542369_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id288542369" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id288542369_download" class="ggvis-download" data-plot-id="plot_id288542369">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id288542369_spec = {
  "data": [
    {
      "name": ".0/count1/stack2",
      "format": {
        "type": "csv",
        "parse": {
          "stack_lwr_": "number",
          "stack_upr_": "number"
        }
      },
      "values": "\"x_\",\"stack_lwr_\",\"stack_upr_\"\n\"0\",0,2e-04\n\"20\",0,0.0012\n\"40\",0,0.006\n\"60\",0,0.03\n\"80\",0,0.09\n\"100\",0,0.27\n\"120\",0,0.75\n\"140\",0,1.85\n\"160\",0,4.2\n\"180\",0,8.8\n\"200\",0,17.3\n\"220\",0,32.1\n\"240\",0,57\n\"260\",0,96\n\"280\",0,157\n\"300\",0,247\n\"320\",0,376\n\"340\",0,558\n\"360\",0,806"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"0\"\n\"20\"\n\"40\"\n\"60\"\n\"80\"\n\"100\"\n\"120\"\n\"140\"\n\"160\"\n\"180\"\n\"200\"\n\"220\"\n\"240\"\n\"260\"\n\"280\"\n\"300\"\n\"320\"\n\"340\"\n\"360\""
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n846.3"
    }
  ],
  "scales": [
    {
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "name": "x",
      "type": "ordinal",
      "points": false,
      "padding": 0.1,
      "sort": false,
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
            "field": "data.x_"
          },
          "y": {
            "scale": "y",
            "field": "data.stack_lwr_"
          },
          "y2": {
            "scale": "y",
            "field": "data.stack_upr_"
          },
          "width": {
            "scale": "x",
            "band": true
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/count1/stack2"
          }
        }
      },
      "from": {
        "data": ".0/count1/stack2"
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
      "title": "temperature"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "pressure"
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
ggvis.getPlot("plot_id288542369").parseSpec(plot_id288542369_spec);
</script><!--/html_preserve-->


## Line graphs


```r
pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines()
```

<!--html_preserve--><div id="plot_id557997573-container" class="ggvis-output-container">
<div id="plot_id557997573" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id557997573_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id557997573" data-renderer="svg">SVG</a>
 | 
<a id="plot_id557997573_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id557997573" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id557997573_download" class="ggvis-download" data-plot-id="plot_id557997573">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id557997573_spec = {
  "data": [
    {
      "name": ".0/arrange1",
      "format": {
        "type": "csv",
        "parse": {
          "temperature": "number",
          "pressure": "number"
        }
      },
      "values": "\"temperature\",\"pressure\"\n0,2e-04\n20,0.0012\n40,0.006\n60,0.03\n80,0.09\n100,0.27\n120,0.75\n140,1.85\n160,4.2\n180,8.8\n200,17.3\n220,32.1\n240,57\n260,96\n280,157\n300,247\n320,376\n340,558\n360,806"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-18\n378"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-40.29979\n846.29999"
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
            "field": "data.temperature"
          },
          "y": {
            "scale": "y",
            "field": "data.pressure"
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
      "title": "temperature"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "pressure"
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
ggvis.getPlot("plot_id557997573").parseSpec(plot_id557997573_spec);
</script><!--/html_preserve-->


## Lines with points:

```r
pressure %>% ggvis(~temperature, ~pressure) %>% 
  layer_points() %>% 
  layer_lines()
```

<!--html_preserve--><div id="plot_id988525234-container" class="ggvis-output-container">
<div id="plot_id988525234" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id988525234_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id988525234" data-renderer="svg">SVG</a>
 | 
<a id="plot_id988525234_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id988525234" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id988525234_download" class="ggvis-download" data-plot-id="plot_id988525234">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id988525234_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "temperature": "number",
          "pressure": "number"
        }
      },
      "values": "\"temperature\",\"pressure\"\n0,2e-04\n20,0.0012\n40,0.006\n60,0.03\n80,0.09\n100,0.27\n120,0.75\n140,1.85\n160,4.2\n180,8.8\n200,17.3\n220,32.1\n240,57\n260,96\n280,157\n300,247\n320,376\n340,558\n360,806"
    },
    {
      "name": ".0/arrange1",
      "format": {
        "type": "csv",
        "parse": {
          "temperature": "number",
          "pressure": "number"
        }
      },
      "values": "\"temperature\",\"pressure\"\n0,2e-04\n20,0.0012\n40,0.006\n60,0.03\n80,0.09\n100,0.27\n120,0.75\n140,1.85\n160,4.2\n180,8.8\n200,17.3\n220,32.1\n240,57\n260,96\n280,157\n300,247\n320,376\n340,558\n360,806"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-18\n378"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-40.29979\n846.29999"
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
            "field": "data.temperature"
          },
          "y": {
            "scale": "y",
            "field": "data.pressure"
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
            "field": "data.temperature"
          },
          "y": {
            "scale": "y",
            "field": "data.pressure"
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
      "title": "temperature"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "pressure"
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
ggvis.getPlot("plot_id988525234").parseSpec(plot_id988525234_spec);
</script><!--/html_preserve-->


## Histograms
We’ll use the built-in **faithful** data set for these examples:


```r
  # The first few rows
  
 head(faithful)
```

```
##   eruptions waiting
## 1     3.600      79
## 2     1.800      54
## 3     3.333      74
## 4     2.283      62
## 5     4.533      85
## 6     2.883      55
```

## Basic histogram:

```r
faithful %>% ggvis(~eruptions) %>% layer_histograms()
```

```
## Guessing width = 0.1 # range / 35
```

<!--html_preserve--><div id="plot_id735170961-container" class="ggvis-output-container">
<div id="plot_id735170961" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id735170961_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id735170961" data-renderer="svg">SVG</a>
 | 
<a id="plot_id735170961_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id735170961" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id735170961_download" class="ggvis-download" data-plot-id="plot_id735170961">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id735170961_spec = {
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
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n1.55,1.65,1,0\n1.65,1.75,9,0\n1.75,1.85,18,0\n1.85,1.95,17,0\n1.95,2.05,15,0\n2.05,2.15,8,0\n2.15,2.25,11,0\n2.25,2.35,6,0\n2.35,2.45,6,0\n2.45,2.55,1,0\n2.55,2.65,2,0\n2.65,2.75,0,0\n2.75,2.85,1,0\n2.85,2.95,2,0\n2.95,3.05,0,0\n3.05,3.15,1,0\n3.15,3.25,0,0\n3.25,3.35,3,0\n3.35,3.45,3,0\n3.45,3.55,2,0\n3.55,3.65,6,0\n3.65,3.75,4,0\n3.75,3.85,10,0\n3.85,3.95,6,0\n3.95,4.05,11,0\n4.05,4.15,17,0\n4.15,4.25,13,0\n4.25,4.35,16,0\n4.35,4.45,15,0\n4.45,4.55,18,0\n4.55,4.65,16,0\n4.65,4.75000000000001,11,0\n4.75,4.85,13,0\n4.85,4.95,6,0\n4.95,5.05,2,0\n5.05,5.15000000000001,2,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.37\n5.33000000000001"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n18.9"
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
      "title": "eruptions"
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
ggvis.getPlot("plot_id735170961").parseSpec(plot_id735170961_spec);
</script><!--/html_preserve-->


```r
faithful %>% ggvis(~waiting) %>% layer_histograms()
```

```
## Guessing width = 2 # range / 27
```

<!--html_preserve--><div id="plot_id128002680-container" class="ggvis-output-container">
<div id="plot_id128002680" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id128002680_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id128002680" data-renderer="svg">SVG</a>
 | 
<a id="plot_id128002680_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id128002680" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id128002680_download" class="ggvis-download" data-plot-id="plot_id128002680">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id128002680_spec = {
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
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n43,45,4,0\n45,47,9,0\n47,49,8,0\n49,51,11,0\n51,53,12,0\n53,55,15,0\n55,57,7,0\n57,59,11,0\n59,61,6,0\n61,63,7,0\n63,65,7,0\n65,67,3,0\n67,69,3,0\n69,71,9,0\n71,73,8,0\n73,75,14,0\n75,77,21,0\n77,79,25,0\n79,81,21,0\n81,83,26,0\n83,85,16,0\n85,87,8,0\n87,89,9,0\n89,91,7,0\n91,93,3,0\n93,95,1,0\n95,97,1,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n40.3\n99.7"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n27.3"
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
      "title": "waiting"
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
ggvis.getPlot("plot_id128002680").parseSpec(plot_id128002680_spec);
</script><!--/html_preserve-->


The bin selection can be controled by specifying `width` and at most one of `center` or `boundary` of one of the bins. boundary and center may be outside the range of the data.


```r
faithful %>% ggvis(~eruptions) %>% layer_histograms(width=0.5, boundary=0)
```

<!--html_preserve--><div id="plot_id995555781-container" class="ggvis-output-container">
<div id="plot_id995555781" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id995555781_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id995555781" data-renderer="svg">SVG</a>
 | 
<a id="plot_id995555781_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id995555781" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id995555781_download" class="ggvis-download" data-plot-id="plot_id995555781">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id995555781_spec = {
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
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n1.5,2,55,0\n2,2.5,37,0\n2.5,3,5,0\n3,3.5,9,0\n3.5,4,34,0\n4,4.5,75,0\n4.5,5,54,0\n5,5.5,3,0"
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
      "values": "\"domain\"\n0\n78.75"
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
      "title": "eruptions"
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
ggvis.getPlot("plot_id995555781").parseSpec(plot_id995555781_spec);
</script><!--/html_preserve-->



```r
faithful %>% ggvis(~eruptions) %>% layer_histograms
```

```
## Guessing width = 0.1 # range / 35
```

<!--html_preserve--><div id="plot_id666338051-container" class="ggvis-output-container">
<div id="plot_id666338051" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id666338051_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id666338051" data-renderer="svg">SVG</a>
 | 
<a id="plot_id666338051_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id666338051" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id666338051_download" class="ggvis-download" data-plot-id="plot_id666338051">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id666338051_spec = {
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
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n1.55,1.65,1,0\n1.65,1.75,9,0\n1.75,1.85,18,0\n1.85,1.95,17,0\n1.95,2.05,15,0\n2.05,2.15,8,0\n2.15,2.25,11,0\n2.25,2.35,6,0\n2.35,2.45,6,0\n2.45,2.55,1,0\n2.55,2.65,2,0\n2.65,2.75,0,0\n2.75,2.85,1,0\n2.85,2.95,2,0\n2.95,3.05,0,0\n3.05,3.15,1,0\n3.15,3.25,0,0\n3.25,3.35,3,0\n3.35,3.45,3,0\n3.45,3.55,2,0\n3.55,3.65,6,0\n3.65,3.75,4,0\n3.75,3.85,10,0\n3.85,3.95,6,0\n3.95,4.05,11,0\n4.05,4.15,17,0\n4.15,4.25,13,0\n4.25,4.35,16,0\n4.35,4.45,15,0\n4.45,4.55,18,0\n4.55,4.65,16,0\n4.65,4.75000000000001,11,0\n4.75,4.85,13,0\n4.85,4.95,6,0\n4.95,5.05,2,0\n5.05,5.15000000000001,2,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.37\n5.33000000000001"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n18.9"
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
      "title": "eruptions"
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
ggvis.getPlot("plot_id666338051").parseSpec(plot_id666338051_spec);
</script><!--/html_preserve-->



```r
 faithful %>% ggvis(~eruptions) %>% layer_histograms(width=0.5, center=0)
```

<!--html_preserve--><div id="plot_id342245276-container" class="ggvis-output-container">
<div id="plot_id342245276" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id342245276_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id342245276" data-renderer="svg">SVG</a>
 | 
<a id="plot_id342245276_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id342245276" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id342245276_download" class="ggvis-download" data-plot-id="plot_id342245276">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id342245276_spec = {
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
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n1.25,1.75,10,0\n1.75,2.25,69,0\n2.25,2.75,15,0\n2.75,3.25,4,0\n3.25,3.75,18,0\n3.75,4.25,57,0\n4.25,4.75,76,0\n4.75,5.25,23,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.05\n5.45"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n79.8"
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
      "title": "eruptions"
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
ggvis.getPlot("plot_id342245276").parseSpec(plot_id342245276_spec);
</script><!--/html_preserve-->

Modify the fill color and bin width, and add titles for the axes, since the automatic titles aren’t very informative:

```r
faithful %>% ggvis(~eruptions, fill := "#ffdc") %>% 
  layer_histograms(width = 0.25)
```

<!--html_preserve--><div id="plot_id514321254-container" class="ggvis-output-container">
<div id="plot_id514321254" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id514321254_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id514321254" data-renderer="svg">SVG</a>
 | 
<a id="plot_id514321254_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id514321254" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id514321254_download" class="ggvis-download" data-plot-id="plot_id514321254">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id514321254_spec = {
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
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n1.375,1.625,1,0\n1.625,1.875,35,0\n1.875,2.125,30,0\n2.125,2.375,20,0\n2.375,2.625,7,0\n2.625,2.875,2,0\n2.875,3.125,3,0\n3.125,3.375,4,0\n3.375,3.625,10,0\n3.625,3.875,14,0\n3.875,4.125,28,0\n4.125,4.375,39,0\n4.375,4.625,41,0\n4.625,4.875,28,0\n4.875,5.125,10,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.1875\n5.3125"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n43.05"
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
            "value": "#ffdc"
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
      "title": "eruptions"
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
ggvis.getPlot("plot_id514321254").parseSpec(plot_id514321254_spec);
</script><!--/html_preserve-->

By default, when the number of integer values is small, bins will be centered at integers and have a width of 1:

```r
# name axis x & y
cocaine %>% ggvis(~month, fill := "#ffdc") %>% 
  layer_histograms() %>% 
  add_axis("x", title = "month") %>% 
  add_axis("y", title = "count")
```

```
## Guessing width = 0.5 # range / 22
```

<!--html_preserve--><div id="plot_id477641295-container" class="ggvis-output-container">
<div id="plot_id477641295" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id477641295_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id477641295" data-renderer="svg">SVG</a>
 | 
<a id="plot_id477641295_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id477641295" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id477641295_download" class="ggvis-download" data-plot-id="plot_id477641295">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id477641295_spec = {
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
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n0.75,1.25,314,0\n1.25,1.75,0,0\n1.75,2.25,268,0\n2.25,2.75,0,0\n2.75,3.25,350,0\n3.25,3.75,0,0\n3.75,4.25,216,0\n4.25,4.75,0,0\n4.75,5.25,262,0\n5.25,5.75,0,0\n5.75,6.25,238,0\n6.25,6.75,0,0\n6.75,7.25,270,0\n7.25,7.75,0,0\n7.75,8.25,357,0\n8.25,8.75,0,0\n8.75,9.25,300,0\n9.25,9.75,0,0\n9.75,10.25,333,0\n10.25,10.75,0,0\n10.75,11.25,263,0\n11.25,11.75,0,0\n11.75,12.25,209,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.175\n12.825"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n374.85"
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
            "value": "#ffdc"
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
      "title": "month",
      "layer": "back",
      "grid": true
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "title": "count",
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
ggvis.getPlot("plot_id477641295").parseSpec(plot_id477641295_spec);
</script><!--/html_preserve-->

```r
# range / 22
```


This can be forced with

```r
cocaine %>% ggvis(~month, fill := "#ffdc") %>% 
layer_histograms(width = 1, center = 0) %>% 
add_axis("x", title = "month") %>% 
add_axis("y", title = "count")
```

<!--html_preserve--><div id="plot_id964977896-container" class="ggvis-output-container">
<div id="plot_id964977896" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id964977896_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id964977896" data-renderer="svg">SVG</a>
 | 
<a id="plot_id964977896_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id964977896" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id964977896_download" class="ggvis-download" data-plot-id="plot_id964977896">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id964977896_spec = {
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
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n0.5,1.5,314,0\n1.5,2.5,268,0\n2.5,3.5,350,0\n3.5,4.5,216,0\n4.5,5.5,262,0\n5.5,6.5,238,0\n6.5,7.5,270,0\n7.5,8.5,357,0\n8.5,9.5,300,0\n9.5,10.5,333,0\n10.5,11.5,263,0\n11.5,12.5,209,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.1\n13.1"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n374.85"
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
            "value": "#ffdc"
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
      "title": "month",
      "layer": "back",
      "grid": true
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "title": "count",
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
ggvis.getPlot("plot_id964977896").parseSpec(plot_id964977896_spec);
</script><!--/html_preserve-->


## Box plots

```r
mtcars %>% ggvis(~factor(cyl), ~mpg) %>% layer_boxplots()
```

```
## Warning in bind_rows_(x, .id): Unequal factor levels: coercing to character
```

<!--html_preserve--><div id="plot_id905062258-container" class="ggvis-output-container">
<div id="plot_id905062258" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id905062258_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id905062258" data-renderer="svg">SVG</a>
 | 
<a id="plot_id905062258_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id905062258" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id905062258_download" class="ggvis-download" data-plot-id="plot_id905062258">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id905062258_spec = {
  "data": [
    {
      "name": ".0/group_by1/boxplot2_flat",
      "format": {
        "type": "csv",
        "parse": {
          "min_": "number",
          "max_": "number",
          "lower_": "number",
          "upper_": "number",
          "median_": "number"
        }
      },
      "values": "\"min_\",\"max_\",\"factor(cyl)\",\"lower_\",\"upper_\",\"median_\"\n21.4,33.9,\"4\",22.8,30.4,26\n17.8,21.4,\"6\",18.65,21,19.7\n13.3,18.7,\"8\",14.4,16.25,15.2"
    },
    {
      "name": ".0/group_by1/boxplot2",
      "source": ".0/group_by1/boxplot2_flat",
      "transform": [
        {
          "type": "treefacet",
          "keys": [
            "data.factor(cyl)"
          ]
        }
      ]
    },
    {
      "name": ".0/group_by1/boxplot2/boxplot_outliers3_flat",
      "format": {
        "type": "csv",
        "parse": {
          "value_": "number"
        }
      },
      "values": "\"value_\",\"factor(cyl)\"\n10.4,\"8\"\n10.4,\"8\"\n19.2,\"8\""
    },
    {
      "name": ".0/group_by1/boxplot2/boxplot_outliers3",
      "source": ".0/group_by1/boxplot2/boxplot_outliers3_flat",
      "transform": [
        {
          "type": "treefacet",
          "keys": [
            "data.factor(cyl)"
          ]
        }
      ]
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"4\"\n\"6\"\n\"8\""
    },
    {
      "name": "scale/xcenter",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"4\"\n\"6\"\n\"8\""
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
      "padding": 0.1,
      "type": "ordinal",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "name": "x",
      "points": false,
      "sort": false,
      "range": "width"
    },
    {
      "points": true,
      "padding": 1.1,
      "name": "xcenter",
      "type": "ordinal",
      "domain": {
        "data": "scale/xcenter",
        "field": "data.domain"
      },
      "sort": false,
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
        "data": ".0/group_by1/boxplot2"
      },
      "marks": [
        {
          "type": "rect",
          "properties": {
            "update": {
              "stroke": {
                "value": "#000000"
              },
              "fill": {
                "value": "white"
              },
              "y": {
                "scale": "y",
                "field": "data.min_"
              },
              "y2": {
                "scale": "y",
                "field": "data.max_"
              },
              "x": {
                "scale": "xcenter",
                "field": "data.factor(cyl)"
              },
              "width": {
                "value": 0.5
              }
            },
            "ggvis": {
              "data": {
                "value": ".0/group_by1/boxplot2"
              }
            }
          }
        }
      ]
    },
    {
      "type": "group",
      "from": {
        "data": ".0/group_by1/boxplot2"
      },
      "marks": [
        {
          "type": "rect",
          "properties": {
            "update": {
              "stroke": {
                "value": "#000000"
              },
              "fill": {
                "value": "white"
              },
              "x": {
                "scale": "x",
                "field": "data.factor(cyl)"
              },
              "y": {
                "scale": "y",
                "field": "data.lower_"
              },
              "y2": {
                "scale": "y",
                "field": "data.upper_"
              },
              "width": {
                "scale": "x",
                "band": true
              }
            },
            "ggvis": {
              "data": {
                "value": ".0/group_by1/boxplot2"
              }
            }
          }
        }
      ]
    },
    {
      "type": "group",
      "from": {
        "data": ".0/group_by1/boxplot2"
      },
      "marks": [
        {
          "type": "rect",
          "properties": {
            "update": {
              "stroke": {
                "value": "#000000"
              },
              "fill": {
                "value": "white"
              },
              "x": {
                "scale": "x",
                "field": "data.factor(cyl)"
              },
              "y": {
                "scale": "y",
                "field": "data.median_"
              },
              "width": {
                "scale": "x",
                "band": true
              },
              "height": {
                "value": 1
              }
            },
            "ggvis": {
              "data": {
                "value": ".0/group_by1/boxplot2"
              }
            }
          }
        }
      ]
    },
    {
      "type": "group",
      "from": {
        "data": ".0/group_by1/boxplot2/boxplot_outliers3"
      },
      "marks": [
        {
          "type": "symbol",
          "properties": {
            "update": {
              "size": {
                "value": 50
              },
              "fill": {
                "value": "black"
              },
              "y": {
                "scale": "y",
                "field": "data.value_"
              },
              "x": {
                "scale": "xcenter",
                "field": "data.factor(cyl)"
              }
            },
            "ggvis": {
              "data": {
                "value": ".0/group_by1/boxplot2/boxplot_outliers3"
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
      "title": "factor(cyl)"
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
ggvis.getPlot("plot_id905062258").parseSpec(plot_id905062258_spec);
</script><!--/html_preserve-->
