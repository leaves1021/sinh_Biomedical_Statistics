# Question 5: Confidence interval
library(dplyr)
library(glue)



# 参数定义
x_bar <- 75.6 # 样本均值
sigma <- 18.2 # 已知总体标准差
n <- 50 # 样本量
conf_level <- 0.95 # 置信水平
alpha <- 1 - conf_level # 显著水平

# 由于总体标准差已知，且样本量较大（n > 30），
# 故使用 z 分布（正态分布）来构建置信区间，而不需要使用 t 分布。
# CI = x̄ ± z_(α/2) * (σ / √n)

# 1. 使用 qnorm 计算 z 分布的临界值 z_(α/2)
z_alpha_over_2 <- qnorm(1 - alpha / 2)

# 2. 计算标准误
se <- sigma / sqrt(n)

# 3. 计算 margin of error
me <- z_alpha_over_2 * se

# 4. 构建置信区间
ci_lower <- x_bar - me
ci_upper <- x_bar + me

# 输出结果
glue("95% Confidence Interval: [{ci_lower}, {ci_upper}]") %>%
  print()

cat("\n")
