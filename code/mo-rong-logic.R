# MỞ RỘNG CÁC LỆNH LOGIC VÀ LOOP

# switch()

# The nested if…else statement is especially useful when you want to execute a certain block of code when a condition is met.
# 
# However, if you want to select values based **only on a condition**, you have a better option: Use switch() function.

# switch (expression, list)
# https://www.learnbyexample.org/r-switch-function/

#### basic
x <- "a"
switch(x, "a" = "apple", "b" = "banana", "c" = "cherry")

x <- "c"
switch(x, "a" = "apple", "b" = "banana", "c" = "cherry")

x <- "a" # nếu trùng nhau thì sẽ in kết quả đầu tiên
switch(x, "a" = "apple", "a" = "banana", "b" = "cherry")

#### 

# In the case of no match, the unnamed element (if any) is returned. If there are more than one unnamed elements present, an error is raised.

x <- "z"
switch(x, "a" = "apple", 
       "b" = "banana", 
       "c" = "cherry", 
       "grapes")

x <- "z"
switch(x, "a" = "apple", 
       "b" = "banana", 
       "c" = "cherry", 
       "grapes",
       "beans")

#### numeric expression
# The numeric version of switch() works in a slightly different way. Instead of using names, the return value is determined purely with positional matching (Index).

x <- 2
v <- switch(x, "apple", "banana", "cherry")
v

x <- 5
v <- switch(x, "apple", "banana", "cherry")
v

x <- c(1, 2)
v <- switch(x, "apple", "banana", "cherry")

######################

ket_qua_chay_bo <- data.frame(
    name = c("Tom", "Mary", "Nam", "Minh", "Lan", "Quang"),
    time = c(9, 8, 10, 15, 7, 8))

ket_qua_chay_bo

# tạo ra cột thứ tự về đích

rank(ket_qua_chay_bo$time)
rank(ket_qua_chay_bo$time, ties.method = "average")
rank(ket_qua_chay_bo$time, ties.method = "first")
rank(ket_qua_chay_bo$time, ties.method = "last")
rank(ket_qua_chay_bo$time, ties.method = "min")
## TUY NHIÊN BỊ MISS HẠNG 3

# ÁP DỤNG CÁCH NÀY
as.numeric(factor(rank(ket_qua_chay_bo$time, ties.method = "min")))

## HOẶC
library(dplyr)
dplyr::dense_rank(ket_qua_chay_bo$time)

result <- as.numeric(factor(rank(ket_qua_chay_bo$time, ties.method = "min")))

ket_qua_chay_bo <- cbind(ket_qua_chay_bo, result)
ket_qua_chay_bo 


ket_qua_chay_bo$result[2] -> x
x
switch(x, "1" = "GIẢI NHẤT", "2" = "GIẢI NHÌ",
       "3" = "GIẢI BA", "4" = "KHUYẾN KHÍCH", "")

ket_qua_chay_bo$result[5] -> x
x
switch(x, "1" = "GIẢI NHẤT", "2" = "GIẢI NHÌ",
       "3" = "GIẢI BA", "4" = "KHUYẾN KHÍCH", "")

reward <- character(length = 6L)
reward

for(i in seq_along(ket_qua_chay_bo$result)) {
    x <- ket_qua_chay_bo$result[i]
    reward[i] <- switch(x, "1" = "GIẢI NHẤT", "2" = "GIẢI NHÌ",
           "3" = "GIẢI BA", "4" = "KHUYẾN KHÍCH", "")
}
reward

ket_qua_chay_bo <- cbind(ket_qua_chay_bo, reward) 
ket_qua_chay_bo

##############################################

# CONTROL FLOW

# if(cond) expr
# 
# if(cond) cons.expr  else  alt.expr
# 
# for(var in seq) expr
# 
# while(cond) expr
# 
# repeat expr
# 
# break
# 
# next, return

#### LỆNH WHILE
# SO SÁNH

count <- 0 
while(count < 4){ 
    count <- count + 1 
    print(count) 
}

count <- 0
while(count < 4){ 
    print(count) 
    count <- count + 1 
}

### rất dễ tạo ra vòng lặp vô tận
count <- 0
while(count < 4){ 
    print(count) 
    count <- count - 1 
}

###############

z <- 5
while(z >= 3 && z <= 10){
    print(z)
    coin <- rbinom(1, 1, 0.5) 
    if(coin == 1){  ## random walk
        z <- z + 1
    } else {
        z <- z - 1
    } 
}
# Kết quả ra một dãy số rất dài đến khi 
# ra ngoài điều kiện cho `z` thì dừng

#### LỆNH REPEAT VÀ BREAK
# SO SÁNH

result <- c("Hello World")
i <- 1
repeat{
    print(result)
    i <- i + 1
    if(i > 5){
        break
    }
}

for(i in 1:5){
    print("Hello World")
}

#### DỄ TẠO VÒNG LẶP VÔ TẬN
result <- c("Hello World")
i <- 1
repeat{
    print(result)
    i <- i - 1
    if(i > 5){
        break
    } 
}


#### LỆNH NEXT

for(i in 1:10){
  if(i <= 3){
    next
  }
  print(i)
}

# Lệnh next dùng để cho qua (skip) một vòng lặp. 
# Lệnh return sẽ kết thúc một hàm và gán kết quả vào một đối tượng chỉ định.

for(a in 1:10){
    if(a <= 3){
        next
    }
  return(a) # khi a đến 4 thì kết thúc vòng lặp
}
a

##### HẠN CHẾ CỦA LỆNH FOR LOOP

vec_1 <- "happy"

for(vec_1 in 1:5){
    print(vec_1)
}

for(i in 1:5){
    print(vec_1)
}

rm(list = ls()) ## tốt nhất khi test lệnh for loop thì cần remove các object đang có
ls()

vec_1 <- "happy"

for(i in 1:5){
    print(vec_1)
}
