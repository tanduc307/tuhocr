source(file = "extract_item_v1.R")
source(file = "extract_item_v2.R")

df_1 <- readRDS("crop_production_all_data.rds")

df_2 <- read.csv("FAOSTAT_data_3-21-2023.csv") 


coffee_data <- extract_item_v1(input_rds = df_1, 
                               input_item = "Coffee, green", 
                               input_region = df_2)

View(coffee_data)

options("max.print" = 1000000)

# library(rstudioapi)
# 
# rstudioapi::writeRStudioPreference("console_max_lines", as.integer(5000))



rstudioapi::writeRStudioPreference("toolbar_visible", FALSE)

rstudioapi::writeRStudioPreference("toolbar_visible", TRUE)


library(kableExtra)
kableExtra::kable(coffee_data, "pipe")
kableExtra::kable(coffee_data, "simple")
knitr::kable(coffee_data)
kableExtra::kbl(coffee_data)

kableExtra::kable(coffee_data, "pipe") -> yes

write.table(yes, 
            file = "yes.txt", 
            quote = FALSE, 
            row.names = FALSE)

# cat yes.txt | sed 1d > yes_1.txt


# https://thongkesinhhoc.quarto.pub/huong-dan-show-all-data-tren-console.html

#########################################################################################

######### ĐẶT TÌNH HUỐNG CHO VIỆC LOOP TRÊN FAOSTAT
# https://www.tuhocr.com/blog/huong-dan-ve-do-thi-cot-to-mau-theo-dieu-kien

source(file = "extract_item_v1.R")

df_1 <- readRDS("crop_production_all_data.rds")

df_2 <- read.csv("FAOSTAT_data_3-21-2023.csv") 


coffee_data <- extract_item_v1(input_rds = df_1, 
                               input_item = "Coffee, green", 
                               input_region = df_2)

head(coffee_data)

head(df_1)

unique(df_1$item)

almonds_data <- extract_item_v1(input_rds = df_1, 
                                input_item = "Almonds, in shell", 
                                input_region = df_2)

head(almonds_data)

almonds_data <- extract_item_v1(input_rds = df_1, 
                                input_item = "Almonds, in shell", 
                                input_region = df_2)

chickens_data <- extract_item_v1(input_rds = df_1, 
                                 input_item = "Chickens", 
                                 input_region = df_2)


df_1_clean <- df_1[ , c(3, 6, 8, 10, 11, 12)]

head(df_1_clean)

almonds_df <- df_1_clean |> subset(item == "Almonds, in shell")

head(almonds_df, n = 100)

table(almonds_df$element)

chickens_df <- df_1_clean |> subset(item == "Chickens")

head(chickens_df, n = 100)

table(chickens_df$element)

#################### CẦN TÁCH RA DANH SÁCH CÂY TRỒNG KHỎI DANH SÁCH VẬT NUÔI

# https://tuhocr.shinyapps.io/hack2/

df_1 -> crop_full

ok <- as.data.frame(table(crop_full$item, crop_full$element))
ok_1 <- ok |> subset(Freq != 0)
ok_2 <- reshape(data = ok_1,
                idvar = c("Var1"),
                v.names = "Freq",
                timevar = "Var2",
                direction = "wide")
ok_2[!is.na(ok_2$Freq.area_harvested) & !is.na(ok_2$Freq.production), ] -> ok_3
as.character(ok_3$Var1) -> crop_item

crop_item

#################### EXTRACT DỮ LIỆU TRÊN DANH SÁCH CÂY TRỒNG

apricots_data <- extract_item_v1(input_rds = df_1, 
                                 input_item = "Apricots", 
                                 input_region = df_2)

head(apricots_data, n = 30)

soya_beans_data <- extract_item_v1(input_rds = df_1, 
                                   input_item = "Soya beans", 
                                   input_region = df_2)

head(soya_beans_data, n = 30)


############## XÂY DỰNG FUNCTION ĐỂ FILTER TOPTEN COUNTRY TRONG NĂM 2021

filter_topten <- function(item_filter, 
                          data_rds, 
                          data_region, 
                          rank_filter, 
                          year_filter) {
  
  country_1 <- extract_item_v1(input_item = item_filter,
                               input_rds = data_rds,
                               input_region = data_region)
  
  country_1[country_1$area %in% unique(country_1$area)[rank_filter], ] -> country_2
  
  country_2 |> subset(year == year_filter) -> country_2_2021
  
  row.names(country_2_2021) <- NULL
  
  country_2_2021$rank <- row.names(country_2_2021) 
  
  country_2_2021[, c(7, 1:6)] -> final_filter
  
  return(final_filter)
  
}

filter_topten(item_filter = "Pineapples",
              data_rds = df_1,
              data_region = df_2,
              rank_filter = 1:10,
              year_filter = 2021)

filter_topten(item_filter = "Soya beans",
              data_rds = df_1,
              data_region = df_2,
              rank_filter = 1:10,
              year_filter = 2021)

############## XÂY DỰNG REPORT BÁO CÁO TOÀN BỘ DANH SÁCH TOPTEN QUỐC GIA 
# SẢN XUẤT NÔNG SẢN TRONG NĂM 2021

lapply(X = crop_item, FUN = filter_topten,
       data_rds = df_1,
       data_region = df_2,
       rank_filter = 1:10, 
       year_filter = 2021) -> list_all_topten 


lapply(X = crop_item[c(1:43, 45:172)], FUN = filter_topten,
       data_rds = df_1,
       data_region = df_2,
       rank_filter = 1:10, 
       year_filter = 2021) -> check_1

do.call(rbind, check_1) -> output

View(output)

##################################

filter_topten(item_filter = "Coir, raw",
              data_rds = df_1,
              data_region = df_2,
              rank_filter = 1:10,
              year_filter = 2021)


extract_item_v1(input_rds = df_1, 
                input_item = "Coir, raw",
                input_region = df_2)


##########################################

extract_item_v2 <- function(input_rds, input_item, input_region){
  
  #### BƯỚC 2: CLEAN DATA ####
  
  ## 2.1) TÁCH ITEM QUAN TÂM
  
  crop_full <- input_rds 
  
  crop_full_clean <- crop_full[ , c(3, 6, 8, 10, 11, 12)]
  
  rice_all <- subset(crop_full_clean, item == input_item)
  
  ## 2.2) TÁCH QUỐC GIA KHỎI THÔNG TIN REGION
  
  input_region -> country_group
  
  region_name <- unique(country_group$Country.Group)
  
  country_name <- unique(rice_all$area)
  
  country_1 <- country_name[!(country_name %in% region_name)]
  
  rice_country <- rice_all[rice_all$area %in% country_1, ]
  
  ## 2.3) SẮP XẾP DATA THEO TRẬT TỰ
  
  library(dplyr)
  
  rice_country <- rice_country %>% dplyr::arrange(area, 
                                                  desc(year),
                                                  desc(element),
                                                  desc(value)
  )
  
  #### BƯỚC 3: CHECK DATA AND CLEAN ####
  
  ## SỬ DỤNG LỆNH TAPPLY ĐỂ TÌM THÔNG TIN CÁC QUỐC GIA KHÔNG SẢN XUẤT GẠO
  
  check_1 <- tapply(rice_country$value, 
                    list(rice_country$area, rice_country$element), 
                    FUN = sum, na.rm = TRUE)
  
  check_2 <- as.data.frame(check_1)
  
  check_2$area <- row.names(check_2)
  
  check_2[, c("area", "production", "area_harvested")] -> check_2
  
  row.names(check_2) <- NULL
  
  check_2 |> dplyr::arrange(area_harvested, production, area) -> check_3
  
  country_check <- check_3 |> subset(area_harvested == 0 & production == 0)
  
  ## SUBSET NHỮNG QUỐC GIA CÓ SẢN XUẤT GẠO
  
  country_name_1 <- unique(rice_country$area)
  
  country_2 <- country_name_1[!(country_name_1 %in% country_check$area)]
  
  rice_country_2 <- rice_country[rice_country$area %in% country_2, ]

  #### BƯỚC 4: RESHAPE DATA ####
  
  rice_country_2 <- rice_country_2 |> subset(select = -unit)
  
  rice_ready <- reshape(data = rice_country_2,
                        idvar = c("year", "area"),
                        v.names = "value",
                        timevar = "element",
                        direction = "wide") 
  
  ## BỎ CỘT YIELD
  
  rice_ready <- rice_ready[, c("area", "item", "year", "value.area_harvested", "value.production")]
  
  ## BỎ MISSING VALUE, CHỈNH LẠI TÊN CỘT VÀ ROW.NAMES
  
   rice_ready <- na.omit(rice_ready)
   
  names(rice_ready)[names(rice_ready) == "value.production"] <- "production"
  names(rice_ready)[names(rice_ready) == "value.area_harvested"] <- "area_harvested"
  
  # names(rice_ready)[4] <- "production"
  # names(rice_ready)[5] <- "area_harvested"
  row.names(rice_ready) <- NULL  
  

  ## ĐỔI TÊN DATASET
  
  rice_ready -> item_ready
  
  ## TÍNH NĂNG SUẤT, NẾU CÓ NAN HOẶC INF THÌ SET BẰNG 0
  
  item_ready$yield <- round(item_ready$production / item_ready$area_harvested, digits = 2)
  
  item_ready$yield[is.nan(item_ready$yield)] <- 0
  
  item_ready$yield[is.infinite(item_ready$yield)] <- 0
  
  item_ready$area <- reorder(item_ready$area, item_ready$production)
  
  item_ready <- item_ready %>% dplyr::arrange(desc(area), 
                                              desc(year),
                                              desc(production),
                                              desc(area_harvested),
                                              desc(yield))
  
  return(item_ready)
  
  
  
}

dump(list = "extract_item_v2", file = "extract_item_v2.R")


# dput()
# dget()
# sink()

######################### CHECK FUNCTION

coffee_data_v1 <- extract_item_v1(input_rds = df_1, 
                               input_item = "Coffee, green", 
                               input_region = df_2)

coffee_data_v2 <- extract_item_v2(input_rds = df_1, 
                               input_item = "Coffee, green", 
                               input_region = df_2)

identical(coffee_data_v1, coffee_data_v2)

dim(coffee_data_v1)
dim(coffee_data_v2)

View(coffee_data_v1)
View(coffee_data_v2)

setdiff(coffee_data_v1, coffee_data_v2)

setdiff(coffee_data_v2, coffee_data_v1)

#######

filter_topten_v1 <- function(item_filter, 
                          data_rds, 
                          data_region, 
                          rank_filter, 
                          year_filter) {
  
  country_1 <- extract_item_v1(input_item = item_filter,
                               input_rds = data_rds,
                               input_region = data_region)
  
  country_1[country_1$area %in% unique(country_1$area)[rank_filter], ] -> country_2
  
  country_2 |> subset(year == year_filter) -> country_2_2021
  
  row.names(country_2_2021) <- NULL
  
  country_2_2021$rank <- row.names(country_2_2021) 
  
  country_2_2021[, c(7, 1:6)] -> final_filter
  
  return(final_filter)
  
}

###

filter_topten_v2 <- function(item_filter, 
                             data_rds, 
                             data_region, 
                             rank_filter, 
                             year_filter) {
  
  country_1 <- extract_item_v2(input_item = item_filter,
                               input_rds = data_rds,
                               input_region = data_region)
  
  country_1[country_1$area %in% unique(country_1$area)[rank_filter], ] -> country_2
  
  country_2 |> subset(year == year_filter) -> country_2_2021
  
  row.names(country_2_2021) <- NULL
  
  country_2_2021$rank <- row.names(country_2_2021) 
  
  country_2_2021[, c(7, 1:6)] -> final_filter
  
  return(final_filter)
  
}

###

soy_1 <- filter_topten_v1(item_filter = "Soya beans",
                          data_rds = df_1,
                          data_region = df_2,
                          rank_filter = 1:10,
                          year_filter = 2021)


soy_2 <- filter_topten_v2(item_filter = "Soya beans",
                          data_rds = df_1,
                          data_region = df_2,
                          rank_filter = 1:10,
                          year_filter = 2021)


identical(soy_1, soy_2)

crop_item[-44] -> crop_check

lapply(X = crop_check[1:30], FUN = filter_topten_v1,
       data_rds = df_1,
       data_region = df_2,
       rank_filter = 1:10, 
       year_filter = 2021) -> loop_v1


lapply(X = crop_check[1:30], FUN = filter_topten_v2,
       data_rds = df_1,
       data_region = df_2,
       rank_filter = 1:10, 
       year_filter = 2021) -> loop_v2

identical(loop_v1, loop_v2)

setdiff(loop_v1, loop_v2)

setdiff(loop_v2, loop_v1)

###

for(i in 1:length(crop_check)){
  
  ok <- identical(loop_v1[i], loop_v2[i])
  
  # print(paste(ok, i))
  
  if(ok == TRUE){
    print(ok)
  } else {print(i)}
  
}




crop_check[19]

buckwheat_v1 <- extract_item_v1(input_rds = df_1, 
                                  input_item = "Buckwheat", 
                                  input_region = df_2)

buckwheat_v2 <- extract_item_v2(input_rds = df_1, 
                                  input_item = "Buckwheat", 
                                  input_region = df_2)

identical(buckwheat_v1, buckwheat_v2)

rice_v1 <- extract_item_v1(input_rds = df_1, 
                                input_item = "Rice", 
                                input_region = df_2)

rice_v2 <- extract_item_v2(input_rds = df_1, 
                                input_item = "Rice", 
                                input_region = df_2)

identical(rice_v1, rice_v2)

setdiff(rice_v1, rice_v2)
setdiff(rice_v2, rice_v1)

























































