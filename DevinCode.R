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
  geom_col(fill = "#ffc39a") +
  theme(panel.background = element_rect(fill = "#265a56"),
        panel.grid.major = element_line(color = "black"),
        panel.grid.minor = element_line(color = "black"),
        plot.background = element_rect(fill = "black"),
        axis.text = element_text(color = "white"),
        axis.title = element_text(color = "white"),
        title = element_text(color = "white")) +
  labs(
    y = 'Review Count',
    title = "Average Stars for Hotels"
  )

OriginalData |> 
  ggplot(aes(Stars, Review.Count)) + 
  geom_col(fill = "#ffc39a") +
  theme(panel.background = element_rect(fill = "#265a56"),
        panel.grid.major = element_line(color = "black"),
        panel.grid.minor = element_line(color = "black"),
        plot.background = element_rect(fill = "black"),
        axis.text = element_text(color = "white"),
        axis.title = element_text(color = "white"),
        title = element_text(color = "white")) +
  labs(
    y = 'Review Count',
    title = "Average Stars for All Data"
  ) 

Hotels |> drop_na(Noise.Level) |> 
  ggplot(aes(Noise.Level, Weighted.Star)) + 
  theme(panel.background = element_rect(fill = "#265a56"),
        panel.grid.major = element_line(color = "black"),
        panel.grid.minor = element_line(color = "black"),
        plot.background = element_rect(fill = "black"),
        axis.text = element_text(color = "white")) +
  geom_col(fill = "#ffc39a") 

sf_Hotels <- st_as_sf(Hotels, coords = c("Long", "Lat"),  crs = 4326)
mapview(sf_Hotels, map.types = "CartoDB.DarkMatter", zcol="Stars") 

Hotels |> drop_na(Dogs.Allowed) |> 
  ggplot(aes(Dogs.Allowed, Weighted.Star)) + 
  geom_col()

##
## Mapping Stuff with Hotels
##

OriginalData <- read.csv("Datasheet.csv")
sf_OriginalData <- st_as_sf(OriginalData, 
                            coords = c("Longitude", "Latitude"),  crs = 4326)

# Graph for the top hotel
df_DistFromHotelTop1 <- data.frame()
for (i in 1:4013) {
  if (distm(c(Hotels$Long[14],Hotels$Lat[14]), 
            c(OriginalData$Longitude[i],OriginalData$Latitude[i]),
            fun = distHaversine) <= 500) {
    df_DistFromHotelTop1 <- rbind(df_DistFromHotelTop1,OriginalData[i,])
  }
}


sf_df_DistFromHotelTop1 <- st_as_sf(df_DistFromHotelTop1, 
                                 coords = c("Longitude", "Latitude"),  crs = 4326)


df_DistFromHotelTop2 <- data.frame()
for (i in 1:4013) {
  if (distm(c(Hotels$Long[82],Hotels$Lat[82]), 
            c(OriginalData$Longitude[i],OriginalData$Latitude[i]),
            fun = distHaversine) <= 500) {
    df_DistFromHotelTop2 <- rbind(df_DistFromHotelTop2,OriginalData[i,])
  }
}

sf_df_DistFromHotelTop2 <- st_as_sf(df_DistFromHotelTop2, 
                                 coords = c("Longitude", "Latitude"),  crs = 4326)

df_DistFromHotelMid1 <- data.frame()
for (i in 1:4013) {
  if (distm(c(Hotels$Long[71],Hotels$Lat[71]), 
            c(OriginalData$Longitude[i],OriginalData$Latitude[i]),
            fun = distHaversine) <= 500) {
    df_DistFromHotelMid1 <- rbind(df_DistFromHotelMid1,OriginalData[i,])
  }
}


sf_df_DistFromHotelMid1 <- st_as_sf(df_DistFromHotelMid1, 
                                 coords = c("Longitude", "Latitude"),  crs = 4326)


df_DistFromHotelMid2 <- data.frame()
for (i in 1:4013) {
  if (distm(c(Hotels$Long[49],Hotels$Lat[49]), 
            c(OriginalData$Longitude[i],OriginalData$Latitude[i]),
            fun = distHaversine) <= 500) {
    df_DistFromHotelMid2 <- rbind(df_DistFromHotelMid2,OriginalData[i,])
  }
}


sf_df_DistFromHotelMid2 <- st_as_sf(df_DistFromHotelMid2, 
                                 coords = c("Longitude", "Latitude"),  crs = 4326)

df_DistFromHotelBot1 <- data.frame()
for (i in 1:4013) {
  if (distm(c(Hotels$Long[72],Hotels$Lat[72]), 
            c(OriginalData$Longitude[i],OriginalData$Latitude[i]),
            fun = distHaversine) <= 500) {
    df_DistFromHotelBot1 <- rbind(df_DistFromHotelBot1,OriginalData[i,])
  }
}


sf_df_DistFromHotelBot1 <- st_as_sf(df_DistFromHotelBot1, 
                                 coords = c("Longitude", "Latitude"),  crs = 4326)


df_DistFromHotelBot2 <- data.frame()
for (i in 1:4013) {
  if (distm(c(Hotels$Long[101],Hotels$Lat[101]), 
            c(OriginalData$Longitude[i],OriginalData$Latitude[i]),
            fun = distHaversine) <= 500) {
    df_DistFromHotelBot2 <- rbind(df_DistFromHotelBot2,OriginalData[i,])
  }
}

sf_df_DistFromHotelBot2 <- st_as_sf(df_DistFromHotelBot2, 
                                 coords = c("Longitude", "Latitude"),  crs = 4326)

mapview(sf_df_DistFromHotelTop1, map.types = "CartoDB.DarkMatter", 
        zcol="Stars",legend = T) +
  #mapview(sf_Hotels[1,], legend = F) +
  mapview(sf_df_DistFromHotelTop2, 
          zcol="Stars", legend = T) +
  #mapview() +
  mapview(sf_df_DistFromHotelMid1, 
          zcol="Stars", legend = T) +
  #mapview() +
  mapview(sf_df_DistFromHotelMid2, 
          zcol="Stars", legend = T) +
  #mapview() +
  mapview(sf_df_DistFromHotelBot1, 
          zcol="Stars", legend = T) +
  #mapview() +
  mapview(sf_df_DistFromHotelBot2, 
          zcol="Stars", legend = T) 
  
df_DistFromHotelBot2 <- mutate(df_DistFromHotelBot2
                  ,
                               Weighted.Stars = Stars * Review.Count)







