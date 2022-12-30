## DOWNLOAD 

# Bài tập
# https://tinyurl.com/4sm9ce76
# Giải nén ra folder specdata rồi đặt trong folder project R của bạn.
# Folder này chứa 332 file csv tương ứng 332 cảm biến theo dõi chỉ tiêu sulfate và nitrate chất lượng nước ở các địa điểm khác nhau.

#### ĐỀ BÀI
# https://rpubs.com/tuhocr/projectcdr

#### ĐÁP ÁN
# https://rpubs.com/tanduc307/projectcdr-solution

############

### CÂU 1: Ở dataset 020.csv có 
# a) bao nhiêu dòng, bao nhiêu cột
# b) bao nhiêu giá trị missing value ở cột sulfate
# c) bao nhiêu giá trị missing value ở cột nitrate
# d) bao nhiêu giá trị missing value ở cả 2 cột sulfate và nitrate
# e) có bao nhiêu ngày quan sát nào có ĐỦ CẢ 2 giá trị theo dõi.
# f) Tìm giá trị trung bình, max, min ở từng cột cho 2 trường hợp: 
    # f.1) loại missing value riêng từng cột
    # f.2) loại missing value cho toàn bộ (tức là ở những cột có đủ 2 giá trị)


#############

### ĐÁP ÁN CÂU 1)

##### LÀM SẠCH DATASET TRƯỚC KHI TRẢ LỜI CÂU HỎI
# Load dataset

data_020 <- read.csv("specdata/020.csv")

# Kiểm tra dataset
head(data_020)
dim(data_020)
length(data_020)
names(data_020)
sapply(data_020, class)
str(data_020)
summary(data_020)

# Chuyển cột Date character thành Date chuẩn
data_020$Date <- as.Date(data_020$Date, 
                         format = "%Y-%m-%d")
sapply(data_020, class)

#####
# a) bao nhiêu dòng, bao nhiêu cột
dim(data_020)
# [1] 1461    4

# b) bao nhiêu giá trị missing value ở cột sulfate
length(data_020$sulfate)

summary(data_020$sulfate)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#   0.472   2.147   3.180   3.625   4.890  14.400    1337

sum(is.na(data_020$sulfate))

a <- c(F, T, T, F, F)
a
sum(a)
mode(a)
typeof(a)
storage.mode(a)
as.numeric(a)

b <- c(-1, 0, 1, 0, 2, 1, 0)
b
as.logical(b)
####### Khi sum thì False là 0, còn True là 1

d <- c(F, T, T, F, F, NA, NA)
d
as.numeric(d)
d
is.na(d)
as.numeric(is.na(d))
sum(as.numeric(is.na(d)))
sum(is.na(d))

###################

# c) bao nhiêu giá trị missing value ở cột nitrate

length(data_020$nitrate)
sum(is.na(data_020$nitrate))
sum(!is.na(data_020$nitrate))
sum(is.na(data_020$nitrate)) + sum(!is.na(data_020$nitrate))

###################

# d) bao nhiêu giá trị missing value ở cả 2 cột sulfate và nitrate
summary(data_020)
data_020$sulfate
data_020$nitrate

a <- c(1:3, NA, NA, 3:6)
length(a)
b <- c(NA, NA, NA, NA, NA, 2:5)
length(b)
df <- data.frame(a, b)
df

na.omit(df)
complete.cases(df)

which(is.na(df$a))
which(is.na(df$b))

intersect(which(is.na(df$a)), which(is.na(df$b)))
intersect(which(is.na(df$b)), which(is.na(df$a)))

length(intersect(which(is.na(df$a)), which(is.na(df$b))))

length(intersect(which(is.na(data_020$sulfate)), which(is.na(data_020$nitrate))))
# [1] 1333

summary(data_020)
### câu hỏi là nitrate có 1333 giá trị NA, sulfate có 1337. Làm sao confirm là toàn bộ những NA của nitrate đều ở những ngày sulfate cũng NA luôn, có ngày nào có đo nitrate mà không đo sulfate không?

a
b
length(intersect(which(is.na(df$a)), which(is.na(df$b))))

which(is.na(df$a))

intersect(which(is.na(df$a)), which(is.na(df$b)))

### LỆNH IDENTICAL GIÚP CHECK LẠI
identical(which(is.na(df$a)),
          intersect(which(is.na(df$a)), which(is.na(df$b))))

identical(which(is.na(df$b)),
          intersect(which(is.na(df$a)), which(is.na(df$b))))


### TƯƠNG TỰ

### CONFIRM LÀ TOÀN BỘ GIÁ TRỊ NA TRONG NITRATE CŨNG TRÙNG HỢP VỚI CÁC GIÁ TRỊ NA CỦA 2 CHỈ TIÊU, HAY NÓI CÁCH KHÁC, HỄ MÀ KHÔNG CÓ ĐO NITRATE THÌ CHẮC CHẮN CŨNG KHÔNG ĐO SULFATE
identical(which(is.na(data_020$nitrate)),
          intersect(which(is.na(data_020$nitrate)), which(is.na(data_020$sulfate))))

### CONFIRM SULFATE LÀ KHÁC
identical(which(is.na(data_020$sulfate)),
          intersect(which(is.na(data_020$nitrate)), which(is.na(data_020$sulfate))))

## có vài ngày không đo sulfate nhưng lại có đo nitrate!!!
summary(data_020)

# những ngày không đo sulfate
which(is.na(data_020$sulfate))

# những ngày không đo sulfate và nitrate
intersect(which(is.na(data_020$nitrate)), which(is.na(data_020$sulfate)))

length(intersect(which(is.na(data_020$nitrate)), which(is.na(data_020$sulfate))))

#####################

a
b
which(is.na(df$b))
intersect(which(is.na(df$a)), which(is.na(df$b)))

## tìm những cái thuộc [tập hợp 1] mà không thuộc [tập hợp 2] 
setdiff(which(is.na(df$b)),
        intersect(which(is.na(df$a)), which(is.na(df$b))))

## tìm những cái thuộc [tập hợp 2] mà không thuộc [tập hợp 1] 
setdiff(intersect(which(is.na(df$a)), which(is.na(df$b))),
        which(is.na(df$b)))

############
## có vài ngày không đo sulfate nhưng lại có đo nitrate!!!
summary(data_020)

setdiff(which(is.na(data_020$sulfate)),
        intersect(which(is.na(data_020$nitrate)), which(is.na(data_020$sulfate))))

ko_do_sulfate <- setdiff(which(is.na(data_020$sulfate)),
                         intersect(which(is.na(data_020$nitrate)), which(is.na(data_020$sulfate))))

data_020[ko_do_sulfate, ]

#########################################################

# e) có bao nhiêu ngày quan sát nào có ĐỦ CẢ 2 giá trị theo dõi.

### cách 1:
a
b
a + b
length(a + b)
sum(is.na(a + b))
length(a + b) - sum(is.na(a + b))

length(data_020$sulfate + data_020$nitrate) - sum(is.na(data_020$sulfate + data_020$nitrate))
# [1] 124

### cách 2:

data_020
summary(data_020)

### Giao nhau không có NA ở cả 2 cột
intersect(which(is.na(data_020$nitrate)), which(is.na(data_020$sulfate)))

### NHỮNG NGÀY CÓ GIÁ TRỊ Ở NITRATE

which(!is.na(data_020$nitrate))

### NHỮNG NGÀY CÓ GIÁ TRỊ Ở SULFATE

which(!is.na(data_020$sulfate))

intersect(which(!is.na(data_020$nitrate)), which(!is.na(data_020$sulfate)))

length(intersect(which(!is.na(data_020$nitrate)), which(!is.na(data_020$sulfate))))
# [1] 124

### cách 3:

dim(na.omit(data_020))

str(na.omit(data_020))

sum(complete.cases(data_020))


# f) Tìm giá trị trung bình, max, min ở từng cột cho 2 trường hợp:
# f.1) loại missing value riêng từng cột
mean(data_020$sulfate, na.rm = TRUE)
max(data_020$sulfate, na.rm = TRUE)
min(data_020$sulfate, na.rm = TRUE)

mean(data_020$nitrate, na.rm = TRUE)
max(data_020$nitrate, na.rm = TRUE)
min(data_020$nitrate, na.rm = TRUE)

funs <- list(gia_tri_trung_binh = mean, cuc_dai = max, cuc_tieu = min)
funs

## trả về matrix kết quả
sapply(funs, function(x) sapply(data_020[, 2:3], x, na.rm = TRUE))
sapply(funs, mapply, data_020[, 2:3], na.rm = TRUE)
# https://stackoverflow.com/questions/30759367/apply-list-of-functions-to-list-of-values

# f.2) loại missing value cho toàn bộ (tức là ở những cột có đủ 2 giá trị)

dim(data_020)
dim(na.omit(data_020))

sapply(funs, function(x) sapply(na.omit(data_020)[, 2:3], x))

identical(sapply(funs, function(x) sapply(data_020[, 2:3], x, na.rm = TRUE)), sapply(funs, function(x) sapply(na.omit(data_020)[, 2:3], x)))

match(sapply(funs, function(x) sapply(data_020[, 2:3], x, na.rm = TRUE)), sapply(funs, function(x) sapply(na.omit(data_020)[, 2:3], x)))

sapply(funs, function(x) sapply(data_020[, 2:3], x, na.rm = TRUE)) == sapply(funs, function(x) sapply(na.omit(data_020)[, 2:3], x))

### check lại chỗ nitrate

data_020[ko_do_sulfate, ]

data_020[ko_do_sulfate, ]$nitrate

mean(na.omit(data_020)$nitrate)

mean(data_020$nitrate, na.rm = TRUE)

nitrate_all <- c(na.omit(data_020)$nitrate, data_020[ko_do_sulfate, ]$nitrate)

mean(nitrate_all)









###########################################################

### CÂU 2: XÂY DỰNG FUNCTION TRẢ KẾT QUẢ GIÁ TRỊ COMPLETE OBSERVATION CHO CÁC DATASET

# > complete("specdata", id = 18:22)
# id    full_quan_sat
# 1 18   84
# 2 19  353
# 3 20  124 ← đây chính là câu 1e) tính thủ công
# 4 21  426
# 5 22  135

# chú thích: full_quan_sat là number of observations, tức là số ngày quan sát đủ cả 2 chỉ tiêu.

###########################################################












### ĐÁP ÁN CÂU 2)

## cách 1:
complete_1 <- function(directory = "specdata", id){
    
    files_list <- list.files(directory, full.names = TRUE)
    tmp <- files_list[c(id)] # Đây là chỗ tùy chọn
    tmp_working <- vector(mode = "list", length = length(tmp))
    
    for (i in seq_along(tmp)) { 
        tmp_working[[i]] <- read.csv(tmp[[i]]) # Kiểu subset của tmp_working là dạng list tách ra dạng bảng
    }
    
    output_tmp_working <- do.call(rbind, tmp_working)
    
    y <- unique(output_tmp_working$ID) # Đếm số lần xuất hiện (number of occurences for each unique value)
    
    extract_data <- data.frame(matrix(ncol = 2, nrow = 0))
    
    for (uu in seq_along(y)) { 
        happy <- output_tmp_working[which(output_tmp_working[, "ID"] == y[uu]),]
        
        sul <- happy[,2]
        nit <- happy[,3]
        tot <- sul + nit
        sum(is.na(tot)) #Hàm đếm missing values trong vector  
        nobs <- length(tot) - sum(is.na(tot))
        extract_data <- rbind(extract_data, c(y[uu], nobs))
    }
    x <- c("cam_bien", "full_quan_sat")
    colnames(extract_data) <- x
    return(extract_data)
}

## cách 2:

complete_2 <- function(directory = "specdata", id){
    
    # import dataset
    files_list <- list.files(directory, full.names = TRUE,
                             pattern = ".csv") # set này để chọn riêng file .csv

    tmp_working <- lapply(files_list[id], read.csv) 
    
    # FUNCTION
    
    check_full_quan_sat <- function(id){
        
        raw <- tmp_working[[id]] 
        
        check_1 <- which(!is.na(raw$nitrate))
        check_2 <- which(!is.na(raw$sulfate))
        
        ra_soat <- intersect(check_1, check_2)
        
        length(ra_soat)
    }
    
    full_quan_sat <- sapply(seq_along(tmp_working), check_full_quan_sat)
    
    full_quan_sat <- as.data.frame(full_quan_sat)

    ket_qua <- cbind(cam_bien = id, full_quan_sat)

    return(ket_qua)
}

## test
complete_2("specdata", id = 1:10)
complete_1("specdata", id = 1:10)

complete_2("specdata", id = 2)
complete_1("specdata", id = 2)

complete_2("specdata", id = c(2, 33:39, 192:194))
complete_1("specdata", id = c(2, 33:39, 192:194))










# > complete_2(, 1:4)
# full_quan_sat cam_bien
# 1           117        1
# 2          1041        2
# 3           243        3
# 4           474        4

### lỗi này vì ở thời điểm load cái 2 vào thì lại chưa có nhé!!
# > complete_2(, 2)
# Error in tmp_working[[id]] : subscript out of bounds


# ################ SỬA LẠI:
# 
# ## cách 2_FINAL:
# 
# complete_2_final <- function(directory = "specdata", id){
#     
#     # import dataset
#     files_list <- list.files(directory, full.names = TRUE,
#                              pattern = ".csv") # set này để chọn riêng file .csv
#     
#     tmp_working <- lapply(files_list[id], read.csv) 
#     
#     # FUNCTION
#     check_full_quan_sat <- function(check_id){
#         
#         raw <- tmp_working[[check_id]] 
#         
#         check_1 <- which(!is.na(raw$nitrate))
#         check_2 <- which(!is.na(raw$sulfate))
#         
#         ra_soat <- intersect(check_1, check_2)
#         
#         length(ra_soat)
#     }
#     
#     # sửa lại chỗ sapply seq_along(tmp_working)
#     full_quan_sat <- sapply(seq_along(tmp_working), check_full_quan_sat)
#     
#     full_quan_sat <- as.data.frame(full_quan_sat)
#     
#     ket_qua <- cbind(cam_bien = id, full_quan_sat)
#     
#     return(ket_qua)
# }

#############################

# TEST HÀM

complete_1("specdata", 1:10)
complete_2("specdata", 1:10)
identical(complete_1("specdata", 1:10), complete_2("specdata", 1:10))

complete_1(, 18:42)
complete_2(, 18:42)
identical(complete_1(, 18:42), complete_2(, 18:42))


system.time(complete_1( , 1:332))

system.time(complete_2( , 1:332))

identical(complete_1( , 1:332), complete_2( , 1:332))

###########################################################

### CÂU 3: XÂY DỰNG FUNCTION TRẢ KẾT QUẢ GIÁ TRỊ MEAN Ở TỪNG CHỈ TIÊU, THEO GIÁ TRỊ ID

# > pollutantmean(, "nitrate", 3:10)
# [1] 0.7471877

# > pollutantmean(, "nitrate", 20)
# [1] 0.7780469

# > pollutantmean(, "sulfate", 1:332)
# [1] 3.189369

###########################################################

### ĐÁP ÁN CÂU 3)

# cách 1:

pollutantmean <- function(directory = "specdata", pollutant, id = 1:332) {
    files_list <- list.files(directory, full.names = TRUE)
    tmp <- files_list[id] # Đây là chỗ tùy chọn
    tmp_working <- vector(mode = "list", length = length(tmp))
    for (i in seq_along(tmp)) { # Lưu ý là seq_along() khác với length()
        tmp_working[[i]] <- read.csv(tmp[[i]])
    }
    output_tmp_working <- do.call(rbind, tmp_working)
    mean(output_tmp_working[, pollutant], na.rm = TRUE)
}

# cách 2:

pollutantmean_v2 <- function(directory = "specdata", pollutant, id = 1:332) {
    
    # import dataset
    files_list <- list.files(directory, full.names = TRUE,
                             pattern = ".csv") # set này để chọn riêng file .csv
    
    tmp_working <- lapply(files_list[id], read.csv) 
    
    # gom chung 1 dataset
    output_tmp_working <- do.call(rbind, tmp_working)
    mean(output_tmp_working[, pollutant], na.rm = TRUE)
}

### TEST HÀM
pollutantmean("specdata", "nitrate", 20) 
pollutantmean_v2("specdata", "nitrate", 20) 

pollutantmean("specdata", "nitrate", 2:200) 
pollutantmean_v2("specdata", "nitrate", 2:200) 

pollutantmean("specdata", "sulfate", 1:332) 
pollutantmean_v2("specdata", "sulfate", 1:332)

identical(pollutantmean("specdata", "sulfate", 1:332),
          pollutantmean_v2("specdata", "sulfate", 1:332))

system.time(pollutantmean("specdata", "sulfate", 1:332))
system.time(pollutantmean_v2("specdata", "sulfate", 1:332))

#########################################

### CÂU 4: LIỆT KÊ GIÁ TRỊ MAX VÀ MIN Ở CẢ 2 CHỈ TIÊU Ở CÁC CẢM BIẾN BẤT KỲ

## FORMAT NHƯ VẦY
# gợi ý: độ lại hàm filter_theo_chi_tieu_super
# merge(ok_1, ok_2, by = "ID", all = TRUE)

#           Date nitrate sulfate ID   note      sep       Date nitrate sulfate ID    note
# 1  2005-09-13   0.149   19.10  1 max sulfate   | 2005-12-06    1.83    2.74  1 max nitrate
# 2  2007-09-03   1.320   27.90  2 max sulfate   | 2002-12-07    6.44    4.14  2 max nitrate
# 3  2005-09-13   0.133   22.50  3 max sulfate   | 2003-01-15    4.06    1.72  3 max nitrate
# 4  2005-09-13   0.347   23.60  4 max sulfate   | 2009-01-25    5.94    4.19  4 max nitrate
# 5  2005-09-13   0.887   20.40  5 max sulfate   | 2009-01-25    6.68    3.21  5 max nitrate
# 6  2004-09-30   0.241   12.80  6 max sulfate   | 2003-02-02    4.19    4.49  6 max nitrate
# 7  2005-09-13   0.432   19.80  7 max sulfate   | 2009-01-25    4.97    5.28  7 max nitrate
# 8  2005-09-13   0.496   20.20  8 max sulfate   | 2004-02-21    5.21    4.21  8 max nitrate
# 9  2005-09-13   0.452   16.20  9 max sulfate   | 2009-01-25    3.36    4.31  9 max nitrate
# 10 2003-05-12   0.367    2.27 10 max sulfate   | 2002-03-18    2.39    1.04 10 max nitrate

#########

### đáp án

######################## # copy từ filter_theo_chi_tieu_super

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


##############################
# getOption("max.print")
# options(max.print = 2000)
# TEST
filter_theo_chi_tieu_super(chi_tieu = "nitrate", a = "max", b = "specdata")

filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "specdata")

filter_theo_chi_tieu_super(chi_tieu = "nitrite", a = "max", b = "2007")

filter_theo_chi_tieu_super(chi_tieu = "nitrite", a = "max", b = "2008")

filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "2006")

########################################

### CỘT DATE CHƯA SỬA FORMAT

## LƯU Ý DATE Ở CSV 1 NÓ KHÁC FORMAT VỚI CÁC CSV CÒN LẠI, DO ĐÓ PHẢI LÀM HÀM IF CHO CHẮC ĂN
#################################################

######################## # copy từ filter_theo_chi_tieu_super

library(dplyr)

## FUNCTION_MIN_CHI_TIEU

"%min_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%Y-%m-%d")
        if(any(is.na(tmp_working[[i]]$Date))){
            tmp_working[[i]] <- read.csv(files_list[i])
            tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")    
        }
        
    }
    # find min value     
    
    ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        if(chi_tieu %in% names(tmp_working[[min_i]])){
            
            gia_tri_min <- suppressWarnings(min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE))
            
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


## FUNCTION_MAX_CHI_TIEU

"%max_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%Y-%m-%d")
        if(any(is.na(tmp_working[[i]]$Date))){
            tmp_working[[i]] <- read.csv(files_list[i])
            tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")    
        }
    }
    # find max value     
    
    ket_qua_max <- data.frame()
    
    for(max_i in seq_along(tmp_working)) { 
        
        if(chi_tieu %in% names(tmp_working[[max_i]])){
            
            gia_tri_max <- suppressWarnings(max(get(chi_tieu, tmp_working[[max_i]]), na.rm = TRUE))
            
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


### FUNCTION RANGE CHỈ TIÊU

"%range_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)){ 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%Y-%m-%d")
        if(any(is.na(tmp_working[[i]]$Date))){
            tmp_working[[i]] <- read.csv(files_list[i])
            tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")    
        }
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

# filter_theo_chi_tieu_enhanced <- function(chi_tieu = "mercury", a = "min", b = "2007"){
#     chi_tieu <<- chi_tieu ### sử dụng super assign
#     a %chi_tieu% b
# }

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

# TEST

filter_theo_chi_tieu_super(chi_tieu = "nitrate", a = "max", b = "specdata")

filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "specdata")

filter_theo_chi_tieu_super(chi_tieu = "nitrite", a = "max", b = "2007")

filter_theo_chi_tieu_super(chi_tieu = "nitrite", a = c(0.2, 0.3), b = "2007")

filter_theo_chi_tieu_super(chi_tieu = "nitrite", a = "max", b = "2008")

filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "2006")

filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "specdata")

########################

# 
# > filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "specdata")
# [1] "Kết quả lọc theo giá trị MAX của sulfate ở folder specdata là:"
#        Date  nitrate     sulfate  ID
# 54  2004-09-30  0.30500 22.00000  54
# 55  2000-10-30  1.65000 15.10000  55 ← 2 GIÁ TRỊ ID
# 56  2000-11-05  1.20000 15.10000  55 ← TRÙNG NHAU LÀ BÌNH THƯỜNG NHA!!!
# 57  2005-09-16  0.85100 20.70000  56
# 58  2004-09-30  0.18600 14.70000  57

#######################

### VẪN CÒN LỖI
filter_theo_chi_tieu_super(chi_tieu = "nitrate", a = "max", b = "specdata")

filter_theo_chi_tieu_super(chi_tieu = "nitrate", a = "min", b = "specdata")

filter_theo_chi_tieu_super(chi_tieu = "nitrate", a = c(0.2, 0.21), b = "specdata")

filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "specdata")

filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "min", b = "specdata")

############

# This warning message appears whenever you attempt to find the minimum or maximum value of a vector that has a length of zero.
# https://www.statology.org/r-no-non-missing-arguments-to-min-returning-inf/

### ĐIỀU NÀY CÓ THỂ LÀ CÓ 1 SỐ FILE CSV KHÔNG HỀ CÓ BẤT KỲ GIÁ TRỊ NITRATE NÀO HẾT NHÉ!

check_nitrate <- filter_theo_chi_tieu_super(chi_tieu = "nitrate", a = "max", b = "specdata")

class(check_nitrate)

unique(check_nitrate$ID)

length(unique(check_nitrate$ID)) ### KO ĐỦ 332!

check_sulfate <- filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "specdata")

class(check_sulfate)

unique(check_sulfate$ID)

length(unique(check_sulfate$ID))

#################
## CÓ 9 FILE NA HOÀN TOÀN NITRATE
setdiff(1:332, unique(check_nitrate$ID))
# 275 276 278 286 289 291 292 293 294
data_275 <- read.csv("specdata/275.csv")

summary(data_275)

max(data_275 $sulfate)
max(data_275 $sulfate, na.rm = TRUE)
max(data_275 $nitrate)
max(data_275 $nitrate, na.rm = TRUE)

#################################


ok_1 <- filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "2006")

ok_1$note <- "max sulfate"

ok_2 <- filter_theo_chi_tieu_super(chi_tieu = "nitrate", a = "max", b = "2006")

ok_2$note <- "max nitrate"

sep <- "|"
sep
cbind(ok_1, sep, ok_2)

rbind(ok_1, ok_2)


############################

#### CÁCH TIẾP CẬN SỬA LẠI HÀM SUPER THÊM THAM SỐ ID
### NHƯ VẬY THÌ MẤT TIME.

filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "specdata")

#### SUBSET THEO ID TỪ KẾT QUẢ FILTER FULL CỦA HÀM SUPER SẼ NHANH HƠN.

filter_theo_id <- function(chi_tieu = "sulfate", a = "max", b = "specdata", id_can_tim) {
    
    data_filter <- filter_theo_chi_tieu_super(chi_tieu, a, b)
    
    vi_tri <- which(get("ID", data_filter) %in% id_can_tim)
    
    ket_qua_chuan <- data_filter[vi_tri, ]
    
    return(ket_qua_chuan)
}


filter_theo_chi_tieu_super(chi_tieu = "sulfate", a = "max", b = "specdata")

filter_theo_id(chi_tieu = "sulfate", a = "max", b = "specdata", id = 280:332)

filter_theo_id(chi_tieu = "nitrate", a = "min", b = "specdata", id = 280:332)

filter_theo_id(chi_tieu = "sulfate", a = c(1, 2), b = "specdata", id = 280:332)


###################

ok_1 <- filter_theo_id(chi_tieu = "sulfate", a = "max", b = "specdata", id = 280:300)

ok_1$note <- "max sulfate"

ok_2 <- filter_theo_id(chi_tieu = "nitrate", a = "max", b = "specdata", id = 280:300)

ok_2$note <- "max nitrate"

sep <- "|"

cbind(ok_1, sep, ok_2)

bind_cols(ok_1, sep, ok_2)

a <- 1:10
b <- 1:12
bind_cols(a = a, b = b)

###########################
options(digits = 2)
ok_1 <- filter_theo_id(chi_tieu = "sulfate", a = "max", b = "specdata", id = 280:300)

ok_1$note <- "max sulfate"

ok_1$sep <- "|"

dim(ok_1)

ok_2 <- filter_theo_id(chi_tieu = "nitrate", a = "max", b = "specdata", id = 280:300)

ok_2$note <- "max nitrate"

dim(ok_2)

nrow(ok_1)
nrow(ok_2)

##############

merge(ok_1, ok_2, by = "ID", all = TRUE)

##########################################

#### NHÉT LỆNH MERGE VÀO TRONG FUNCTION FILTER THEO ID SO SÁNH.

filter_theo_id_so_sanh <- function(chi_tieu_1, 
                                   chi_tieu_2,
                                   a, b, id_can_tim) {
    
    ok_1 <- filter_theo_id(chi_tieu = chi_tieu_1, a, b, id_can_tim)
    ok_2 <- filter_theo_id(chi_tieu = chi_tieu_2, a, b, id_can_tim)
    
    if(length(a) == 1) {
        ok_1$note <- paste(a[1], chi_tieu_1)
        ok_2$note <- paste(a[1], chi_tieu_2)
    } else {  
        ok_1$note <- paste("from", a[1], "to", a[2], chi_tieu_1)
        ok_2$note <- paste("from", a[1], "to", a[2], chi_tieu_2)
    }
    
    ok_1$sep <- "|"
    
    ket_qua_so_sanh <- merge(ok_1, ok_2, by = "ID", all = TRUE)
  
    return(ket_qua_so_sanh)
}

### TEST HÀM

filter_theo_id_so_sanh(chi_tieu_1 = "sulfate", chi_tieu_2 = "nitrate", a = "max", b = "specdata", id_can_tim = 1:10)

filter_theo_id_so_sanh(chi_tieu_1 = "sulfate", chi_tieu_2 = "nitrate", a = "min", b = "specdata", id_can_tim = 1:10)

filter_theo_id_so_sanh(chi_tieu_1 = "sulfate", chi_tieu_2 = "nitrate", a = c(0.690, 0.7), b = "specdata", id_can_tim = 1:10)

filter_theo_id_so_sanh(chi_tieu_1 = "nitrate", chi_tieu_2 = "nitrate", a = c(0.6, 0.7), b = "specdata", id_can_tim = 1:10)

filter_theo_id_so_sanh(chi_tieu_1 = "sulfate", chi_tieu_2 = "nitrate", a = "min", b = "specdata", id_can_tim = 1:332)

options(max.print = 10000)
getOption("max.print")

kq <- filter_theo_id_so_sanh(chi_tieu_1 = "sulfate", chi_tieu_2 = "nitrate", a = "min", b = "specdata", id_can_tim = 1:332)

print(kq)

filter_theo_id_so_sanh(chi_tieu_1 = "nitrate", chi_tieu_2 = "sulfate", a = "max", b = "specdata", id_can_tim = 1:332)

#####################

# SUPRESS WARNING MESSANGE MIN AND MAX

#####################

### TEST HÀM MERGE

filter_theo_id_so_sanh(chi_tieu_1 = "nitrate", chi_tieu_2 = "nitrate", a = c(0.698, 0.7), b = "specdata", id_can_tim = 1:4)

nitrate_1 <- filter_theo_id(chi_tieu = "nitrate", a = c(0.698, 0.7), b = "specdata", 
                            id_can_tim = 1:4) 

nitrate_2 <- filter_theo_id(chi_tieu = "nitrate", a = c(0.698, 0.7), b = "specdata", 
                            id_can_tim = 1:4) 

merge(nitrate_1, nitrate_2, by = "ID", all = TRUE)

filter_theo_id_so_sanh(chi_tieu_1 = "sulfate", chi_tieu_2 = "nitrate", a = c(0.690, 0.7), b = "specdata", id_can_tim = 1:10)




filter_theo_id(chi_tieu = "sulfate", a = c(0.690, 0.7), b = "specdata", 
               id_can_tim = 1:10) 
