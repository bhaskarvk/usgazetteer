library(magrittr)
# also uses memoise, purrr, readr, rvest


# Census Gazetteer Files are available for these years
years <- as.character(c(2010,2012:2016))

fetch_html <- memoise::memoise(xml2::read_html)

links <- paste0('http://www.census.gov/geo/maps-data/data/gazetteer',years,'.html')

# Get links to the zip files for each year
htmls <- purrr::map(links, fetch_html)
names(htmls) <- years

# Construct a List of data.frames of the files we want to read
zipLists <- purrr::map(years, function(year) {
    html <- htmls[[year]]
    table.names <- html %>% rvest::html_nodes('div.accordion h3') %>%
        rvest::html_text(trim=TRUE)
    table.links <- html %>% rvest::html_nodes('a[href$=zip]') %>%
        rvest::html_attr('href')
    local.files <- paste0('data-raw/',year,'/',gsub('^.*/','',table.links))
    data.frame(
        table.name = table.names,
        table.link = table.links,
        local.file = local.files,
        stringsAsFactors = F
    )
})
names(zipLists) <- years

# Download files if not already downloaded.
purrr::walk(years, function(year) {
    dir <- paste0('data-raw/',year)
    if(!dir.exists(dir)) {dir.create(dir)}
    df <- zipLists[[year]]
    purrr::walk2(df$local.file, df$table.link, function(local.file, link){
        if(!file.exists(local.file)) {
            download.file(link, destfile = local.file, quiet = T)
        }
    })
})

# Read each file into a data.frame
dfs <- purrr::map(zipLists, function(df) {
    purrr::map(df$local.file, function(f) {
        readr::read_tsv(f,
                        col_types = readr::cols(
                            ALAND = readr::col_number(),
                            AWATER = readr::col_number(),
                            ALAND_SQMI = readr::col_number(),
                            AWATER_SQMI = readr::col_number(),
                            INTPTLAT = readr::col_double(),
                            INTPTLONG = readr::col_double(),
                            .default = readr::col_character()
                        )) %>%
            dplyr::mutate(ATOTAL = ALAND+AWATER,
                          ATOTAL_SQMI = ALAND_SQMI + AWATER_SQMI)
    })
})
names(dfs) <- years

# Give each data.fram an appropriate label
purrr::walk(years, function(year) {
    names(dfs[[year]]) <<- zipLists[[year]]$table.name
})

gazetteer.2010 <- dfs[['2010']]
gazetteer.2012 <- dfs[['2012']]
gazetteer.2013 <- dfs[['2013']]
gazetteer.2014 <- dfs[['2014']]
gazetteer.2015 <- dfs[['2015']]
gazetteer.2016 <- dfs[['2016']]

rm(dfs,fetch_html,htmls,links,years,zipLists)

devtools::use_data(gazetteer.2010, gazetteer.2012, gazetteer.2013,
                   gazetteer.2014, gazetteer.2015, gazetteer.2016,
                   overwrite = TRUE)
