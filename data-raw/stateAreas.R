library(magrittr)
# also uses memoise, rvest, dplyr

fetch_html <- memoise::memoise(xml2::read_html)

# Wikipidia was the best source I could find
state.abbr.url <-
    'https://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations'

state.abbr.xpath <- '//*[@id="mw-content-text"]/table[1]'

state.abbr.df <- fetch_html(state.abbr.url) %>%
    rvest::html_node(xpath=state.abbr.xpath) %>%
    rvest::html_table(header = F, trim=T)

state.abbr.df <- state.abbr.df[,1:7] %>% dplyr::slice(4:n()) %>%
    dplyr::mutate_if(is.character, function(x)  gsub('^\\s*','',x))

colnames(state.abbr.df) <- c('State', 'Type', 'ISO3166',
                             'ANSI', 'FIPS', 'USPS', 'USCG')

# Blanks to NAs
state.abbr.df[state.abbr.df==''] <- NA
#state.abbr.df <- state.abbr.df[complete.cases(state.abbr.df),]

fips.gnis.codes.url <- 'http://www2.census.gov/geo/docs/reference/state.txt'

fips.gnis.codes <- readr::read_delim(fips.gnis.codes.url,delim='|') %>%
    dplyr::select(STATE, STATENS) %>% dplyr::rename(FIPS=STATE, GNISID=STATENS)

state.abbr.df %<>% dplyr::left_join(fips.gnis.codes, by=c('FIPS'='FIPS'))


# From U.S. Census Bureau
state.area.url <- 'https://www.census.gov/geo/reference/state-area.html'

state.area.xpath <- '//*[@id="middle-column"]/div/table'

state.area.df <- fetch_html(state.area.url) %>%
    rvest::html_node(xpath=state.area.xpath) %>%
    rvest::html_table(header = F, trim=T, fill=T)

state.area.df  %<>% dplyr::slice(7:n())

colnames(state.area.df) <- c('State',
                             'Total.Area.sqm', 'Total.Area.km2',
                             'Total.LandArea.sqm', 'Total.LandArea.km2',
                             'Total.WaterArea.sqm', 'Total.WaterArea.km2',
                             'Inland.WaterArea.sqm', 'Inland.WaterArea.km2',
                             'Costal.WaterArea.sqm', 'Costal.WaterArea.km2',
                             'GreatLakes.WaterArea.sqm', 'GreatLakes.WaterArea.km2',
                             'Territorial.WaterArea.sqm', 'Territorial.WaterArea.km2',
                             'IntPoint.Lat', 'IntPoint.Long'
)

state.area.df[state.area.df=='—'] <- NA

state.area.df %<>%
    dplyr::mutate(IntPoint.Lat = as.numeric(IntPoint.Lat),
                 IntPoint.Long = as.numeric(IntPoint.Long)) %>%
    dplyr::mutate_if(is.character,
                    function(x)  gsub('^\\s*','', x)) %>%
    dplyr::mutate_if(seq_along(names(state.area.df)) %in% 2:15,
                    function(x) as.numeric(gsub(',', '', gsub('\\[.*::', '', x))))

state.areas.2010 <- dplyr::left_join(state.abbr.df, state.area.df,
                                 by=c('State'='State'))

rm(fetch_html, state.abbr.df, state.abbr.url, state.abbr.xpath,
   state.area.df, state.area.url, state.area.xpath, fips.gnis.codes, fips.gnis.codes.url)

devtools::use_data(state.areas.2010, overwrite = TRUE)
