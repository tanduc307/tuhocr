# Control Flow

# CÁC LỆNH LOGIC IF-ELSE VÀ FOR-LOOP
# https://tuhocr.netlify.app/cac-lenh-logic.html
# XỬ LÝ KẾT QUẢ THEO ĐIỀU KIỆN, LỰA CHỌN

# XỬ LÝ KẾT QUẢ THEO CÁC VÒNG LẶP TRÊN NHỮNG ĐỐI TƯỢNG KHÁC NHAU (GIÚP TỰ ĐỘNG HÓA QUY TRÌNH)

#######################################################

# IF...THEN

# if statement syntax:

# if
# a single logical value between (), or an expression that leads to a SINGLE logical value
# a block of code between {} that has to be executed when the logical value is TRUE

vec_1 <- 8

if(vec_1 > 5) {
    "Đạt"
}

?`if`

if(vec_1 > 5) {
    print("Đạt")
}

if(vec_1 > 5) print("Đạt")

if(vec_1 > 5) {
    return("Đạt")
}

vec_1 <- 4

if(vec_1 > 5) {
    "Đạt"
} else {
    "Không đạt"
}

if(vec_1 > 5) {
    "Đạt"
} else "Không đạt"

if(vec_1 > 5) {
    "Đạt"
} 
else {
    "Không đạt"
}

# DÙNG CÁC LỆNH IF ĐỂ BAO TRÙM ĐIỀU KIỆN

vec_1 <- 8

if(vec_1 >= 5) {
    "Đạt"
}

if(vec_1 < 5) {
    "Không đạt"
}

vec_1 <- 4

###################

?`if`

?ifelse

###################

# ifelse(test, yes, no)

x <- c(6 : -4)
x
sqrt(x)  #- gives warning
sqrt(ifelse(x >= 0, x, NA))  # no warning

## Note: the following also gives the warning !
ifelse(x >= 0, sqrt(x), NA)

vec_1 <- 8

ifelse(test = vec_1 >= 5, yes = "Đạt", no = "Không đạt")

ifelse(vec_1 >= 5, "Đạt", "Không đạt")

vec_2 <- c(8, 7, 9, 5, 4, 10)

## PHÂN BIỆT

ifelse(vec_2 >= 5, "Đạt", "Không đạt")

if(vec_2 >= 5) {
    "Đạt"
} else {
    "Không đạt"
}

# LỆNH FOR-LOOP
for(i in 1:4){
    print(i)
}

for(i in vec_2) {
    if(i >= 5) {
        "Đạt"
    } else {
        "Không đạt"
    }
}

for(i in vec_2) {
    if(i >= 5) {
        print("Đạt")
    } else {
        print("Không đạt")
    }
}

for(i in vec_2) {
    if(i >= 5) {
        return("Đạt")
    } else {
        return("Không đạt")
    }
}

################

vec_2 <- c(8, 7, 9, 5, 4, 10)
kq_1 <- ifelse(vec_2 >= 5, "Đạt", "Không đạt")
kq_1
class(kq_1)
cbind(vec_2, kq_1)
data.frame("Điểm số" = vec_2, "Kết quả" = kq_1)
data.frame("Điểm số" = vec_2, "Kết quả" = kq_1, check.names = FALSE)

ok_2 <- data.frame("Điểm số" = vec_2, "Kết quả" = kq_1, check.names = FALSE)
readr::write_excel_csv(ok_2, "test6.csv")

ok_2$`Kết quả`

########################

vec_2

kq_loop <- vector(mode = "character")
class(kq_loop)
str(kq_loop)

for(i in vec_2) {
    if(i >= 5) {
        kq_loop <- append(kq_loop, "Đạt")
    } else {
        kq_loop <- append(kq_loop, "Không đạt")
    }
}

kq_loop

data.frame("Điểm số" = vec_2, "Kết quả" = kq_loop)
data.frame("Điểm số" = vec_2, "Kết quả" = kq_loop, check.names = FALSE)
ok_2 <- data.frame("Điểm số" = vec_2, "Kết quả" = kq_loop, check.names = FALSE)
readr::write_excel_csv(ok_2, "test1.csv")

######################################

# NESTED IF

vec_1 <- 9
vec_1 <- 7
vec_1 <- 4

if(vec_1 > 8) {
    "Giỏi"
} else {
    
    
    if(vec_1 > 5) {
        "Khá"
    } else {
        "Trung bình"
    }
    
    
}

if(vec_1 > 8) {
    "Giỏi"
} else if(vec_1 > 5) {
    "Khá"
} else {
    "Trung bình"
}


########################
# BÀI TẬP IF-ELSE PHÂN LOẠI KẾT QUẢ HỌC TẬP

# DOWNLOAD
https://tuhocr.netlify.app/code/xeploaihocsinh.xlsx

# KẾT QUẢ
# 10 - 9 : GIỎI
# >9 - 7 : KHÁ  
# >7 - 5 : TRUNG BÌNH KHÁ
# >5 - 3 : YẾU
# >3 - 0 : KÉM
# KHÔNG CÓ ĐIỂM: KHÔNG ĐI THI

# THÊM 1 CỘT MỚI "XẾP LOẠI"
# >= 5: ĐẠT
# <5: KHÔNG ĐẠT
# KHÔNG CÓ ĐIỂM: ĐỂ TRỐNG

xeploai <- readxl::read_excel("xeploaihocsinh.xlsx")
head(xeploai)
summary(xeploai)

kq_thi <- vector(mode = "character")

for(diem_thi in xeploai$`ĐIỂM SỐ`) {

if(diem_thi >= 9) {
    kq_thi <- append(kq_thi, "GIỎI")
} else if(diem_thi >= 7) {
    kq_thi <- append(kq_thi, "KHÁ")
} else if(diem_thi >= 5) {
    kq_thi <- append(kq_thi, "TRUNG BÌNH KHÁ")
} else if(diem_thi >= 3) {
    kq_thi <- append(kq_thi, "YẾU")
} else if(diem_thi >= 0) {
    kq_thi <- append(kq_thi, "KÉM")
} else {
    kq_thi <- append(kq_thi, "KHÔNG ĐI THI")
}

}

########## CẢI TIẾN

!is.na(xeploai$`ĐIỂM SỐ`)

kq_thi <- vector(mode = "character")

for(diem_thi in xeploai$`ĐIỂM SỐ`) {
    
    if(!is.na(diem_thi) && diem_thi >= 9) {
        kq_thi <- append(kq_thi, "GIỎI")
    } else if(!is.na(diem_thi) && diem_thi >= 7) {
        kq_thi <- append(kq_thi, "KHÁ")
    } else if(!is.na(diem_thi) && diem_thi >= 5) {
        kq_thi <- append(kq_thi, "TRUNG BÌNH KHÁ")
    } else if(!is.na(diem_thi) && diem_thi >= 3) {
        kq_thi <- append(kq_thi, "YẾU")
    } else if(!is.na(diem_thi) && diem_thi >= 0) {
        kq_thi <- append(kq_thi, "KÉM")
    } else {
        kq_thi <- append(kq_thi, "KHÔNG ĐI THI")
    }
    
}

xeploai_1 <- cbind(xeploai[1:4], "KẾT QUẢ" = kq_thi)
xeploai_1 

##################

kq_xeploai <- vector(mode = "character")

for(diem_thi in xeploai$`ĐIỂM SỐ`) {
    
    if(!is.na(diem_thi) && diem_thi >= 5) {
        kq_xeploai <- append(kq_xeploai, "ĐẠT")
    } else if(!is.na(diem_thi) && diem_thi < 5) {
        kq_xeploai <- append(kq_xeploai, "KHÔNG ĐẠT")
    } else {
        kq_xeploai <- append(kq_xeploai, "")
    }
    
}

print(kq_xeploai)
cat(kq_xeploai)

xeploai_2 <- cbind(xeploai_1, "XẾP LOẠI" = kq_xeploai)

# XỬ LÝ NA TRONG CỘT ĐIỂM SỐ VỀ GIÁ TRỊ BLANK

giatri_na <- which(is.na(xeploai_2$`ĐIỂM SỐ`))

xeploai_2$`ĐIỂM SỐ`[giatri_na]

xeploai_2$`ĐIỂM SỐ`[giatri_na] <- ""

xeploai_2 

# OK
readr::write_excel_csv(xeploai_2 , "xeploaihocsinh_final.csv")

# ko được
readr::write_excel_csv2(xeploai_2 , "xeploaihocsinh_final.xlsx")

?readr::write_excel_csv

# install.packages("xlsx")
library("xlsx")
write.xlsx(xeploai_2 , 
           "xeploaihocsinh_final_1.xlsx", 
           sheetName = "Sheet1", 
           col.names = TRUE, 
           row.names = FALSE, 
           append = FALSE)
#########################################

# SWITCH

# WHILE

# REPEAT

# NEXT

# RETURN