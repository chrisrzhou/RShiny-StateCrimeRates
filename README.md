# State Crime Rates Explorer

------

## About
The [Uniform Crime Reporting (UCR)](http://www.fbi.gov/about-us/cjis/ucr/) is an online resource for crime statistics produced by the Federal Bureau Investigation (FBI).

This is a R Shiny data visualization project based on the information made available by the FBI.  You can preview the app at this [AWS EC2 instance](http://ec2-54-183-164-175.us-west-1.compute.amazonaws.com:3838/StateCrimeRates/).

The data is obtained through this [link](http://www.ucrdatatool.gov/Search/Crime/State/StatebyState.cfm).  Since the information is not readily scrapable and requires a form submission, I have saved a sample of the raw malformed csv file together with this project.  Part of this project is parsing a malformed csv file utilizing the awesome `dplyr` package.  For more information on this data collection and cleaning implementation, please refer to the `parser.R` file for more details.

Throughout the application, the user is empowered with selection widgets to zoom in on data exploration of the dataset.  This site is designed with analysts in mind, and provides a layer of visualization that is otherwise masked behind tabular display of datasets in the original website.  Some examples of data insights with this application:
    
- Compare the crime rates over the years of each states.
- Compare the various kinds of crime rates of a given state over the years.
- Identify if certain kinds of crime rates are tied to big economic events e.g. the Great Recession of 2007-2009.
- Quantify the correlation values of various kinds of crime rates within a given period of time.
- And many more that you can analyze!

------

## Visualizations:
- **Heatmaps:** Series of heatmaps visualizing crime rates in states. Major recession periods are highlighted in gold.
- **Correlations:** Correlation matrix of various types of crimes. Use the widgets to filter a data subset.
- **Data:** Tabular searchable data display similar to that found in the [original source](http://www.ucrdatatool.gov/Search/Crime/State/StatebyState.cfm).  A convenient download of the malformed csv is found [here](data.csv).  The webform used to generate the malformed csv from the link above requires selections of:
    - (a) All 50 states (exlcluding "District of Columbia").
    - (b) "Violent crime rates" and "Property crime rates".
    - (c) All years.

------

## Other notes:
- Use the selection widgets to help highlight specific data subsets of interest, and to view a different visualization based on the selected metric report.

- Download the "cleaned" and filtered dataset from the `Data` section using the download button found next to the `Data` section header.

- This project is done with `ggplot`.  This is a rich library for data visualization and works tremendously well with organized data living in dataframes.  Another project that explores the concepts of using a more interactive approach of data visualization with `ggvis` can be found here if you are interested: [PowerToChoose](http://ec2-54-183-164-175.us-west-1.compute.amazonaws.com:3838/PowerToChoose/).

- This project/application is not affiliated with the FBI.  The work is intended as a showcase of R Shiny data visualization capabilities.  All information courtesy of FBI/UCR. Used with permission.

------

## Resources
- [Homepage](https://chrisrzhou.github.io/)
- [R Shiny Projects](http://ec2-54-183-164-175.us-west-1.compute.amazonaws.com:3838/)
- [Github Project](https://github.com/chrisrzhou/RShiny-StateCrimeRates)
- [Uniform Crime Reporting (UCR)](http://www.ucrdatatool.gov/Search/Crime/State/StatebyState.cfm)
- [dplyr](http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html)
