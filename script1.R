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

write.csv(table, "gapminder_gdp.csv", quote=F)

reg <- lm(data=table, lifeExp ~ year)
summary(reg)
plot(table$year, table$lifeExp)

# make data.frame example
data <- data.frame(c("Wayne"), c("Liu"), c(26))
names(data) <- c("firstname", "lastname", "age")
data
new_person <- data.frame(c("Newton"), c("Vidal"), c(34))
names(new_person) <- c("firstname", "lastname", "age")
data2 <- rbind(data,new_person)
data2
