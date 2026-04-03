# Question 2: Exponential distribution
library(dplyr)
library(glue)



# 参数定义
# 衰变率
lambda <- 0.2 # per min
glue("X ~ Exp({lambda})") %>%
  print()

cat("\n")

# 2-1 计算半衰期 ------------------------------
cat("2-1 ------------------------------\n")

# 半衰期 t_half 满足 P(X > t_half) = 0.5
# 使用 qexp 计算 t_half
t_half <- qexp(0.5, rate = lambda)

# 输出结果
glue("半衰期 t_half = {t_half} min") %>%
  print()

cat("\n")

# 2-2 计算 P(X > 10) ------------------------------
cat("2-2 ------------------------------\n")

# 使用 pexp 计算 P(X > 10) = 1 - P(X <= 10)
prob_X_greater_than_10 <- 1 - pexp(10, rate = lambda)

# 输出结果
glue("P(X > 10) = {prob_X_greater_than_10}") %>%
  print()

cat("\n")

# 2-3 比较 P(X > 5 + 10 | X > 5) 与 P(X > 10) ------------------------------
cat("2-3 ------------------------------\n")

# 根据指数分布的无记忆性，P(X > s + t | X > s) = P(X > t)
# 因此 P(X > 5 + 10 | X > 5) = P(X > 10)
cat("根据指数分布的无记忆性，P(X > 5 + 10 | X > 5) = P(X > 10)，即“unchanged”")

cat("\n")
