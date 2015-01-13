shinyUI(fluidPage(
    tags$head(tags$link(rel="stylesheet", type="text/css", href="app.css")),
    
    titlePanel("State Crime Rates"),
    
    sidebarLayout(
        sidebarPanel(
            p(class="text-small",
              a(href="https://chrisrzhou.github.io/", target="_blank", "by chrisrzhou"),
              a(href="https://github.com/chrisrzhou/RShiny-StateCrimeRates", target="_blank", icon("github")), " | ",
              a(href="http://bl.ocks.org/chrisrzhou", target="_blank", icon("th")), " | ",
              a(href="https://www.linkedin.com/in/chrisrzhou", target="_blank", icon("linkedin"))),
            hr(),
            p(class="text-small", "State Crime Rates Visualizations.  All data is derived from the FBI's : ",
              a(href="http://www.fbi.gov/about-us/cjis/ucr/", target="_blank", "Uniform Crime Reports (UCR)"),
              " website.  Rates are measured in per 100,000 population."),
            hr(),
            
            width=3
        ),
        
        mainPanel(
            tabsetPanel(id="tabset",
                        tabPanel("Heatmaps",
                                 h2("Heatmaps"),
                                 p(class="text-small", "Series of heatmaps visualizing crime rates in states.  
                                   Major recession periods are highlighted in gold."),
                                 hr(),
                                 div(class="tab-section",
                                     h3("State-Time Heatmap"),
                                     p(class="text-small", "This section visualizes heatmap of crime rates of states over the years."),
                                     div(class="span4",
                                         selectInput(inputId="state_time_crimes", label="Crimes", choices=choices$crimes, selected=choices$crimes[[1]])
                                     ),
                                     div(class="span4",
                                         sliderInput(inputId="state_time_years_min", label="Years", min=min(choices$years), max=max(choices$years), value=min(choices$years), step=1, format="####"),
                                         sliderInput(inputId="state_time_years_max", label="", min=min(choices$years), max=max(choices$years), value=max(choices$years), step=1, format="####")
                                     ),
                                     plotOutput("state_time_heatmap", height=400, width="auto"),
                                     hr()
                                 ),
                                 
                                 div(class="tab-section",
                                     h3("Crime-Time Heatmap"),
                                     p(class="text-small", "This section visualizes heatmap of crime rates over time of a selected state."),
                                     div(class="span4",
                                         selectInput(inputId="state_crime_states", label="Year", choices=choices$states, selected=choices$states[[5]])
                                     ),
                                     div(class="span4",
                                         checkboxInput(inputId="show_labels", label="Show Labels", value=FALSE)
                                     ),
                                     plotOutput("state_crime_heatmap", height=400, width="auto"),
                                     hr()
                                 )
                                 
                        ),
                        
                        tabPanel("Correlations",
                                 h2("Correlations"),
                                 p(class="text-small", "Correlation matrix of various types of crimes.  Use the widgets to filter a data subset."),
                                 p(class="text-small", "The number of years in the dataset provides a sample size for calculating correlation of crime rates."),
                                 hr(),
                                 div(class="tab-section",
                                     div(class="span4",
                                         selectInput(inputId="correlation_states", label="States", choices=choices$states, selected=choices$states[[5]])
                                     ),
                                     div(class="span4",
                                         sliderInput(inputId="correlation_years_min", label="Years", min=min(choices$years), max=max(choices$years), value=min(choices$years), step=1, format="####"),
                                         sliderInput(inputId="correlation_years_max", label="", min=min(choices$years), max=max(choices$years), value=max(choices$years), step=1, format="####")
                                     ),
                                     plotOutput("crime_correlations", height=500, width="auto"),
                                     hr()
                                 )
                        ),
                        
                        tabPanel("Data",
                                 h2("Data", downloadButton("crimes_download", label="")),
                                 p(class="text-small", "Tabular searchable data display similar to that found in the ",
                                   a(href="http://www.ucrdatatool.gov/Search/Crime/State/StatebyState.cfm", target="_blank", "original source")),
                                 p(class="text-small", "A convenient download sample of the data is provided ",
                                   a(href="data.csv", target="_blank", "here.")),
                                 p(class="text-small", "You can download the data with the download button above."),
                                 dataTableOutput("crimes_datatable"),
                                 hr()
                        )
            ),
            width=9
        )
    )
))