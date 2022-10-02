library(readxl)
nhanvien <- read_excel("nhanvien.xlsx")
paste(nhanvien$Họ, nhanvien$Tên) -> oke
table(oke)

table(nhanvien$CCCD) -> a
a
length(a)

table(nhanvien$Họ)

paste(nhanvien$Họ, nhanvien$Tên) -> oke

table(oke)

length(oke)

nhanvien_file_dummy -> nhanvien
nhanvien$"Họ" -> a
a
nhanvien$"Tên" -> b
b
paste(a, b) -> c
c
library(tibble)
add_column(nhanvien, c, .after = "Tên") -> nhanvien_3
names(nhanvien_3)[5] <- "Họ tên"
colnames(nhanvien_3)[6] <- "Vị trí việc làm"




































