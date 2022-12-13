source("filter_theo_chi_tieu.R")
filter_theo_chi_tieu("mercury", "max", "2007")

# DOWNLOAD DATA 2007.RAR
# https://tuhocr.netlify.app/code/2007.rar
# Gồm 10 file csv, đồng nhất cấu trúc mercury-nitrite-id

# DOWNLOAD DATA 2008.RAR
# https://tuhocr.netlify.app/code/2008.rar
# Gồm 8 file csv, không đồng nhất cấu trúc:
	# file 2,6,8 có thêm cột COD


filter_theo_chi_tieu("mercury", "max", "2008")


source("filter_theo_chi_tieu_enhanced.R")

filter_theo_chi_tieu("mercury", "max", "2008")

##################

filter theo chỉ tiêu mercury và nitrite thì OK, cột COD sẽ NA

nhưng filter theo COD thì bị lỗi vì lệnh get() nó chỉ lấy cột có COD thì ko có nên báo lỗi.

##########
fix lại

b <- "2008"

files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")
    }

##########

chi_tieu <- "nitrite"

ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
        
        ket_qua_min <- bind_rows(ket_qua_min, tmp_working[[min_i]][vi_tri, ])}

ket_qua_min 




ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
        
        ket_qua_min <- rbind(ket_qua_min, tmp_working[[min_i]][vi_tri, ])}

ket_qua_min 






### ok
############

chi_tieu <- "COD"

ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
        
        ket_qua_min <- bind_rows(ket_qua_min, tmp_working[[min_i]][vi_tri, ])}

ket_qua_min 

############## FIX LẠI CHỖ HÀM GET()

## XEM TIẾP Ở FILE FILTER_THEO_CHI_TIEU_ENHANCED.R Ở KHÚC CUỐI.




