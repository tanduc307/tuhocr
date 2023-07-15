library(FAOSTAT)
data_folder <- "data_raw_1"
dir.create(data_folder) ## tạo folder lưu file trên máy tính
fao_metadata_1 <- FAOsearch()


fao_metadata_2 <- search_dataset()

View(fao_metadata_2)

?FAOsearch

FAOsearch(dataset = "crop", full = FALSE)

search_dataset(dataset = "crop", full = FALSE)
# 
# ## dòng lệnh này sẽ thực thi truy vấn download full dataset nông nghiệp về máy tính
crop_production <- get_faostat_bulk(code = "QCL", 
                                    data_folder = data_folder)
# 
# ## bạn save object này ra thành 1 file riêng biệt để thuận tiện sử dụng sau này
# saveRDS(crop_production, "data_raw/crop_production_e_all_data.rds")

packageVersion("FAOSTAT")

search()

detach("package:FAOSTAT", unload = TRUE)

remove.packages("FAOSTAT")

install.packages("https://cran.r-project.org/src/contrib/Archive/FAOSTAT/FAOSTAT_2.2.4.tar.gz",
                 repos = NULL, 
                 type = "source")

# https://stackoverflow.com/questions/6979917/how-to-unload-a-package-without-restarting-r
# https://www.programmingr.com/how-to-uninstall-an-r-package/
# https://rstudio.github.io/packrat/
# https://stackoverflow.com/questions/2988559/how-do-you-use-multiple-versions-of-the-same-r-package
# https://support.posit.co/hc/en-us/articles/219949047-Installing-older-versions-of-packages



