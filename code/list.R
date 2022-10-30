####### CÁCH TẠO LIST

1:20
letters
matrix(1:4, 2, 2)
mtcars[1:5, ]

list_1 <- list(1:20, letters, matrix(1:4, 2, 2), mtcars[1:5, ])

list_1

list_1 <- list(day_so = 1:20, "aaa bbb" = letters, mt_1 = matrix(1:4, 2, 2), "bảng" = mtcars[1:5, ])

list_1
class(list_1)
mode(list_1)
typeof(list_1)

dim(list_1)
length(list_1)
seq_along(list_1)

names(list_1)
str(list_1)

# The first line simply tells you that baskets.listis a list with 4 components.

# The second line contains a $, which indicates the start of the first component. The rest of that line is the structure of this component.

# The third line is preceded by .., indicating that this line also belongs to 
# the first component.

attributes(list_1)

dput(list_1)
unlist(list_1)
unclass(list_1)

##############################

# nested list

list_1

list_2 <- list(1:10, list_1)

list_2
unlist(list_2)
# install.packages("NCmisc")
library("NCmisc")
Unlist(list_2, depth = 1) # add thêm chức năng unlist theo depth

######### TÌM MAXIMUM DEPTH LIST

# install.packages("collapse")
library("collapse")
ldepth(list_2)


list_3 <- list(1:10, list_2, list(list_1))
ldepth(list_3)
list_3
list_3[[3]][[1]][[4]]


#################################

# SUBSET LIST
# Cách subset trong list tương tự như trong vector. Khi dùng `[` sẽ subset từ list mẹ ra list con. Khi dùng `[[` sẽ subset ra chính thành phần đó.

list_1 <- list(day_so = 1:20, "aaa bbb" = letters, mt_1 = matrix(1:4, 2, 2), "bảng" = mtcars[1:5, ])
list_1
names(list_1)
list_1[1]

list_1[1:3]

list_1[c(1, 4)]

list_1[1, 2]

list_1[-1]

list_1[c(T, T, F, T)]

list_1[[1]] #  a single component

list_1$day_so

list_1$`aaa bbb`

list_1[c("day_so", "mt_1")]

list_1[["mt_1"]]

list_1[["mt", exact = FALSE]]

list_1[["mt_1"]][2, 2]

####################

# THAY THẾ THÀNH PHẦN TRONG LIST
list_1 <- list(day_so = 1:20, "aaa bbb" = letters, mt_1 = matrix(1:4, 2, 2), "bảng" = mtcars[1:5, ])

ok_1 <- c(-1:7)
# list_1[1] <- ok_1 # bị lỗi vì ko cùng kiểu
list_1[1] <- list(ok_1) # chuyển qua list
list_1[[1]] <- ok_1 # vector thay thế cho vector
list_1

# THAY THẾ THÀNH PHẦN CON TRONG LIST

list_1[[1]][8] <- 100
list_1

#######################

# LOẠI THÀNH PHẦN TRONG LIST

list_1

list_1[1] <- NULL
list_1[[2]] <- NULL

# ĐƯA THÊM COMPONENT VÀO LIST

list_1
yes <- c(T, T, F, T, T)

list_yes <- list(yes)
list_yes
# cách 1
list_2 <- append(list_1, list_yes)
list_2

list_2[c(1, 3, 2)] # Thay đổi vị trí

# cách 2
list_3 <- c(list_1, list_yes)
list_3

# cách 3
list_3[[4]]

list_3[[4]] <- 1:15
list_3

##############################

# TRÍCH XUẤT DỮ LIỆU DATA FRAME TỪ LIST

list_1[["bảng"]][, 3]

list_1[["bảng"]]["hp"]

#############################

# NESTED LIST

library("collapse")
ldepth(list_2)

list_2
list_2[2] # VẪN CÒN LÀ NESTED LIST
list_2[[2]] # VẪN LÀ LIST
list_2[[[2]]] # KO ÁP DỤNG CÁCH NÀY
list_2[[2]][2] # VẪN LÀ LIST
list_2[[2]][[2]]

list_3 <- list(1:10, list_2, list(list_1))
ldepth(list_3)
list_3

str(list_3)


