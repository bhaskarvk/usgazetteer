## ---- results = "asis", echo=FALSE---------------------------------------
load("../data/state.areas.2010.rda")
knitr::kable(head(state.areas.2010[,c(1:9,23,24)]), format = 'html')

## ---- results = "asis", echo=FALSE---------------------------------------
load("../data/gazetteer.2015.rda")
knitr::kable(data.frame(`Data Name`=names(gazetteer.2015)), format = 'html')

## ---- results = "asis"---------------------------------------------------
counties.2015 <- gazetteer.2015$Counties
knitr::kable(head(counties.2015[,c(1:4,9:12)]),  format = 'html')

