### các lệnh confirm Rtools trên máy tính

writeLines(strsplit(Sys.getenv("PATH"), ";")[[1]])

# Sys.getenv("PATH")

# https://stackoverflow.com/questions/71514948/how-to-set-rtools-path-for-r

# Sys.getenv("HOME")

# https://search.r-project.org/CRAN/refmans/pkgbuild/html/has_rtools.html

install.packages("pkgbuild")

library(pkgbuild)

pkgbuild::rtools_path()

pkgbuild::has_rtools(debug = FALSE)

pkgbuild::check_rtools(debug = FALSE)

# https://github.com/rstudio/rstudio/issues/3563
# https://www.h3xed.com/windows/how-to-add-to-and-edit-windows-path-variable


#### Khi cần update thủ công vị trí đường dẫn Rtools, ta thay đổi giá trị ở file này
.Renviron (sử dụng lệnh Sys.getenv("HOME") )

# chèn dòng lệnh này vào

PATH="${RTOOLS43_HOME}\usr\bin;${PATH}"
# sau đó khởi động lại RStudio

