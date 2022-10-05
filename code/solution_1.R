# download file excel: https://tinyurl.com/4swv6z56

library(readxl)
nhanvien_3 <- read_excel("nhanvien_3.xlsx")

nhanvien_3$`Họ tên` -> homework

homework

library(stringr)
word(homework, -1) -> ok

ok

sort(ok)

names(homework) <- ok

homework

################

homework[sort(names(homework))]

homework[order(names(homework))]

####

sort(homework) -> yes_1
yes_1

homework[sort(names(homework))] -> yes_2
sort(yes_2) -> yes_2

homework[order(names(homework))] -> yes_3
sort(yes_3) -> yes_3


identical(yes_1, yes_2)
identical(yes_1, yes_3)

yes_1 == yes_2

table(yes_1)

################
library(dplyr)

homework_df <- as.data.frame(homework)

homework_df %>%                
    arrange(gsub(".*\\s", "", homework_df$homework)) -> kq_1


###

kq_1$homework -> kq_2

kq_2

sort(kq_2) -> kq_2

kq_2

identical(kq_2, yes_3)

names(yes_3) <- NULL

identical(kq_2, yes_3)


gsub(".*\\s", "", homework_df$homework)

# Giải thích regular expression https://regexr.com/


