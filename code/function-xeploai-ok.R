########################
# BÀI TẬP IF-ELSE PHÂN LOẠI KẾT QUẢ HỌC TẬP

# DOWNLOAD
# https://tuhocr.netlify.app/code/xeploaihocsinh.xlsx
# 
# https://tuhocr.netlify.app/code/lop_7a.rar

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
# 
# xeploai <- readxl::read_excel("xeploaihocsinh.xlsx")
# print(xeploai, n = 60)
# summary(xeploai)
# 
# if(diem_thi >= 9) {
#     "GIỎI"
# } else if(diem_thi >= 7) {
#     "KHÁ"
# } else if(diem_thi >= 5) {
#     "TRUNG BÌNH KHÁ"
# } else if(diem_thi >= 3) {
#     "YẾU"
# } else if(diem_thi >= 0) {
#     "KÉM"
# } else {
#     "KHÔNG ĐI THI"
# }
# 
# diem_thi <- 9
# 
# kq_thi <- vector(mode = "character")
# 
# for(diem_thi in xeploai$`ĐIỂM SỐ`) {
# 
#     if(!(is.na(diem_thi)) && diem_thi >= 9) {
#         kq_thi <- append(kq_thi, "GIỎI")
#     } else if(!(is.na(diem_thi)) && diem_thi >= 7) {
#         kq_thi <- append(kq_thi, "KHÁ")
#     } else if(!(is.na(diem_thi)) && diem_thi >= 5) {
#         kq_thi <- append(kq_thi, "TRUNG BÌNH KHÁ")
#     } else if(!(is.na(diem_thi)) && diem_thi >= 3) {
#         kq_thi <- append(kq_thi, "YẾU")
#     } else if(!(is.na(diem_thi)) && diem_thi >= 0) {
#         kq_thi <- append(kq_thi, "KÉM")
#     } else {
#         kq_thi <- append(kq_thi, "KHÔNG ĐI THI")
#     }
# 
# }
# # 
# # !(is.na(xeploai$`ĐIỂM SỐ`))
# # 
# xeploai_1 <- cbind(xeploai[1:4], "KẾT QUẢ" = kq_thi)

###########################

# CODE CHUẨN

# Import dataset

name <- "lop_7a/lop_7a8.xlsx"

xeploai <- readxl::read_excel(name)

output <- basename(name)
output_name <- paste0("lop_7a/OUTPUT/", output)

# xử lý lần 1
kq_thi <- vector(mode = "character")

for(diem_thi in xeploai$`ĐIỂM SỐ`) {
    
    if(!(is.na(diem_thi)) && diem_thi >= 9) {
        kq_thi <- append(kq_thi, "GIỎI")
    } else if(!(is.na(diem_thi)) && diem_thi >= 7) {
        kq_thi <- append(kq_thi, "KHÁ")
    } else if(!(is.na(diem_thi)) && diem_thi >= 5) {
        kq_thi <- append(kq_thi, "TRUNG BÌNH KHÁ")
    } else if(!(is.na(diem_thi)) && diem_thi >= 3) {
        kq_thi <- append(kq_thi, "YẾU")
    } else if(!(is.na(diem_thi)) && diem_thi >= 0) {
        kq_thi <- append(kq_thi, "KÉM")
    } else {
        kq_thi <- append(kq_thi, "KHÔNG ĐI THI")
    }
    
}

xeploai_1 <- cbind(xeploai[1:4], "KẾT QUẢ" = kq_thi)

# xử lý lần 2

kq_xeploai <- vector(mode = "character")

for(diem_thi in xeploai_1$`ĐIỂM SỐ`) {
    
    if(!is.na(diem_thi) && diem_thi >= 5) {
        kq_xeploai <- append(kq_xeploai, "ĐẠT")
    } else if(!is.na(diem_thi) && diem_thi < 5) {
        kq_xeploai <- append(kq_xeploai, "KHÔNG ĐẠT")
    } else {
        kq_xeploai <- append(kq_xeploai, "")
    }
    
}

# cat(kq_xeploai)

xeploai_2 <- cbind(xeploai_1, "XẾP LOẠI" = kq_xeploai)

# XỬ LÝ NA TRONG CỘT ĐIỂM SỐ VỀ GIÁ TRỊ BLANK

giatri_na <- which(is.na(xeploai_2$`ĐIỂM SỐ`))

# xeploai_2$`ĐIỂM SỐ`[giatri_na]

xeploai_2$`ĐIỂM SỐ`[giatri_na] <- 0

# xeploai_2

# readr::write_excel_csv(xeploai_2, "xeploaihocsinh_final.csv", na = "")
# sau đó save as qua file xlsx

# install.packages("xlsx")
library("xlsx")
write.xlsx(xeploai_2, 
           output_name, 
           sheetName = "Sheet1", 
           col.names = TRUE, 
           row.names = FALSE, 
           append = FALSE)

# sapply(xeploai_2, class)

######################################

# CHUYỂN THÀNH FUNCTION

# TÊN FOLDER LÚC NÀY KHÁC NHAU

# xeploai_hocsinh("file")

xeploai_hocsinh <- function(file) {
    
    name <- file
    xeploai <- readxl::read_excel(name)
    
    output <- basename(name)
    output_name <- paste0("lop_7a/OUTPUT/", output)
    
    # xử lý lần 1
    kq_thi <- vector(mode = "character")
    
    for(diem_thi in xeploai$`ĐIỂM SỐ`) {
        
        if(!(is.na(diem_thi)) && diem_thi >= 9) {
            kq_thi <- append(kq_thi, "GIỎI")
        } else if(!(is.na(diem_thi)) && diem_thi >= 7) {
            kq_thi <- append(kq_thi, "KHÁ")
        } else if(!(is.na(diem_thi)) && diem_thi >= 5) {
            kq_thi <- append(kq_thi, "TRUNG BÌNH KHÁ")
        } else if(!(is.na(diem_thi)) && diem_thi >= 3) {
            kq_thi <- append(kq_thi, "YẾU")
        } else if(!(is.na(diem_thi)) && diem_thi >= 0) {
            kq_thi <- append(kq_thi, "KÉM")
        } else {
            kq_thi <- append(kq_thi, "KHÔNG ĐI THI")
        }
        
    }
    
    xeploai_1 <- cbind(xeploai[1:4], "KẾT QUẢ" = kq_thi)
    
    # xử lý lần 2
    
    kq_xeploai <- vector(mode = "character")
    
    for(diem_thi in xeploai_1$`ĐIỂM SỐ`) {
        
        if(!is.na(diem_thi) && diem_thi >= 5) {
            kq_xeploai <- append(kq_xeploai, "ĐẠT")
        } else if(!is.na(diem_thi) && diem_thi < 5) {
            kq_xeploai <- append(kq_xeploai, "KHÔNG ĐẠT")
        } else {
            kq_xeploai <- append(kq_xeploai, "")
        }
        
    }
    
    xeploai_2 <- cbind(xeploai_1, "XẾP LOẠI" = kq_xeploai)
    
    # XỬ LÝ NA TRONG CỘT ĐIỂM SỐ VỀ 0
    
    giatri_na <- which(is.na(xeploai_2$`ĐIỂM SỐ`))
    
    # xeploai_2$`ĐIỂM SỐ`[giatri_na]
    
    xeploai_2$`ĐIỂM SỐ`[giatri_na] <- 0
    
    # xeploai_2
    
    # save qua file excel
    library("xlsx")
    write.xlsx(xeploai_2, 
               output_name, 
               sheetName = "Sheet1", 
               col.names = TRUE, 
               row.names = FALSE, 
               append = FALSE)
    
}

xeploai_hocsinh(file = file.choose())

filenames <- list.files("lop_7a", 
                        full.names = TRUE, 
                        pattern = "*.xlsx")
filenames

file_1 <- file.choose()

for(i in filenames) {
    xeploai_hocsinh(i)
}

system.time(for(i in filenames) {
    xeploai_hocsinh(i)
})



















