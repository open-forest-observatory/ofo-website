library(tidyverse)
library(DT)
library(here)


d = read_csv("static/map-database/dataset-list.csv")

d$`View and download data` = "<a href='http://www.openforestobservatory.org/dataset-details/'>Go</a>"
d$`Dataset name` = "Sample A"

d = d %>%
  select(-`Ground sampling distance (cm)`, -`DEM resolution (cm)`, -`Orthomosaic resolution (cm)`)

a = datatable(d, escape = FALSE, options = list(
                                                columnDefs = list(list(className = 'dt-center', targets = "_all")))
)

saveWidget(a, "static/map-database/dataset-list.html")
