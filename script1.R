## 20150911FRI
# software carpentry
# learning R
# 02-Project management
# http://swcarpentry.github.io/r-novice-gapminder/02-project-intro.html
table <- read.table("~/Documents/R/my_project/gapminder-FiveYearData.csv", stringsAsFactors = F, sep=",", header=T)

head(table)

table$country <- as.factor(table$country)
table$continent <- as.factor(table$continent)
str(table)
summary(table)
