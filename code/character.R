# CHARACTER VECTOR - TIẾNG VIỆT TRONG R

a <- "HUONG DAN SU DUNG R DE XU LY DU LIEU"
b <- "HƯỚNG DẪN SỬ DỤNG R ĐỂ XỬ LÝ DỮ LIỆU"
c <- c("R manual", "R intro", "R blogger")

nchar(a)
nchar(b)
nchar(c)

length(a)
length(b)
length(c)

x <- rnorm(100)
plot(x, main = "SỬ DỤNG R XỬ LÝ DỮ LIỆU")


windowsFonts(font_1 = windowsFont("Times New Roman"))

plot(x, family = "font_1",
     main = "SỬ DỤNG R XỬ LÝ DỮ LIỆU")

plot(x, family = "font_1",
     main = "SỬ DỤNG R XỬ LÝ DỮ LIỆU",
     font = 1)

plot(x, family = "font_1",
     main = "SỬ DỤNG R XỬ LÝ DỮ LIỆU",
     font = 2)



readxl::read_excel("KIỂM TRA TIẾNG VIỆT TRONG R.xlsx") -> ok_1

# install.packages("vietnameseConverter")

library("vietnameseConverter")

decodeVN(
    ok_1,
    from = c("TCVN3", "VISCII", "VPS", "Unicode"),
    to = c("Unicode"),
    diacritics = TRUE
)

print("trường")
# "truờng"

print("tr\u01B0ờng")

\u01B0
U+01B0




































