# https://www.masterclass.com/articles/how-to-use-hsv-color-model-in-photography

### scale màu
barplot(rep(1, 12), 
        col = hsv(h = seq(0, 0.8,length.out = 12), # pure color
                  s = 1, # intensity of color
                  v = 1, # lightness of color
                  alpha = 1) # transparency of color
)

barplot(rep(1, 12), 
        col = hsv(h = 0.1, 
                  s = seq(0.15, 1,length.out = 12), 
                  v = 1,
                  alpha = 1)
)


# https://colorpicker.me/#07f596
# hsv(156, 97%, 96%)    

barplot(rep(1, 12), 
        col = "#07f596"
)

barplot(rep(1, 12), 
        col = hsv(156/360, 97/100, 96/100)
)




# hsv(248, 70%, 77%)

barplot(rep(1, 13), 
        col = c("#00ffff", hsv(0.1, seq(0.15, 1, length.out = 9), 1), "#ff685d", "#ff4e41", "#ff3122")
)


barplot(rep(1, 12),
        col = hsv(h = 0.2, # pure color
                  s = 1, # intensity of color
                  v = seq(0, 1, length.out = 12), # lightness of color
                  alpha = 1))

hsv(h = seq(0, 1,length.out = 12), # pure color
    s = 1, # intensity of color
    v = 1, # lightness of color
    alpha = 1)


hsv(h = 1, s = 1, v = 1)














