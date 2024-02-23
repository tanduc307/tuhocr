plot(1:10, col = "red", pch = 19)

plot(-1:-10, col = "red", pch = 19)

plot(rnorm(10), col = "red", pch = 19)

plot(x = na.omit(airquality$Ozone), 
     type = "o",
     col = "blue", 
     pch = 19)

abline(h = 0, col = "red", lwd = 2)

###

plot(x = airquality$Day[airquality$Month == 5],
     y = airquality$Ozone[airquality$Month == 5],
     type = "o",
     col = "blue", 
     xlab = "Tháng 5",
     ylab = "Ozone (ppb)",
     pch = 19)

### cách 1

plot(x = airquality$Day[airquality$Month == 5][complete.cases(airquality$Ozone[airquality$Month == 5])],
     y = airquality$Ozone[airquality$Month == 5][complete.cases(airquality$Ozone[airquality$Month == 5])],
     type = "o",
     col = "red", 
     xlab = "Tháng 5",
     ylab = "Ozone (ppb)",
     pch = 19)

points(x = airquality$Day[airquality$Month == 5],
     y = airquality$Ozone[airquality$Month == 5],
     type = "o",
     col = "blue", 
     xlab = "Tháng 5",
     ylab = "Ozone (ppb)",
     pch = 19)

### cách 2

ozone_month_5 <- data.frame(day = airquality$Day[airquality$Month == 5],
                            ozone = airquality$Ozone[airquality$Month == 5])

ozone_month_5_clean <- na.omit(ozone_month_5)

attributes(ozone_month_5_clean)$na.action

na_1 <- as.numeric(attributes(ozone_month_5_clean)$na.action)

na_2 <- which(is.na(ozone_month_5$ozone))

na_3 <- which(!complete.cases(ozone_month_5))

ozone_month_5[na_1 - 1, ]

ozone_month_5[na_1, ]

ozone_month_5[na_1 + 1, ]

rbind(ozone_month_5[na_1 - 1, ],
      ozone_month_5[na_1, ],
      ozone_month_5[na_1 + 1, ]) -> df_ok

df_ok |> dplyr::arrange(day) -> df_ok

df_ok[!duplicated(df_ok), ] -> df_ok_1

df_ok_1$keep <- paste0(df_ok_1$day,
                       "-",
                       df_ok_1$ozone)

ozone_month_5$keep <- paste0(ozone_month_5$day,
                             "-",
                             ozone_month_5$ozone)

ozone_month_5$check_1 <- ozone_month_5$keep %in% df_ok_1$keep

ozone_month_5$check_2 <- complete.cases(ozone_month_5$ozone)

ozone_month_5[!ozone_month_5$check_1, c("day", "ozone")] <- NA

ozone_month_5[ozone_month_5$check_2, c("day", "ozone")] -> ozone_ok

plot(x = airquality$Day[airquality$Month == 5],
     y = airquality$Ozone[airquality$Month == 5],
     type = "o",
     col = "blue", 
     xlab = "Tháng 5",
     ylab = "Ozone (ppb)",
     pch = 19)

na.omit(ozone_ok) -> yes

points(x = ozone_ok$day,
       y = ozone_ok$ozone,
       col = "red",
       type = "o",
       pch = 19)




























