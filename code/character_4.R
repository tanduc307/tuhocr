
letters

sort(letters, decreasing = TRUE)

################

vd_1 <- c("a", "b", "c", "A", "C", "0", NA, "1", "-100", "Z", "w")

sort(vd_2)

sort(vd_2, na.last = TRUE)

sort(vd_2, na.last = FALSE)

sort(vd_2, na.last = NA) # sort và loại giá trị NA


################

a <- c(4, 12, 6, 7, 2, NA, 9, 5)

seq_along(a) -> names(a)

a

sort(a) # Sắp xếp theo thứ tự giá trị của số, mặc định từ nhỏ đến lớn (ascending)

sort(a, decreasing = FALSE)

sort(a, decreasing = TRUE) # Từ lớn đến nhỏ

order(a) # Sắp xếp theo thứ tự index, mặc định từ nhỏ đến lớn (ascending)

order(a, decreasing = TRUE) # Sắp xếp theo từ lớn đến nhỏ (descending)

order(a, na.last = TRUE)

order(a, na.last = FALSE)

order(a, na.last = NA) # order và loại giá trị NA

##################

# install.packages('stringr')
library(stringr)

full_name <- "Nguyễn Văn A"

word(full_name, -1) 

word(full_name, -2) 

word(full_name, 2) 

word(full_name, 3) 

###################

bien_so_xe <- c(50, 60, 33, 55, 47)

names(bien_so_xe) 

seq_along(bien_so_xe)

str(bien_so_xe)

names(bien_so_xe) <- c("TP.HCM", "Đồng Nai", "Hà Nội", "TP.HCM", "Đăk Lăk")

bien_so_xe

names(bien_so_xe) -> well

bien_so_xe[well]

bien_so_xe[c(3, 1, 4)]

bien_so_xe[c("TP.HCM", "Đồng Nai")]

bien_so_xe[sort(well)]

bien_so_xe[order(well)]

order(well)

order(bien_so_xe)


kkk <- c("TP.HCM", "Đồng Nai", "Hà Nội", "TP.HCM", "Đăk Lăk")

sort(kkk)
order(kkk)

kkk
##################

# BÀI TẬP

# download file excel: https://tinyurl.com/4swv6z56

library(readxl)
nhanvien_3 <- read_excel("nhanvien_3.xlsx")

nhanvien_3$`Họ tên` -> homework

homework

class(homework)

sort(homework)
sort(homework, decreasing = TRUE)

order(homework)


