
R package for Post-2010 Census U.S. gazetteer data
--------------------------------------------------

[![Project Status: Active – The project is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Last-changedate](https://img.shields.io/badge/last%20change-2017--02--27-green.svg)](/commits/master) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![keybase verified](https://img.shields.io/badge/keybase-verified-brightgreen.svg)](https://gist.github.com/bhaskarvk/46fbf2ba7b5713151d7e)

[![Travis-CI Build Status](https://travis-ci.org/bhaskarvk/usgazetteer.svg?branch=master)](https://travis-ci.org/bhaskarvk/usgazetteer) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/bhaskarvk/usgazetteer?branch=master&svg=true)](https://ci.appveyor.com/project/bhaskarvk/usgazetteer)

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.2.0-6666ff.svg)](https://cran.r-project.org/) [![packageversion](https://img.shields.io/badge/Package%20version-0.1.2-orange.svg?style=flat-square)](commits/master)

**NOTE**: This is a large package (more than 50 MB) and may never be submitted to CRAN due to its size.

------------------------------------------------------------------------

### Introduction

This package allows you to access [gazetteer](https://en.wikipedia.org/wiki/Gazetteer) data released by the U.S. census bureau. This package is supplementary to the excellent [tigris](https://cran.r-project.org/package=tigris) and the [acs](https://cran.r-project.org/package=acs) packages to work with U.S. census data.

### Installation

``` r
if(!require(devtools)) {
  install.packages("devtools")
}
devtools::install_git('bhaskarvk/usgazetteer')
```

### Data Provided

For now there is one data.frame 'state.areas.2010' and 6 lists (one for each year) ...

-   gazetteer.2016
-   gazetteer.2015
-   gazetteer.2014
-   gazetteer.2013
-   gazetteer.2012
-   gazetteer.2010

The state.areas.2010 data.frame consists of state level gazetteer data from 2010 U.S. census. This data is consolidated from multiple sources, due to the fact that census bureau doesn't supply it in a single file.

The state.areas.2010 is built from these sources

-   [Wikipedia entry for state abbreviations](https://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations)
-   [U.S. census bureau data for each state from 2010 Census](https://www.census.gov/geo/reference/state-area.html)
-   [U.S. census bureau data for state FIPS/GNISID codes](http://www2.census.gov/geo/docs/reference/state.txt)

Although the state.areas.2010 is from 2010, this data should be fairly stable and not change (much).

Each of the 'gazetteer.\*' list is a list of data.frames, one data.frame for one type of gazetteer data. The names of types of gazetteer data each list contains can be queried by

``` r
library(usgazetteer)
names(gazetteer.2016)
```

    ##  [1] "115th Congressional Districts"                                                               
    ##  [2] "American Indian Reservations, Statistical Areas, and Alaska Native Village Statistical Areas"
    ##  [3] "Census Tracts"                                                                               
    ##  [4] "Core Based Statistical Areas"                                                                
    ##  [5] "Counties"                                                                                    
    ##  [6] "County Subdivisions"                                                                         
    ##  [7] "Current American Indian, Alaska Native, and Hawaiian Home Lands Legal and Statistical Areas" 
    ##  [8] "Current American Indian  Off-Reservation Trust Lands"                                        
    ##  [9] "Current Hawaiian Home Lands"                                                                 
    ## [10] "Places"                                                                                      
    ## [11] "School Districts - Elementary"                                                               
    ## [12] "School Districts - Secondary"                                                                
    ## [13] "School Districts - Unified"                                                                  
    ## [14] "State Legislative Districts - Lower Chamber"                                                 
    ## [15] "State Legislative Districts - Upper Chamber"                                                 
    ## [16] "Urban Areas"                                                                                 
    ## [17] "ZIP Code Tabulation Areas"

<br/> Individual data.frames can be access by their respective names.

``` r
library(usgazetteer)
counties.2016 <- gazetteer.2016$Counties
dplyr::glimpse(counties.2016)
```

    ## Observations: 3,220
    ## Variables: 12
    ## $ USPS        <chr> "AL", "AL", "AL", "AL", "AL", "AL", "AL", "AL", "A...
    ## $ GEOID       <chr> "01001", "01003", "01005", "01007", "01009", "0101...
    ## $ ANSICODE    <chr> "00161526", "00161527", "00161528", "00161529", "0...
    ## $ NAME        <chr> "Autauga County", "Baldwin County", "Barbour Count...
    ## $ ALAND       <dbl> 1539609015, 4117584019, 2291818680, 1612481559, 16...
    ## $ AWATER      <dbl> 25749942, 1133130502, 50864677, 9287974, 15077458,...
    ## $ ALAND_SQMI  <dbl> 594.446, 1589.808, 884.876, 622.583, 644.807, 622....
    ## $ AWATER_SQMI <dbl> 9.942, 437.504, 19.639, 3.586, 5.821, 2.338, 1.053...
    ## $ INTPTLAT    <dbl> 32.53224, 30.65922, 31.87025, 33.01589, 33.97736, ...
    ## $ INTPTLONG   <dbl> -86.64644, -87.74607, -85.40510, -87.12715, -86.56...
    ## $ ATOTAL      <dbl> 1565358957, 5250714521, 2342683357, 1621769533, 16...
    ## $ ATOTAL_SQMI <dbl> 604.388, 2027.312, 904.515, 626.169, 650.628, 625....

<br/> All the gazetteer files from 2010 to 2016 are obtained from <http://www.census.gov/geo/maps-data/data/gazetteer.html>. All the data found on the census.gov site is released under public domain.

### License

This package is released under [MIT license](http://opensource.org/licenses/mit-license.php). The data itself comes from [U.S. Census Bureau](http://www.census.gov/) who release it under [public domain](https://askacs.census.gov/faq.php?id=5000&faqId=537).
