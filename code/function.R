# CÁCH XÂY DỰNG FUNCTION

# XEM VIDEO: CÁC LỆNH PHIÊN LÀM VIỆC

# LÝ DO CẦN BIẾT CÁCH XÂY DỰNG HÀM.

# Bài tập
# https://tinyurl.com/4sm9ce76

######################################

# FUNCTION
# Định nghĩa: https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Function-objects

f2 <- function(a, b){
            a + b
}

str(f2)
# giải thích về attribute của function
# https://stackoverflow.com/questions/15910113/what-where-are-the-attributes-of-a-function-object

f2 <- function(a = 0, b = 0){
    a + b -> kq
}

f2 <- function(a = 0, b = 0){
    a + b -> kq
    return(kq)
}

# giải thích lexical scoping
# https://rstudio-education.github.io/hopr/environments.html#scoping-rules

f2 <- function(a = 0, b = 0){
    a + b ->> kq
    return(kq)
}

#############################################

"command == lệnh"
"function call == gọi hàm/gọi lệnh để thực hiện"
"function closure = hàm được đóng gói"

# dot-dot-dot argument == tham số ... trong function

ftb <- function(a = 0, b = 0){
                tb <- mean(a) + mean(b)
                return(tb)
}

x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(7, NA, 8)


ftb(x, y)
ftb(x, z)
mean(x)
mean(z)
mean(x) + mean(z)
mean(x) + mean(z, na.rm = TRUE)

ftb <- function(a = 0, b = 0, ...){
    tb <- mean(a, ...) + mean(b, ...)
    return(tb)
}

ftb(x, z)

ftb(x, z, na.rm = TRUE)

ftb1 <- function(a = 0, b = 0){
    tb <- mean(a, na.rm = TRUE) + mean(b, na.rm = TRUE)
    return(tb)
}

#############################################

# Types of Function

# Functions are “self contained” modules of code that accomplish a specific task. 
# https://hbctraining.github.io/Intro-to-R/lessons/03_introR-functions-and-arguments.html

# R also has two types of function, i.e. Built-in Function and User-defined Function.
# https://www.javatpoint.com/r-functions#:~:text=Similar%20to%20the%20other%20languages,to%20create%20our%20own%20functions.

# [built-in function] gồm 
# • built-in function (viết bằng R code)
# • primitive function (viết bằng C code)
# • infix function (R infix operator, viết bằng C code)

# LOGIC HỌC R: làm rõ từng cái đầu tiên, để sau đó làm tương tự, hoặc chỉ quan tâm sự khác biệt với cái đầu tiên thông qua so sánh và đối chiếu.

# built-in function (viết bằng R code)
mean(1:20)
base::mean(1:20)
is.primitive(mean)
mean # press F2   or # press Ctrl +
Click 
# https://homerhanumat.github.io/r-notes/generic-function-oo.html
View(mean)
print(mean)
print.function(mean)
class(mean)
mode(mean)
typeof(mean)
# [1] "closure" # vì viết bằng R code
storage.mode(mean)
str(mean)
attributes(mean)
args(mean)

formalArgs(mean)
formals(mean)
body(mean)
environment(mean) # Vì mean là built-in fuction nên kết quả trả về thuộc global environment, ko phải local environment như user-defined function


getAnywhere(mean)

methods(mean)
mean.default
mean.Date
mean.difftime
mean.POSIXct
mean.POSIXlt

getAnywhere(mean.default)
getAnywhere(mean.Date)

Sys.Date() -> ok
ok
ok + 1:10 -> yes
yes
mean(yes)
class(yes)
mean.Date(yes) # thực chất quy hết ra số ngày rồi lấy trung bình
mean.default(yes)

vec_1 <- 1:20
mean(vec_1)
mean.Date(vec_1)
mean.Date(vec_1) - 10.5

methods(mean)
methods("mean")
methods(class = "data.frame")
?methods
methods("[[") 
methods("+")
methods(`+`)
methods(class = "Date")
methods(class = "numeric")
methods(class = "vector")
methods(class = "character")
methods("all.equal")
methods(class = "list")
methods(class = "matrix")
methods(subset)

# • primitive function (viết bằng C code)
is.primitive(sum)
sum(1:10)
base::sum(1:10)
sum
View(sum)
print(sum)
print.function(sum)
class(sum)
mode(sum)
typeof(sum)
typeof(mean)
storage.mode(sum)
storage.mode(mean)
str(sum)
attributes(sum)
args(sum)

formalArgs(sum)
formals(sum)
body(sum)
environment(sum) # Vì sum viết bằng C code nên không thể hiện source code trên RStudio

getAnywhere(sum)
methods(sum)

Sys.Date() -> ok
ok
ok + 1:10 -> yes
yes
sum(yes)
?Summary.Date
sum(as.numeric(yes))
.Date(0)
.Date(193145)
?.Date

.POSIXct(0)
class(.POSIXct(0))
.POSIXlt(0)
as.POSIXlt(.POSIXct(0))
class(as.POSIXlt(.POSIXct(0)))

example(sum)
example(mean)

# .C(), .Call(), .Fortran(), .External(), or .Internal() and .Primitive()

# https://stackoverflow.com/questions/14035506/how-to-see-the-source-code-of-r-internal-or-primitive-function

# Primitive functions are harder to write but are highly efficient. They are of two types, either type builtin or type special. 

typeof('+')
typeof(`+`)
typeof(`[`)

typeof(`-`)
typeof(`*`)
typeof(`/`)
typeof(`^`)
typeof(`$`)

10/2
typeof(`<-`)
typeof(`->`)
typeof(`<`)
typeof(`>`)
typeof(`==`)

typeof(`|`)
typeof(`&`)
typeof(`&&`)
typeof(print)
typeof(sum)

typeof(`%*%`)

print

print.function(print)

print.default

typeof(plot)
typeof(summary)

is.primitive(`+`)
.Primitive('+')
get('+', envir = baseenv())
get('mean', envir = baseenv())
getAnywhere(`+`)
body('mean')
body("+")







# Primitive functions exist primarily in C, not R, so their formals(), body(),and environment() are NULL. These functions are only found in the base package. Primitive functions are harder to write but are highly efficient. They are of two types, either type builtin or type special. 








# Nói về function ko có tên
# function ko có argument

names(methods:::.BasicFunsList) # Danh sách function trong R

# Danh sách function và object trong package R ở thẻ environment.
# There are mainly three types of function in R programming: 
# Primitive Functions (special and builtin)
# Infix Functions
# Replacement Functions

# The formals(), the list of arguments that control how you call the function.
# The body(), the code inside the function.
# The environment(), the data structure that determines how the function finds the values associated with the names.

# The formals and body are defined explicitly whenever one creates a function, but the environment is specified implicitly, based on where you define the function. 

# But there is an exception to the rule that a function has three components, some functions call C code directly. These functions are known as primitive functions.



################

# Infix Functions

# Infix functions are those functions in which the function name comes in between its arguments, and hence have two arguments. R comes with a number of built-in infix operators such as :, ::, :::, $, @, ^, *, /, +, -, >, >=, <, <=, ==, !=, !, &, &&, |, ||, ~, <-, and <<-. 

# One can create his own infix functions that start and end with %. The name of an infix function is more flexible as it can contain any sequence of characters except %. There are some predefined infix operators in R programming. 







# Phân biệt script và function và command.

# Phân biệt global environment và local environment

# Scoping rule

# Dot-dot-dot

# Method

# Variable input

# Expression
## Argument

# name of argument (có hoặc ko)
# default value of argument
# optional argument

## Function call

# source()

# Dispatch method

##########################

# To understand functions in R you need to internalise two important ideas:
#     
# Functions can be broken down into three components: arguments, body, and environment.
# There are exceptions to every rule, and in this case, there is a small selection of “primitive” base functions that are implemented purely in C.
# 
# Functions are objects, just as vectors are objects.

############################

# Function components
# A function has three parts:
#     
# The formals(), the list of arguments that control how you call the function.
# 
# The body(), the code inside the function.
# 
# The environment(), the data structure that determines how the function finds the values associated with the names.

# While the formals and body are specified explicitly when you create a function, the environment is specified implicitly, based on where you defined the function. The function environment always exists, but it is only printed when the function isn’t defined in the global environment.


f02 <- function(x, y) {
    # A comment
    x + y
}

formals(f02)
#> $x
#> 
#> 
#> $y

body(f02)
#> {
#>     x + y
#> }

environment(f02)
#> <environment: R_GlobalEnv>

str(f02)

attr(f02, "srcref")

# Primitive functions
typeof(sum)
#> [1] "builtin"
typeof(`+`)
#> [1] "special"
typeof(`$`)
# These functions exist primarily in C, not R, so their formals(), body(), and environment() are all NULL:
formals(sum)
#> NULL
body(sum)
#> NULL
environment(sum)
#> NULL

# Primitive functions are only found in the base package. While they have certain performance advantages, this benefit comes at a price: they are harder to write. For this reason, R-core generally avoids creating them unless there is no other option.

# ========> TRUY CẬP SOURCECODE của primitive function bằng C
# https://github.com/wch/r-source/blob/69b94f0c8ce9b2497f6d7a81922575f6c585b713/src/main/arithmetic.c

# https://stackoverflow.com/questions/52545380/how-to-get-the-c-c-source-code-of-the-a-secondary-function-of-r
# https://github.com/wch/r-source
# https://svn.r-project.org/R/trunk/src/main/names.c
########################

# First-class functions

# function có tên

f01 <- function(x) {
    sin(1 / x ^ 2)
}

# function ko cần tên

# If you choose not to give a function a name, you get an anonymous function. This is useful when it’s not worth the effort to figure out a name:

sapply(mtcars, function(x) length(x))

# A final option is to put functions in a list:
funs <- list(
    half = function(x) x / 2,
    double = function(x) x * 2
)

funs$double(10)
funs$half(20)
#> [1] 20

# In R, you’ll often see functions called closures. This name reflects the fact that R functions capture, or enclose, their environments.

is.primitive(sapply)
is.primitive(sum)

sum
sapply

######################################

plus_2_object <- function(a, b){
                a + b
}

plus_3_object <- function(a, b, c){
    a + b + c
}

x <- c(1:25)
y <- c(26:50)
z <- 200

#######################################

plus_2_object
str(plus_2_object)
class(plus_2_object)
mode(plus_2_object)
typeof(plus_2_object)
storage.mode(plus_2_object)
args(plus_2_object)

LÀM RÕ CÁI NÀY
> typeof(f02)
[1] "closure"
> typeof(mean)
[1] "closure"
> typeof(`+`)
[1] "builtin"




#######################################

multiply_2_object <- function(a, b) a * b

multiply_2_object <- function(a, b) {a * b}

##############################



#####################



# https://r4ds.had.co.nz/functions.html
# https://search.r-project.org/CRAN/refmans/httr/html/content.html

######################

##########################



1 + 2

mean # press F2   or # press Ctrl + Click 
View(mean)
    
methods(mean)
mean.default
getAnywhere(`mean.default`)
print.function(mean)
print.function(`+`)
UseMethod(mean)



`+.POSIXt`

# See here on why .Internal is preferred over .Primitive. And, also, as simple example of "closure"s VS "builtin"s
# https://stackoverflow.com/questions/38158371/primitive-function-in-r

# https://cran.r-project.org/doc/manuals/r-release/R-ints.html#g_t_002eInternal-vs-_002ePrimitive

# https://github.com/wch/r-source

# https://stackoverflow.com/questions/19226816/how-can-i-view-the-source-code-for-a-function

# https://rfaqs.com/source-code-of-r-method/

##########################
names(methods:::.BasicFunsList)
# XEM SOURCE CODE IN C
# http://adv-r.had.co.nz/C-interface.html

# How to see the source code of R .Internal or .Primitive function
# https://contributor.r-project.org/rdevguide/FindSource.html
# https://contributor.r-project.org/rdevguide/finding-the-source.html?utm_campaign=Next%20%E2%80%94%20Today%20I%20Learned%20About%20R&utm_medium=email&utm_source=Revue%20newsletter

# https://blog.r-hub.io/2019/05/14/read-the-source/

# https://github.com/jennybc/access-r-source
# https://www.geeksforgeeks.org/types-of-functions-in-r-programming/
# Venables, W. N., Smith, D. M., & the R Core Team. (2022). An Introduction to R. https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf 