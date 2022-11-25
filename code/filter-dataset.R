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
filter_theo_ngay_thang(c(3, 14), 8)
filter_theo_ngay_thang(c(3, 14), 6:8)
filter_theo_ngay_thang(12:14, 1:10)

######################
# BÀI TẬP

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
                                clean_na = FALSE # thêm tham số
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

##################################
# 2/ BỔ SUNG TÍNH NĂNG XỬ LÝ DATASET CÓ CÙNG CẤU TRÚC MONTH, DAY NHƯNG KHÁC TÊN AIRQUALITY

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



########## CÁCH 2)

# xử lý chỗ thay đổi Month và Day đồng bộ về 1 style

colnames(chat_luong_khong_khi_2022)

test_1 <- c("Month", "month", "MONTH", "moNTH", "montH", "monnth", "monthh")

grep(pattern = "month", test, value = TRUE)

grep(pattern = "M|month", test, value = TRUE)

grep(pattern = "M|mO|onth", test, value = TRUE)

grep(pattern = "(M|m)(O|o)nth", test, value = TRUE)

grep(pattern = "[MONTH]|[month]", test, value = TRUE)

grep(pattern = "([MONTH]|[month]){3}", test, value = TRUE)

grep(pattern = "M", test, value = TRUE)

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

head(chat_luong_khong_khi_2022)
colnames(chat_luong_khong_khi_2022)[c(5, 6)] <- c("Month", "Day")

filter_theo_ngay_thang(ngay = 25, thang = 11, chat_luong_khong_khi_2022)

filter_theo_ngay_thang(ngay = 25, thang = 11) # thiếu tham số dataset để filter

filter_theo_ngay_thang(chat_luong_khong_khi_2022, ngay = 25:30, thang = c(7, 9, 2:3))

filter_theo_ngay_thang(chat_luong_khong_khi_2022, ngay = 25:31, thang = 0)

filter_theo_ngay_thang(chat_luong_khong_khi_2022, ngay = 25:31,)

filter_theo_ngay_thang(chat_luong_khong_khi_2022, ngay = 25:31)

filter_theo_ngay_thang(ngay = 25:10, , chat_luong_khong_khi_2022)

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
    
    data_raw <- filter_theo_ngay_thang(ngay, thang, name_dataset)
    
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

filter_theo_ngay_thang_final(ngay = 2:6, 
                             thang = 8:12, 
                             chat_luong_khong_khi_1992)

filter_theo_ngay_thang_final(ngay = 2:6, 
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






