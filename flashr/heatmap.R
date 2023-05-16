### Hướng dẫn vẽ heatmap sử dụng package plot.matrix

### xử lý data về dạng matrix

rice_ready <- readRDS(file = "rice_ready.rds")

rice_ready -> rice_full_1 # gán vào object để tận dụng code template

matrix_rice <- rice_full_1[, c(1, 3, 4)] # chỉ lấy cột area, year, production

matrix_rice$area <- reorder(matrix_rice$area, matrix_rice$production)

library(dplyr)

matrix_rice <- matrix_rice |> dplyr::arrange(desc(area), year)

matrix_1 <- reshape(data = matrix_rice,
                    idvar = c("area"),
                    v.names = "production",
                    timevar = "year",
                    direction = "wide") 

colnames(matrix_1)[2:62] <- unique(matrix_rice$year)

matrix_2 <- matrix_1[, 2:62]

rownames(matrix_2) <- matrix_1[, 1]

##### PLOTTING
# https://cran.r-project.org/web/packages/plot.matrix/vignettes/plot.matrix.html

v <- matrix_2

## convert qua matrix
v <- as.matrix(v)

z <- v/1000000 # tính theo triệu tấn

nrow(z) -> so_luong_quoc_gia

a <- as.character(so_luong_quoc_gia)

### Vẽ đồ thị

library(plot.matrix)
library(RColorBrewer)

library(Cairo)
Cairo::CairoPNG(
        width = 2000,
        height = 4000,
        file = "heatmap_128.png",
        bg = "white",
        dpi = 200,
        units = "px"
        )

oldpar <- par(no.readonly = TRUE)

par(mar = c(4, 9, 6, 4)) # bottom, left, top, right

par("cex.axis" = 0.5)

par(xpd = TRUE) # đưa legend outside plot

par(mgp = c(0, 0.7, 0)) # thay đổi vị trí text của axis, 
#The margin line (in mex units) for the axis title, axis labels and axis line
                                            
plot.matrix:::plot.matrix(z,
                          las = 1,
                          key = list(side = 4, font = 2),
                          col = c("#00ffff", hsv(0.1, seq(0.15, 1, length.out = 9), 1), "#ff685d", "#ff4e41", "#ff3122"),
                          na.col = "grey",
                          main = "",
                          axis.row = list(side = 2, font = 2, tick = FALSE),
                          axis.col = list(side = 1, font = 2),
                          xlab = "", ylab = "",
                          breaks = c(0, 0.0000000001, 1, 10, 30, 60, 90, 100, 130, 160, 200, 230, 260),
                          fmt.key = "%.0f" # số thập phân
)

title(main = "Các quốc gia sản xuất lúa gạo trên thế giới (1961–2021) | Nguồn: FAOSTAT | Đồ họa: tuhocr.com",
      adj = 0, # canh lề trái/giữa/phải
      col.main = "blue", cex.main = 0.9, line = 3.5)

mysubtitle <- bquote(italic('Thứ tự của')~italic(.(a))~italic("quốc gia và vùng lãnh thổ được sắp xếp theo sản lượng sản xuất."))

mtext(side = 3, line = 1.8, adj = 0, cex = 0.8, mysubtitle, col = "red")

legend(x = "bottom",
       y = NULL,
       legend = c("Không có dữ liệu", "Không sản xuất"),
       fill = c("grey", "#00ffff"),
       x.intersp = 1,
       y.intersp = 2,
       inset = c(0, -0.045),
       box.lty = 0,
       horiz = TRUE,
       cex = 0.8,
       bg = "transparent")

par(lheight = 1.15)

text(x = 66, y = 130,
     substitute(paste(bold("Đơn vị: \ntriệu tấn"))), cex = 0.7, col = "red")

############ Vẽ chồng lên 1 heatmap để có trục hoành ở trên.

par(new = TRUE)

par(yaxt = "none")

plot.matrix:::plot.matrix(z,
                          las = 1,
                          key = list(side = 4, font = 2),
                          col = c("#00ffff", hsv(0.1, seq(0.15, 1, length.out = 9), 1), "#ff685d", "#ff4e41", "#ff3122"),
                          na.col = "grey",
                          main = "",
                          axis.row = list(side = 2, font = 2, tick = FALSE),
                          axis.col = list(side = 3, font = 2),
                          xlab = "", ylab = "",
                          breaks = c(0, 0.0000000001, 1, 10, 30, 60, 90, 100, 130, 160, 200, 230, 260),
                          fmt.key = "%.0f" # số thập phân
)

library(png) 
library(grid) 
logor <- readPNG("logo-blue.png")
grid.raster(logor, x = 0.10, y = 0.97, width = 0.1)

par(oldpar)
dev.off()

# https://tuhocr.netlify.app/flashr/heatmap_128.png






































