# Soal 1
X <- c(78,75,67,77,70,72,78,74,77)
Y <- c(100,95,70,90,90,90,89,90,100)

# 1a
std_deviasi <- sd(Y-X)
print(std_deviasi)

# 1b
t.test(X, Y, paired = TRUE)

# 1c
t.test(X, Y, paired = TRUE, conf.level = 0.95)


# Soal 2
library(BSDA)
mu <- 20000
n_x <- 100
mean_x <- 23500
s_x <- 3900

zsum.test(mean.x = mean_x, sigma.x = s_x, n.x = n_x,
          alternative = "greater", mu = mu, conf.level=0.95)


# Soal 3
n_1 <- 19
n_2 <- 27
mean_1 <- 3.64
mean_2 <- 2.79
s_1 <- 1.67
s_2 <- 1.32

# 3bc
tsum.test(mean.x = mean_1, mean.y = mean_2, s.x = s_1, s.y = s_2,
          n.x = n_1, n.y = n_2, alternative="two.side",
          var.equal = TRUE, conf.level = 0.95)

# 3d
p_l <- qt(p = 0.025, df = 2, lower.tail = TRUE)
p_r <- qt(p = 0.025, df = 2, lower.tail = FALSE)
print(paste("nilai kritikal kiri: ", p_l, 
            "nilai kritikal kanan:", p_r))


# Soal 4
data <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", h = T)

# 4a
data$Group <- as.factor(data$Group)
data$Group <- factor(data$Group, labels = c("Kucing Oranye", "Kucing Hitam", "Kucing Putih"))

group1 = subset(data, Group == "Kucing Oranye")
group2 = subset(data, Group == "Kucing Hitam")
group3 = subset(data, Group == "Kucing Putih")

qqnorm(group1$Length)
qqline(group1$Length)

qqnorm(group2$Length)
qqline(group2$Length)

qqnorm(group3$Length)
qqline(group3$Length)

# 4b
bartlett.test(Length~Group, data = data)

# 4c
model1 <- lm(Length~Group, data = data)
anova(model1)

# 4e
TukeyHSD(aov(model1))

# 4f
library("ggplot2")
ggplot(data, aes(x = Group,y = Length)) +
  geom_boxplot(fill = c("orange", "black", "white"), color = "gray") +
  scale_x_discrete() + xlab("Group") + ylab("Length")


# Soal 5
setwd("F:\\PROJECT\\probstat\\Modul2_Probstat_5025211045")
data <- read.csv(file = "GTL.csv")

# 5a
qplot(x = Temp, y = Light, geom = "point", data = data) +
  facet_grid(.~Glass, labeller = label_both)

# 5b
data$Glass <- as.factor(data$Glass)
data$Temp <- as.factor(data$Temp)

anova <- aov(Light~Glass*Temp, data = data)
summary(anova)

# 5c
library("magrittr")
library("dplyr")
summary <- group_by(data, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(summary)

# 5d
tukey <- TukeyHSD(anova)
print(tukey)

# 5e
library("multcompView")
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
summary$Tukey <- cld$Letters
print(summary)
