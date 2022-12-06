# infix binary operator

`%ok%` <- function(a, b) {
    a + b
}

"%phép cộng%" <- function(a, b) {
    a + b
}

a <- 3
b <- 8

a %ok% b
a %phép cộng% b

## ko có giá trị mặc định trong infix

`%ok%` <- function(a = 2, b = 4) {
    a + b
}

%ok% b

##################################

# XÂY DỰNG 1 PHÉP TOÁN TÌM RA GIÁ TRỊ MIN, MAX, VÀ TRONG KHOẢNG CỦA CHỈ TIÊU NITRITE

# DOWNLOAD DATA 2007.RAR
# https://tuhocr.netlify.app/code/2007.rar

#### NHẬP HẾT VÀO 1 FILE LIST DATA FRAME

files_list <- list.files("2007", full.names = TRUE)

tmp_working <- vector(mode = "list", length = length(files_list))

for (i in seq_along(files_list)) { 
    tmp_working[[i]] <- read.csv(files_list[i])
}

str(tmp_working)
View(tmp_working)

#### NHẬP HẾT VÀO 1 FILE LIST DATA FRAME

## tìm min trong các data frame tương ứng

a %nitrite% b

# a == "min"
# b == địa chỉ folder chứa các file csv
# kết quả sẽ xuất ra danh sách ở dạng data frame giá trị min ở các dataset tương ứng.

# tương tự cho "max"

# a là 1 vector gồm 2 số (1, 1.2) thì function sẽ tìm trong khoảng những giá trị này ở b để trả ra kết quả

#################

# XÂY DỰNG HÀM

### TÌM MIN

x <- c(-1:12, -10:9)
x
min(x)
max(x)

y <- c(-1:12, -10:9, NA, NA, 2)
y
min(y)
max(y)

### thời điểm này đã có list data frame tmp_working

for (min_i in seq_along(tmp_working)) { 
    print(min(tmp_working[[min_i]]$nitrite, na.rm = TRUE))
}

### TÌM MAX

for (max_i in seq_along(tmp_working)) { 
    print(max(tmp_working[[max_i]]$nitrite, na.rm = TRUE))
}

########### RÚT KẾT QUẢ THEO DATASET TƯƠNG ỨNG

min(tmp_working[[3]]$nitrite, na.rm = TRUE)

tmp_working[[3]]

## TÌM DÒNG NÀO CÓ GIÁ TRỊ MIN

subset(tmp_working[[3]], nitrite == min(tmp_working[[3]]$nitrite, na.rm = TRUE))

## NHÉT TRỞ LẠI DATASET CHUNG

for (min_i in seq_along(tmp_working)) { 
    gia_tri_min <- min(tmp_working[[min_i]]$nitrite, na.rm = TRUE)
    print(subset(tmp_working[[min_i]], nitrite == gia_tri_min))
}

################## CẢI TIẾN

ket_qua_min <- data.frame()

for (min_i in seq_along(tmp_working)) { 
    gia_tri_min <- min(tmp_working[[min_i]]$nitrite, na.rm = TRUE)
    ket_qua_min <- rbind(ket_qua_min, subset(tmp_working[[min_i]], nitrite == gia_tri_min))
}

####################

# FUNCTION MIN

"%min_nitrite%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    # find min value     
    
    ket_qua_min <- data.frame()
        
    for(min_i in seq_along(tmp_working)) { 
        
    gia_tri_min <- min(tmp_working[[min_i]]$nitrite, na.rm = TRUE)
    
    ket_qua_min <- rbind(ket_qua_min, subset(tmp_working[[min_i]], nitrite == gia_tri_min))
        } 
    return(ket_qua_min)    
    }
    
a <- 1
b <- "2007"
a %min_nitrite% b
    
a <- "min"    
a    
a %min_nitrite% b    

##########

# FUNCTION MAX

"%max_nitrite%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    # find max value     
    
    ket_qua_max <- data.frame()
    
    for(max_i in seq_along(tmp_working)) { 
        
        gia_tri_max <- max(tmp_working[[max_i]]$nitrite, na.rm = TRUE)
        
        ket_qua_max <- rbind(ket_qua_max, subset(tmp_working[[max_i]], nitrite == gia_tri_max))
    } 
    return(ket_qua_max)    
}

a <- 1
b <- "2007"
a %max_nitrite% b

##########

# FUNCTION TÌM VALUE TRONG RANGE

# a là 1 vector gồm 2 số (1, 1.2) thì function sẽ tìm trong khoảng những giá trị này ở b để trả ra kết quả

# xét dataset id#3
tmp_working[[3]]

# HÀM TÌM MIN VÀ MAX
range(tmp_working[[3]]$nitrite, na.rm = TRUE)

# tách riêng vector nitrite ra
tmp_working[[3]]$nitrite

# tìm giá trị nào >= 1 AND <= 1.2

which(tmp_working[[3]]$nitrite >= 1 & tmp_working[[3]]$nitrite <= 1.2)

ket_qua_tim_trong_khoang <- which(tmp_working[[3]]$nitrite >= 1 & tmp_working[[3]]$nitrite <= 1.2)

tmp_working[[3]][ket_qua_tim_trong_khoang, ]

######## HÀM FOR LOOP TÌM TRONG 10 DATASET

for(range_i in seq_along(tmp_working)){
    
    ket_qua_tim_trong_khoang <- which(tmp_working[[range_i]]$nitrite >= 1 & tmp_working[[range_i]]$nitrite <= 1.2)
    
    print(tmp_working[[range_i]][ket_qua_tim_trong_khoang, ])
    
}


### ĐƯA VÀO FUNCTION
"%range_nitrite%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)){ 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    
    # tìm trong khoảng
    
    ket_qua_range <- data.frame()
    
    for(range_i in seq_along(tmp_working)){
        
        ket_qua_tim_trong_khoang <- which(tmp_working[[range_i]]$nitrite >= a[1] & tmp_working[[range_i]]$nitrite <= a[2])
        
        ket_qua_range <- rbind(ket_qua_range, tmp_working[[range_i]][ket_qua_tim_trong_khoang, ])
        
    }  
    return(ket_qua_range ) 
} 

a <- 1
b <- "2007"
a %range_nitrite% b

a <- c(1, 1.2)
b <- "2007"
a %range_nitrite% b

ok_1 <- a %range_nitrite% b
# kiểm tra
range(ok_1$nitrite)

####################################

# GỘP 3 HÀM NÀY LẠI

`%min_nitrite%`

`%max_nitrite%`

`%range_nitrite%`

args(`%min_nitrite%`)

a %nitrite% b

"%nitrite%" <- function(a, b){
    
    if(length(a) == 1){
    switch(a, 
               "min" = a %min_nitrite% b, 
               "max" = a %max_nitrite% b)
    } else {
        a %range_nitrite% b
    }

}

########### TEST HÀM
a <- "min"
b <- "2007"

a %nitrite% b

a <- "max"
b <- "2007"

a %nitrite% b

"min" %nitrite% b
"max" %nitrite% b

1 %nitrite% b # tương ứng trong switch là min
2 %nitrite% b # tương ứng trong switch là max
333 %nitrite% b # ko có kết quả

c(0.8, 0.9) %nitrite% b

a %nitrite% b

##############################

### GHI CHÚ CÁCH SỬ DỤNG HÀM:
a %nitrite% b

# a == "min"
# b == địa chỉ folder chứa các file csv
# kết quả sẽ xuất ra danh sách ở dạng data frame giá trị min ở các dataset tương ứng.

# tương tự cho "max"

# a là 1 vector gồm 2 số (1, 1.2) thì function sẽ tìm trong khoảng những giá trị này ở b để trả ra kết quả

################ NÂNG CẤP HÀM

### LINH ĐỘNG THAY ĐỔI CHỈ TIÊU

# ## filter_theo_chi_tieu(chi_tieu,
#                         a,   # yêu cầu lọc data
#                         b,)  # folder file .csv

# FUNCTION MIN

chi_tieu <- "nitrite"

"%min_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    # find min value     
    
    ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        gia_tri_min <- min(tmp_working[[min_i]]$chi_tieu, na.rm = TRUE)
        
        ket_qua_min <- rbind(ket_qua_min, subset(tmp_working[[min_i]], chi_tieu == gia_tri_min))
    } 
    return(ket_qua_min)    
}

### R KO HIỂU CHỖ LỆNH SUBSET
1 %min_chi_tieu% "2007"

### SỬA LẠI

chi_tieu <- "nitrite"
tmp_working[[3]]$"nitrite"

tmp_working[[3]]$chi_tieu

tmp_working[[3]]$(chi_tieu)

get("nitrite", tmp_working[[3]])

get(chi_tieu, tmp_working[[3]])

identical(get("nitrite", tmp_working[[3]]), get(chi_tieu, tmp_working[[3]]))

###

chi_tieu <- "nitrite"

"%min_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    # find min value     
    
    ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
        
        ket_qua_min <- rbind(ket_qua_min, subset(tmp_working[[min_i]], chi_tieu == gia_tri_min))
    } 
    return(ket_qua_min)    
}

# TEST

1 %min_chi_tieu% "2007"

### SỬA TIẾP CHỖ SUBSET

chi_tieu <- "nitrite"

gia_tri_min <- min(get(chi_tieu, tmp_working[[3]]), na.rm = TRUE)

subset(tmp_working[[3]], nitrite == gia_tri_min)

subset(tmp_working[[3]], chi_tieu == gia_tri_min)

subset(tmp_working[[3]], "nitrite" == gia_tri_min)


"%min_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    # find min value     
    
    ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
        
        ket_qua_min <- rbind(ket_qua_min, tmp_working[[min_i]][vi_tri, ])
    } 
    return(ket_qua_min)    
}

1 %min_chi_tieu% "2007"
1 %min_nitrite% "2007"


##################################

## FUNCTION_MIN_CHI_TIEU

"%min_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    # find min value     
    
    ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
        
    ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
        
        ket_qua_min <- rbind(ket_qua_min, tmp_working[[min_i]][vi_tri, ])
    }
    print(paste("Kết quả lọc theo giá trị MIN của", chi_tieu, "là:"))
    return(ket_qua_min)    
}

### TEST HÀM MIN
chi_tieu <- "nitrite"
1 %min_chi_tieu% "2007"

identical(1 %min_chi_tieu% "2007", 1 %min_nitrite% "2007")

## FUNCTION_MAX_CHI_TIEU

"%max_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    # find min value     
    
    ket_qua_max <- data.frame()
    
    for(max_i in seq_along(tmp_working)) { 
        
        gia_tri_max <- max(get(chi_tieu, tmp_working[[max_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[max_i]]) == gia_tri_max)
        
        ket_qua_max <- rbind(ket_qua_max, tmp_working[[max_i]][vi_tri, ])
    } 
    #### THÊM DÒNG THÔNG BÁO
    print(paste("Kết quả lọc theo giá trị MAX của", chi_tieu, "là:"))
    #### TRẢ KẾT QUẢ
    return(ket_qua_max)    
}

### TEST HÀM MAX
chi_tieu <- "nitrite"
1 %max_chi_tieu% "2007"
identical(1 %max_chi_tieu% "2007", 1 %max_nitrite% "2007")

chi_tieu <- "mercury"
1 %max_chi_tieu% "2007"

### FUNCTION RANGE CHỈ TIÊU

"%range_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)){ 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    
    # tìm trong khoảng
    
    ket_qua_range <- data.frame()
    
    for(range_i in seq_along(tmp_working)){
        
        ket_qua_tim_trong_khoang <- which(get(chi_tieu, tmp_working[[range_i]]) >= a[1] & get(chi_tieu, tmp_working[[range_i]]) <= a[2])
        
        ket_qua_range <- rbind(ket_qua_range, tmp_working[[range_i]][ket_qua_tim_trong_khoang, ])
        
    }
    print(paste("Kết quả lọc trong khoảng, từ", a[1], "đến", a[2], "của", chi_tieu, "là:"))
    return(ket_qua_range ) 
} 

### TEST HÀM
chi_tieu <- "nitrite"
c(1, 1.2) %range_chi_tieu% "2007"
identical(c(1, 1.2) %range_chi_tieu% "2007", 
          c(1, 1.2) %range_nitrite% "2007")

head(c(1, 1.2) %range_chi_tieu% "2007")

chi_tieu <- "mercury"
c(11, 12.5) %range_chi_tieu% "2007"

#### ĐƯA VÀO FUNCTION CHUNG

### CÁCH 1

"%chi_tieu%" <- function(a, b){
        
        if(length(a) == 1){
            switch(a, 
                   "min" = a %min_chi_tieu% b, 
                   "max" = a %max_chi_tieu% b)
        } else {
            a %range_chi_tieu% b
        }
        
}    

### TEST HÀM

chi_tieu <- "nitrite"
"min" %chi_tieu% "2007"

chi_tieu <- "mercury"
"min" %chi_tieu% "2007"  

chi_tieu <- "mercury"
"max" %chi_tieu% "2007" 

chi_tieu <- "mercury"
c(12, 12.5) %chi_tieu% "2007" 



#####################################

## NÂNG CẤP HÀM HOÀN THIỆN

# ## filter_theo_chi_tieu(chi_tieu,
#                         a,   # yêu cầu lọc data
#                         b,)  # folder file .csv


## FUNCTION_MIN_CHI_TIEU

"%min_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    # find min value     
    
    ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
        
        ket_qua_min <- rbind(ket_qua_min, tmp_working[[min_i]][vi_tri, ])
    }
    print(paste("Kết quả lọc theo giá trị MIN của", chi_tieu, "là:"))
    return(ket_qua_min)    
}

## FUNCTION_MAX_CHI_TIEU

"%max_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
    }
    # find min value     
    
    ket_qua_max <- data.frame()
    
    for(max_i in seq_along(tmp_working)) { 
        
        gia_tri_max <- max(get(chi_tieu, tmp_working[[max_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[max_i]]) == gia_tri_max)
        
        ket_qua_max <- rbind(ket_qua_max, tmp_working[[max_i]][vi_tri, ])
    } 
    #### THÊM DÒNG THÔNG BÁO
    print(paste("Kết quả lọc theo giá trị MAX của", chi_tieu, "là:"))
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
    }
    
    # tìm trong khoảng
    
    ket_qua_range <- data.frame()
    
    for(range_i in seq_along(tmp_working)){
        
        ket_qua_tim_trong_khoang <- which(get(chi_tieu, tmp_working[[range_i]]) >= a[1] & get(chi_tieu, tmp_working[[range_i]]) <= a[2])
        
        ket_qua_range <- rbind(ket_qua_range, tmp_working[[range_i]][ket_qua_tim_trong_khoang, ])
        
    }
    print(paste("Kết quả lọc trong khoảng, từ", a[1], "đến", a[2], "của", chi_tieu, "là:"))
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
filter_theo_chi_tieu <- function(chi_tieu = "mercury", a = "min", b = "2007"){
    chi_tieu <<- chi_tieu ### sử dụng super assign
    a %chi_tieu% b
}

# TEST HÀM
filter_theo_chi_tieu("nitrite", "max", "2007")
filter_theo_chi_tieu("nitrite", "min", "2007")

# TEST HÀM

filter_theo_chi_tieu(chi_tieu = "mercury",
                     a = "max",
                     b = "2007")

filter_theo_chi_tieu(chi_tieu = "nitrite",
                     a = "min",
                     b = "2007")

filter_theo_chi_tieu(chi_tieu = "nitrite",
                     a = c(0.8, 0.81),
                     b = "2007")

filter_theo_chi_tieu(chi_tieu = "mercury",
                     a = c(9.8, 12.8),
                     b = "2007")

filter_theo_chi_tieu(,,)

filter_theo_chi_tieu(, "max",)

### LỌC MISSING VALUE



aaa <- filter_theo_chi_tieu(chi_tieu = "nitrite",
                            a = c(0.8, 0.81),
                            b = "2007")
complete.cases(aaa)

aaa[complete.cases(aaa), ]

sapply(tmp_working[[3]], class)


################ NÊN CHUYỂN DATE HOÀN THIỆN HƠN

# import dataset
files_list <- list.files("2007", full.names = TRUE)

tmp_working <- vector(mode = "list", length = length(files_list))

for(i in seq_along(files_list)) { 
    tmp_working[[i]] <- read.csv(files_list[i])
    tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")
}

#### ĐƯA VÀO HÀM FINAL FINAL

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
        
        gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
        
        ket_qua_min <- rbind(ket_qua_min, tmp_working[[min_i]][vi_tri, ])
    }
    print(paste("Kết quả lọc theo giá trị MIN của", chi_tieu, "là:"))
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
    # find min value     
    
    ket_qua_max <- data.frame()
    
    for(max_i in seq_along(tmp_working)) { 
        
        gia_tri_max <- max(get(chi_tieu, tmp_working[[max_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[max_i]]) == gia_tri_max)
        
        ket_qua_max <- rbind(ket_qua_max, tmp_working[[max_i]][vi_tri, ])
    } 
    #### THÊM DÒNG THÔNG BÁO
    print(paste("Kết quả lọc theo giá trị MAX của", chi_tieu, "là:"))
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
        
        ket_qua_tim_trong_khoang <- which(get(chi_tieu, tmp_working[[range_i]]) >= a[1] & get(chi_tieu, tmp_working[[range_i]]) <= a[2])
        
        ket_qua_range <- rbind(ket_qua_range, tmp_working[[range_i]][ket_qua_tim_trong_khoang, ])
        
    }
    print(paste("Kết quả lọc trong khoảng, từ", a[1], "đến", a[2], "của", chi_tieu, "là:"))
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
filter_theo_chi_tieu <- function(chi_tieu = "mercury", a = "min", b = "2007"){
    chi_tieu <<- chi_tieu ### sử dụng super assign
    a %chi_tieu% b
}

# TEST HÀM

filter_theo_chi_tieu(chi_tieu = "mercury",
                     a = "max",
                     b = "2007")

filter_theo_chi_tieu(chi_tieu = "nitrite",
                     a = "min",
                     b = "2007")

filter_theo_chi_tieu(chi_tieu = "nitrite",
                     a = c(0.8, 0.81),
                     b = "2007")

filter_theo_chi_tieu(chi_tieu = "mercury",
                     a = c(9.8, 12.8),
                     b = "2007")

filter_theo_chi_tieu(,,)

########## BỔ SUNG CHỨC NĂNG LỌC THEO NGÀY THÁNG.

result <- filter_theo_chi_tieu(, "max",)

time_range <- which(result$Date >= as.Date("2005-09-01") & result$Date <= as.Date("2007-09-30"))

result[time_range, ]















