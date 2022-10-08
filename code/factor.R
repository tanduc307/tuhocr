
data_student <- read.csv("test_factor.csv")
head(data_student, n = 30)
dim(data_student)
sapply(data_student, class)

fit1 <- lm(write ~ factor(race), data = data_student)
fit1

fit3 <- lm(write ~ factor(race) - 1, data = data_student)
fit3

summary(fit1)
summary(fit3)

##################

flower <- c("hồng", "mai", "cúc", "cúc", "mai", "lan", "hồng", "sen", "sen")

factor(flower)
factor(flower) -> flower_1
levels(flower)
levels(flower_1)

is.character(flower_1)
is.factor(flower_1)
is.atomic(flower_1)
typeof(flower_1)
typeof(flower)
mode(flower_1)
mode(flower)

str(flower)
str(flower_1)

factor(flower, ordered = TRUE, levels = c("mai", "hồng", "sen", "cúc", "lan")) -> flower_3

as.numeric(flower_1)

as.numeric(flower)

flower_2 <- as.character(flower_1)

gl(n, k, length = n*k, labels = seq_len(n), ordered = FALSE)

########################

data_student_1 <- read.csv("test_factor_1.csv")
head(data_student_1, n = 20)

data_student_1$race <- factor(data_student_1$race, ordered = FALSE)

fit_unordered <- lm(write ~ race, data = data_student_1)
fit_unordered
summary(fit_unordered)

data_student_1$race <- factor(data_student_1$race, ordered = TRUE)

fit_ordered <- lm(write ~ race, data = data_student_1)
fit_ordered
summary(fit_ordered)


data_student_1 <- read.csv("test_factor_1.csv")
data_student_1
boxplot(data_student_1$race ~ data_student_1$write)
?boxplot
boxplot(data_student_1$write ~ data_student_1$race)
data_student_1$race <- factor(data_student_1$race, levels = c("c", "d", "a", "b"))
boxplot(data_student_1$write ~ data_student_1$race)
data_student_1$race <- factor(data_student_1$race, levels = c("c", "d", "a", "b"), ordered = TRUE)
boxplot(data_student_1$write ~ data_student_1$race)

########################

sapply(nhanvien, class)

nhanvien$`Vị trí` <- as.factor(nhanvien$`Vị trí`)

# PHÂN BIỆT GIỮA ORDERED VÀ UNORDERED FACTOR
# https://stat.ethz.ch/pipermail/r-help/2009-November/410726.html
# https://colinfay.me/intro-to-r/ordered-and-unordered-factors.html
# https://data.library.virginia.edu/understanding-ordered-factors-in-a-linear-model/
# https://www.researchgate.net/post/How_important_is_the_order_of_the_variables_in_a_linear_regression

# LÝ DO NÊN CHUYỂN CHARACTER VECTOR QUA FACTOR

# Most statistical operations within R that can act on a character variable will essentially convert to a factor first. So, it’s more efficient to convert characters to factors before passing them into these kinds of functions. This also gives us more control over what we’re going to get.

# Factors are stored as numbers and a table of levels. If you have categorical data, storing it as a factor may save lots of memory.
# Comparisons with factors should be quicker too because equality is tested by comparing the numbers, not the character values.
# If name is not categorical, and it sounds like it isn't, then use character.

# https://michaelbarrowman.co.uk/post/convert-all-character-variables-to-factors/

# LÀM RÕ VỀ FACTOR

# https://www.r-bloggers.com/2014/09/factors-are-not-first-class-citizens-in-r/
# https://stackoverflow.com/questions/15070738/when-to-use-factor-when-plotting-with-ggplot-in-r    
# https://stackoverflow.com/questions/8652694/r-use-of-factor
# https://www.quantumforest.com/2011/12/15/r-pitfall-3-friggin-factors/
# https://r4ds.had.co.nz/factors.html
# https://www.stat.berkeley.edu/~s133/factors.html
# https://datascience.stackexchange.com/questions/12018/when-to-choose-character-instead-of-factor-in-r