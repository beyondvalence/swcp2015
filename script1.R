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

# can use droplevels() if subsetting from larger to smaller dataset
# with factors that arent used in subset dataset

gap2 <- table[table$continent == "Asia",]
str(gap2)
gap2 <- droplevels(gap2)
str(gap2)

# create function that can convert F to C
f_to_k <- function(temp) {
  kelvin <- (temp - 32)*(5/9) + 273
  return(kelvin)
}
temp <- seq(50, 100, by=5)
f_to_k(temp)

k_to_c <- function(temp) {
  celcius <- temp - 273
  return(celcius)
}

# nested functions
# from f to k to c
k_to_c(f_to_k(95))
k_to_c(f_to_k(temp))

# create function to convert F to C
# using nested functions
f_to_c <- function(temp ) {
  out <- k_to_c(f_to_k(temp))
  return(out)
}

# checks
f_to_c(32)
f_to_c(212)
f_to_c(0)

# pass large argument vectors to a function
test <- f_to_c(rnorm(1000000))
summary(test)


# section 7, challenge 3
# write a function that pastes a certain output
best_practice <- c("Write", "programs", "for", "people", "not", "computers")

fence <- function(text=best_practice, wrapper="***") {
  out <- paste0(wrapper, paste(text,collapse=" "), wrapper)
  return(out)
}
(text1 <- fence(text="hello"))

# loops
for(i in 1:nrow(table)) {
  if (table$lifeExp[i] > 50) {
    print("Excellent")
  }
  else {
    print("Needs improvement")
  }
}

# section 8, creating publication quality graphics
# using ggplot2
# docs.ggplot2.org/current

library(ggplot2)
ggplot(data=table, aes(x=lifeExp, y=gdpPercap)) + geom_point()

ggplot(data=table, aes(x=year, y=lifeExp)) + geom_point()

# stratify by country
ggplot(data=table, aes(x=year, y=lifeExp, by=country, color=continent)) + geom_point()
ggplot(data=table, aes(x=year, y=lifeExp, by=country, color=continent)) + geom_line()

ggplot(data=table, aes(x=year, y=lifeExp, by=country)) + geom_line(aes(color=continent)) + geom_point()

# facet wrapping
ggplot(data=table, aes(x=year, y=lifeExp, color=continent)) +
  geom_line() + facet_wrap(~ country) + ylab("Life Expectancy (years)")

# check dplyr, tidyr, data.table