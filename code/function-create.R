
# Liệt kê các lệnh trong R
names(methods:::.BasicFunsList)


# User-defined function

head(airquality)
dim(airquality)
names(airquality)

# Bước 1: Xây dựng những dòng lệnh thủ công, giải quyết bài toán cụ thể

# Tìm giá trị ở ngày 10 tháng 5 trong dataset airquality



with(airquality, airquality[Month == 5, ])

subset(airquality, Month == 5)

airquality[airquality$Month == 5, ]

# get("Month" == 5, airquality)

identical(data_1, data_2)

data_3 <- airquality[airquality$Month == 5, ]
data_3

identical(data_1, data_3)

with(airquality, airquality[Month == 5, ])

# Viết 1 hàm để tách ra dữ liệu ở ngày xxx trong tháng yyy

data_1 <- with(airquality, airquality[Month == 5, ])

subset(data_1, Day == 10)

filter_theo_ngay_thang <- function(ngay, thang){
data_1 <- with(airquality, airquality[Month == thang, ])
kq <- subset(data_1, Day == ngay)
return(kq)
###################

filter_theo_ngay_thang <- function(ngay, thang){
    data_1 <- with(airquality, airquality[Month == thang, ])
    kq <- data_1[ngay, ]
    return(kq)
}

filter_theo_ngay_thang <- function(ngay, thang){
    data_1 <- airquality[airquality$Month == thang, ]
    kq <- data_1[ngay, ]
    return(kq)
}


filter_theo_ngay_thang(10, 9)
filter_theo_ngay_thang(10:20, 9)
filter_theo_ngay_thang(1:30, 9)
filter_theo_ngay_thang(1:31, 9)
filter_theo_ngay_thang(, 9)

######### CẢI TIẾN HÀM: 

# 1/ LIỆT KÊ TẤT CẢ CÁC NGÀY TRONG THÁNG

filter_theo_ngay_thang(, 9)

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang){
    data_1 <- airquality[airquality$Month == thang, ]
    kq <- data_1[ngay, ]
    return(kq)
}

filter_theo_ngay_thang(, 8)
filter_theo_ngay_thang(, 7)


data_1 <- airquality[airquality$Month == 9, ]
data_1[seq_along(data_1), ]
seq_along(data_1)

######### CẢI TIẾN HÀM: 

# 2/ LIỆT KÊ TẤT CẢ CÁC THÁNG CÓ CÙNG SỐ NGÀY

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang){
    data_1 <- airquality[airquality$Month == thang, ]
    kq <- data_1[ngay, ]
    return(kq)
}


filter_theo_ngay_thang(9, ) # Liệt kê tất cả tháng có ngày 9

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0){
    if(thang != 0) { 
        data_1 <- airquality[airquality$Month == thang, ]
        kq <- data_1[ngay, ]
    return(kq)
    } else {
        kq_2 <- with(airquality, airquality[airquality$Day %in% ngay, ])        
        return(kq_2)     
        }
}

filter_theo_ngay_thang(12, )

filter_theo_ngay_thang(15:30, 8)

filter_theo_ngay_thang(, 8)

filter_theo_ngay_thang(c(3, 14), 8)

filter_theo_ngay_thang(c(3, 14), 6:8)

###############################################################

######### CẢI TIẾN HÀM: 

# 3/ LIỆT KÊ TẤT CẢ CÁC THÁNG CÓ CÙNG SỐ NGÀY

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0){
    if(thang != 0) { 
        
        for(thang_i in thang){
            data_1 <- airquality[airquality$Month == thang_i, ]
            kq <- data_1[ngay, ]
            return(kq)
        }

    } else {
        kq_2 <- with(airquality, airquality[Day == ngay, ])        
        return(kq_2)     
    }
}





################ SỬA LẠI HÀM LOOP

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0){
    if(thang != 0) { 
        for(thang_i in thang){
            data_1 <- airquality[airquality$Month == thang_i, ]
        }
        kq <- data_1[ngay, ]
        return(kq)
    } else {
        kq_2 <- with(airquality, airquality[Day == ngay, ])        
        return(kq_2)     
    }
}

rm(list = ls())
for(thang_i in 6:8){
    data_1 <- airquality[airquality$Month == thang_i, ]
    data_1
} # lấy giá trị cuối của chuỗi

rm(list = ls())
for(thang_i in 6:8){
    data_1 <- airquality[airquality$Month == thang_i, ]
    return(data_1) # lấy giá trị ĐẦU của chuỗi
}

rm(list = ls())
for(thang_i in 6:8){
    data_1 <- airquality[airquality$Month == thang_i, ]
    print(data_1) # in toàn bộ giá trị
}

rm(list = ls())
# 1

data_2 <- data.frame()
for(thang_i in 6:8){
    data_1 <- airquality[airquality$Month == thang_i, ] 
    data_2 <- rbind(data_2, data_1)
}


data_2

vec_1 <- c(3, 6 , 7)
data_2$Day

vec_1 %in% data_2$Day

data_2$Day %in% vec_1

data_2[data_2$Day %in% vec_1, ] # 2

######################################

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = "f"){
    if(thang != 0) { 

        data_2 <- data.frame()
        for(thang_i in 6:8){
            data_1 <- airquality[airquality$Month == thang_i, ] 
            data_2 <- rbind(data_2, data_1)
        }
        kq <- data_2[data_2$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- with(airquality, airquality[Day == ngay, ])        
        return(kq_2)     
    }
}


filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0){

        data_1 <- airquality[airquality$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)

}

#############

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = 0){
    if(!(0 %in% thang)) {
        data_1 <- airquality[airquality$Month %in% thang, ]
        kq <- data_1[data_1$Day %in% ngay, ]
        return(kq)
    } else {
        kq_2 <- airquality[airquality$Day %in% ngay, ]
        return(kq_2)
    }
}

filter_theo_ngay_thang(1:3, 7:9)
filter_theo_ngay_thang(1:3, 7)
filter_theo_ngay_thang(1:3, )
 







####################


filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang){
        data_2 <- data.frame()
        for(thang_i in thang){
            data_1 <- airquality[airquality$Month == thang_i, ] 
            data_2 <- rbind(data_2, data_1)
        }
        kq <- data_2[data_2$Day %in% ngay, ]
        return(kq)
}


########### TEST HÀM

filter_theo_ngay_thang(12, )

filter_theo_ngay_thang(15:30, 8)

filter_theo_ngay_thang(, 8)

filter_theo_ngay_thang(c(3, 14), 8)

filter_theo_ngay_thang(c(3, 14), 6:8)

filter_theo_ngay_thang(12:14, 1:10)

################################# Version 3

filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), thang = unique(airquality$Month)){
    data_2 <- data.frame()
    for(thang_i in thang){
        data_1 <- airquality[airquality$Month == thang_i, ] 
        data_2 <- rbind(data_2, data_1)
    }
    kq <- data_2[data_2$Day %in% ngay, ]
    return(kq)
}

unique(airquality$Month)

################################# Version 4 có chức năng loại/không loại missing value

data_3 <- filter_theo_ngay_thang(c(3, 14), 6:8)
complete.cases(data_3)
data_3[complete.cases(data_3), ]

filter_theo_ngay_thang_final <- function(ngay, thang, loai_na = FALSE){
    data_3 <- filter_theo_ngay_thang(ngay, thang)
    if(loai_na == FALSE){
        return(data_3)
    } else {
        complete.cases(data_3)
        data_3[complete.cases(data_3), ]
    }
}

filter_theo_ngay_thang_final(14, 5)
filter_theo_ngay_thang_final(14:30, 5)
filter_theo_ngay_thang_final(14:30, 5, TRUE)
dim(filter_theo_ngay_thang_final(14:30, 5:9, TRUE))
dim(filter_theo_ngay_thang_final(14:30, 5:9, FALSE))

########################################

# CẢI TIẾN CHO DATASET TÊN BẤT KỲ


filter_theo_ngay_thang <- function(ngay = 1:nrow(data_1), 
                                   thang = unique(airquality$Month),
                                   ...){
    data_2 <- data.frame()
    for(thang_i in thang){
        data_1 <- ...[...$Month == thang_i, ] 
        data_2 <- rbind(data_2, data_1)
    }
    kq <- data_2[data_2$Day %in% ngay, ]
    return(kq)
}

filter_theo_ngay_thang(10, 5, airquality)

########################################

filter_theo_ngay_thang_final_v2 <- function(ngay, thang, loai_na = FALSE, ...){
    data_3 <- filter_theo_ngay_thang(ngay, thang, ...)
    if(loai_na == FALSE){
        return(data_3)
    } else {
        complete.cases(data_3)
        data_3[complete.cases(data_3), ]
    }
}

filter_theo_ngay_thang_final_v2(10:16, 5:8, TRUE, airquality)

thoitiet <- airquality

head(thoitiet)

filter_theo_ngay_thang_final_v2(10:16, 5:8, TRUE, thoitiet)

#######






# Binary operator so sánh dim 2 dataset để đánh giá độ lớn dataset

class(dim(airquality))
class(dim(mtcars))

dim(airquality) / dim(mtcars)
dim(mtcars) / dim(airquality)


"%compare%" <- function(a, b)
{
    dim(a) / dim(b)
}

airquality %compare% mtcars
mtcars %compare% airquality


###################### CẢI TIẾN HÀM 

"%compare%" <- function(a, b)
{
    tyle <- round(dim(a) / dim(b), digits = 2)
    if(tyle[1] > 1){
        kqss_1 <- paste("Dataset", a, "lớn hơn", "dataset", b, tyle, "lần, tính theo số hàng" )
        return(kqss_1)
    } else {
        kqss_2 <- paste("Dataset", a, "nhỏ hơn", "dataset", b, tyle, "lần, tính theo số hàng" )
        return(kqss_2)
    }
}

######################  TIẾP TỤC CẢI TIẾN HÀM 

"%compare%" <- function(a, b)
{
    tyle <- round(dim(a) / dim(b), digits = 2)
    if(tyle[1] > 1){
        kqss_1 <- paste("Dataset", as.name("a"), "lớn hơn", "dataset", as.name("b"), tyle, "lần, tính theo số hàng" )
        return(kqss_1)
    } else {
        kqss_2 <- paste("Dataset", as.name("a"), "nhỏ hơn", "dataset", as.name("b"), tyle, "lần, tính theo số hàng" )
        return(kqss_2)
    }
}

######################  TIẾP TỤC CẢI TIẾN HÀM FINAL

"%compare%" <- function(a, b)
{
    tyle <- round(dim(a) / dim(b), digits = 2)
    if(tyle[1] > 1){
        kqss_1 <- paste("Dataset", as.name("a"), "lớn hơn", "dataset", as.name("b"), tyle[1], "lần, tính theo số hàng" )
        return(kqss_1)
    } else {
        kqss_2 <- paste("Dataset", as.name("a"), "nhỏ hơn", "dataset", as.name("b"), tyle[1], "lần, tính theo số hàng" )
        return(kqss_2)
    }
}

airquality %compare% mtcars
PlantGrowth %compare% mtcars









