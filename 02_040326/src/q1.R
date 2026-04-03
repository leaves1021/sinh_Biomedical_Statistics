# Question 1: Poisson distribution
library(dplyr)
library(glue)



# 参数计算
# 突变率
mutation_rate <- 120 / 1e+3 # 每 kb 的突变数

# 20 kb 窗口对应的泊松分布均值
window_len <- 20 # kb
lambda <- window_len * mutation_rate # 20 kb 窗口内的平均突变数
glue("X ~ Poisson({lambda})") %>%
  print()

cat("\n")

# 1-1 计算 P(X = 4) ------------------------------
cat("1-1 ------------------------------\n")

# 使用 dpois 计算 P(X = 4)
prob_X_equals_4 <- dpois(4, lambda)

# 输出结果
glue("P(X = 4) = {prob_X_equals_4}") %>%
  print()

cat("\n")

# 1-2 计算 P(X < 3) ------------------------------
cat("1-2 ------------------------------\n")

# 使用 ppois 计算 P(X < 3) = P(X <= 2)
prob_X_less_than_3 <- ppois(2, lambda)

# 输出结果
glue("P(X < 3) = {prob_X_less_than_3}") %>%
  print()

cat("\n")

# 1-3 计算 P(X > 5) ------------------------------
cat("1-3 ------------------------------\n")

# 使用 ppois 计算 P(X > 5) = 1 - P(X <= 5)
prob_X_greater_than_5 <- 1 - ppois(5, lambda)

# 输出结果
glue("P(X > 5) = {prob_X_greater_than_5}") %>%
  print()

cat("\n")
