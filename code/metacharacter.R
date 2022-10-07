# escape character: a special character preceded by a backslash

# metacharacter are characters that have a special meaning depending context.

# https://www.gastonsanchez.com/r4strings/metacharacters.html#the-wild-metacharacter

# https://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html

# https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Literal-constants

# https://www.regular-expressions.info/

# https://faculty.nps.edu/sebuttre/home/R/text.html#:~:text=The%20most%20commonly%20used%20are,a%20(single)%20backslash%20character


meta_1 <- ".   \   |   (   )   [   ]   {   }   $   -    ^   *   +   ?"
print(meta_1)
cat(meta_1)

meta_2 <- ".   \\   |   (   )   [   ]   {   }   $   -    ^   *   +   ?"

print(meta_2)
cat(meta_2)

a <- "Dấu \\ "

b <- "Tom said: "Hello" "
b_1 <- 'Tom said: "Hello" '
b_2 <- "Tom said: \"Hello\" "

b_3 <- "Tom said: 'Hello' "
b_4 <- 'Tom said: \'Hello\' '
print(b_3)
cat(b_3)
print(b_4)
cat(b_4)




print(b_1)
cat(b_1)

print(b_2)
cat(b_2)

print(a)
cat(a)

nchar(a)

getwd()


dulieu_1 <- read.table("D:/tuhocr/dulieu.txt", header = TRUE)
head(dulieu_1)

dulieu_2 <- read.table("D:\tuhocr\dulieu.txt", header = TRUE)
head(dulieu_2)

dulieu_3 <- read.table("D:\\tuhocr\\dulieu.txt", header = TRUE)
head(dulieu_3)

a <- "R ứng dụng trong: \n 1) xử lý dữ liệu \n 2) xử lý thống kê và \t vẽ đồ thị \n 3) nhiều lĩnh vực đa dạng"