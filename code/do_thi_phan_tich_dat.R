#BARPLOT WITH ERROR BAR IN R

library(readxl)
ket_qua_phan_tich_dat <- read_excel("ket_qua_phan_tich_dat.xlsx", range = "C15:E27")

ket_qua_phan_tich_dat

######### CÁCH 1: BASE-R GRAPHIC
# Tham khảo: https://r-graph-gallery.com/4-barplot-with-error-bar.html

# TÍNH MEAN
ket_qua_phan_tich_dat_mean <- aggregate(cbind(pH, do_man) ~ dia_diem, data = ket_qua_phan_tich_dat, mean)

# CHUYỂN QUA MATRIX
# ĐƯA TÊN ĐỊA ĐIỂM VÀO ROWNAMES
rownames(ket_qua_phan_tich_dat_mean) <- ket_qua_phan_tich_dat_mean[, 1]
class(ket_qua_phan_tich_dat_mean)
# CHUYỂN THÀNH NUMERIC MATRIX
ket_qua_phan_tich_dat_mean <- as.matrix(ket_qua_phan_tich_dat_mean[, -1])

mean_ph <- ket_qua_phan_tich_dat_mean[, 1, drop = FALSE]

mean_do_man <- ket_qua_phan_tich_dat_mean[, 2, drop = FALSE]

# TÍNH SD
ket_qua_phan_tich_dat_sd <- aggregate(cbind(pH, do_man) ~ dia_diem, data = ket_qua_phan_tich_dat, sd)

# CHUYỂN QUA MATRIX
# ĐƯA TÊN ĐỊA ĐIỂM VÀO ROWNAMES
rownames(ket_qua_phan_tich_dat_sd) <- ket_qua_phan_tich_dat_sd[, 1]

# CHUYỂN THÀNH NUMERIC MATRIX
ket_qua_phan_tich_dat_sd <- as.matrix(ket_qua_phan_tich_dat_sd[, -1])

sd_ph <- ket_qua_phan_tich_dat_sd[, 1, drop = FALSE]

sd_do_man <- ket_qua_phan_tich_dat_sd[, 2, drop = FALSE]

#A function to add arrows on the chart
error.bar <- function(x, y, upper, lower = upper, length = 0.05, ...) {
    arrows(x , y + upper, x, y - lower, angle = 90, code = 3, length = length, ...)
}

#####################
par(mfrow = c(1, 2), xpd = NA)

### VẼ ĐỒ THỊ CHO PH
ph_barplot <- barplot(mean_ph, beside = TRUE,
                      col = c("#eb8060", "#b9e38d", "#a1e9f0", "#d9b1f0"), ylim = c(0, 10), space = 0.5, ylab = "pH", axisnames = FALSE)

error.bar(ph_barplot,mean_ph, sd_ph)

#######################
### VẼ ĐỒ THỊ CHO ĐỘ MẶN
do_man_barplot <- barplot(mean_do_man, beside = TRUE,
                      col = c("#eb8060", "#b9e38d", "#a1e9f0", "#d9b1f0"), ylim = c(0, 5), space = 0.5, ylab = "Độ mặn (‰)", axisnames = FALSE)

error.bar(do_man_barplot, mean_do_man, sd_do_man)

########################

legend(-12, 6,
       legend = rownames(ket_qua_phan_tich_dat_mean),
       horiz = TRUE,
       fill = c("#eb8060", "#b9e38d", "#a1e9f0", "#d9b1f0"),
       box.lty = 1,
       cex = 0.6
)

mtext("Kết quả phân tích đất",
      side = 1,
      line = -4,
      outer = TRUE)


############################
# CÁCH 2
# install.packages("highcharter")
# library(highcharter)

colnames(ket_qua_phan_tich_dat_mean) <- c("x", "y1", "y2")
ket_qua_phan_tich_dat_mean -> df

my_theme <- hc_theme(
  chart = list(
    backgroundColor = "#ffffff",
    style = list(
      fontFamily = "Time News Roman"
    )
  )
)

highchart() %>%
  hc_yAxis_multiples(
    list(
      lineWidth = 3,
      lineColor = "green",
      title = list(text = "pH")
    ),
    list(
      lineWidth = 3,
      lineColor = "#eb8060",
      title = list(text = "Độ mặn (‰)")
    )
  ) %>%
  hc_add_series(
    data = df$y1,
    color = "green", 
    name = "pH",
    type = "column"
  ) %>%
  hc_add_series(
    data = df$y2,
    color = "#eb8060",
    name = "Độ mặn (‰)",
    type = "column",
    yAxis = 1
  ) %>%
  hc_xAxis(
    categories = df$x,
    title = list(text = "Kết quả phân tích đất")
  ) %>%
  hc_add_theme(my_theme)

############

df <- data.frame(Gender = c("Male", "Male", "Female", "Female"),
                 ShareType = rep(c("Long", "Short"),2),
                 InvestedPerAccount = c(10,9,7,8),
                 lower = c(8,7,6,7),
                 upper = c(11.5,10,9,8.8))

highchart() %>%
    hc_add_series(df, "column",hcaes(x = ShareType, y = InvestedPerAccount, group = Gender),
                  tooltip = list(enabled = TRUE,pointFormat = '${point.y}')) %>%
    hc_add_series(df, "errorbar", stemWidth = 1,  whiskerLength = 10, grouping = FALSE,
                  centerInCategory = TRUE, groupPadding = .68,
                  hcaes(x = ShareType, low = lower, high = upper, group = Gender)) %>%
    hc_xAxis(categories = df$ShareType, title = list(text = "Share Type")) %>% 
    hc_colors(c("pink","lightblue"))



############

example_dat <- tibble(Type = c("Human", "High-Elf", "Orc"), 
                      key = c("World1", "World2", "World3")) %>% 
    expand.grid() %>% 
    mutate(mean = runif(9, 5, 7)) %>% 
    mutate(sd = runif(9, 0, 2)) 

hchart(
    example_dat, 
    "column",
    hcaes(x = key, y = mean, group = Type),
    id = c("a", "b", "c")
) %>%
    
    hc_add_series(
        example_dat,
        "errorbar", 
        hcaes(y = mean, x = key, low = mean - sd, high = mean + sd, group = Type),
        linkedTo = c("a", "b", "c"),
        enableMouseTracking = TRUE,
        showInLegend = FALSE
    ) %>% 
    
    hc_plotOptions(
        errorbar = list(
            color = "black", 
            # whiskerLength = 1,
            stemWidth = 1
        ) 
    ) 
https://stackoverflow.com/questions/63836750/r-highcharter-errorbar-series-position-dodge

#####################################

### VẼ HOÀN CHỈNH

library(readxl)
ket_qua_phan_tich_dat <- read_excel("ket_qua_phan_tich_dat.xlsx", range = "C15:E27")

ket_qua_phan_tich_dat

ket_qua_phan_tich_dat_mean <- aggregate(cbind(pH, do_man) ~ dia_diem, data = ket_qua_phan_tich_dat, mean)

ket_qua_phan_tich_dat_mean -> df1

colnames(df1)[c(2, 3)] <- c("pH", "do_man")
df1


ket_qua_phan_tich_dat_sd <- aggregate(cbind(pH, do_man) ~ dia_diem, data = ket_qua_phan_tich_dat, sd)

ket_qua_phan_tich_dat_sd -> df2

colnames(df2)[c(2, 3)] <- c("pH_sd", "do_man_sd")
df2

library(tidyverse)
df1_a <- gather(data = df1, key = "chi_tieu", value = "mean_all", 2:3)
df1_a

df2_a <- gather(data = df2, key = "chi_tieu", value = "sd_all", 2:3)
df2_a 

df3 <- cbind(df1_a, df2_a)

df3 <- df3[c(1:3, 6)]
df3

##########

df3 -> example_dat

colnames(example_dat) <- c("Type", "key", "mean", "sd")
example_dat

hchart(
    example_dat, 
    "column",
    hcaes(x = key, y = mean, group = Type),
    id = c("a", "b", "c")
) %>%
    
    hc_add_series(
        example_dat,
        "errorbar", 
        hcaes(y = mean, x = key, low = mean - sd, high = mean + sd, group = Type),
        linkedTo = c("a", "b", "c"),
        enableMouseTracking = TRUE,
        showInLegend = FALSE
    ) %>% 
    
    hc_plotOptions(
        errorbar = list(
            color = "black", 
            # whiskerLength = 1,
            stemWidth = 1
        ) 
    )


####################################################


library(readxl)
ket_qua <- read_excel("ket_qua_phan_tich_dat_full.xlsx", range = "B6:O15")

library(tidyverse)

ket_qua
names(ket_qua)

ket_qua_clean <- ket_qua %>% group_by(location) %>%
    mutate(pH_mean = mean(c(`pH-1`,`pH-2`,`pH-3`))) %>% 
    mutate(pH_sd = sd(c(`pH-1`,`pH-2`,`pH-3`))) %>%
    mutate(salinity_mean = mean(c(`salinity-1`,`salinity-2`,`salinity-3`))) %>% 
    mutate(salinity_sd = sd(c(`salinity-1`,`salinity-2`,`salinity-3`))) %>%
    mutate(organic_mean = mean(c(`organic-1`,`organic-2`,`organic-3`))) %>% 
    mutate(organic_sd = sd(c(`organic-1`,`organic-2`,`organic-3`))) %>%
    mutate(nitrogen_mean = mean(c(`nitrogen-1`,`nitrogen-2`,`nitrogen-3`))) %>% 
    mutate(nitrogen_sd = sd(c(`nitrogen-1`,`nitrogen-2`,`nitrogen-3`))) %>% 
    select(location, 
           pH_mean, pH_sd, 
           salinity_mean, salinity_sd, 
           organic_mean, organic_sd,
           nitrogen_mean, nitrogen_sd)

ket_qua_clean
ket_qua_clean <- as.data.frame(ket_qua_clean)

ket_qua_clean$`ĐỊA ĐIỂM`
######################################

# CHUYỂN QUA MATRIX

# PH MEAN
ph_mean_data <- ket_qua_clean %>% select(`ĐỊA ĐIỂM`, pH_mean) 

rownames(ph_mean_data) <- ph_mean_data[, 1]
ph_mean_data

ph_mean_data <- as.matrix(ph_mean_data[, -1, drop = FALSE])
ph_mean_data 

# PH SD

ph_sd_data <- ket_qua_clean %>% select(`ĐỊA ĐIỂM`, pH_sd) 

rownames(ph_sd_data) <- ph_sd_data[, 1]
ph_sd_data

ph_sd_data <- as.matrix(ph_sd_data[, -1, drop = FALSE])
ph_sd_data

# SALINITY MEAN
salinity_mean_data <- ket_qua_clean %>% select(`ĐỊA ĐIỂM`, salinity_mean) 

rownames(salinity_mean_data) <- salinity_mean_data[, 1]
salinity_mean_data

salinity_mean_data <- as.matrix(salinity_mean_data[, -1, drop = FALSE])
salinity_mean_data 

# SALINITY SD
salinity_sd_data <- ket_qua_clean %>% select(`ĐỊA ĐIỂM`, salinity_sd) 

rownames(salinity_sd_data) <- salinity_sd_data[, 1]
salinity_sd_data

salinity_sd_data <- as.matrix(salinity_sd_data[, -1, drop = FALSE])
salinity_sd_data

# ORGANIC MEAN
organic_mean_data <- ket_qua_clean %>% select(`ĐỊA ĐIỂM`, organic_mean) 

rownames(organic_mean_data) <- organic_mean_data[, 1]
organic_mean_data

organic_mean_data <- as.matrix(organic_mean_data[, -1, drop = FALSE])
organic_mean_data

# ORGANIC SD
organic_sd_data <- ket_qua_clean %>% select(`ĐỊA ĐIỂM`, organic_sd) 

rownames(organic_sd_data) <- organic_sd_data[, 1]
organic_sd_data

organic_sd_data <- as.matrix(organic_sd_data[, -1, drop = FALSE])
organic_sd_data

# NITROGEN MEAN
nitrogen_mean_data <- ket_qua_clean %>% select(`ĐỊA ĐIỂM`, nitrogen_mean) 

rownames(nitrogen_mean_data) <- nitrogen_mean_data[, 1]
nitrogen_mean_data

nitrogen_mean_data <- as.matrix(nitrogen_mean_data[, -1, drop = FALSE])
nitrogen_mean_data

# NITROGEN SD
nitrogen_sd_data <- ket_qua_clean %>% select(`ĐỊA ĐIỂM`, nitrogen_sd) 

rownames(nitrogen_sd_data) <- nitrogen_sd_data[, 1]
nitrogen_sd_data

nitrogen_sd_data <- as.matrix(nitrogen_sd_data[, -1, drop = FALSE])
nitrogen_sd_data

######################################

#A function to add arrows on the chart
error.bar <- function(x, y, upper, lower = upper, length = 0.035, ...) {
    arrows(x , y + upper, x, y - lower, angle = 90, code = 3, length = length, ...)
}

#####################
old.par <- par(mfrow = c(2, 2),
               mar = c(1, 4, 3, 2), # chỉnh nội bộ đồ thị, bottom, left, top, right
               oma = c(2, 2, 0, 7), # chỉnh multiple plot
               xpd = NA)

### VẼ ĐỒ THỊ CHO PH
ph_barplot <- barplot(ph_mean_data, 
                      beside = TRUE,
                      col = hsv(seq(0,1 - 1/12,length.out = 12), 0.5 , 1), 
                      ylim = c(0, 10), space = 0.5, ylab = "pH", 
                      axisnames = FALSE)

error.bar(ph_barplot, ph_mean_data, ph_sd_data)

#######################
### VẼ ĐỒ THỊ CHO SALINITY
salinity_barplot <- barplot(salinity_mean_data, 
                            beside = TRUE,
                            col = hsv(seq(0,1 - 1/12,length.out = 12), 0.5 , 1),
                            ylim = c(0, 5), space = 0.5, ylab = "Độ mặn (‰)", 
                            axisnames = FALSE)

error.bar(salinity_barplot, salinity_mean_data, salinity_sd_data)

########################
### VẼ ĐỒ THỊ CHO ORGANIC
organic_barplot <- barplot(organic_mean_data, 
                            beside = TRUE,
                            col = hsv(seq(0,1 - 1/12,length.out = 12), 0.5 , 1),
                            ylim = c(0, 30), space = 0.5, ylab = "Hữu cơ (%)", 
                            axisnames = FALSE)

error.bar(organic_barplot, organic_mean_data, organic_sd_data)

#######################
### VẼ ĐỒ THỊ CHO NITROGEN
nitrogen_barplot <- barplot(nitrogen_mean_data, 
                            beside = TRUE,
                            col = hsv(seq(0,1 - 1/12,length.out = 12), 0.5 , 1),
                            ylim = c(0, 4), space = 0.5, ylab = "Nitrogen (%)", 
                            axisnames = FALSE)

error.bar(nitrogen_barplot, nitrogen_mean_data, nitrogen_sd_data)

legend(14, 5.6, # trục x, trục y
       y.intersp = 1.5,
       legend = ket_qua_clean$`ĐỊA ĐIỂM`,
       title = "Địa điểm lấy mẫu",
       horiz = FALSE,
       fill = hsv(seq(0,1 - 1/12,length.out = 12), 0.5 , 1),
       box.lty = 1,
       cex = 0.8)

mtext("Kết quả phân tích đất tháng 9/2022 | tuhocr.com",
      side = 3,
      line = -2,
      outer = TRUE)

par(old.par)

?legend








