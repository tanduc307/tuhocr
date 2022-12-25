# CÁC LỆNH HỌ APPLY

# apply, lapply, sapply...

# Cách tìm tên hàm trong R

# Cách 1:

# Search trên Environment/package base 

# Cách 2: 
names(methods:::.BasicFunsList)

grep("apply", x = names(methods:::.BasicFunsList), value = TRUE)

grep("list", x = names(methods:::.BasicFunsList), value = TRUE)

# Cách 3:
lsf.str("package:base") 
lsf.str("package:base") -> ok
str(ok)
length(ok)

grep("", lsf.str("package:base"), value = TRUE) -> yes
class(yes)
length(yes)
str(yes)
yes
which(yes == "apply")

grep("apply", yes, value = TRUE)

print(yes)
getOption("max.print")
options(max.print = 2000)
getOption("max.print")
print(yes)

grep("apply", yes, value = TRUE)

# Cách 4:

objects("package:base", pattern = "apply")

objects("package:base")

class(objects("package:base"))

identical(yes, objects("package:base"))

length(yes)
length(objects("package:base"))

setdiff(objects("package:base"), yes)

# Cách 5:

apropos("apply")
apropos("sapply")

find("apply")
getAnywhere("apply")

library(dplyr)
find("bind_rows")

#######################################

# "apply"  "eapply" "lapply" "mapply" "rapply" "sapply" "tapply" "vapply"

# apply

# apply(X, MARGIN, FUN, ..., simplify = TRUE)

# APPLY CHỈ ÁP DỤNG TRÊN MATRIX, ARRAY, DATA FRAME (có giá trị dim), ko áp dụng được trên vector hay list (vì dim là null)

# MARGIN 1 LÀ THEO HÀNG, 2 LÀ THEO CỘT, c(1, 2) LÀ THEO CẢ HÀNG VÀ CỘT

## CÁC PHÉP TÍNH TRÊN MATRIX

m <- matrix(21:40, 4, 5)
m

rowMeans(m)
colMeans(m)

apply(m, 1, mean) ## rowMeans(m)
apply(m, 2, mean) ## colMeans(m)

rowSums(m)
colSums(m)

apply(m, 1, sum) ## rowSums(m)
apply(m, 2, sum) ## colSums(m)

m[2, 4]
m[2, 4] <- NA
m
rowMeans(m)
rowMeans(m, na.rm = TRUE)
apply(m, 1, mean)
apply(m, 1, mean, na.rm = TRUE)

###########################

m <- matrix(21:40, 4, 5)
m

apply(m, c(1, 2), mean)
m
apply(m, c(2, 1), mean)  
t(m) # transpose


apply(m, c(1, 2), sqrt)
sqrt(m)

##################################

m
cumsum(m)
cumsum(as.vector(m))

# tính cumsum theo hàng
m
apply(m, 1, cumsum)

m[1, ]
cumsum(m[1, ])

apply(m, 2, cumsum)
m[, 1]
cumsum(m[, 1])

################################

# https://tuhocr.netlify.app/post2-for-loop.html

### TẠO VÒNG LOOP ĐỌC NHIỀU FILE .CSV

list.files("diet_data", full.names = TRUE)

# CÁCH 1

files_full <- list.files("diet_data", full.names = TRUE)

list_dataset_all <- vector(mode = "list", length = length(files_full))

for (i in seq_along(files_full)) {
    list_dataset_all[[i]] <- read.csv(files_full[[i]])
}     

# CÁCH 2 # lệnh apply

list_dataset_all_ok1 <- apply(files_full, 2, read.csv)

# chuyển qua matrix 1 hàng 5 cột
dim(files_full) <- c(1, 5)

list_dataset_all_ok1 <- apply(files_full, 2, read.csv) # rà theo từng cột


# CÁCH 3 # lệnh lapply # áp dụng trên vector, data frame, list và cả matrix

list_dataset_all_ok2 <- lapply(files_full, read.csv) # khỏi set thông số hàng hay cột vì nó sẽ rà hết theo index

# nếu là vector hay list thì rà theo index của element
# nếu là data frame sẽ rà theo index của cột/variable

identical(list_dataset_all, list_dataset_all_ok2)
identical(list_dataset_all, list_dataset_all_ok1)

# CÁCH 4 # lệnh sapply
# ĐÂY LÀ Danh sách (list) chứa 5 dataset ở dạng matrix
list_dataset_all_ok3 <- sapply(files_full, read.csv, simplify = TRUE)

class(list_dataset_all_ok3)
mode(list_dataset_all_ok3)
typeof(list_dataset_all_ok3)
str(list_dataset_all_ok3)
length(list_dataset_all_ok3)
dim(list_dataset_all_ok3)

list_dataset_all_ok4 <- sapply(files_full, read.csv, simplify = FALSE)

identical(list_dataset_all_ok2, list_dataset_all_ok4) # lý do là có tên

names(list_dataset_all_ok4) 
names(list_dataset_all_ok2)

names(list_dataset_all_ok4) <- NULL

identical(list_dataset_all_ok2, list_dataset_all_ok4)

############################################

### Làm sao gộp lại các data frame trong list vào lại thành file data frame chung?

list_dataset_all_ok4
length(list_dataset_all_ok4)

full_data_4 <- do.call(rbind, list_dataset_all_ok4) # kết quả từ sapply
full_data_2 <- do.call(rbind, list_dataset_all_ok2) # kết quả từ lapply

class(full_data_4)
row.names(full_data_4)
sapply(full_data_4, class)

class(full_data_2)
row.names(full_data_2)
sapply(full_data_2, class)

identical(full_data_4, full_data_2) 

row.names(full_data_4) <- 1:nrow(full_data_2)

identical(full_data_4, full_data_2)

#################################

list.files("diet_data", full.names = TRUE)

files_full <- list.files("diet_data", full.names = TRUE)

list_dataset_all_ok2 <- lapply(files_full, read.csv)

list_dataset_all_ok2


# áp dụng lệnh apply để rowbind dataset

# rbind ra 1 dataset chỉ lấy kết quả ngày 25:30 của mỗi dataset trong list

lapply(list_dataset_all_ok2, "[", 25:30, )

data_25_30 <- do.call(rbind, lapply(list_dataset_all_ok2, "[", 25:30, ))

data_25_30 

row.names(data_25_30) <- 1 : nrow(data_25_30)

data_25_30 

# Chuyển cột weight thành 1 matrix 5x5, col-wise

sapply(data_25_30["Weight"], "[", simplify = TRUE)
sapply(data_25_30["Weight"], "[", simplify = FALSE)

class(sapply(data_25_30["Weight"], "[", simplify = TRUE))
class(sapply(data_25_30["Weight"], "[", simplify = FALSE))

#### 
list_dataset_all_ok2

sapply(list_dataset_all_ok2, "[", 25:30, 3) -> matrix_ok
matrix_ok

# colnames(matrix_ok)

files_full 

gsub(pattern = "diet_data/|.csv", replacement = "", files_full)  -> clear

colnames(matrix_ok) <- clear

matrix_ok

#################################

# https://www.tuhocr.com/blog/so-sanh-lapply-va-docall

# We can use a function called do.call() to combine tmp into a single data frame. do.call lets you specify a function and then passes a list as if each element of the list were an argument to the function. 
# The syntax is 
# do.call(function_you_want_to_use, list_of_arguments)

tmp <- expand.grid(letters[1:2], 1:3, c("+", "-"))
?expand.grid
sapply(tmp, class)

do.call("paste", c(tmp, sep = ""))
paste(tmp$Var1, tmp$Var2, tmp$Var3, sep = "")
apply(tmp, 1, paste) 
apply(tmp, 1, paste, sep = "") 
apply(tmp, 1, paste, collapse = "")




###############################################

# lapply(X, FUN, ...)
# áp dụng trên vector, data frame, list và cả matrix ==> luôn luôn trả về là list
 
# sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)
# áp dụng trên vector, data frame, list và cả matrix ==> nếu default, simplify = TRUE thì tùy tình huống trả về vector < matrix < list

list_dataset_all_ok2 # các dataset có 4 cột và 30 dòng

# muốn tạo 1 cái list chỉ có 3 hàng ở mỗi dataset thì làm sao?

lapply(list_dataset_all_ok2, "[", c(1:3))

list_dataset_all_ok2[[1]][1:3] # subset dataframe theo cột 1:3
list_dataset_all_ok2[1:3] # subset theo list lấy 1 đến 3 dataset con
list_dataset_all_ok2[1][1:3] # subset dataset 1 (list), lấy 1:3 dataset con trong list đó.

list_dataset_all_ok2[[1]][1:3, ]
lapply(list_dataset_all_ok2, "[", c(1:3), )

lapply(list_dataset_all_ok2, "[", c(1:3), ) -> list_1

list_1

# giờ muốn tách riêng cột weight ra.

lapply(list_1, "[", 3) -> yes_1
yes_1
class(yes_1) # check class của kết quả này.
# nhưng muốn check class của từng thành phần trong đó thì sao?
lapply(yes_1, class)


lapply(list_1, "[[", 3) -> yes_2
yes_2
class(yes_2)
lapply(yes_2, class)



sapply(list_1, "[", 3) -> yes_3
yes_3
class(yes_3)
lapply(yes_3, class)
sapply(yes_3, class)


sapply(list_1, "[[", 3) -> yes_4
yes_4
class(yes_4)
lapply(yes_4, class)
sapply(yes_4, class)

######################################################

## LOAD DATASET VÀO CHECK CLASS BẰNG LỆNH SAPPLY

# LỆNH NÀO THAY CLASS CỘT HÀNG LOẠT?

nhanvien <- readxl::read_excel("Danh sách nhân viên.xlsx")
head(nhanvien)
View(nhanvien)
dim(nhanvien)
names(nhanvien)

sapply(nhanvien, class)
sapply(nhanvien, class, simplify = TRUE, USE.NAMES = TRUE)

class(sapply(nhanvien, class))

unlist(sapply(nhanvien, class))

class(unlist(sapply(nhanvien, class)))

names(unlist(sapply(nhanvien, class)))


nhanvien$`Vị trí`

nhanvien$`Vị trí` <- as.factor(nhanvien$`Vị trí`)
nhanvien$`Vị trí`

nhanvien$`Chức vụ`

# $`Vị trí`
# [1] "character"
# 
# $`Chức vụ`
# [1] "character"
# 
# $`Phòng ban`
# [1] "character"
# 
# $`Chi nhánh`
# [1] "character"
# 
# $`Giới tính`
# [1] "character"
# 
# $`Trạng thái`
# [1] "character"
# 
# $`Loại hình làm việc`
# [1] "character"
# 
# $`Loại hợp đồng`
# [1] "character"
# 
# $`Trình độ học vấn`
# [1] "character"


# yes <- c("Vị trí", "Chức vụ", "Phòng ban")
# nhanvien[yes]
# lapply(nhanvien[yes], as.factor) -> nhanvien[yes]
# sapply(nhanvien, class)
# unlist(sapply(nhanvien, class))

########

col_factor <- "`Vị trí`, `Chức vụ`, `Phòng ban`, `Chi nhánh`, `Giới tính`, `Trạng thái`, `Loại hình làm việc`, `Loại hợp đồng`, `Trình độ học vấn`"

col_factor

strsplit(col_factor, ", ") -> col_factor_1

col_factor_1

col_factor_2 <- gsub(pattern = "`", replacement = "", col_factor_1[[1]]) 

col_factor_2

nhanvien[col_factor_2]

sapply(nhanvien[col_factor_2], class)

# sapply(nhanvien[col_factor_2], as.factor)
# 
# nhanvien[col_factor_2] <- sapply(nhanvien[col_factor_2], as.factor)

lapply(nhanvien[col_factor_2], as.factor)

sapply(nhanvien[col_factor_2], class)

nhanvien[col_factor_2] <- lapply(nhanvien[col_factor_2], as.factor)

sapply(nhanvien, class)
unlist(sapply(nhanvien, class))

View(nhanvien)

nhanvien

###########


rapply(nhanvien, mean, class = "numeric")

options(scipen = 10, digits = 10)

tapply(X = nhanvien$"Lương vị trí", INDEX = nhanvien$"Vị trí", FUN = mean, na.rm = TRUE)

class(tapply(X = nhanvien$"Lương vị trí", INDEX = nhanvien$"Vị trí", FUN = mean, na.rm = TRUE))

dim(tapply(X = nhanvien$"Lương vị trí", INDEX = nhanvien$"Vị trí", FUN = mean, na.rm = TRUE))

names(tapply(X = nhanvien$"Lương vị trí", INDEX = nhanvien$"Vị trí", FUN = mean, na.rm = TRUE)) -> names_ok

as.vector(tapply(X = nhanvien$"Lương vị trí", INDEX = nhanvien$"Vị trí", FUN = mean, na.rm = TRUE)) -> salary

names(salary) <- names_ok

salary

class(salary)

tapply(X = nhanvien$"Lương vị trí", INDEX = list(nhanvien$"Vị trí", nhanvien$"Chi nhánh"), FUN = mean, na.rm = TRUE)

class(tapply(X = nhanvien$"Lương vị trí", INDEX = list(nhanvien$"Vị trí", nhanvien$"Chi nhánh"), FUN = mean, na.rm = TRUE))

tapply(X = nhanvien$"Lương vị trí", INDEX = list(nhanvien$"Vị trí", nhanvien$"Chi nhánh", nhanvien$"Loại hình làm việc"), FUN = mean, na.rm = TRUE)

class(tapply(X = nhanvien$"Lương vị trí", INDEX = list(nhanvien$"Vị trí", nhanvien$"Chi nhánh", nhanvien$"Loại hình làm việc"), FUN = mean, na.rm = TRUE))

dim(tapply(X = nhanvien$"Lương vị trí", INDEX = list(nhanvien$"Vị trí", nhanvien$"Chi nhánh", nhanvien$"Loại hình làm việc"), FUN = mean, na.rm = TRUE))
##############################

########## MỐI QUAN HỆ GIỮA CÁC LỆNH HỌ APPLY

apply() ### chỉ áp dụng trên matrix trở lên (có dim)
# 
#
lapply() ### loop trên vector, (matrix), data frame, list
lapply(X, FUN, ...)
#   ↑     # luôn trả về list
#   |     # https://stackoverflow.com/questions/45101045/
#   |     # why-use-purrrmap-instead-of-lapply/
#   |     #
|       eapply() ### áp dụng loop trên environment
#   |     # https://www.r-bloggers.com/2011/06/environments-in-r/ # list và environment có cùng bản chất.
      # http://theautomatic.net/2019/12/30/mapply-and-map-in-r/
             
values1 <- list(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9))
values1
values2 <- list(d = c(10, 11, 12), e = c(13, 14, 15), f = c(16, 17, 18))
values2
mapply(function(num1, num2) max(c(num1, num2)), values1, values2)
mapply(function(num1, num2) num1 / num2, values1, values2)

Map() # Map is actually a wrapper around mapply   
values1 <- list(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9))
values1
values2 <- list(d = c(10, 11, 12), e = c(13, 14, 15), f = c(16, 17, 18))
values2
Map(function(num1, num2) num1 / num2, values1, values2)
mapply(function(num1, num2) num1 / num2, values1, values2, SIMPLIFY = TRUE)
mapply(function(num1, num2) num1 / num2, values1, values2, SIMPLIFY = FALSE)
Map(function(num1, num2) union(num1, num2), values1, values2)


#   |
#   ↓
# sapply() ### wrapper of lapply khi set simplify = F, USE.NAMES = F
sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)
#     ## sapply() trả về object có dim thấp nhất
#
# vapply() # is similar to sapply, 
vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)
           # vapply works similarly to sapply, except that it requires an extra parameter specifying the type of the expected return value. This extra parameter is useful in coding because it can help ensure silent errors don’t cause issues for you.
           # http://theautomatic.net/2018/11/13/those-other-apply-functions/
sample_list_1 <- list(1:10, 2:18, -3:-9, "some_string", 8, "yes")
sapply(sample_list_1, max)
vapply(sample_list_1, max, numeric(1)) # rà length numeric của từng thành phần

sample_list_2 <- list(10, 20, 30, 8)
sapply(sample_list_2, max)
vapply(sample_list_2, max, numeric(1))
#  
#  
# replicate() 
replicate(n, expr, simplify = "array")
replicate(n = 10, expr = 3)
rep(x = 3, times = 10)
sapply(3, rep, 10, simplify = TRUE)
lapply(3, rep, 10)

replicate(n = 4, rnorm(10, mean = 0, sd = 1)) #generate 3 values that follow normal distribution (replicate this 4 times)
replicate(n = 4, rnorm(1000, mean = 0, sd = 1)) -> ok
apply(ok, 2, mean)

# simplify2array()
simplify2array(x, higher = TRUE, except = c(0L, 1L) 
x <- list(1, 2, 3, 4, 5)
r <- lapply(x, sqrt)
r
simplify2array(r) # xả các thành phần trong list ra
unlist(r)
sapply(x, sqrt)

y <- list(1, 2, 3, ok = list(8, 9, 10))
y
z <- lapply(y, sqrt) # không tính được thành phần trong nested list               
simplify2array(y) # không simplify được thành phần bên trong nested list
z <- rapply(y, sqrt) # tính được thành phần bên trong nested list, trả về ngang cấp

#  rapply to apply a function to elements of a given class
iris
sapply(iris, class)
rapply(iris, mean, class = "numeric") # tính toán dựa trên class của cột
rapply(iris, summary, class = "factor")
table(iris$Species)
iris$Species

### The other purpose of rapply is to apply a function recursively to a list.
temp <- list(a = c(1, 2, 3), 
            b = list(a = c(4, 5, 6), b = c(7, 8, 9)),
            c = list(a = c(10, 11, 12), b = c(13, 14, "text")))
temp
rapply(temp, sum) # trả về ngang cấp
rapply(temp, sum, class = "numeric")
rapply(temp, sum, how = "list", class = "numeric") # trả về theo đúng cấu trúc nested list




# https://r-coder.com/tapply-r/
# https://www.statology.org/tapply-r/
tapply() # The R tapply function is very similar to the apply function
tapply(X,                # Object you can split (matrix, data frame, ...)
       INDEX,            # List of factors of the same length
       FUN,              # Function to be applied to factors (or NULL)
       ...,              # Additional arguments to be passed to FUN
       default = NA,     # If simplify = TRUE, is the array initialization value
       simplify = TRUE)  # If set to FALSE returns a list object

df <- data.frame(team = c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B'),
                 position = c('G', 'G', 'F', 'F', 'G', 'G', 'F', 'F'),
                 points = c(14, 19, 13, 8, 15, 15, NA, 19),
                 assists = c(4, 3, 3, 5, 9, 14, 15, 12))

df
sapply(df, class)

#calculate mean of points, grouped by team
tapply(X = df$points, INDEX = df$team, FUN = mean, na.rm = TRUE)

#calculate mean of points, grouped by team and position
tapply(df$points, list(df$team, df$position), mean, na.rm = TRUE)

aggregate(x, by, FUN, ..., simplify = TRUE, drop = TRUE)

aggregate(x = df$points, by = list(df$team, df$position), FUN = mean, na.rm = TRUE)
aggregate(x = df$points, by = list(df$team), FUN = mean, na.rm = TRUE)

# https://stackoverflow.com/questions/25966052/what-is-the-difference-of-tapply-and-aggregate-in-r

# aggregate is designed to work on multiple columns with one function and returns a dataframe with one row for each category, while tapply is designed to work on a single vector with results returned as a matrix or array. 
# Only using a two-column matrix does not really allow the capacities of either function (or their salient differences) to be demonstrated. aggregate also has a formula method, which tapply does not.

