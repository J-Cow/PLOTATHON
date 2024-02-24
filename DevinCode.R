library(tidyverse) # General stuff
library(sf) # For reading map based data
library(mapview) # for viewing map based data
library(readr) # for reading files
library(geosphere) # For doing map distance
library(ThemePark)

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
  geom_col() +
  theme_barbie()

OriginalData |> 
  ggplot(aes(Stars, Review.Count)) + 
  geom_col() +
  theme_barbie()

Hotels |> drop_na(Noise.Level) |> 
  ggplot(aes(Noise.Level, Weighted.Star)) + 
  geom_col()

sf_Hotels <- st_as_sf(Hotels, coords = c("Long", "Lat"),  crs = 4326)
mapview(sf_Hotels, map.types = "CartoDB.DarkMatter", zcol="Stars") 

max(Hotels$Stars)


##
## Mapping Stuff with Hotels
##

OriginalData <- read.csv("Datasheet.csv")
sf_OriginalData <- st_as_sf(OriginalData, 
                            coords = c("Longitude", "Latitude"),  crs = 4326)

distm(c(Hotels$Long[1],Hotels$Lat[1]), 
      c(OriginalData$Longitude[1],OriginalData$Latitude[1]), fun = distHaversine)

df_DistFromHotel1 <- data.frame()
k <- 0

for (i in 1:4013) {
  if (distm(c(Hotels$Long[1],Hotels$Lat[1]), 
            c(OriginalData$Longitude[i],OriginalData$Latitude[i]),
            fun = distHaversine) <= 500) {
    df_DistFromHotel1 <- rbind(df_DistFromHotel1,OriginalData[i,])
    k <- k + 1
  }
}

sf_df_DistFromHotel1 <- st_as_sf(df_DistFromHotel1, 
                                 coords = c("Longitude", "Latitude"),  crs = 4326)

mapview(sf_df_DistFromHotel1, map.types = "CartoDB.DarkMatter", 
        zcol="Stars") +
  mapview(sf_Hotels[1,], map.types = "CartoDB.DarkMatter")

