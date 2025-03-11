play_media <- function(url_final){
  
library(googledrive)

url_all <- paste0("https://drive.google.com/file/d/", url_final)

# public_file <-  drive_get(url_all)

drive_deauth()
drive_user()

drive_download(file = url_all,
               # path = getwd(),
               overwrite = TRUE)

library(stringi)

file_noaccent <- stri_trans_general(str = list.files(pattern="*.webm|*.mp4"), 
                                    id = "Latin-ASCII")
file_nospace <- gsub(" ", "", file_noaccent)

file_nospace <- tolower(file_nospace)

file_clean <- gsub("[[:punct:]]", "", file_nospace)

file.rename(from = list.files(pattern="*.webm|*.mp4"), 
            to = file_nospace)

# WINDOWS
shell(cmd = unique(file_nospace))

# LINUX (đã cài VLC)
# paste0(getwd(), "/", unique(file_nospace)) -> link_file
# paste0("chmod a+x ", link_file)
# 
# system(command = "chmod a+x /home/tuhocr/lamon[r89ftgysblq].webm") 
# system(command = "vlc /home/tuhocr/lamon[r89ftgysblq].webm") 

}
