# U.S. Census Bureau Gazetteer Data

R datafiles for Post-2010 Census U.S. Gazetteer files.

Along with the excellent [tigris](https://github.com/walkerke/tigris) and the [acs](https://cran.r-project.org/web/packages/acs/index.html) packages to work with U.S. Census data, this package allows you to access [Gazetteer](https://en.wikipedia.org/wiki/Gazetteer) data released by the U.S. Census bureau.

For now there are 5 lists ...

- gazetteer.2015
- gazetteer.2014
- gazetteer.2013
- gazetteer.2012
- gazetteer.2010

Each is a list of data.frames, one data.frame for one type of gazetteer data. The names of types of gazetteer data each list contains can be queried by

```r
devtools::install_github('bhaskarvk/usgazetteer')
library(usgazetteer)
names(gazetteer.2015)
```

Individual data.frames can be access by their respective names.

```r
library(usgazetteer)
counties.2015 <- gazetteer.2015$Counties
```

## TODO

- Write demo/vignettes 
- ???
- Profit