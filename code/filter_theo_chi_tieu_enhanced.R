### HƯỚNG DẪN SỬ DỤNG R TỪ A ĐẾN Z
### LIÊN HỆ MR. DUC NGUYEN | WWW.TUHOCR.COM

### CẢI TIẾN:
## SỬ DỤNG dplyr::bind_rows() thay thế rbind() cho các file .csv có cấu trúc cột không đồng nhấts
## CHECK ĐIỀU KIỆN CÁC CỘT KHÔNG CÓ TÊN TRÙNG NHAU trong lệnh for-loop


library(dplyr)

## FUNCTION_MIN_CHI_TIEU

"%min_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")
    }
    # find min value     
    
    ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        if(chi_tieu %in% names(tmp_working[[min_i]])){
            
            gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
            
            ### trích xuất ra vị trí index
            vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
            
            ket_qua_min <- bind_rows(ket_qua_min, tmp_working[[min_i]][vi_tri, ])
        }
        next
    }
    #### THÊM DÒNG THÔNG BÁO
    print(paste("Kết quả lọc theo giá trị MIN của", chi_tieu, "ở folder", b, "là:"))
    #### TRẢ KẾT QUẢ
    return(ket_qua_min)    
}    

## test
# chi_tieu <- "nitrite"
# 1 %min_chi_tieu% "2007"
# 1 %min_chi_tieu% "2008"
# 
# chi_tieu <- "COD"
# 1 %min_chi_tieu% "2007"
# 1 %min_chi_tieu% "2008"

## FUNCTION_MAX_CHI_TIEU

"%max_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")
    }
    # find max value     
    
    ket_qua_max <- data.frame()
    
    for(max_i in seq_along(tmp_working)) { 
        
        if(chi_tieu %in% names(tmp_working[[max_i]])){
            
            gia_tri_max <- max(get(chi_tieu, tmp_working[[max_i]]), na.rm = TRUE)
            
            ### trích xuất ra vị trí index
            vi_tri <- which(get(chi_tieu, tmp_working[[max_i]]) == gia_tri_max)
            
            ket_qua_max <- bind_rows(ket_qua_max, tmp_working[[max_i]][vi_tri, ])
        }
        next
    }
    #### THÊM DÒNG THÔNG BÁO
    print(paste("Kết quả lọc theo giá trị MAX của", chi_tieu, "ở folder", b, "là:"))
    #### TRẢ KẾT QUẢ
    return(ket_qua_max)    
}

## test
# chi_tieu <- "mercury"
# 1 %max_chi_tieu% "2007"
# 1 %max_chi_tieu% "2008"
# 
# chi_tieu <- "COD"
# 1 %max_chi_tieu% "2007"
# 1 %max_chi_tieu% "2008"

### FUNCTION RANGE CHỈ TIÊU

"%range_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)){ 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")
    }
    
    # tìm trong khoảng
    
    ket_qua_range <- data.frame()
    
    for(range_i in seq_along(tmp_working)){
        
        if(chi_tieu %in% names(tmp_working[[range_i]])) {
            
            ket_qua_tim_trong_khoang <- which(get(chi_tieu, tmp_working[[range_i]]) >= a[1] & get(chi_tieu, tmp_working[[range_i]]) <= a[2])
            
            ket_qua_range <- bind_rows(ket_qua_range, tmp_working[[range_i]][ket_qua_tim_trong_khoang, ])
        }
        next
    }
    print(paste("Kết quả lọc trong khoảng, từ", a[1], "đến", a[2], "của", chi_tieu, "ở folder", b, "là:"))
    return(ket_qua_range ) 
} 

### TEST HÀM
## test
# chi_tieu <- "mercury"
# c(1, 1.2) %range_chi_tieu% "2007"
# c(1, 1.2) %range_chi_tieu% "2008"
# 
# chi_tieu <- "COD"
# c(1, 1.2) %range_chi_tieu% "2007"
# c(1, 1.2) %range_chi_tieu% "2008"


### function chung

"%chi_tieu%" <- function(a, b){
    
    if(length(a) == 1){
        switch(a, 
               "min" = a %min_chi_tieu% b, 
               "max" = a %max_chi_tieu% b)
    } else {
        a %range_chi_tieu% b
    }
    
}  

### FUNCTION FINAL

filter_theo_chi_tieu_enhanced <- function(chi_tieu = "mercury", a = "min", b = "2007"){
    chi_tieu <<- chi_tieu ### sử dụng super assign
    a %chi_tieu% b
}

### TEST HÀM

# filter_theo_chi_tieu_enhanced(, ,)
# filter_theo_chi_tieu_enhanced(, , "2008")
# 
# filter_theo_chi_tieu_enhanced("COD", "max", "2008")
# filter_theo_chi_tieu_enhanced("COD", "max", "2007")
# 
# filter_theo_chi_tieu_enhanced("COD", c(0.8, 0.9), "2007")
# filter_theo_chi_tieu_enhanced("COD", c(0.8, 0.9), "2008")
# 
# filter_theo_chi_tieu_enhanced("nitrite", c(0.8, 0.9), "2007")
# filter_theo_chi_tieu_enhanced("nitrite", c(0.8, 0.9), "2008")

#######################

## sắp xếp thứ tự tên cột

data_1 <- filter_theo_chi_tieu_enhanced("nitrite", c(0.8, 0.9), "2008")

names(data_1)
sort(names(data_1)[])

!(names(data_1) %in% c("Date", "ID"))

names(data_1)[!(names(data_1) %in% c("Date", "ID"))]

sort(names(data_1)[!(names(data_1) %in% c("Date", "ID"))])

kq_sort <- sort(names(data_1)[!(names(data_1) %in% c("Date", "ID"))])

names(data_1) -> ok

ok <- c("Date", kq_sort, "ID")
ok

data_1
head(data_1)

data_2 <- data_1[ok]
head(data_2)

### dùng lệnh sort là đủ. Không cần dùng lệnh order vì tên cột trong dataset luôn phải khác nhau, không sợ bị trùng.

##################

filter_theo_chi_tieu_super <- function(chi_tieu = "mercury", a = "min", b = "2007") {
    
    data_1 <- filter_theo_chi_tieu_enhanced(chi_tieu, a, b)
    if(length(data_1) != 0) {
        
        kq_sort <- sort(names(data_1)[!(names(data_1) %in% c("Date", "ID"))])
        
        ok <- c("Date", kq_sort, "ID")
        
        data_2 <- data_1[ok]
        
        return(data_2)  
        
    }
    
    return("Không có kết quả tìm kiếm")

}

## TEST

filter_theo_chi_tieu_super(, ,)
filter_theo_chi_tieu_super(, , "2008")

filter_theo_chi_tieu_super("COD", "max", "2008")
filter_theo_chi_tieu_super("COD", "max", "2007")

filter_theo_chi_tieu_super("COD", c(0.8, 0.9), "2007")
filter_theo_chi_tieu_enhanced("COD", c(0.8, 0.9), "2007")

filter_theo_chi_tieu_super("COD", c(0.8, 0.9), "2008")

filter_theo_chi_tieu_super("nitrite", c(0.8, 0.9), "2007")
filter_theo_chi_tieu_super("nitrite", c(0.8, 0.9), "2008")

##########


### HƯỚNG DẪN SỬ DỤNG R TỪ A ĐẾN Z
### LIÊN HỆ MR. DUC NGUYEN | WWW.TUHOCR.COM



#########################################


# 
# ###
# b <- "2008"
# 
# chi_tieu <- "COD"
# 
# ket_qua_min <- data.frame()
# 
# for(min_i in seq_along(tmp_working)) { 
#     
#     gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
#     
#     ### trích xuất ra vị trí index
#     vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
#     
#     ket_qua_min <- bind_rows(ket_qua_min, tmp_working[[min_i]][vi_tri, ])
#     }
# 
# ket_qua_min 
# 
# chi_tieu <- "nitrite"
# 
# names(tmp_working[[1]])
# names(tmp_working[[2]])
# 
# str(tmp_working)
# 
# 
# intersect(names(tmp_working[[1]]), "COD")
# 
# "COD" %in% names(tmp_working[[2]])
# 
# "COD" %in%  names(tmp_working[[1]])
# 
# while("COD" %in% names(tmp_working[[i]])) {
# }
# 
# 
# for(min_i in seq_along(tmp_working)) { 
#     
#     if("COD" %in% names(tmp_working[[min_i]])){
#     
#     gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
#     
#     ### trích xuất ra vị trí index
#     vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
#     
#     ket_qua_min <- bind_rows(ket_qua_min, tmp_working[[min_i]][vi_tri, ])
#     }
#     next
# }
# 
# ################################
# 









