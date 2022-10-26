library(sf)
# change this to your file path!!!
shape <- st_read("D:/MSc/Term1/GIS/practice/practice1/statistical-gis-boundaries-london/statistical-gis-boundaries-london/ESRI/London_Borough_Excluding_MHW.shp")
summary(shape)
plot(shape)
shape %>%
  st_geometry()%>%
  plot()
library(tidyverse)
#this needs to be your file path again
mycsv <- read_csv("D:/MSc/Term1/GIS/practice/practice1/table1.csv")
shape <- shape%>%
  merge(.,
        mycsv,
        by.x="GSS_CODE", 
        by.y="code")
shape%>%
  head(., n=10)
library(tmap)
tmap_mode("plot")
# change the fill to your column name if different
shape %>%
  qtm(.,fill = "2011-12")



