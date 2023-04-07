install.packages("FAOSTAT")
library(FAOSTAT)
data_folder <- "data_raw"
dir.create(data_folder)

# fao_metadata <- FAOsearch()
# 
# fao_metadata
# 
# class(fao_metadata)
# dim(fao_metadata)
# str(fao_metadata)
# View(fao_metadata)
# 
# library(kableExtra)
# 
# fao_metadata %>%
#     kbl() %>%
#     kable_styling(bootstrap_options = c("striped", "hover", "condensed", "bordered", "responsive"))
# 
# FAOsearch(dataset = "crop", full = FALSE)
# 
# FAOsearch(dataset = "land", full = TRUE)
# 
# FAOsearch(dataset = "crop", full = FALSE)

##############

# crop_production <- FAOSTAT::get_faostat_bulk(code = "QCL", data_folder = data_folder)

class(crop_production)

# https://stackoverflow.com/questions/21370132/what-are-the-main-differences-between-r-data-files

save(crop_production, file = "data_raw/crop_production_all_data.RData")

saveRDS(crop_production, file = "data_raw/crop_production_all_data.rds")

# crop_full <- readRDS("data_raw/crop_production_all_data.rds")

# crop_full_1 <- load(file = "data_raw/crop_production_all_data.RData")

identical(crop_full, crop_full_1)

identical(crop_full, crop_production)

# crop_full_1

write.csv(crop_production, file = "data_raw/crop_production_all_data.csv")

#################

crop_full_clean <- crop_full[ , c(3, 6, 8, 10, 11, 12)]

# crop_full_clean_1 <- crop_full[ , c("area", "item", "element", "year", "unit", "value")]  

head(crop_full_clean, n = 30)

View(crop_full_clean)

sapply(crop_full_clean, class)

str(crop_full_clean)

summary(crop_full_clean)

rm(crop_full, crop_full_clean_1)

any(is.na(crop_full_clean))

x <- c(1:20, NA)
x
is.na(x)
any(is.na(x))

y <- 1:10
y
is.na(y)
any(is.na(y))

table(crop_full_clean$item)

sum(table(crop_full_clean$item))

unique(crop_full_clean$item)

rice_all <- subset(crop_full_clean, item == "rice")

rice_all <- subset(crop_full_clean, item == "Rice")

dim(rice_all)

table(crop_full_clean$item)[names(table(crop_full_clean$item)) == "Rice"]

names(unclass(table(crop_full_clean$item)))

which(names(unclass(table(crop_full_clean$item))) == "Rice")
unclass(table(crop_full_clean$item))[241]

grep(pattern = "rice", names(unclass(table(crop_full_clean$item))))

grep("(R(ICE|ice)|rice)", names(unclass(table(crop_full_clean$item))))

###################################

crop_full <- readRDS("data_raw/crop_production_all_data.rds")

crop_full_clean <- crop_full[ , c(3, 6, 8, 10, 11, 12)]

rice_all <- subset(crop_full_clean, item == "Rice")


##########

# BƯỚC 2: TÁCH QUỐC GIA RA

names(rice_all)
head(rice_all)

table(rice_all$area)

world <- subset(rice_all, area == "World")

table(rice_all$element)

table(rice_all$year)

table(rice_all$unit)


rice_1 <- subset(rice_all, area != "World")

table(rice_1 $area)

read.csv("data_raw/FAOSTAT_data_3-21-2023.csv") -> country_group

View(country_group)

region_name <- unique(country_group$Country.Group)

country_name <- unique(rice_all$area)

region_name %in% country_name

country_name %in% region_name


country_1 <- country_name[!(country_name %in% region_name)] 



# View(rice_country)
# 
# table(rice_country$area)
# 
# View(rice_all)
# 
# 
# options("max.print" = 50000)

#####################

rice_country <- rice_all[rice_all$area %in% country_1, ]

# danh sách quốc gia sản xuất gạo
rice_country
head(rice_country, n = 30)

library(dplyr)

rice_country <- rice_country %>% dplyr::arrange(area, 
                                                desc(year),
                                                desc(element),
                                                desc(value)
                                                )

head(rice_country, n = 100)

#############

#  cleaning tập 2









##########
rice_full <- reshape(data = rice_country,
                     idvar = c("year", "area"),
                     v.names = "value",
                     timevar = "element",
                     direction = "wide")


table(rice_country$unit)


rice_full <- reshape(data = rice_country[, c(-5)],
                     idvar = c("year", "area"),
                     v.names = "value",
                     timevar = "element",
                     direction = "wide")


rice_full[rice_full$value.production == 0, ]




































