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
head(xeploai, n = 60)
summary(xeploai)

kq_thi <- vector(mode = "character")

for(diem_thi in xeploai$`ĐIỂM SỐ`) {
    
    if(diem_thi >= 9) {
        kq_thi <- append(kq_thi, "GIỎI")
    } else if(diem_thi >= 7) {
        kq_thi <- append(kq_thi, "KHÁ")
    } else if(diem_thi >= 5) {
        kq_thi <- append(kq_t hi, "TRUNG BÌNH KHÁ")
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
readr::write_excel_csv(xeploai_2, "xeploaihocsinh_final.csv")
# sau đó save as qua file xlsx

# chuyển NA qua blank
readr::write_excel_csv(xeploai_2, "xeploaihocsinh_final_ok_1.csv", na = "")

# https://appsilon.com/writing-excel-formatted-csv-using-readrwrite_excel_csv2/
# nếu muốn phân cách dấu phẩy sau dấu thập phân
# readr::write_excel_csv2(xeploai_2 , "xeploaihocsinh_final.csv")

?readr::write_excel_csv

# Save trực tiếp qua file excel

# install.packages("xlsx")
library("xlsx")
write.xlsx(xeploai_2, 
           "xeploaihocsinh_final_1.xlsx", 
           sheetName = "Sheet1", 
           col.names = TRUE, 
           row.names = FALSE, 
           append = FALSE)

# cải tiến

sapply(xeploai_2, class)

xeploai_2$`ĐIỂM SỐ` <- as.numeric(xeploai_2$`ĐIỂM SỐ`)

xeploai_2 <- cbind(xeploai_1, "XẾP LOẠI" = kq_xeploai)

# XỬ LÝ NA TRONG CỘT ĐIỂM SỐ VỀ GIÁ TRỊ BLANK

giatri_na <- which(is.na(xeploai_2$`ĐIỂM SỐ`))

xeploai_2$`ĐIỂM SỐ`[giatri_na]

xeploai_2$`ĐIỂM SỐ`[giatri_na] <- 0

xeploai_2

#########################################

# XỬ LÝ CÙNG LÚC NHIỀU FILE

xeploai <- readxl::read_excel("lop_7a/lop_7a3.xlsx")
xeploai

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

xeploai_2 <- cbind(xeploai_1, "XẾP LOẠI" = kq_xeploai)

giatri_na <- which(is.na(xeploai_2$`ĐIỂM SỐ`))

xeploai_2$`ĐIỂM SỐ`[giatri_na]

xeploai_2$`ĐIỂM SỐ`[giatri_na] <- 0

library("xlsx")
write.xlsx(xeploai_2, 
           "lop_7a/OUTPUT/OUPUT_file.xlsx", 
           sheetName = "Sheet1", 
           col.names = TRUE, 
           row.names = FALSE, 
           append = FALSE)

#############

# CẢI TIẾN CHỖ XUẤT RA TÊN TƯƠNG ỨNG

name <- "lop_7a/lop_7a5.xlsx"
xeploai <- readxl::read_excel(name)

output <- substr(name, start = 8, stop = 50)
output
output_name <- paste0("lop_7a/OUTPUT/", output)

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

xeploai_2 <- cbind(xeploai_1, "XẾP LOẠI" = kq_xeploai)

giatri_na <- which(is.na(xeploai_2$`ĐIỂM SỐ`))

xeploai_2$`ĐIỂM SỐ`[giatri_na]

xeploai_2$`ĐIỂM SỐ`[giatri_na] <- 0

 
library("xlsx")
write.xlsx(xeploai_2, 
           output_name, 
           sheetName = "Sheet1", 
           col.names = TRUE, 
           row.names = FALSE, 
           append = FALSE)

####################

# CHUYỂN THÀNH FUNCTION

# TÊN FOLDER LÚC NÀY KHÁC NHAU

# xeploai_hocsinh("file")

xeploai_hocsinh <- function(file) {
    
    name <- file
    xeploai <- readxl::read_excel(name)
    
    output <- basename(name)
    output
    output_name <- paste0("lop_7a/OUTPUT/", output)
    
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
    
    xeploai_2 <- cbind(xeploai_1, "XẾP LOẠI" = kq_xeploai)
    
    giatri_na <- which(is.na(xeploai_2$`ĐIỂM SỐ`))
    
    xeploai_2$`ĐIỂM SỐ`[giatri_na]
    
    xeploai_2$`ĐIỂM SỐ`[giatri_na] <- 0
    
    
    library("xlsx")
    write.xlsx(xeploai_2, 
               output_name, 
               sheetName = "Sheet1", 
               col.names = TRUE, 
               row.names = FALSE, 
               append = FALSE)  
  
}

xeploai_hocsinh(file.choose())

#############

basename("D:\\tuhocr\\lop_7a\\lop_7a10.xlsx")
dirname("C:/some_dir/a.ext")

#################

filenames <- list.files("lop_7a", pattern="*.xlsx", full.names=TRUE)

for(i in filenames) {
    xeploai_hocsinh(i)
}

system.time(for(i in filenames) {
    xeploai_hocsinh(i)
})









