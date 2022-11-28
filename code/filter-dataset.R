# # Lọc dữ liệu theo ngày tháng
# 
# filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang){
#     data_1 <- airquality[airquality$Month == thang, ]
#     kq <- data_1[ngay, ]
#     return(kq)
# }
# # filter theo 1 ngày bất kỳ trong 1 tháng
# filter_theo_ngay_thang(17, 8)
# 
# # filter theo dãy ngày trong 1 tháng
# filter_theo_ngay_thang(1:20, 6)
# 
# # filter toàn bộ ngày trong 1 tháng
# filter_theo_ngay_thang(1:31, 6)
# filter_theo_ngay_thang(1:31, 5)
# filter_theo_ngay_thang(, 7)
# 
# # filter 1 ngày trong tất cả các tháng
# filter_theo_ngay_thang(9, )
# 
# airquality[airquality$Day == 9, ]
# 
# filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0){
#     if(!(0 %in% thang)){
#         data_1 <- airquality[airquality$Month %in% thang, ]
#         kq <- data_1[data_1$Day %in% ngay, ]
#         return(kq)
#     } else {
#         kq_2 <- airquality[airquality$Day %in% ngay, ]
#         return(kq_2)
#     }
# }
# 
# # filter 1 số ngày trong tất cả các tháng
# filter_theo_ngay_thang(2:9, )
# 
# # filter 1 số ngày trong 1 tháng bất kỳ
# filter_theo_ngay_thang(c(3, 14), 8)
# 
# # filter 1 số ngày trong các tháng bất kỳ
# filter_theo_ngay_thang(c(3, 14), 6:8)
# 
# 
# airquality[airquality$Day == 2:9, ]
# 
# airquality$Day %in% 2:9
# 
# airquality$Day
# 
# 6:8 != 0
# 
# 0 != 6:8
# 
# 6:8 %in% 0
# 
# !(0 %in% 6:8)
# 
# # filter 1 số ngày trong toàn bộ các tháng
# filter_theo_ngay_thang(c(3, 14), thang = 0)
# filter_theo_ngay_thang(c(3, 14), )


############################
airquality

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0){
    if(!(0 %in% thang)){
        data_1 <- airquality[airquality$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- airquality[airquality$Day %in% ngay, ]
        return(kq_2)
    }
}
########### TEST HÀM
filter_theo_ngay_thang(12, )
filter_theo_ngay_thang(15:30, 8)
filter_theo_ngay_thang(, 8)
filter_theo_ngay_thang(, ) # test luôn tình huống này
filter_theo_ngay_thang(c(3, 14), 8)
filter_theo_ngay_thang(c(3, 14), 6:8)
filter_theo_ngay_thang(12:14, 1:10)

######################
# BÀI TẬP
# 1/ BỔ SUNG TÍNH NĂNG LOẠI MISSING VALUE
# 2/ BỔ SUNG TÍNH NĂNG XỬ LÝ DATASET CÓ CÙNG CẤU TRÚC MONTH, DAY NHƯNG KHÁC TÊN AIRQUALITY
# 3/ VIẾT HÀM TƯƠNG TỰ CÓ CÙNG CÁC CHỨC NĂNG NHƯ HÀM VÍ DỤ NÀY (GỢI Ý SỬ DỤNG LỆNH FOR-LOOP)

##################################
# 1/ BỔ SUNG TÍNH NĂNG LOẠI MISSING VALUE

data_raw <- filter_theo_ngay_thang(12:14, 1:10)

complete.cases(data_raw)

data_clean <- data_raw[complete.cases(data_raw), ] # làm sạch na

# vì đưa thêm lệnh nhỏ này vào lệnh lớn sẽ gây cồng kềnh.
# do đó tách ra 1 lệnh khác sẽ thuận hơn.

###### FUNCTION 1: FILTER BAO GỒM CẢ MISSING VALUE

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0){
    if(!(0 %in% thang)){
        data_1 <- airquality[airquality$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- airquality[airquality$Day %in% ngay, ]
        return(kq_2)
    }
}


###### FUNCTION 2: SỬ DỤNG FUNCTION 1, THÊM THAM SỐ TRUE/FALSE ĐỂ TÙY CHỌN CÓ CLEAN NA HAY KO

filter_theo_ngay_thang_final <- function(ngay = 1:nrow(data_1), 
                                thang = 0,
                                clean_na = FALSE
                                   ) {
    
    data_raw <- filter_theo_ngay_thang(ngay, thang)

    if(clean_na == FALSE){
        return(data_raw)
    } else {
        complete.cases(data_raw)
        data_clean <- data_raw[complete.cases(data_raw), ]
        return(data_clean)
    }
    
}

########### TEST HÀM
filter_theo_ngay_thang_final(14, 5)
filter_theo_ngay_thang_final(22:30, 5)
filter_theo_ngay_thang_final(22:30, 5, TRUE)

filter_theo_ngay_thang_final(22:30, , TRUE)
filter_theo_ngay_thang_final(22:30, 7:9, TRUE)
filter_theo_ngay_thang_final(22:30, 7:9)
filter_theo_ngay_thang_final(, 7:9)
filter_theo_ngay_thang_final(, 7)
filter_theo_ngay_thang(, 7)

##################################
# 2/ BỔ SUNG TÍNH NĂNG XỬ LÝ DATASET CÓ CÙNG CẤU TRÚC MONTH, DAY NHƯNG KHÁC TÊN AIRQUALITY

# download file csv chat_luong_khong_khi_2022 và 1992
# https://github.com/tanduc307/tuhocr

########## CÁCH 1)
chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")

dim(chat_luong_khong_khi_2022)

dim(airquality)

chat_luong_khong_khi_2022 -> airquality

chat_luong_khong_khi_2022

head(chat_luong_khong_khi_2022)

filter_theo_ngay_thang_final(14, 5)

# change col names cho phù hợp

colnames(chat_luong_khong_khi_2022)[c(5, 6)]

colnames(chat_luong_khong_khi_2022)[c(5, 6)] <- c("Month", "Day")

chat_luong_khong_khi_2022 -> airquality

head(airquality)

########## CÁCH 2)

# xử lý chỗ thay đổi Month và Day đồng bộ về 1 style

colnames(chat_luong_khong_khi_2022)

test_1 <- c("Month", "month", "MONTH", "moNTH", "montH", "monnth", "monthh")

grep(pattern = "month", test_1, value = TRUE)

grep(pattern = "M|month", test_1, value = TRUE)

grep(pattern = "M|mO|onth", test_1, value = TRUE)

grep(pattern = "(M|m)(O|o)nth", test_1, value = TRUE)

grep(pattern = "[MONTH]|[month]", test_1, value = TRUE)

grep(pattern = "([MONTH]|[month]){3}", test_1, value = TRUE)

grep(pattern = "M", test_1, value = TRUE)

grep(pattern = "^([Mm]{1})([Oo]{1})([Nn]{1})([Tt]{1})([Hh]{1})$", test_1, value = TRUE)

test_2 <- c("DAY", "dayy", "day", "daYY", "DAaY", "Day")

grep(pattern = "([Dd]{1})([Aa]{1})([Yy]{1})", test_2, value = TRUE)

grep(pattern = "^([Dd]{1})([Aa]{1})([Yy]{1})$", test_2, value = TRUE)

grep(pattern = "Day", test_2,
     ignore.case = FALSE, # check case sensitive
     value = TRUE)

grep(pattern = "^([Mm]{1})([Oo]{1})([Nn]{1})([Tt]{1})([Hh]{1})$",
     colnames(chat_luong_khong_khi_2022), 
     value = TRUE)

colnames(chat_luong_khong_khi_2022)

gsub(pattern = "^([Mm]{1})([Oo]{1})([Nn]{1})([Tt]{1})([Hh]{1})$",
     colnames(chat_luong_khong_khi_2022),
     replacement = "Month")
# kết quả trả về toàn bộ vector colnames(chat_luong_khong_khi_2022)


# sử dụng tham số dot-dot-dot để linh động subset trực tiếp theo file name dataset


# Hình dung:

# function hiện tại: filter_theo_ngay_thang(ngay, thang)

# function cải tiến: filter_theo_ngay_thang(ngay, thang, name_dataset)

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0, ...){
    if(!(0 %in% thang)){
        data_1 <- ...[...$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- ...[...$Day %in% ngay, ]
        return(kq_2)
    }
}

## TUY NHIÊN BẢN CHẤT ... là tham số chứ không phải là object nên chúng ta không dùng ... để thay thế

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0, name_dataset = airquality){
    
    data_xuly <- name_dataset
    
    if(!(0 %in% thang)){
        data_1 <- data_xuly[data_xuly$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- data_xuly[data_xuly$Day %in% ngay, ]
        return(kq_2)
    }
}

### TEST

head(airquality)
data("airquality")


head(chat_luong_khong_khi_2022)
colnames(chat_luong_khong_khi_2022)[c(5, 6)] <- c("Month", "Day")

filter_theo_ngay_thang(, 8, chat_luong_khong_khi_2022)
filter_theo_ngay_thang(ngay = 25, thang = 11, chat_luong_khong_khi_2022)

filter_theo_ngay_thang(ngay = 25, thang = 9) # thiếu tham số dataset để filter

filter_theo_ngay_thang(chat_luong_khong_khi_2022, ngay = 25:30, thang = c(7, 9, 2:3))

filter_theo_ngay_thang(chat_luong_khong_khi_2022, ngay = 25:31, thang = 0)

filter_theo_ngay_thang(chat_luong_khong_khi_2022, ngay = 25:31,)

filter_theo_ngay_thang(chat_luong_khong_khi_2022, ngay = 25:31)

filter_theo_ngay_thang_final(ngay = 25:10, , chat_luong_khong_khi_2022, TRUE)

############ ĐƯA GSUB cho Month và Day VÀO


filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0, name_dataset){
    
    data_xuly <- name_dataset
    
    colnames(data_xuly) <- gsub(pattern = "^([Mm]{1})([Oo]{1})([Nn]{1})([Tt]{1})([Hh]{1})$",
         colnames(data_xuly),
         replacement = "Month")
    
    colnames(data_xuly) <- gsub(pattern = "^([Dd]{1})([Aa]{1})([Yy]{1})$",
         colnames(data_xuly),
         replacement = "Day")
    
    if(!(0 %in% thang)){
        data_1 <- data_xuly[data_xuly$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- data_xuly[data_xuly$Day %in% ngay, ]
        return(kq_2)
    }
}

####### TEST HÀM

chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")
head(chat_luong_khong_khi_2022)


filter_theo_ngay_thang(ngay = 25, thang = 11, chat_luong_khong_khi_2022)

filter_theo_ngay_thang(chat_luong_khong_khi_2022, ngay = 25:30, thang = c(7, 9, 2:3))

chat_luong_khong_khi_1992 <- read.csv("D:/tuhocr/chat_luong_khong_khi_1992.csv")

filter_theo_ngay_thang(ngay = 2:6, thang = 8, chat_luong_khong_khi_1992)

###################################


# FUNCTION HOÀN CHỈNH 1

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0, name_dataset = airquality){
    
    data_xuly <- name_dataset
    
    colnames(data_xuly) <- gsub(pattern = "^([Mm]{1})([Oo]{1})([Nn]{1})([Tt]{1})([Hh]{1})$",
                                colnames(data_xuly),
                                replacement = "Month")
    
    colnames(data_xuly) <- gsub(pattern = "^([Dd]{1})([Aa]{1})([Yy]{1})$",
                                colnames(data_xuly),
                                replacement = "Day")
    
    if(!(0 %in% thang)){
        data_1 <- data_xuly[data_xuly$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- data_xuly[data_xuly$Day %in% ngay, ]
        return(kq_2)
    }
}

# FUNCTION HOÀN CHỈNH 2

filter_theo_ngay_thang_final <- function(ngay = 1:nrow(data_1), 
                                         thang = 0,
                                         name_dataset = airquality,
                                         clean_na = FALSE # thêm tham số
) {
    
    data_raw <- filter_theo_ngay_thang(ngay, thang , name_dataset)
    
    if(clean_na == FALSE){
        return(data_raw)
    } else {
        complete.cases(data_raw)
        data_clean <- data_raw[complete.cases(data_raw), ]
        return(data_clean)
    }
    
}


########### TEST HÀM
filter_theo_ngay_thang_final(, 5)
filter_theo_ngay_thang(, 5)
filter_theo_ngay_thang_final(22:30, 5)
filter_theo_ngay_thang_final(22:30, 5, TRUE)
filter_theo_ngay_thang_final(22:30, 5, , TRUE)
filter_theo_ngay_thang_final(22:30, , TRUE)
filter_theo_ngay_thang_final(22:30, , , TRUE)
filter_theo_ngay_thang_final(22:30, 7:9, , TRUE)
filter_theo_ngay_thang_final(22:30, 7:9)

chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")
filter_theo_ngay_thang_final(ngay = 12:28, thang = 11, chat_luong_khong_khi_2022)
filter_theo_ngay_thang_final(ngay = 12:28, 
                             thang = 11, 
                             chat_luong_khong_khi_2022, 
                             TRUE)

chat_luong_khong_khi_1992 <- read.csv("D:/tuhocr/chat_luong_khong_khi_1992.csv")

filter_theo_ngay_thang_final(, 
                             8, 
                             chat_luong_khong_khi_1992)



filter_theo_ngay_thang_final(ngay = 2:28, 
                             thang = 8:12, 
                             chat_luong_khong_khi_1992)

filter_theo_ngay_thang_final(ngay = 2:28, 
                             thang = 8:12, 
                             chat_luong_khong_khi_1992,
                             TRUE)

#############################################################

# 3/ VIẾT HÀM TƯƠNG TỰ CÓ CÙNG CÁC CHỨC NĂNG NHƯ HÀM VÍ DỤ NÀY (GỢI Ý SỬ DỤNG LỆNH FOR-LOOP)

# FUNCTION HOÀN CHỈNH 1

filter_theo_ngay_thang_ver2 <- function(ngay = 1:nrow(data_1), 
                                   thang = unique(airquality$Month),
                                   name_dataset = airquality
                                   ) {
    
    data_xuly <- name_dataset
    
    colnames(data_xuly) <- gsub(pattern = "^([Mm]{1})([Oo]{1})([Nn]{1})([Tt]{1})([Hh]{1})$",
                                colnames(data_xuly),
                                replacement = "Month")
    
    colnames(data_xuly) <- gsub(pattern = "^([Dd]{1})([Aa]{1})([Yy]{1})$",
                                colnames(data_xuly),
                                replacement = "Day")
    
    data_2 <- data.frame()
    
    for(thang_i in thang){
        data_1 <- data_xuly[data_xuly$Month == thang_i, ] 
        data_2 <- rbind(data_2, data_1)
    }
    kq <- data_2[data_2$Day %in% ngay, ]
    return(kq)
}

### TEST HÀM

data("airquality") 
airquality


filter_theo_ngay_thang_ver2(21:30, 8)
filter_theo_ngay_thang(21:30, 8)

filter_theo_ngay_thang_ver2(27:30, c(3, 5, 8))
filter_theo_ngay_thang(27:30, c(3, 5, 8))

# FUNCTION HOÀN CHỈNH 2

filter_theo_ngay_thang_final_ver2 <- function(ngay = 1:nrow(data_1), 
                                         thang = unique(airquality$Month),
                                         name_dataset = airquality,
                                         clean_na = FALSE # thêm tham số
) {
    
    data_raw <- filter_theo_ngay_thang_ver2(ngay, thang, name_dataset)
    
    if(clean_na == FALSE){
        return(data_raw)
    } else {
        complete.cases(data_raw)
        data_clean <- data_raw[complete.cases(data_raw), ]
        return(data_clean)
    }
    
}

########### TEST HÀM
a1 <- filter_theo_ngay_thang_final(14, 5)
a2 <- filter_theo_ngay_thang_final_ver2(14, 5)


a3 <- filter_theo_ngay_thang_final(22:30, 5)
a4 <- filter_theo_ngay_thang_final_ver2(22:30, 5)

a5 <- filter_theo_ngay_thang_final(22:30, 5, , TRUE)
a6 <- filter_theo_ngay_thang_final_ver2(22:30, 5, , TRUE)

a7 <- filter_theo_ngay_thang_final(22:30, , , TRUE)
a8 <- filter_theo_ngay_thang_final_ver2(22:30, , , TRUE)


a9 <-filter_theo_ngay_thang_final(22:30, 7:9, , TRUE)
a10 <-filter_theo_ngay_thang_final_ver2(22:30, 7:9, , TRUE)

a11 <- filter_theo_ngay_thang_final(22:30, 7:9)
a12 <- filter_theo_ngay_thang_final_ver2(22:30, 7:9)

chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")

a13 <- filter_theo_ngay_thang_final(ngay = 12:28, thang = 11, chat_luong_khong_khi_2022)
a14 <-filter_theo_ngay_thang_final_ver2(ngay = 12:28, thang = 11, chat_luong_khong_khi_2022)


a15 <- filter_theo_ngay_thang_final(ngay = 12:28, 
                             thang = 11, 
                             chat_luong_khong_khi_2022, 
                             TRUE)

a16 <- filter_theo_ngay_thang_final_ver2(ngay = 12:28, 
                             thang = 11, 
                             chat_luong_khong_khi_2022, 
                             TRUE)

identical(a1, a2)
identical(a3, a4)
identical(a5, a6)
identical(a7, a8)
identical(a9, a10)
identical(a11, a12)

identical(a13, a14)
identical(a15, a16)

##################################

# ỨNG DỤNG

chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")

ok_1 <- filter_theo_ngay_thang_final(, thang = 8, chat_luong_khong_khi_2022)

chat_luong_khong_khi_1992 <- read.csv("D:/tuhocr/chat_luong_khong_khi_1992.csv")

ok_2 <- filter_theo_ngay_thang_final(, thang = 5, chat_luong_khong_khi_1992)

plot(POLLUTION ~ Day, 
     data_2, 
     pch = 19, 
     col = "blue",
     type = "l",
     ylim = c(0, 30),
     main = "Mức độ ô nhiễm không khí")
points(POLLUTION ~ Day, 
       data_1, 
       pch = 19, 
       col = "red",
       type = "l",
       ylim = c(0, 30))
legend("topright", 
       lty = 1, 
       col = c("blue", "red"), 
       legend = c("1992", "2022"),
       cex = 1)

#######################################################

# PHÁT HIỆN LỖI FUNCTION

###### FUNCTION 1: FILTER BAO GỒM CẢ MISSING VALUE

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0){
    if(!(0 %in% thang)){
        data_1 <- airquality[airquality$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- airquality[airquality$Day %in% ngay, ]
        return(kq_2)
    }
}

# test hàm
filter_theo_ngay_thang(1:10, 5)
filter_theo_ngay_thang(, 9)
# chủ quan chưa test tình huống CỰC ĐOAN!!
filter_theo_ngay_thang( , thang = 0)
filter_theo_ngay_thang( , )

####################

## SỬA LỖI

###### FUNCTION 1: FILTER BAO GỒM CẢ MISSING VALUE

filter_theo_ngay_thang <- function(ngay = 1:31, thang = 0){
    if(!(0 %in% thang)){
        data_1 <- airquality[airquality$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- airquality[airquality$Day %in% ngay, ]
        return(kq_2)
    }
}



###################################


# FUNCTION HOÀN CHỈNH 1

filter_theo_ngay_thang <- function(ngay = 1:31, thang = 0, name_dataset = airquality){
    
    data_xuly <- name_dataset
    
    colnames(data_xuly) <- gsub(pattern = "^([Mm]{1})([Oo]{1})([Nn]{1})([Tt]{1})([Hh]{1})$",
                                colnames(data_xuly),
                                replacement = "Month")
    
    colnames(data_xuly) <- gsub(pattern = "^([Dd]{1})([Aa]{1})([Yy]{1})$",
                                colnames(data_xuly),
                                replacement = "Day")
    
    if(!(0 %in% thang)){
        data_1 <- data_xuly[data_xuly$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- data_xuly[data_xuly$Day %in% ngay, ]
        return(kq_2)
    }
}

# FUNCTION HOÀN CHỈNH 2

filter_theo_ngay_thang_final <- function(ngay = 1:31, 
                                         thang = 0,
                                         name_dataset = airquality,
                                         clean_na = FALSE # thêm tham số
) {
    
    data_raw <- filter_theo_ngay_thang(ngay, thang , name_dataset)
    
    if(clean_na == FALSE){
        return(data_raw)
    } else {
        complete.cases(data_raw)
        data_clean <- data_raw[complete.cases(data_raw), ]
        return(data_clean)
    }
    
}

####################

filter_theo_ngay_thang(1:10, 5)
filter_theo_ngay_thang_final(1:10, 5)
filter_theo_ngay_thang(, 9)
filter_theo_ngay_thang_final(, 5)

filter_theo_ngay_thang( , thang = 0)
filter_theo_ngay_thang( , )
filter_theo_ngay_thang_final( , )

##########################################

# FUNCTION HOÀN CHỈNH 1 SỬ DỤNG FOR-LOOP

filter_theo_ngay_thang_ver2 <- function(ngay = 1:31, 
                                        thang = 1:12,
                                        name_dataset = airquality
) {
    
    data_xuly <- name_dataset
    
    colnames(data_xuly) <- gsub(pattern = "^([Mm]{1})([Oo]{1})([Nn]{1})([Tt]{1})([Hh]{1})$",
                                colnames(data_xuly),
                                replacement = "Month")
    
    colnames(data_xuly) <- gsub(pattern = "^([Dd]{1})([Aa]{1})([Yy]{1})$",
                                colnames(data_xuly),
                                replacement = "Day")
    
    data_2 <- data.frame()
    
    for(thang_i in thang){
        data_1 <- data_xuly[data_xuly$Month == thang_i, ] 
        data_2 <- rbind(data_2, data_1)
    }
    kq <- data_2[data_2$Day %in% ngay, ]
    return(kq)
}

### TEST HÀM

# FUNCTION HOÀN CHỈNH 2

filter_theo_ngay_thang_final_ver2 <- function(ngay = 1:31, 
                                              thang = 1:12,
                                              name_dataset = airquality,
                                              clean_na = FALSE # thêm tham số
) {
    
    data_raw <- filter_theo_ngay_thang_ver2(ngay, thang, name_dataset)
    
    if(clean_na == FALSE){
        return(data_raw)
    } else {
        complete.cases(data_raw)
        data_clean <- data_raw[complete.cases(data_raw), ]
        return(data_clean)
    }
    
}

######################

########### TEST HÀM
a1 <- filter_theo_ngay_thang_final(14, 5)
a2 <- filter_theo_ngay_thang_final_ver2(14, 5)


a3 <- filter_theo_ngay_thang_final(22:30, 5)
a4 <- filter_theo_ngay_thang_final_ver2(22:30, 5)

a5 <- filter_theo_ngay_thang_final(22:30, 5, , TRUE)
a6 <- filter_theo_ngay_thang_final_ver2(22:30, 5, , TRUE)

a7 <- filter_theo_ngay_thang_final(22:30, , , TRUE)
a8 <- filter_theo_ngay_thang_final_ver2(22:30, , , TRUE)


a9 <-filter_theo_ngay_thang_final(22:30, 7:9, , TRUE)
a10 <-filter_theo_ngay_thang_final_ver2(22:30, 7:9, , TRUE)

a11 <- filter_theo_ngay_thang_final(22:30, 7:9)
a12 <- filter_theo_ngay_thang_final_ver2(22:30, 7:9)

chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")

a13 <- filter_theo_ngay_thang_final(ngay = 12:28, thang = 11, chat_luong_khong_khi_2022)
a14 <-filter_theo_ngay_thang_final_ver2(ngay = 12:28, thang = 11, chat_luong_khong_khi_2022)


a15 <- filter_theo_ngay_thang_final(ngay = 12:28, 
                                    thang = 11, 
                                    chat_luong_khong_khi_2022, 
                                    TRUE)

a16 <- filter_theo_ngay_thang_final_ver2(ngay = 12:28, 
                                         thang = 11, 
                                         chat_luong_khong_khi_2022, 
                                         TRUE)

identical(a1, a2)
identical(a3, a4)
identical(a5, a6)
identical(a7, a8)
identical(a9, a10)
identical(a11, a12)

identical(a13, a14)
identical(a15, a16)

########### TEST EXTREME

e1 <- filter_theo_ngay_thang_final( , )
e2 <- filter_theo_ngay_thang_final_ver2(, )


e3 <- filter_theo_ngay_thang_final( , 6)
e4 <- filter_theo_ngay_thang_final_ver2( , 6)


e5 <- filter_theo_ngay_thang_final(6, )
e6 <- filter_theo_ngay_thang_final_ver2(6, )


chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")
e7 <- filter_theo_ngay_thang_final(, 1:3 , chat_luong_khong_khi_2022)

e8 <- filter_theo_ngay_thang_final_ver2(, 1:3 , chat_luong_khong_khi_2022)

e9 <- filter_theo_ngay_thang_final(, , chat_luong_khong_khi_2022)

e10 <- filter_theo_ngay_thang_final_ver2(, , chat_luong_khong_khi_2022)

identical(e3, e4)
identical(e5, e6)
identical(e1, e2)
identical(e7, e8)
identical(e9, e10)





# ỨNG DỤNG

# Line chart

chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")

ok_1 <- filter_theo_ngay_thang_final(, thang = 8, chat_luong_khong_khi_2022)

chat_luong_khong_khi_1992 <- read.csv("D:/tuhocr/chat_luong_khong_khi_1992.csv")

ok_2 <- filter_theo_ngay_thang_final(, thang = 8, chat_luong_khong_khi_1992)

plot(POLLUTION ~ Day, 
     ok_1, 
     pch = 19, 
     col = "blue",
     type = "l",
     xlab = "Ngày",
     ylab = "Chỉ số ô nhiễm (%)",
     ylim = c(0, 25),
     main = "Mức độ ô nhiễm không khí")
points(POLLUTION ~ Day, 
       ok_2, 
       pch = 19, 
       col = "red",
       type = "l",
       ylim = c(0, 30))
legend("topright", 
       lty = 1, 
       col = c("blue", "red"), 
       legend = c("8/2022", "8/1992"),
       cex = 1)

##############################

# barplot

chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")

ok_3 <- filter_theo_ngay_thang_final(15, thang = 8:12, chat_luong_khong_khi_2022)

chat_luong_khong_khi_1992 <- read.csv("D:/tuhocr/chat_luong_khong_khi_1992.csv")

ok_4 <- filter_theo_ngay_thang_final(15, thang = 8:12, chat_luong_khong_khi_1992)

ok_3_2022 <- ok_3[ , c(3, 5)]
ok_3_2022
colnames(ok_3_2022) <- c(2022, "Month")

ok_4_1992 <- ok_4[ , c(3, 5)]
ok_4_1992
colnames(ok_4_1992) <- c(1992, "Month")
ok_4_1992

barplot_data <- cbind(ok_3_2022[1], ok_4_1992[1])
rownames(barplot_data) <- c("tháng 8", "tháng 9", "tháng 10", "tháng 11", "tháng 12")

barplot_data <- as.matrix(barplot_data)



# Define a set of colors
my_colors <- c("lightblue", "mistyrose", "lightcyan", 
               "lavender", "cornsilk")
# Bar plot
barplot(barplot_data, 
        col = my_colors, 
        beside = TRUE,
        ylim = c(0, 20),
        xlab = "Năm",
        ylab = "Chỉ số ô nhiễm (%)",
        main = "Mức độ ô nhiễm không khí ở ngày 15 hằng tháng")
# Add legend
legend("top", 
       legend = rownames(barplot_data), 
       horiz = TRUE,
       fill = my_colors, 
       box.lty = 0, 
       cex = 0.75)
abline(h = 10, col = "red", lty = 2, lwd = 2)

##############################

# boxplot

chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")

ok_5 <- filter_theo_ngay_thang_final(, thang = 4:6, chat_luong_khong_khi_2022)
ok_5
ok_5

chat_luong_khong_khi_1992 <- read.csv("D:/tuhocr/chat_luong_khong_khi_1992.csv")

ok_6 <- filter_theo_ngay_thang_final(, thang = 4:6, chat_luong_khong_khi_1992)
ok_6 

identical(ok_5, ok_6)


old.par <- par(mfrow = c(1, 2))

boxplot(POLLUTION ~ Month, 
        data = ok_5, 
        lwd = 1, 
        ylab = "Chỉ số ô nhiễm (%)",
        xlab = "2022",
        col = terrain.colors(5))

stripchart(POLLUTION ~ Month, 
           vertical = TRUE, 
           data = ok_5, 
           method = "jitter", 
           add = TRUE, 
           pch = 20, 
           col = 'blue')

boxplot(POLLUTION ~ Month, 
        data = ok_6, 
        lwd = 1, 
        ylab = NULL,
        xlab = "1992",
        col = 4:6)

stripchart(POLLUTION ~ Month, 
           vertical = TRUE, 
           data = ok_6, 
           method = "jitter", 
           add = TRUE, 
           pch = 20, 
           col = 'red')

mtext("Mức độ ô nhiễm không khí theo tháng giữa các năm",
      side = 3,
      line = -2,
      outer = TRUE)

par(old.par)