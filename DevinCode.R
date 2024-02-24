library(tidyverse) # General stuff
library(sf) # For reading map based data
library(mapview) # for viewing map based data
library(readr) # for reading files

# Getting data into R
YelpData <- read_csv("Yelp Academic Dataset - Select CA Cities & Businesses.csv")
View(Yelp_Academic_Dataset_Select_CA_Cities_Businesses)

LatLong <- YelpData |> select(Name,Latitude,Longitude,Stars)


# This code should work, converts to sf data and views
sf_LatLong <- st_as_sf(LatLong, coords = c("Longitude", "Latitude"),  crs = 4326)
mapview(sf_LatLong, map.types = "CartoDB.DarkMatter") 
