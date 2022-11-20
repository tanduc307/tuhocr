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
# 2/ BỔ SUNG TÍNH NĂNG XỬ LÝ DATASET CÓ CÙNG CẤU TRÚC MONTH, DAY NHƯNG KHÁC TÊN AIRQUALITY
# 3/ VIẾT HÀM TƯƠNG TỰ CÓ CÙNG CÁC CHỨC NĂNG NHƯ HÀM VÍ DỤ NÀY (GỢI Ý SỬ DỤNG LỆNH FOR-LOOP)

#  https://tuhocr.netlify.app/cac-lenh-logic.html





