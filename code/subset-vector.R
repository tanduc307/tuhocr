
"Subset bằng các lệnh base-R hoặc từ package"

"Những gì không thể hiểu qua lý thuyết thì chỉ có thể hiểu qua thực hành."

"Toán tử subset [, [[, và $"

"Phân biệt với (), {}"

# https://tuhocr.netlify.app/subset-vector.svg

a <- c(-10:12)
a
seq_along(a)
length(a)
names(a)
a[3]
a[[3]]
# a$3

a[3:6]
a[[3:6]]



#############################

b <- matrix(10:18, 3, 3)
b
length(b)
seq_along(b)
names(b)

b[5]
b[[5]]
# b$5

b[5:7]
b[[5:7]]

#############################

c <- list(a, b, e = c(letters), f = list(1:6, -1:-9))
c

length(c)
seq_along(c)
names(c)

c[2]
c[[2]]
c$f # Ký hiệu `$` dành subset thành phần có tên

c[2:3]
c[[2:3]]

# https://cran.r-project.org/doc/manuals/R-lang.html#Indexing

#############################

L3 <- LETTERS[1:3]
char <- sample(L3, 10, replace = TRUE)
d <- data.frame(x = 1, y = 1:10, char = char)
d

d[3]
d[[3]]

d[2:3]
d[[2:3]]
length(d)
seq_along(d)
names(d)

# d$3
d$char

#############################

# CÁC LỆNH SUBSET THƯỜNG GẶP TRONG VECTOR

### using positive integer

x <- c(5.4, 6.2, 7.1, 4.8)
x[1]

# Lấy hai giá trị ở vị trí thứ ba và thứ nhất (index)
x[c(3, 1)]

# Lấy giá trị thứ nhất (index) và lặp lại giá trị thứ nhất 1 lần
x[c(1, 1)]

# Nếu nhập số thực sẽ được chuyển thành số nguyên
x[c(3.2, 3.3)] # Lấy giá trị thứ ba (index) và lặp lại giá trị thứ ba 1 lần

# Lấy giá trị thứ ba (index) và lặp lại giá trị thứ ba 2 lần
x[c(3, 3, 3)]

x[2]
x[2, 3]
x[, 3]
x[c(3:1, 4)][2]
x[c(3:1, 4)][c(2, 3)]

### using negative integer

x <- c(5.4, 6.2, 7.1, 4.8)

# Bỏ qua vị trí thứ nhất, lấy hết các số còn lại
x[-1]

# Bỏ qua vị trí thứ nhất và thứ năm, lấy hết các số còn lại
x[-c(1, 5)]

x[1:3]
x[-1:3]
x[-1:-3]
x[-c(1:3)]


x[c(-1, -3)]
x[-c(-1, -3)]
x[c(1, 3)]
x[c(1, -3)]
x[c(!1, -3)]
x[c(!-1, -3)]

### SUBSET THEO LOGICAL

x <- c(5.4, 6.2, 7.1, 4.8)
x[c(TRUE, TRUE, FALSE, FALSE)]
x[x > 5]
x > 5

x[which(x > 5)]
which(x > 5) # Which indices are TRUE?
?which
!which(x > 5)
which(!x > 5)

which.max(x)
max(x)
which.min(x)
min(x)

x[0]
x[0] -> k
class(k)

x_1 <- c(5.4, 6.2, 7.1, 4.8, NA, NA, 5.4, 6.3)

###

yes <- c("d", "a", "A", "b", "C", "B", "c", "c", "d", "a")
yes[1]
yes[1:4]
seq_along(yes)
# Subset (chọn) những thành phần lớn hơn a
yes[yes > "a"] 
u <- yes > "a"
u
yes[u]

###

z <- c("1", "3", 1:5)
z
z[1]

# Chọn những thành phần trong vector `z` có giá trị bằng `1`
z[z == "1"]

# Gán giá trị `12` vào những vị trí có giá trị `1` trong vector ban đầu
z[z == "1"] <- 12
z

### SUBSET THEO TÊN

x <- c(5.4, 6.2, 7.1, 4.8)
y <- setNames(x, letters[1:4])
y
?setNames

y[c("d", "c", "a")]

y[c("c", "d", "b")]

y[c("a", "a", "a")]

t <- c(abc = 1, def = 2)
t

t[c("a", "d")]
t[c("abc", "d")] # không partial matching name

t["a"]
t[["a"]]
t[["a", exact = FALSE]] # Turn off chế độ exact matching

# Khớp nhanh tên chỉ dùng với [[ và $, còn [ thì phải dùng chính xác ký tự.

r <- c(abc = 1, def = 2, me = 1:3)
r
s <- c(abc = 1, def = 2, ghi = t)
s
w <- c(abc = 1, def = 2, ghi = t, "ppp")
w

# Difference between the == and %in% operators in R

# https://www.r-bloggers.com/2022/01/how-to-compare-strings-in-r-with-examples/