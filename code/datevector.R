# LÀM VIỆC VỚI VECTOR NGÀY THÁNG VÀ THỜI GIAN (DATE-TIME VECTOR)

# Đa dạng các format ngày tháng
"May 15, 2009" 
"15-05-2009" # DD-MM-YYYY
"15/05/1998" # DD/MM/YYYY
"2009-05-15" # YYYY-MM-DD

# Đa dạng các format về thời gian

"9:15 p.m."
"21:25"
"21h25"

# KIỂU CHUẨN MÀ R QUY ĐỊNH VỀ DATE

Sys.Date() 
ngay <- "2022-10-30"
ngay
class(ngay)
ngay <- as.Date("2022-10-30")
ngay
class(ngay)
unclass(ngay)
ngay - 19295
mode(ngay)
typeof(ngay)
str(ngay)
attributes(ngay)
names(ngay)
dim(ngay)

"2022-10-29"

Sys.timezone(location = TRUE)


# KIỂU CHUẨN MÀ R QUY ĐỊNH VỀ DATE-TIME, KIỂU POSIXct

Sys.time() -> thoigian
"2022-10-29 20:11:32 +07"

thoigian -> thoigian_ct

thoigian_ct
class(thoigian_ct)
unclass(thoigian)

thoigian - unclass(thoigian)

mode(thoigian)
typeof(thoigian)
str(thoigian)
attributes(thoigian)
names(thoigian)
dim(thoigian)

# KIỂU CHUẨN MÀ R QUY ĐỊNH VỀ DATE-TIME, KIỂU POSIXlt

thoigian_lt <- as.POSIXlt(thoigian)
class(thoigian_lt)
unclass(thoigian_lt)
mode(thoigian_ct)
mode(thoigian_lt)

str(thoigian_ct)
str(thoigian_lt)

attributes(thoigian_ct)
attributes(thoigian_lt)



########################

# XEM CÁC THÔNG TIN HỆ THỐNG
Sys.setlocale()

Sys.localeconv()

# Tên của timezone
# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

Sys.timezone()

Sys.time()

Sys.setenv(tz = "Asia/Ho_Chi_Minh")

Sys.time()






########################

# LÀM VIỆC VỚI NGÀY THÁNG (DATE)

a <- "2022-10-09"
a
class(a)
mode(a)
length(a)
a_1 <- as.Date(a) # default
a_1
class(a_1)
mode(a_1)
length(a_1)
str(a)
str(a_1)

unclass(a_1)
a_1 - 19274 # TÍNH TỪ 1970

weekdays(a_1) # thứ trong tuần
months(a_1) # tháng trong năm

class(weekdays(a_1))
class(months(a_1))

quarters(a_1)
class(quarters(a_1))

a_1 + 5
a_1 - 111
a_1 * 2
a_1 / 3

a_1 + 0:4
a_1 + 0:4 -> a_2
a_2

a_2 + 2 -> a_3
a_3

a_3 + a_2 # 2 vector ngày tháng không thực hiện phép tính được

a_3
seq_along(a_3) # vẫn áp dụng lệnh subset vector như bình thường
a_3[2]

weekdays(a_3)
months(a_3)


#################

# SỬ DỤNG LỆNH seq()

d_1 <- as.Date("2022-10-24") # chỉ dùng lệnh seq cho date vector có length = 1

chuoi_ngay <- seq(d_1, by = "4 days", length.out = 6)
chuoi_ngay

chuoi_ngay_2 <- seq(d_1, by = "2 weeks", length.out = 6)
chuoi_ngay_2

chuoi_ngay_3 <- seq(d_1, by = "2 months", length.out = 6)
chuoi_ngay_3

chuoi_ngay_4 <- seq(d_1, by = "2 years", length.out = 6)
chuoi_ngay_4

# BÀI TẬP: Tạo ra 1 vector, lặp lại ngày thứ hai và thứ năm, trong 4 tuần, tính từ ngày thứ hai "2022-10-03".

bt <- as.Date("2022-10-03")

bt_1 <- seq(bt, by = "1 weeks", length.out = 4)
bt_1

bt_2 <- seq(bt + 3, by = "1 weeks", length.out = 4)
bt_2

bt_3 <- c(bt_1, bt_2)
bt_3

sort(bt_3) 
weekdays(sort(bt_3))

###################

# FORMAT DATE

d_1 <- as.Date("2022-10-24")
d_1

d_2 <- as.Date("2022-24-10")

d_2 <- as.Date("2022-24-10", format = "%Y-%d-%m")
d_2

d_3 <- as.Date("May 5, 2009", format = "%b %d, %Y")
d_3 # ĐỊNH DẠNG VỀ KIỂU CHUẨN

d_4 <- as.Date("15/05/98", format = "%d/%m/%y")
d_4

# %Y cho kiểu ghi năm YYYY
# %y cho kiểu ghi năm YY (lưu ý từ 00 đến 68 thì được quy về 19yy, còn 69 đến 99 thì quy về 20yy)

# %d cho kiểu ghi ngày dd, kể cả không có leading zero vẫn được R bổ sung vào cho đủ.

# %m cho kiểu ghi tháng theo số

# %B cho kiểu ghi tháng theo tên đầy đủ
# %b cho kiểu ghi tháng theo tên viết tắt

# xem thêm ở đây
?strptime

################################

# LINK DOWNLOAD 
# https://tinyurl.com/3uffm2kh

data_1 <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

head(data_1)
tail(data_1)
names(data_1)
dim(data_1)
View(data_1)

sapply(data_1, class)

subset(data_1, Date == "16/12/2006") -> ok_1
ok_1

subset(data_1, Date == "01/02/2007") -> ok_2
ok_2

subset(data_1, Date == "1/2/2007") -> ok_2
ok_2

# VIỆC CHUYỂN FORMAT QUAN TRỌNG Ở CHỖ GIÚP CHÚNG TA SUBSET ĐƯỢC DỮ LIỆU THEO THỜI GIAN THEO CẤU TRÚC CHUẨN.

# KHI VẼ ĐỒ THỊ THÌ DATE VECTOR SẼ DỄ DÀNG ĐƯỢC R THỂ HIỆN THEO NGÀY THÁNG

head(data_1$Date)
class(data_1$Date)

data_1$Date <- as.Date(data_1$Date, format = "%d/%m/%Y")

subset(data_1, Date == "2007-02-01") -> ok_3

View(ok_3)

##################################

# LÀM VIỆC VỚI VECTOR NGÀY THÁNG VÀ THỜI GIAN (DATE-TIME VECTOR)

# KHI NÓI ĐẾN TIME, PHẢI GẮN LIỀN VỚI DATE.

as.Date()

as.POSIXct() # số giây tính từ năm 1970 (giờ UTC) ở dạng numeric vector

as.POSIXlt() # đối tượng lưu ở dạng list, chứa thông tin về giờ, phút, giây

####################################

### CONVERT QUA POSIXct

time_1 <- "June 20, 1995, 21:55:38"

format_1 <- "%B %d, %Y, %H:%M:%S"

time_ok <- as.POSIXct(time_1, format = format_1, tz = "Asia/Ho_Chi_Minh")

time_ok
class(time_ok)



# %H cho giờ 00-23
# %I cho giờ theo kiểu 01-12
# %M cho phút theo kiểu 00-59
# %S cho giây theo kiểu 00-59
# %p cho kiểu AM/PM indicator

time_2 <- "10:55 PM"
time_3 <- as.POSIXct(time_2, format = "%I:%M %p")
time_3 # NẾU KHÔNG XÁC ĐỊNH NGÀY THÌ R TỰ CHO NGÀY HIỆN TẠI

time_4 <- "10:55 pm"
time_5 <- as.POSIXct(time_4, format = "%I:%M %p")
time_5

time_6 <- "10:55 p.m."
time_7 <- as.POSIXct(time_6, format = "%I:%M %p")
time_7

# TRƯỜNG HỢP GHI KIỂU p.m. trong vector cần chuyển hết về pm hoặc PM.

time_6
gsub(pattern = "p\\.m\\.", replacement = "PM", x = time_6) -> time_6
time_6

######################################

### CONVERT QUA POSIXlt

test_1 <- "July 20, 1995, 21:55:38"

format_1 <- "%B %d, %Y, %H:%M:%S"

lt_ok <- as.POSIXlt(test_1, format = format_1, tz = "Asia/Ho_Chi_Minh")

lt_ok
class(lt_ok)

### SO SÁNH

ct_ok <- as.POSIXct(test_1, format = format_1, tz = "Asia/Ho_Chi_Minh")

ct_ok
class(ct_ok)

str(lt_ok)
str(ct_ok)
unclass(lt_ok)
unclass(ct_ok)
mode(lt_ok)
mode(ct_ok)

unlist(lt_ok) 
class(unlist(lt_ok))

###############  

ct_ok

lt_ok

#################

# TRÍCH XUẤT TỪ POSIXlt

lt_ok$mon
lt_ok[5] ### LƯU Ý: POSIXlt đánh số tháng từ 0 (tương ứng là tháng 1)
unclass(lt_ok)[5]
unclass(lt_ok)[[5]]
unclass(lt_ok)$mon

#################

test_2 <- "21:55:38"

lt_2 <- as.POSIXlt(test_2, format = "%H:%M:%S", tz = "Asia/Ho_Chi_Minh")
lt_2 # TƯƠNG TỰ, R cũng tự cho thông tin ngày vào thời gian.


#######################

# TRÍCH THÔNG TIN THỜI GIAN RA NGOÀI

Sys.time() -> thoigian
"2022-10-29 20:11:32 +07"

thoigian
class(thoigian) # MẶC ĐỊNH LÀ POSIXct, ko phải POSIXlt
str(thoigian)

thoigian_1 <- format(thoigian, format = "%H:%M:%S")
thoigian_1

class(thoigian_1)

thoigian_2 <- format(Sys.time(), format = "Hiện tại là %H giờ %M phút %S giây")
thoigian_2

###########################

# CÁC PHÉP TÍNH VỀ THỜI GIAN

t_1 <- as.Date("2022-10-14 20:11:32 +07")
t_1
class(t_1)
t_1 + 3
t_1

t_2 <- as.POSIXct("2022-10-14 20:11:32 +07")
t_2
class(t_2)

t_2 + 10 # Bản chất POSIXct tính theo số giây
unclass(t_2)

t_2 - 1665753092 # từ thời điểm 1970.

################################

# SO SÁNH

t_2 <- as.POSIXct("2022-10-14 20:11:32 +07")
t_2

t_4 <- as.POSIXct("1995-06-20 21:55:38 +07")
t_4

t_2 > t_4
t_2 == t_4
t_2 + t_4
t_2 - t_4
t_2 - t_4 -> t_5
class(t_5)
str(t_5)
unclass(t_5)
mode(t_5)

t_4 + t_5 == t_2
t_2

t_5 <- as.POSIXct(t_5)


as.numeric(difftime(t_2, t_4), units = "hours")
as.numeric(difftime(t_2, t_4), units = "days")

t_5

###############

### CHUYỂN DIFFTIME QUA DẠNG PERIOD HOẶC HMS

# install.packages('hms')
library(hms)

duration <- difftime(t_2, t_4)
duration
t_6 <- as_hms(duration) ## quy ra giờ
t_6
class(t_6)
mode(t_6)
str(t_6)

unclass(t_6) ## quy ra giây

t_4 + 862092954 == t_2

################

### CỘNG TRỪ THỜI GIAN

### TẠO HÀM

SubstracTimes <-  function(TimeEnter, TimeExit){
    (as.numeric(format(strptime(TimeExit, format ="%H:%M"), "%H")) + 
         as.numeric(format(strptime(TimeExit, format ="%H:%M"), "%M"))/60) -
        
        (as.numeric(format(strptime(TimeEnter, format ="%H:%M"), "%H")) + 
             as.numeric(format(strptime(TimeEnter, format ="%H:%M"), "%M"))/60)
}



t_8 <- "00:11"
t_9 <- "14:21"

t_8_ct <- as.POSIXct(t_8, format = "%H:%M")

t_9_ct <- as.POSIXct(t_9, format = "%H:%M")

SubstracTimes(t_8, t_9)

######################

# https://stackoverflow.com/questions/22659947/r-how-to-handle-times-without-dates
# https://cran.r-project.org/web/packages/chron/index.html

##########################

data_1 <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

head(data_1)
tail(data_1)
names(data_1)
dim(data_1)
View(data_1)

class(data_1$Date)
class(data_1$Time)

paste(data_1$Date, data_1$Time) -> date_full

head(date_full)

date_full <- as.POSIXct(
    date_full, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

head(date_full)

date_full[6] - date_full[1]

data_1

cbind(data_1, date_full) -> data_2

View(data_2)
names(data_2)

data_2[c(1, 2, 10, 3:9)] -> data_3
data_3
View(data_3)

sapply(data_3, class)

unlist(sapply(data_3, class))

sapply(data_1, class)

?sapply
# https://stackoverflow.com/questions/9668456/why-does-sapply-return-a-list

#############################

# TIMESTAMP

# TIME INTERVAL

# LÀM VIỆC VỚI THỜI GIAN (TIME)

# PACKAGE LUBRIDATE

#  https://docs.tibco.com/pub/enterprise-runtime-for-R/4.4.0/doc/html/Language_Reference/base/difftime.html

# https://r4ds.had.co.nz/dates-and-times.html

# https://www.geeksforgeeks.org/how-to-extract-time-from-datetime-in-r/