# String theory
#
# xâu == chuỗi == text == string
#
# character: ký tự
#
# letter: chữ cái
#
# word: từ
#
# lexical: từ vựng
#
# vocabulary: từ vựng 

a <- aaoIfgh1245!2

b <- "aaoIfgh1245!2"

strsplit(b, " ")

c <- "Kỹ năng R xử lý dữ liệu"

strsplit(c, " ")

d <- "Kỹ.năng.R.xử.lý.dữ.liệu"

strsplit(d, " ")

strsplit(d, ".")

strsplit(d, "[.]") # Regular expression

strsplit(c, " ") -> ok

class(ok)

str(ok)
unlist(ok) -> ok_1

ok[[1]] -> ok_2
ok_2

class(ok_2)

######################################

e <- "nghiên_cứu_ứng_dụng"

g <- c("nghiên", "cứu")

paste(g)

h <- c("ứng", "dụng")

paste(g, h)

paste(g, h, sep = "_")

paste(g, h, sep = "_", collapse = "_")

paste(g, h, collapse = "_")

######################

paste(g, collapse = "_") -> g_1

paste(h, collapse = "_") -> h_1

paste(g_1, h_1)

paste(g_1, h_1, sep = "_")

######################


k_1 <- "nghiên cứu ứng dụng"

k_2 <- "nghiên.cứu.ứng.dụng" 

strsplit(e, split = "_") -> e_1 # tách ký tự trong e_1
e_1 # list
unlist(e_1) -> e_2 # chuyển qua vector
e_2

paste(e_2, collapse = " ") # kết dính các thành phần trong e_2 cách nhau bằng khoảng trắng

paste(e_2, collapse = ".")





























paste("Mẫu", 1:5)

paste(c("A", "B", "C"), c(1, 2, 3, 4), c("XX", "YY"))

paste(c("A", "B", "C"), c(1, 2, 3, 4), c("XX", "YY"),
      sep = "_",
      collapse = "---")
























