library(dplyr)
library(reshape2)

# =========================================================================
# function get_crime_data
#
# @description: get data from FBI url: http://www.ucrdatatool.gov/Search/Crime/State/StatebyState.cfm
#               CSV data can be obtained by querying:
#                   - for 50 states (except District of Columbia)
#                   - "Violent crime rates" and "property crime rates"
#               The saved CSV is conveniently provided in this project as "data.csv"
# @return: reshaped dataframe of crime statistics by state, year and crime
# =========================================================================

get_crime_data <- function() {
    states <- c("Alabama",
                "Alaska",
                "Arizona",
                "Arkansas",
                "California",
                "Colorado",
                "Connecticut",
                "Delaware",
                "Florida",
                "Georgia",
                "Hawaii",
                "Idaho",
                "Illinois",
                "Indiana",
                "Iowa",
                "Kansas",
                "Kentucky",
                "Louisiana",
                "Maine",
                "Maryland",
                "Massachusetts",
                "Michigan",
                "Minnesota",
                "Mississippi",
                "Missouri",
                "Montana",
                "Nebraska",
                "Nevada",
                "New Hampshire",
                "New Jersey",
                "New Mexico",
                "New York",
                "North Carolina",
                "North Dakota",
                "Ohio",
                "Oklahoma",
                "Oregon",
                "Pennsylvania",
                "Rhode Island",
                "South Carolina",
                "South Dakota",
                "Tennessee",
                "Texas",
                "Utah",
                "Vermont",
                "Virginia",
                "Washington",
                "West Virginia",
                "Wisconsin",
                "Wyoming")
    
    # load data from csv
    file <- "data.csv"
    df <- read.csv(file=file, header=FALSE, stringsAsFactors=FALSE, na.strings=c("", ".", "NA"))
    
    # clean malformed csv data
    colnames(df) <- df[4, ]  # column header is in row 4
    df <- df[, colSums(is.na(df)) < nrow(df)]  # remove columns containing all NAs in malformed csv
    df <- df %>% 
        rename(year = Year) %>%
        mutate(year = as.integer(year)) %>%
        na.omit() %>%  # removes header rows (years not coerced to integer)
        filter(year >= 1965)  # manual observation: csv data is incomplete for years < 1965
    years <- unique(df$year)  # get number of years to add states column
    
    # reshape df from wide to long
    df <- df %>%
        mutate(state = rep(states, each=length(years)))  # add states column
    df <- melt(df, id=c("year", "state")) %>%  # melt from wide to long
        rename(crime = variable) %>%
        mutate(crime = as.character(crime),
               value = as.numeric(value)) %>%
        filter(crime != "Population") %>%
        arrange(-year, crime, state)
    return(df)
}