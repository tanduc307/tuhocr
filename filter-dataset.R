# Lọc dữ liệu theo ngày tháng

filter_theo_ngay_thang <- function(ngay, thang){
    data_1 <- airquality[airquality$Month == thang, ]
    kq <- data_1[ngay, ]
    return(kq)
}