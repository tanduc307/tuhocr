# Data frame = tabular data = Table = Dữ liệu dạng bảng

# Tạo data frame trong R

employee <- c("David", "Peter Jane", "West Rice")
salary <- c(21000, 23400, 26800)
age <- c(22, 53, 36)
position <- c("engineer", "coder", "builder")

data_1 <- data.frame(employee, salary, age, position)
data_1

dim(data_1)
colnames(data_1)
col.names(data_1)
rownames(data_1)
row.names(data_1)

rownames(data_1) <- c("aaa", "bbb", "ccc")

data_1

sapply(data_1, class)

str(data_1)

attributes(data_1)

summary(data_1)

unclass(data_1)

dput(data_1)

edit(data_1) -> data_2

data_2

edit(data.frame()) -> data_3

####################

# Add observation into dataframe

data_1

new_1 <- c("Jane", 21500, 29, "worker")
new_1

rbind(data_1, new_1) -> data_2

data_2
sapply(data_1, class)
sapply(data_2, class)

data_2$salary <- as.numeric(data_2$salary)

data_2$age <- as.numeric(data_2$age)

sapply(data_2, class)

# Add variable into dataframe

new_2 <- c("full time", "part time", "full time", "full time")
new_2

cbind(data_2, "ghi chú" = new_2) -> data_3

data_3

# DI CHUYỂN CỘT
colnames(data_3)[c(1, 5, 2, 3, 4)]

data_3[, colnames(data_3)[c(1, 5, 2, 3, 4)]]

# DI CHUYỂN HÀNG

rownames(data_3)[c(1, 4, 2, 3)]

data_3[rownames(data_3)[c(1, 4, 2, 3)], ]

### SỬ DỤNG PACKAGE DPLYR ĐỂ THAO TÁC TRÊN DẠNG BẢNG THUẬN TIỆN HƠN.

########################

# 1/ Data frame vs Matrix

mt_1 <- matrix(1:20, 4, 5)
mt_1
class(mt_1)
as.data.frame(mt_1) -> df_1
df_1
class(df_1)
as.matrix(df_1) -> mt_2
mt_2

dimnames(mt_1) <- list(aaa = c("a", "b", "c", "d"), bbb = c("r", "t", "h", "i", "j"))
mt_1
as.data.frame(mt_1) -> df_2
df_2

sapply(df_2, class)

yes <- c("www", "eee", "rrr", "yyy")

cbind(df_2, yes) -> df_3
df_3
sapply(df_3, class)

as.matrix(df_3) -> mt_3
mt_3

# 2/ Data frame vs Tibble vs Table

library(dplyr)
library(tibble)

?tibble

mtcars
tibble(mtcars)
as_tibble(mtcars)

mtcars_tbl <- rownames_to_column(mtcars, var = "car") %>% as_tibble()
mtcars_tbl


read.csv("ketqua_eng.csv") -> ok_1
ok_1

readxl::read_excel("nhanvien_file_dummy.xlsx") -> ok_2
ok_2


# https://tibble.tidyverse.org/reference/rownames.html
# https://www.educative.io/answers/what-is-tibble-versus-data-frame-in-r
# https://dcl-prog.stanford.edu/data-structure-basics.html#tibbles
# https://tibble.tidyverse.org/reference/tbl_df-class.html


?table # Bảng tần số

?table()
?unique()
table(mtcars$cyl)
unique(mtcars$cyl)


# 3/ Data frame vs List

list(aaa = c("a", "b", "c", "d"), bbb = c("r", "t", "h", "i", "j"), ggg = list(1:23, LETTERS, df_1), mt_1)

# List có thể chứa list, data frame, matrix, vector; trong khi data frame không thể chứa những thành phần nhỏ hơn.

# Dữ liệu trong list bố trí theo hàng ngang. Trong data frame thì mỗi cột là 1 variable (vector)


# https://r4ds.had.co.nz/vectors.html#lists
# https://dcl-prog.stanford.edu/purrr-extras.html

##################

# Subset data frame

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])

df
######### SUBSET THEO KIỂU LIST
df["y"]

mt_1 <- as.matrix(df)
mt_1

mt_1["y"]
mt_1[, "y"]
mt_1[, "y", drop = FALSE]

######### SUBSET THEO KIỂU MATRIX

df[c("x", "z")] # KO CÓ DẤU PHẨY (THEO KIỂU LIST)
df[, c("x", "z")] # CÓ DẤU PHẨY (THEO KIỂU MATRIX)

df[2:3, c("x", "z")]

df[c(1, 3), ] # Chọn hàng 1 và 3, còn lại lấy hết các cột

df[c(1, 1, 2)] # Chọn cột 1, cột 1 và cột 2

############

df["x"]
df[, "x"] # Nếu là 1 cột thì subset ra vector
df[, "x", drop = FALSE]

############

df$x == 1 # TRẢ VỀ VECTOR LOGIC
df[df$x == 1] # SUBSET KO ĐÚNG Ý
df[df$x == 1, ] # CHÚ Ý CÓ DẤU PHẨY

######################

mtcars
mtcars -> df_2

df_2["mpg"]
df_2[, "mpg"]
df_2$mpg
df_2[["mpg"]]
df_2[["mp", exact = FALSE]]

head(df_2)
colnames(df_2)[2] <- "số lượng xy lanh"
df_2

df_2$số lượng xy lanh
df_2$`số lượng xy lanh` # dấu backstick
df_2$'số lượng xy lanh'
df_2$"số lượng xy lanh"

##############################

# Extract rows from data frame with row names

df_2

get_1 <- c("Toyota Corona", "Datsun 710")

z_1 <- df_2[rownames(df_2) %in% get_1, ]
z_1









rownames(df_2) %in% get_1
rownames(df_2) == get_1

?'%in%'

1:10 %in% c(1, 3, 5, 9)

get_2 <- "Toyota"
z_2 <- df_2[rownames(df_2) %in% get_2, ]
z_2

grep(pattern = "Toyota", rownames(df_2)) -> get_3

get_3

z_3 <- df_2[get_3, ]
z_3

grep(pattern = "Toyota|Merc", rownames(df_2)) -> get_4
get_4

z_4 <- df_2[get_4, ]
z_4

#####

x <- subset(df_2, rownames(df_2) == "Toyota Corona")
rownames(df_2) == "Toyota Corona"
x

y <- subset(df_2, rownames(df_2) %in% "Toyota Corona")
rownames(df_2) %in% "Toyota Corona"
y

mt_1 <- matrix(1:20, 4, 5)
mt_1
subset(mt_1, c(T, F, T, T))

mt_1[mt_1[seq_along(mt_1)] > 6]

vec_1 <- 1:20
vec_1
subset(vec_1, vec_1 > 4 & vec_1 < 11)


















###############

head(airquality, n = 15)
dim(airquality)

airquality -> df_3
head(df_3)
dim(df_3)
subset(df_3, Temp > 80, select = c(Ozone, Temp)) -> df_3_temp80

subset(df_3, Temp > 60 & Month == 5, select = c(Ozone, Temp, Month)) -> df_4
df_4

head(df_3_temp80, n = 10)


subset(df_3, Day == 1, select = -Temp) -> df_5
df_5

subset(df_3, select = Ozone:Wind) -> df_6
head(df_6)
dim(df_6)

na.omit(df_6) -> df_7
df_7
dim(df_7)

df_8 <- subset(df_6, !is.na(df_6$Ozone), select = Ozone:Wind)
df_8
dim(df_8)
