### HƯỚNG DẪN SỬ DỤNG R TỪ A ĐẾN Z
### LIÊN HỆ MR. DUC NGUYEN | WWW.TUHOCR.COM

## FUNCTION_MIN_CHI_TIEU

"%min_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")
    }
    # find min value     
    
    ket_qua_min <- data.frame()
    
    for(min_i in seq_along(tmp_working)) { 
        
        gia_tri_min <- min(get(chi_tieu, tmp_working[[min_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[min_i]]) == gia_tri_min)
        
        ket_qua_min <- rbind(ket_qua_min, tmp_working[[min_i]][vi_tri, ])}
    print(paste("Kết quả lọc theo giá trị MIN của", chi_tieu, "là:"))
    return(ket_qua_min)    
}


## FUNCTION_MAX_CHI_TIEU

"%max_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)) { 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")
    }
    # find min value     
    
    ket_qua_max <- data.frame()
    
    for(max_i in seq_along(tmp_working)) { 
        
        gia_tri_max <- max(get(chi_tieu, tmp_working[[max_i]]), na.rm = TRUE)
        
        ### trích xuất ra vị trí index
        vi_tri <- which(get(chi_tieu, tmp_working[[max_i]]) == gia_tri_max)
        
        ket_qua_max <- rbind(c(ket_qua_max, tmp_working[[max_i]][vi_tri, ]))
    } 
    #### THÊM DÒNG THÔNG BÁO
    print(paste("Kết quả lọc theo giá trị MAX của", chi_tieu, "là:"))
    #### TRẢ KẾT QUẢ
    return(ket_qua_max)    
}

### FUNCTION RANGE CHỈ TIÊU

"%range_chi_tieu%" <- function(a, b){
    
    # import dataset
    files_list <- list.files(b, full.names = TRUE)
    
    tmp_working <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(files_list)){ 
        tmp_working[[i]] <- read.csv(files_list[i])
        tmp_working[[i]]$Date <- as.Date(tmp_working[[i]]$Date, format = "%m/%d/%Y")
    }
    
    # tìm trong khoảng
    
    ket_qua_range <- data.frame()
    
    for(range_i in seq_along(tmp_working)){
        
        ket_qua_tim_trong_khoang <- which(get(chi_tieu, tmp_working[[range_i]]) >= a[1] & get(chi_tieu, tmp_working[[range_i]]) <= a[2])
        
        ket_qua_range <- rbind(c(ket_qua_range, tmp_working[[range_i]][ket_qua_tim_trong_khoang, ]))
        
    }
    print(paste("Kết quả lọc trong khoảng, từ", a[1], "đến", a[2], "của", chi_tieu, "là:"))
    return(ket_qua_range ) 
} 

### function chung

"%chi_tieu%" <- function(a, b){
    
    if(length(a) == 1){
        switch(a, 
               "min" = a %min_chi_tieu% b, 
               "max" = a %max_chi_tieu% b)
    } else {
        a %range_chi_tieu% b
    }
    
}  

### FUNCTION FINAL

filter_theo_chi_tieu <- function(chi_tieu = "mercury", a = "min", b = "2007"){
    chi_tieu <<- chi_tieu ### sử dụng super assign
    a %chi_tieu% b
}

### HƯỚNG DẪN SỬ DỤNG R TỪ A ĐẾN Z
### LIÊN HỆ MR. DUC NGUYEN | WWW.TUHOCR.COM