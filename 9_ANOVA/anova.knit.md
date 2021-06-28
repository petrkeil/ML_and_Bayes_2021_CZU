---
title: "ANOVA -- **part 1**: The data and fixed-effects model definition"
author: "Petr Keil"
date: "June 2021"
output:
  html_document:
    highlight: pygments
    keep_md: yes
    number_sections: yes
    theme: cerulean
    toc: yes
  pdf_document: default
---

***

# Objective

The aim of this lesson is to leave the participants to come up with their
code for simple one-way ANOVA (part 1), and to experiment with random effects ANOVA (part 2).

***

# The Data

We will use modified data from the example from **Marc Kery's Introduction to WinBUGS for Ecologists**, page 119 (Chapter 9 - ANOVA). The data describe snout-vent lengths in 5 populations of Smooth snake (*Coronella austriaca*).

![](figure/snake.png)

***

Loading the data from the web:


```r
  snakes <- read.csv("http://www.petrkeil.com/wp-content/uploads/2017/02/snakes_lengths.csv")

  summary(snakes)
```

```
##  X..DOCTYPE.html..html.lang.en..data.adblockkey.MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBANnylWw2vLY4hUn9w06zQKbhKBfvjFUCsdFlb6TdQhxb9RXWXuI4t31c.o8fYOv.s8q1LGPga3DE1L.tHU4LENMCAwEAAQ.._Td5iA8ah7M0W.zbGlLLCRI1ef2cf2it1G5EWlFwuycHaOtWCw22zZuSNf2cc.kv2i2bx.vZ3kPRiTv5Z6XB.8Q....head..meta.charset.utf.8..title.petrkeil.com.nbsp...nbspThis.website.is.for.sale..nbsp...nbsppetrkeil.Resources.and.Information...title..meta.name.viewport.content.width.device.width.initial.scale.1.0.maximum.scale.1.0.user.scalable.0..meta.name.description.content.This.website.is.for.sale..petrkeil.com.is.your.first.and.best.source.for.all.of.the.information.youâ..re.looking.for..From.general.topics.to.more.of.what.you.would.expect.to.find.here..petrkeil.com.has.it.all..We.hope.you.find.what.you.are.searching.for...link
##  Length:255                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
##  Class :character                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
##  Mode  :character
```

Plotting the data:


