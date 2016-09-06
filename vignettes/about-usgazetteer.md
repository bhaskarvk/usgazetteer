# U.S. Census Gazetteer Data
Bhaskar V. Karambelkar  
`r Sys.Date()`  

### Gazetteer

Wikipedia defines a [Gazetteer](https://en.wikipedia.org/wiki/Gazetteer) as:

> A gazetteer is a geographical dictionary or directory used in conjunction with a map or atlas.

This is exactly what you get from this package, the [gazetteer data](https://www.census.gov/geo/maps-data/data/gazetteer.html) that is released under public domain from [U.S. Census Bureau](https://www.census.gov/) all nicely packaged as R data structures.

### Some Core Concepts

Before diving into the data it will be helpful if you familiarize yourself with some core concepts related to the U.S. census data. Instead of repeating the information here, I'm simply linking to pages from the census bureau site. If you are new to this data I highly encourage you to read the links below.

- The [Geographic Areas Reference Manual](http://www.census.gov/geo/reference/garm.html) (GARM) describes in great detail the basic geographic entities the Census Bureau used in its various data tabulations.
- The [Web Atlas](http://www.census.gov/geo/reference/webatlas/) shows standard hierarchy of census geographic entities displays the relationships between legal, administrative, and statistical boundaries maintained by the U.S. Census Bureau.
- [Glossary of Metropolitan-Related Terms](http://www.census.gov/population/metro/data/glossary.html)
- http://www2.census.gov/geo/pdfs/reference/GTC_10.pdf (! PDF link)
- http://www2.census.gov/geo/pdfs/reference/glossry2.pdf (! PDF link)

Every geo data uses some kind of ID to uniquely determine a geographic entity. The links below will help you understand the various **types of geo IDs** in use. Understanding these types of IDs is essential to joining the gazetteer data with geo-spatial data from other sources.

- http://www.census.gov/geo/reference/geoidentifiers.html
- http://www.census.gov/geo/reference/geocodes.html
- http://www.census.gov/geo/reference/ansi.html

### The Data

The package contains one data.frame called `state.areas.2010` and 5 lists, `gazetteer.2010`, `gazetteer.2012`, `gazetteer.2013`, `gazetteer.2014`, and `gazetteer.2015`.

**state.area.2010** contains state level gazetteer data, compiled from data from [U.S. Census Bureau](https://www.census.gov/geo/reference/state-area.html), and [Wikipedia](https://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations). In all the data.frame has 77 rows, 50 states + DC + Territories.

Here's a small sample of it.

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> State </th>
   <th style="text-align:left;"> Type </th>
   <th style="text-align:left;"> ISO3166 </th>
   <th style="text-align:left;"> ANSI </th>
   <th style="text-align:left;"> FIPS </th>
   <th style="text-align:left;"> USPS </th>
   <th style="text-align:left;"> USCG </th>
   <th style="text-align:left;"> GNISID </th>
   <th style="text-align:right;"> Total.Area.sqm </th>
   <th style="text-align:right;"> IntPoint.Lat </th>
   <th style="text-align:right;"> IntPoint.Long </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Alabama </td>
   <td style="text-align:left;"> State </td>
   <td style="text-align:left;"> US-AL </td>
   <td style="text-align:left;"> AL </td>
   <td style="text-align:left;"> 01 </td>
   <td style="text-align:left;"> AL </td>
   <td style="text-align:left;"> AL </td>
   <td style="text-align:left;"> 01779775 </td>
   <td style="text-align:right;"> 52420 </td>
   <td style="text-align:right;"> 32.73963 </td>
   <td style="text-align:right;"> -86.84346 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Alaska </td>
   <td style="text-align:left;"> State </td>
   <td style="text-align:left;"> US-AK </td>
   <td style="text-align:left;"> AK </td>
   <td style="text-align:left;"> 02 </td>
   <td style="text-align:left;"> AK </td>
   <td style="text-align:left;"> AK </td>
   <td style="text-align:left;"> 01785533 </td>
   <td style="text-align:right;"> 665384 </td>
   <td style="text-align:right;"> 63.34619 </td>
   <td style="text-align:right;"> -152.83707 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Arizona </td>
   <td style="text-align:left;"> State </td>
   <td style="text-align:left;"> US-AZ </td>
   <td style="text-align:left;"> AZ </td>
   <td style="text-align:left;"> 04 </td>
   <td style="text-align:left;"> AZ </td>
   <td style="text-align:left;"> AZ </td>
   <td style="text-align:left;"> 01779777 </td>
   <td style="text-align:right;"> 113990 </td>
   <td style="text-align:right;"> 34.20996 </td>
   <td style="text-align:right;"> -111.60240 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Arkansas </td>
   <td style="text-align:left;"> State </td>
   <td style="text-align:left;"> US-AR </td>
   <td style="text-align:left;"> AR </td>
   <td style="text-align:left;"> 05 </td>
   <td style="text-align:left;"> AR </td>
   <td style="text-align:left;"> AR </td>
   <td style="text-align:left;"> 00068085 </td>
   <td style="text-align:right;"> 53179 </td>
   <td style="text-align:right;"> 34.89553 </td>
   <td style="text-align:right;"> -92.44463 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> California </td>
   <td style="text-align:left;"> State </td>
   <td style="text-align:left;"> US-CA </td>
   <td style="text-align:left;"> CA </td>
   <td style="text-align:left;"> 06 </td>
   <td style="text-align:left;"> CA </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:left;"> 01779778 </td>
   <td style="text-align:right;"> 163695 </td>
   <td style="text-align:right;"> 37.14857 </td>
   <td style="text-align:right;"> -119.54065 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Colorado </td>
   <td style="text-align:left;"> State </td>
   <td style="text-align:left;"> US-CO </td>
   <td style="text-align:left;"> CO </td>
   <td style="text-align:left;"> 08 </td>
   <td style="text-align:left;"> CO </td>
   <td style="text-align:left;"> CL </td>
   <td style="text-align:left;"> 01779779 </td>
   <td style="text-align:right;"> 104094 </td>
   <td style="text-align:right;"> 38.99358 </td>
   <td style="text-align:right;"> -105.50777 </td>
  </tr>
</tbody>
</table>

You get various geo-IDs for each state including FIPS/GNISID/USPS/USCG as well as land and water areas and coordinates for an internal point in the state.

In addition to the state level data, the `gazetteer.20*` lists each contain data.frames for gazetteer data for each type of geographic entity. Each element of the list is assigned a name that indicates the data that element holds. The suffix of the list name is indicative of the year for which the data was relased. e.g. gazetteer.2015 contains data valid from 2015.

e.g. The names of data stored in the `gazetteer.2015` list is shown below.

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> Data.Name </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 114th Congressional Districts </td>
  </tr>
  <tr>
   <td style="text-align:left;"> American Indian Areas - Legal American Indian Reservations and Off-Reservation Trust Lands </td>
  </tr>
  <tr>
   <td style="text-align:left;"> American Indian Areas - Legal  American Indian Areas Excluding Off-Reservation Trust Lands and Hawaiian Home Land Records </td>
  </tr>
  <tr>
   <td style="text-align:left;"> American Indian Areas - Legal and Statistical American Indian Areas </td>
  </tr>
  <tr>
   <td style="text-align:left;"> American Indian Areas - Legal American Indian Areas Off-Reservation Trust Lands and Hawaiian Home Lands </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Census Tracts </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Core Based Statistical Areas </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Counties </td>
  </tr>
  <tr>
   <td style="text-align:left;"> County Subdivisions </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Places </td>
  </tr>
  <tr>
   <td style="text-align:left;"> School Districts - Elementary </td>
  </tr>
  <tr>
   <td style="text-align:left;"> School Districts - Secondary </td>
  </tr>
  <tr>
   <td style="text-align:left;"> School Districts - Unified </td>
  </tr>
  <tr>
   <td style="text-align:left;"> State Legislative Districts - Lower Chamber </td>
  </tr>
  <tr>
   <td style="text-align:left;"> State Legislative Districts - Upper Chamber </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Urban Areas </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ZIP Code Tabulation Areas </td>
  </tr>
</tbody>
</table>

You can retrieve the names of any list using the standard `names(<list>)` call. e.g. `names(gazetteer.2014)`

To retrieve information from any particular gazetteer simply reference it from the list by its name.


```r
counties.2015 <- gazetteer.2015$Counties
knitr::kable(head(counties.2015[,c(1:4,9:12)]),  format = 'html')
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> USPS </th>
   <th style="text-align:left;"> GEOID </th>
   <th style="text-align:left;"> ANSICODE </th>
   <th style="text-align:left;"> NAME </th>
   <th style="text-align:right;"> INTPTLAT </th>
   <th style="text-align:right;"> INTPTLONG </th>
   <th style="text-align:right;"> ATOTAL </th>
   <th style="text-align:right;"> ATOTAL_SQMI </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> AL </td>
   <td style="text-align:left;"> 01001 </td>
   <td style="text-align:left;"> 00161526 </td>
   <td style="text-align:left;"> Autauga County </td>
   <td style="text-align:right;"> 32.53224 </td>
   <td style="text-align:right;"> -86.64644 </td>
   <td style="text-align:right;"> 1565358960 </td>
   <td style="text-align:right;"> 604.389 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AL </td>
   <td style="text-align:left;"> 01003 </td>
   <td style="text-align:left;"> 00161527 </td>
   <td style="text-align:left;"> Baldwin County </td>
   <td style="text-align:right;"> 30.65922 </td>
   <td style="text-align:right;"> -87.74607 </td>
   <td style="text-align:right;"> 5250713237 </td>
   <td style="text-align:right;"> 2027.312 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AL </td>
   <td style="text-align:left;"> 01005 </td>
   <td style="text-align:left;"> 00161528 </td>
   <td style="text-align:left;"> Barbour County </td>
   <td style="text-align:right;"> 31.87025 </td>
   <td style="text-align:right;"> -85.40510 </td>
   <td style="text-align:right;"> 2342685383 </td>
   <td style="text-align:right;"> 904.516 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AL </td>
   <td style="text-align:left;"> 01007 </td>
   <td style="text-align:left;"> 00161529 </td>
   <td style="text-align:left;"> Bibb County </td>
   <td style="text-align:right;"> 33.01589 </td>
   <td style="text-align:right;"> -87.12715 </td>
   <td style="text-align:right;"> 1621769533 </td>
   <td style="text-align:right;"> 626.169 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AL </td>
   <td style="text-align:left;"> 01009 </td>
   <td style="text-align:left;"> 00161530 </td>
   <td style="text-align:left;"> Blount County </td>
   <td style="text-align:right;"> 33.97736 </td>
   <td style="text-align:right;"> -86.56644 </td>
   <td style="text-align:right;"> 1685119333 </td>
   <td style="text-align:right;"> 650.628 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AL </td>
   <td style="text-align:left;"> 01011 </td>
   <td style="text-align:left;"> 00161531 </td>
   <td style="text-align:left;"> Bullock County </td>
   <td style="text-align:right;"> 32.10176 </td>
   <td style="text-align:right;"> -85.71726 </td>
   <td style="text-align:right;"> 1619114158 </td>
   <td style="text-align:right;"> 625.144 </td>
  </tr>
</tbody>
</table>

### Using the Gazetteer Data

While the data on its own is not very useful, it is very much useful when working with geo-spatial data obtained from other sources. It allows you to map names of geographic entities (states,counties, congressional districts etc.) to their corresponding geoids. It also gives you some useful data like land/water/total area of each entity as well as latitude/longitude values of an internal point in that said entity. These can be used to normalize geo-data by area (using the land/water/total area) or place labels/markers on geographic entities when mapping them.

Lastly this is perhaps the authoritative source of data of this kind. So while there are other packages that offer similar data, none offer so much comprehensive data in one place. This package along with the `acs` package, which allows you to query dynamic census data, and the `tigris` package which allows you to pull census shapefiles, provide comprehensive resources for any need you may have when it comes to obtaining/analyzing/plotting data from the U.S. Census Bureau. 

