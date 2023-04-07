crop_full <- readRDS("data_raw/crop_production_all_data.rds")

crop_full_clean <- crop_full[ , c(3, 6, 8, 10, 11, 12)]

rice_all <- subset(crop_full_clean, item == "Rice")


read.csv("data_raw/FAOSTAT_data_3-21-2023.csv") -> country_group

region_name <- unique(country_group$Country.Group)

country_name <- unique(rice_all$area)

country_1 <- country_name[!(country_name %in% region_name)]

rice_country <- rice_all[rice_all$area %in% country_1, ]

library(dplyr)

rice_country <- rice_country %>% dplyr::arrange(area, 
                                                desc(year),
                                                desc(element),
                                                desc(value)
)


summary(rice_country)

#################

options("max.print" = 50000)

### check data bằng lệnh table()

## 1 tham số

table(rice_country$area)

dim(rice_country)

class(table(rice_country$area))

df_1 <- data.frame(table(rice_country$area))

## 2 tham số

table(rice_country$area, rice_country$element)

df_2 <- data.frame(table(rice_country$area, rice_country$element))

df_2

## 3 tham số

table(rice_country$area, 
      rice_country$year, 
      rice_country$element)

dim(table(rice_country$area, 
          rice_country$year, 
          rice_country$element))

class(table(rice_country$area, 
            rice_country$year, 
            rice_country$element))
mode(table(rice_country$area, 
           rice_country$year, 
           rice_country$element))

storage.mode(table(rice_country$area, 
                   rice_country$year, 
                   rice_country$element))

attributes(table(rice_country$area, 
                 rice_country$year, 
                 rice_country$element))

df_3 <- data.frame(table(rice_country$area, rice_country$year, rice_country$element))

df_3

## check area và year
table(rice_country$area, rice_country$year)

df_4 <- data.frame(table(rice_country$area, rice_country$year))

df_4

## lệnh aggregate

aggregate(rice_country$value, 
          list(rice_country$area,
               rice_country$element), 
          FUN = sum, na.rm = TRUE)

aggregate(rice_country$value, 
          list(rice_country$area,
               rice_country$element), 
          FUN = length)

aggregate(rice_country$value, 
          list(rice_country$area,
               rice_country$element), 
          FUN = mean, na.rm = TRUE)





class(aggregate(rice_country$value, list(rice_country$area, rice_country$element), 
                FUN = sum, na.rm = TRUE))

df_5 <- data.frame(aggregate(rice_country$value, list(rice_country$area, rice_country$element), 
                             FUN = sum, na.rm = TRUE))

identical(df_5, 
          aggregate(rice_country$value, list(rice_country$area, rice_country$element), 
                    FUN = sum, na.rm = TRUE))


# nếu đổi vị trí

aggregate(rice_country$value, 
          list(rice_country$area), 
          FUN = sum, na.rm = TRUE)

## 3 tham số
aggregate(rice_country$value, 
          list(rice_country$area,
               rice_country$element,
               rice_country$year), 
          FUN = sum, na.rm = TRUE)

## lệnh tapply

df_aggregate <- aggregate(rice_country$value, 
          list(rice_country$area,
               rice_country$element), 
          FUN = sum, na.rm = TRUE)

df_tapply <- tapply(rice_country$value, 
       list(rice_country$area,
            rice_country$element), 
       FUN = sum, na.rm = TRUE)

class(df_aggregate)

class(df_tapply)

df_tapply <- as.data.frame(df_tapply)
df_tapply$area <- row.names(df_tapply)
df_tapply <- df_tapply[, c(4, 1:3)]
row.names(df_tapply) <- NULL
df_tapply

df_aggregate <- reshape(data = df_aggregate,
                        idvar = "Group.1",
                        v.names = "x",
                        timevar = "Group.2",
                        direction = "wide")

head(df_aggregate) 
     
head(df_tapply)

names(df_aggregate) <- names(df_tapply)

identical(df_tapply, df_aggregate)

attributes(df_aggregate)

attributes(df_aggregate)$reshapeWide <- NULL

attributes(df_tapply)

#####################

tapply(rice_country$value,
       rice_country$area,
       sum, na.rm = TRUE)

ok <- tapply(rice_country$value,
             rice_country$area,
             sum, na.rm = TRUE)

ok <- data.frame(ok)

ok |> dplyr::arrange(ok)













