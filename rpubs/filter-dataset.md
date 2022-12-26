---
output: 
  html_document: 
    keep_md: yes
---
Hướng dẫn xây dựng hàm filter dataset theo `Month` và `Day`
===============================================

# Nhu cầu

File có cấu trúc gồm 6 cột và 365 ngày, chia theo ngày tháng tương ứng (đây là file ví dụ, số liệu được tạo ra ngẫu nhiên). Xem format file ở đây: 

- [File 2022](https://docs.google.com/spreadsheets/d/1bJklPjNxSa1_EfsaTFYB6530tLQMY5Q4J2jfM4S8SdY/edit#gid=1577274406)

- [File 1992](https://docs.google.com/spreadsheets/d/113PVGIsvZZk0VEync1jrTn3pxcHuBAlmLqME7Ya51HA/edit?usp=sharing)

Download file đưa vào thư mục project để xử lý [`chat_luong_khong_khi_1992.csv`](https://tuhocr.netlify.app/chat_luong_khong_khi_1992.csv) và [`chat_luong_khong_khi_2022.csv`](https://tuhocr.netlify.app/chat_luong_khong_khi_2022.csv) 

## Câu hỏi

Làm sao để biết được mức độ ô nhiễm (%) thể hiện ở cột `POLLUTION` ở ngày, tháng bất kỳ trong năm 1992 và 2022 để so sánh và vẽ đồ thị, không cần phải filter và sort thủ công như trên Excel.

## <span style="color: blue">Cách tiếp cận</span>

<mark>Xây dựng một hàm filter theo cột `Month` và `Day` trong dataset</mark>, <span style="color: red">sau đó gán vào các code template có sẵn</span> cho đồ thị dạng đường, cột, boxplot để xuất ra *kết quả nhanh chóng đưa vào báo cáo.*

# Xây dựng function filter dataset

## Code function


```r
# FUNCTION HOÀN CHỈNH 1

filter_theo_ngay_thang <- function(ngay = 1:31, thang = 0, name_dataset = airquality){
    
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

filter_theo_ngay_thang_final <- function(ngay = 1:31, 
                                         thang = 0,
                                         name_dataset = airquality,
                                         clean_na = FALSE # thêm tham số
) {
    
    data_raw <- filter_theo_ngay_thang(ngay, thang , name_dataset)
    
    if(clean_na == FALSE){
        return(data_raw)
    } else {
        complete.cases(data_raw)
        data_clean <- data_raw[complete.cases(data_raw), ]
        return(data_clean)
    }
    
}
```

## Test hàm


```r
# Import dataset
chat_luong_khong_khi_2022 <- read.csv("D:/tuhocr/chat_luong_khong_khi_2022.csv")
chat_luong_khong_khi_1992 <- read.csv("D:/tuhocr/chat_luong_khong_khi_1992.csv")

# Lọc kết quả từ ngày 12 đến 28 tháng 11 trong năm 2022 và 1992

filter_theo_ngay_thang_final(ngay = 12:28, thang = 11, chat_luong_khong_khi_2022, clean_na = TRUE)
```

```
##     CO2 HUMIDITY POLLUTION TEMPT Month Day
## 316  21      259       8.0    76    11  12
## 317  28      238      11.5    77    11  13
## 318   9       24       6.9    71    11  14
## 319  13      112       8.0    71    11  15
## 320  46      237       2.8    78    11  16
## 321  18      224       4.6    67    11  17
## 322  13       27       7.4    76    11  18
## 323  24      238      15.5    68    11  19
## 324  16      201      10.9    82    11  20
## 325  13      238      10.3    64    11  21
## 326  23       14      10.9    71    11  22
## 327  36      139       9.7    81    11  23
## 328   7       49      14.9    69    11  24
## 329  14       20      15.5    63    11  25
## 330  30      193       6.3    70    11  26
## 332  14      191      11.5    75    11  28
```

```r
filter_theo_ngay_thang_final(ngay = 12:28, thang = 11, chat_luong_khong_khi_1992, clean_na = TRUE)
```

```
##     CO2 HUMIDITY POLLUTION TEMPT Month Day
## 316  21      259       8.0    76    11  12
## 317  28      238      11.5    77    11  13
## 318   9       24       6.9    71    11  14
## 319  13      112       5.1    71    11  15
## 320  46      237       2.8    78    11  16
## 321  18      224       4.6    67    11  17
## 322  13       27       7.4    76    11  18
## 323  24      238      15.5    68    11  19
## 324  16      201      10.9    82    11  20
## 325  13      238      10.3    64    11  21
## 326  23       14      10.9    71    11  22
## 327  36      139       9.7    81    11  23
## 328   7       49      14.9    69    11  24
## 329  14       20      15.5    63    11  25
## 330  30      193       6.3    70    11  26
## 332  14      191      11.5    75    11  28
```

