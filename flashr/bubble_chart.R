# TÀI LIỆU THAM KHẢO
# https://stackoverflow.com/questions/70942728/understanding-color-scales-in-ggplot2

# BƯỚC 1: DOWNLOAD DATASET

library(FAOSTAT)

# download dataset QCL lưu ở thư mục project
crop_production <- get_faostat_bulk(code = "QCL", 
                                    data_folder = "./")

saveRDS(crop_production, "crop_production_e_all_data.rds")

# BƯỚC 2: LÀM SẠCH DỮ LIỆU

library(dplyr)
library(tidyr)
library(DT)

crop_production <- readRDS("crop_production_e_all_data.rds")
dim(crop_production)

## tách riêng dataset của Việt Nam
vietnam_data <- subset(crop_production, area == "Viet Nam")
dim(vietnam_data)

## subset dữ liệu Flag A từ nguồn chính thức do Việt Nam công bố
vietnam_data_a <- subset(vietnam_data, flag == "A")
dim(vietnam_data_a)

## chọn những cột cần thiết
vietnam_crop <- vietnam_data_a[, c("item", "element", "year", "unit", "value")]

## sắp xếp theo năm và thông tin nông sản
vietnam <- vietnam_crop %>% dplyr::arrange(desc(year), desc(item), desc(element))
str(vietnam)

as.data.frame(table(vietnam$item)) -> df_1

## chúng ta có clean dataset để đưa vào phân tích giai đoạn sau
datatable(vietnam, options = list(pageLength = 30))

# BƯỚC 3: LỌC DỮ LIỆU VỀ LÚA GẠO ĐƯA VÀO ĐỒ THỊ

rice <- subset(vietnam, item == "Rice")
rice_ok <- subset(rice, element != "yield")
rice_ok <- subset(rice_ok, select = -unit)

head(rice_ok)

rice_final <- rice_ok %>% tidyr::spread(key = "element", 
                                        value = "value")

# head(rice_final)

# na.omit(rice_final) -> rice_final

write.csv(rice_final, "rice_final_vietnam.csv",
          row.names = FALSE)

# BƯỚC 4: VẼ ĐỒ THỊ

rm(list = ls())

rice_final <- read.csv("rice_final_vietnam.csv")

# head(rice_final)

library(ggplot2)
library(extrafont)

windows()

windows(width = 8, height = 6)

windows(height = 6, width = 8)

windows(8, 6)

windows(6, 8)

font_chu <- "Times New Roman"

# library(Cairo)
# Cairo::CairoPNG(
#   width = 8,
#   height = 6,
#   file = "rice_vn_cario_dpi_900.png",
#   bg = "white",
#   dpi = 900,
#   units = "in"
# )
# 
# png(filename = "rice_vn_baser_dpi_900.png", 
#     width = 8, height = 6, units = "in", 
#     res = 900)

p <- ggplot(
       data = rice_final,
       aes(x = year, 
           y = production / 1000000,
           size = area_harvested / 1000,
           fill = production/area_harvested)
       ) +
  
  geom_point(shape = 21, colour = "red", alpha = 0.5, show.legend = TRUE) +
  
  scale_x_continuous(expand = c(0, 0),
                     limits = c(1955, 2025),
                     name = "Năm",
                     breaks = c(1961, 
                                1980,
                                2000,
                                2021)
                     ) +
  
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 
                                1.15 * max(rice_final$production) / 1000000),
                     name = "Sản lượng thu hoạch (triệu tấn)"
                     ) +
  
  scale_size_continuous(name = "Diện tích canh tác (nghìn/ha)",
                        breaks = seq(from = 8000, to = 4000, by = -1000),
                        limits = c(4000, 8000),
                        range = c(1, 7),
                        guide = guide_legend(order = 1,
                                             # direction = "horizontal"
                                             )) +
  
  # scale_fill_continuous(name = "Năng suất (tấn/ha)",
  #                       guide = guide_colourbar(barwidth = 1, barheight = 8,
  #                                               order = 2),
  #                       limits = c(1, 10),
  #                       breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
  #                       labels = c(1, "", 3, "", 5, "", 7, "", "", 10),
  #                       type = "viridis")
  # 
  # scale_fill_gradient(name = "Năng suất (tấn/ha)",
  #                     guide = guide_colourbar(barwidth = 1, barheight = 8,
  #                                             order = 2),
  #                     limits = c(1, 10),
  #                     breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
  #                     labels = c(1, "", 3, "", 5, "", 7, "", "", 10),
  #                     high = "red",
  #                     low = "yellow")

# scale_fill_viridis_c(name = "Năng suất (tấn/ha)",
#                      guide = guide_colourbar(barwidth = 1, barheight = 8,
#                                              order = 2),
#                      limits = c(1, 10),
#                      breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
#                      labels = c(1, "", 3, "", 5, "", 7, "", "", 10),
#                      option = "D"
#                      )

# scale_fill_gradient2(name = "Năng suất (tấn/ha)",
#                      guide = guide_colourbar(barwidth = 1, barheight = 8,
#                                              order = 2),
#                      limits = c(1, 10),
#                      breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
#                      labels = c(1, "", 3, "", 5, "", 7, "", "", 10),
#                      high = "red",
#                      mid = "green",
#                      midpoint = 5,
#                      low = "yellow")

scale_fill_gradientn(name = "Năng suất (tấn/ha)",
                     guide = guide_colourbar(barwidth = 1, barheight = 8,
                                             order = 2),
                     # guide = "none",
                     limits = c(1, 10),
                     breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                     labels = c(1, "", 3, "", 5, "", 7, "", "", 10),
                     # colours = c("#00ffff", "#FFF0D9", "#FFD391", "#ff4e41", "#ff3122")
                     colours = c("#440154","#482878","#3e4989","#31688e","#26828e","#1f9e89","#35b779","#6ece58","#b5de2b","#fde725")
                     ) +

############### theming đồ thị
  
  ## set một theme chung cho toàn đồ thị

theme_classic() +
  
  ## đưa thông tin tiêu đề đồ thị
  
  labs(title = "Tình hình sản xuất lúa gạo ở Việt Nam từ 1960–2021",
       subtitle = "Nguồn: FAOSTAT [crop dataset, Vietnam, flag A]",
       caption = "Đồ thị: Duc Nguyen | tuhocr.com") +

  ## format text trong đồ thị

theme(plot.title = element_text(size = "12",
                                family = "Times New Roman",
                                face = "bold",
                                colour = "black",
                                angle = 0,
                                hjust = 0,
                                vjust = 0,
                                margin = margin(t = 0, r = 0, b = 10, l = 0, unit = "pt"))) +
  
theme(plot.subtitle = element_text(size = "11",
                                  family = "Times New Roman",
                                  face = "plain",
                                  colour = "black",
                                  angle = 0,
                                  hjust = 0,
                                  vjust = 0,
                                  margin = margin(t = 0, r = 0, b = 10, l = 0, unit = "pt"))) +
                
theme(plot.caption = element_text(size = "10",
                                  family = "Times New Roman",
                                  face = "plain",
                                  colour = "black",
                                  angle = 0,
                                  hjust = 1,
                                  vjust = 0,
                                  margin = margin(t = 0, r = 0, b = 0, l = 0, unit = "pt"))) +
  
  ## customize panel và margin của plot

theme(panel.background = element_rect(fill = "white", colour = "white", linewidth = 0),
      plot.background = element_rect(fill = "grey90"),
      plot.margin = margin(t = 0.5, r = 0.5, b = 0.5, l = 0.5, unit = "cm")) +

  ## customize 2 trục đồ thị

theme(axis.text.x = element_text(face = "bold", 
                                 colour = "#993333", 
                                 size = 10, 
                                 family = "Times New Roman"),
      axis.text.y = element_text(face = "bold", 
                                 colour = "#993333", 
                                 size = 10, 
                                 family = "Times New Roman")) +
  
theme(axis.title.x = element_text(face = "bold", 
                                  colour = "black", 
                                  size = 11, 
                                  family = "Times New Roman"),
      axis.title.y = element_text(face = "bold", 
                                  colour = "black", 
                                  size = 11,
                                  family = "Times New Roman",
                                  margin = margin(t = 0, r = 10, b = 0, l = 0, unit = "pt"))) + 

  ## customize legend

theme(legend.background = element_rect(fill = "transparent", colour = "transparent", linewidth = 0)) +

# theme(legend.background = element_blank())

theme(legend.position = "right") +

# theme(legend.position = c(0.5, 0.5)) +
  
theme(legend.justification = c("left", "bottom")) +
  
theme(legend.title = element_text(face = "bold",
                                    colour = "black",
                                    size = 11,
                                    family = "Times New Roman",
                                    margin = margin(t = 0, r = 0, b = 10, l = 0, unit = "pt"))) +
  
theme(legend.text = element_text(face = "plain",
                                   colour = "black",
                                   size = 10,
                                   family = "Times New Roman")) +
  
theme(legend.direction = "vertical")

####################################

## chú thích đồ thị

p + geom_hline(yintercept = 48, 
               colour = "#148c34", 
               linewidth = 1.2, 
               linetype = 2) +
  
    annotate(geom = "text", 
             x = 2000, 
             y = 1.1 * max(rice_final$production) / 1000000,
             label = "Ngưỡng cực hạn 48 triệu tấn/năm",
             colour = "red") +
  
    geom_label(aes(x = 1975, 
                   y = 0.9 * max(production)/1000000, 
                   label = paste("Năm", 
                                 max(year), 
                                 "Việt Nam", 
                                 "\nthu hoạch được", 
                                 round(rice_final[rice_final$year == max(rice_final$year), ]$production/1000000, digits = 0), 
                                 "triệu tấn gạo", "\ntrên diện tích canh tác", 
                                 round(rice_final[rice_final$year == max(rice_final$year), ]$area_harvested/1000, digits = 0), 
                                 "nghìn ha", 
                                 "\nnăng suất là", round(rice_final[rice_final$year == max(rice_final$year), ]$production/rice_final[rice_final$year == max(rice_final$year), ]$area_harvested, digits = 2), 
                                 "tấn/ha")),
               fill = "#f5ec42", 
               label.size = 0.15, 
               size = 3.5) 

##########################

library(grid)
library(gridExtra)
library(png)

logor <- readPNG("logor.png")

# grid.raster(logor, x = 0.9, y = 0.9, width = 0.1)

## adjust opacity/transparent of image

logor -> m

w <- matrix(rgb(m[, , 1], m[, , 2], m[, , 3], m[, , 4] * 0.5), 
            nrow = dim(m)[1]) # 0.5 is alpha

grid.raster(w, x = 0.9, y = 0.9, width = 0.1)



# download.file(url = "https://tuhocr.netlify.app/rice.png",
#               destfile = "rice.png",
#               mode = "wb")

rice <- readPNG("rice.png")

grid.raster(rice, x = 0.56, y = 0.24, width = 0.23)

dev.copy(device = png, 
         filename = "rice_vn_dev_dpi_90.png", 
         width = 8, 
         height = 6, 
         units = "in", 
         res = 90)

# ggsave(filename = "rice_vn_ggsave_dpi_900.png", 
#        width = 8, 
#        height = 6, 
#        units = "in", 
#        dpi = 900)

dev.off()

# The ggplot2 package is built on top of grid package graphics.
# 
# A grid graphical object (grob).
# 
# Viewports are the plotting windows that you can move into and out of 
# to customize plots using grid graphics.

### Tham khảo
# https://stackoverflow.com/questions/13143894/how-do-i-position-two-legends-independently-in-ggplot
# https://stackoverflow.com/questions/52060601/ggplot-multiple-legends-arrangement
# https://kohske.wordpress.com/2010/12/25/various-position-adjustments-of-legend-in-ggplot2/
# https://stackoverflow.com/questions/11357926/r-add-alpha-value-to-png-image
# https://iruler.net/
# https://www.cloudbees.com/blog/what-is-the-difference-between-implicit-vs-explicit-programming
# https://www.cloudbees.com/blog/what-is-the-difference-between-implicit-vs-explicit-programming
# http://adv-r.had.co.nz/Style.html
# https://style.tidyverse.org/
# https://styler.r-lib.org/
# https://studyr.netlify.app/script/fao.html




