# R package for Post-2010 Census U.S. gazetteer data

**License**

This package is released under [MIT license](http://opensource.org/licenses/mit-license.php). The data itself comes from [U.S. Census Bureau](http://www.census.gov/) who release it under [public domain](https://ask.census.gov/faq.php?id=5000&faqId=537).

---

## Introduction

This package allows you to access [gazetteer](https://en.wikipedia.org/wiki/Gazetteer) data released by the U.S. census bureau.
This package is supplementary to the excellent [tigris](https://github.com/walkerke/tigris) and the [acs](https://cran.r-project.org/web/packages/acs/index.html) packages to work with U.S. census data.

For now there is one data.frame 'state.areas.2010' and 5 lists (one for each year) ...

- gazetteer.2015
- gazetteer.2014
- gazetteer.2013
- gazetteer.2012
- gazetteer.2010

The state.areas.2010 data.frame consists of state level gazetteer data from 2010 U.S. census. This data is consolidated from multiple sources, due to the fact that census bureau doesn't supply it in a single file.

The state.areas.2010 is built from these sources

- [Wikipedia entry for state abbreviations](https://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations)
- [U.S. census bureau data for each state from 2010 Census](https://www.census.gov/geo/reference/state-area.html)
- [U.S. census bureau data for state FIPS/GNISID codes](http://www2.census.gov/geo/docs/reference/state.txt)

Although the state.areas.2010 is from 2010, this data should be fairly stable and not change (much).

Each of the 'gazetteer.*' list is a list of data.frames, one data.frame for one type of gazetteer data. The names of types of gazetteer data each list contains can be queried by

```r
devtools::install_github('bhaskarvk/usgazetteer')
library(usgazetteer)
names(gazetteer.2015)
```
<br/>
Individual data.frames can be access by their respective names.

```r
library(usgazetteer)
counties.2015 <- gazetteer.2015$Counties
```

<br/>
All the gazetteer files from 2010 to 2015 are obtained from http://www.census.gov/geo/maps-data/data/gazetteer.html. All the data found on the census.gov site is released under public domain.

## TODO

- Write demo/vignettes 
- ???
- Profit
