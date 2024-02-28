library(readxl)
df <- read_excel("experiment.xlsx")
df <- as.data.frame(df)
df

# windows(12, 8, rescale = "fixed")

library(lattice)
library(latticeExtra)
library(modeest) # tìm số mode

### HÌNH 1 ###

png(filename = "histogram_density.png",
    width = 12,
    height = 8, 
    units = "in",
    res = 300)

trellis.par.set(background = list(col = "#affc83"),
                panel.background = list(col = "lightyellow"))

trellis.par.set(layout.heights = list(top.padding = 5,
                                      bottom.padding = 5))

trellis.par.set(layout.widths = list(left.padding = 2,
                                     right.padding = 5))

# trellis.par.set(layout.heights = list(main = 0))

trellis.par.set(layout.heights = list(key.top = 2))

###

lattice::histogram(~ var1 + var2 + var3 + var4 + var5 + var6 + output1 + output2,
                   data = df,
                   breaks = 30, # breaks
                   # nint = 30, # n inverval
                   type = "density", #percent #count
                   
                   main = list(label = "Đánh giá sơ bộ về đặc điểm phân bố dữ liệu",
                               fontsize = 14,
                               col = "navyblue",
                               font = 2,
                               rot = 0,
                               vjust = 0),
                   
                   xlab = list(label = "Đơn vị trục hoành tương ứng đơn vị gốc của từng chỉ tiêu",
                               fontsize = 12,
                               col = "navyblue",
                               font = 2,
                               rot = 0,
                               vjust = 2),
                   
                   ylab = list(label = "Mật độ xác suất", 
                               fontsize = 12, 
                               col = "navyblue", 
                               font = 2, 
                               rot = 90,
                               vjust = 1),
                   
                   layout = c(4, 2),
                   
                   as.table = TRUE, # vẽ panel 1 lên đầu, topleft
                   
                   between = list(x = 1, y = 1), 
                   
                   scales = list(x = list(col = "red", font = 2, relation = "free"),
                                 y = list(col = "red", font = 2, relation = "free", rot = 0,
                                          limits = list(c(0, 8),     #var1
                                                        c(0, 3),     #var2
                                                        c(0, 1.5),   #var3
                                                        c(0, 0.005), #var4
                                                        c(0, 1.7),   #var5
                                                        c(0, 1),     #var6
                                                        c(0, 0.1),   #output1
                                                        c(0, 0.1))   #output2
                                 )
                   ),
                   
                   panel = function(x, ...) {
                     
                     ### vẽ histogram
                     panel.histogram(x, 
                                     col = "gray",
                                     ...)
                     
                     ### vẽ đường normal curve tương ứng từng panel
                     for(i in 1:8){
                       
                       if (panel.number() == i) {
                         panel.curve(expr = dnorm(x, mean = mean(df[, i]), sd = sd(df[, i])),
                                     col = "red",
                                     lwd = 2,
                                     lty = 1)
                         
                         # panel.abline(v = mlv(df[, i], method = "naive"),
                         #              col = "purple",
                         #              lwd = 2,
                         #              lty = 1)
                       }
                       
                     }
                     
                     ### vẽ đường kernel density
                     panel.densityplot(x,
                                       lty = 1,
                                       lwd = 2,
                                       col = "blue",
                                       darg = list(bw = "nrd0", kernel = "gaussian"),
                                       ...)
                   },
                   
                   key = list(space = "top",
                              columns = 2,
                              font = 2,
                              # title = "Chú thích",
                              lines = list(lty = c(1, 1), lwd = 2,
                                           col = c("red", "blue")),
                              text = list(c("Normal curve (probability density function)      ", 
                                            "Kernel density (empirical density estimate)")))
)

###
library(png)
library(grid)
logor <- readPNG("logor.png")

grid.raster(logor, 
            x = 0.11, 
            y = 0.92, 
            width = 0.08)

dev.off()

shell("histogram_density.png")

### HÌNH 2 ###

png(filename = "histogram_frequency.png",
    width = 12,
    height = 8, 
    units = "in",
    res = 300)

trellis.par.set(background = list(col = "#affc83"),
                panel.background = list(col = "lightyellow"))

trellis.par.set(layout.heights = list(top.padding = 5,
                                      bottom.padding = 5))

trellis.par.set(layout.widths = list(left.padding = 2,
                                     right.padding = 5))

# trellis.par.set(layout.heights = list(main = 0))

trellis.par.set(layout.heights = list(key.top = 2))

trellis.par.set(par.ylab.text = list(lineheight = 1.3))

lattice::histogram(~ var1 + var2 + var3 + var4 + var5 + var6 + output1 + output2,
                   data = df,
                   breaks = 30, # breaks
                   # nint = 30, # n inverval
                   type = "count", #percent #count
                   
                   main = list(label = "Tần số xuất hiện trong bộ dữ liệu (frequency in count number)",
                               fontsize = 14,
                               col = "navyblue",
                               font = 2,
                               rot = 0,
                               vjust = 0),
                   
                   xlab = list(label = "Đơn vị trục hoành tương ứng đơn vị gốc của từng chỉ tiêu",
                               fontsize = 12,
                               col = "navyblue",
                               font = 2,
                               rot = 0,
                               vjust = 2),
                   
                   ylab = list(label = "R sẽ tự động chia ra các khoảng (interval)\nvà đếm số lần xuất hiện của số liệu trong khoảng đó", 
                               fontsize = 12, 
                               col = "navyblue", 
                               font = 2, 
                               rot = 90,
                               vjust = 0.5),
                   
                   layout = c(4, 2),
                   
                   as.table = TRUE, # vẽ panel 1 lên đầu, topleft
                   
                   # col = "gray",
                   
                   between = list(x = 0, y = 1), 
                   
                   scales = list(x = list(col = "red", font = 2, relation = "free"),
                                 y = list(col = "red", font = 2, relation = "free", rot = 0)),
                   
                   
                   panel = function(x, ...) {
                     
                     ### vẽ histogram
                     panel.histogram(x, 
                                     col = "gray",
                                     ...)
                     
                     ### vẽ đường normal curve tương ứng từng panel
                     for(i in 1:8){
                       
                       if (panel.number() == i) {
                         
                         panel.abline(v = median(df[, i]),
                                      col = adjustcolor("blue", alpha.f = 0.7),
                                      lwd = 2,
                                      lty = 1)
                         
                         panel.abline(v = modeest::mlv(df[, i], method = "naive"),
                                      col = adjustcolor("purple", alpha.f = 0.7),
                                      lwd = 2,
                                      lty = 1)
                         
                         panel.abline(v = mean(df[, i]),
                                      col = adjustcolor("red", alpha.f = 0.7),
                                      lwd = 2,
                                      lty = 1)
                         
                         
                       }
                       
                     }
                     
                   },
                   
                   key = list(space = "top",
                              columns = 3,
                              font = 2,
                              # title = "Chú thích",
                              lines = list(lty = c(1, 1), lwd = 2,
                                           col = c("red", "blue", "purple")),
                              text = list(c("Mean (trung bình cộng)",
                                            "Median (trung vị)",
                                            "Mode (số mode)")))
                   
)

library(png)
library(grid)
logor <- readPNG("logor.png")

grid.raster(logor, 
            x = 0.12, 
            y = 0.92, 
            width = 0.08)

dev.off()

shell("histogram_frequency.png")