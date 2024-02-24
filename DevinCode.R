library(tidyverse) # General stuff
library(sf) # For reading map based data
library(mapview) # for viewing map based data
library(readr) # for reading files

# Getting data into R
YelpData <- read_csv("Yelp Academic Dataset - Select CA Cities & Businesses.csv")
View(Yelp_Academic_Dataset_Select_CA_Cities_Businesses)

LatLong <- YelpData |> select(Name, Latitude, Longitude, Stars, Categories) |> 
  filter(Latitude < 35, Longitude < -119)


# This code should work, converts to sf data and views
sf_LatLong <- st_as_sf(LatLong, coords = c("Longitude", "Latitude"),  crs = 4326)

mapview(sf_LatLong, map.types = "CartoDB.DarkMatter", zcol="Stars") 

##
## New Section
##  Working on hotels

Hotels <- read.csv("Hotels.csv")

Hotels |> 
ggplot(aes(Stars, Review.Count)) + 
  geom_col()

Hotels |> drop_na(Noise.Level) |> 
  ggplot(aes(Noise.Level, Weighted.Star)) + 
  geom_col()

sf_Hotels <- st_as_sf(Hotels, coords = c("Long", "Lat"),  crs = 4326)
mapview(sf_Hotels, map.types = "CartoDB.DarkMatter", zcol="Stars") 



