# "A dot (period) (.) is a wildcard in a regular expression"

# "metacharacter"

"literal period"

"Alternatives: thay thế"

"beach|beech"

"Grouping: gom nhóm"

"be(a|e)ch"

"Quantifiers: theo số lượng"

"* (occurs zero or many times) or + (occurs one or many times)"

"b(e*|a*)ch"

rwords <- c("bach", "back", "beech", "beach", "black")

grep("beach|beech", rwords, value = TRUE)

grep("be(a|e)ch", rwords, value = TRUE)

grep("b(e*|a*)ch", rwords, value = TRUE)

grep("b(e+|a+)ch", rwords, value = TRUE)


# Tài liệu tham khảo
# [1]. Handling Text in R. 
# https://faculty.nps.edu/sebuttre/home/R/text.html
# [2]. Metacharacter. https://www.gastonsanchez.com/r4strings/metacharacters.html
# [3]. Regular expression as used in R. https://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html
# [4]. https://viblo.asia/p/hoc-regular-expression-va-cuoc-doi-ban-se-bot-kho-updated-v22-Az45bnoO5xY
# [5]. https://regexr.com/


