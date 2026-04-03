# Question 3: Normal distribution
library(dplyr)
library(glue)



# 参数定义
# 正态分布的均值和标准差
mu <- 50
sigma <- 5
glue("X ~ N({mu}, {sigma}^2)") %>%
  print()

cat("\n")

# 3-4 计算 z-score ------------------------------
cat("3-4 ------------------------------\n")

x_obs <- 45
z_obs <- (x_obs - mu) / sigma

# 输出结果
glue("当 x = {x_obs} 时，z-score = {z_obs}") %>%
  print()

cat("\n")

# 3-5 计算 P(X < 42.3) ------------------------------
cat("3-5 ------------------------------\n")

# 使用 pnorm 计算 P(X < 42.3)
prob_X_less_than_42_3 <- pnorm(42.3, mean = mu, sd = sigma)

# 输出结果
glue("P(X < 42.3) = {prob_X_less_than_42_3}") %>%
  print()

cat("\n")

# 3-6 计算 P(X >= 55 | X >= 50) ------------------------------
cat("3-6 ------------------------------\n")

# 使用 pnorm 计算 P(X >= 55) 和 P(X >= 50)
prob_X_greater_than_55 <- 1 - pnorm(55, mean = mu, sd = sigma)
prob_X_greater_than_50 <- 1 - pnorm(50, mean = mu, sd = sigma)

# 根据条件概率公式，
# P(X >= 55 | X >= 50) = P(X >= 55 ∩ X >= 50) / P(X >= 50)
#                      = P(X >= 55) / P(X >= 50)
prob_X_greater_than_55_given_greater_than_50 <-
  prob_X_greater_than_55 / prob_X_greater_than_50

# 输出结果
glue(
  "P(X >= 55 | X >= 50) = {prob_X_greater_than_55_given_greater_than_50}"
) %>%
  print()

cat("\n")
