# Question 4: Sampling distribution
library(dplyr)
library(glue)

set.seed(42)



# 参数定义
mu <- 25
sigma <- 8
reps <- 500 # 每位成员重复抽样次数
sample_size <- c(
  "Mark" = 6,
  "Marina" = 300,
  "Piccolo" = 2000
) # 三位组员每次抽样的样本量

# 1. 执行随机抽样：每次先抽 n 个细胞，再取样本均值；重复 reps 次
simulate_sample_means <- function(n, reps, mu, sigma) {
  replicate(reps, rnorm(n, mean = mu, sd = sigma) %>% mean()) # 每次独立抽样并计算均值
}

sample_means <- lapply(sample_size,
                       simulate_sample_means,
                       reps = reps, mu = mu, sigma = sigma) # 一个列表，包含每位成员的样本均值分布

# 2. 绘制每位成员样本均值分布（直方图 + 拟合正态线 + 理论正态线）
opar <- par(no.readonly = TRUE) # 保存当前图形参数，以便最后恢复
on.exit(par(opar), add = TRUE) # 确保在函数退出时恢复图形参数

par(mfrow = c(1, 3)) # 设置 1 行 3 列的图形布局

for (member in names(sample_means)) {
  xbar <- sample_means[[member]] # 当前成员的样本均值分布
  n <- sample_size[[member]] # 当前成员的样本量

  hist(
    xbar,
    breaks = "FD", # Freedman-Diaconis 规则自动选择合适的分箱数
    probability = TRUE, # 显示概率密度而非频数
    col = "lightblue",
    border = "white",
    main = glue("{member}: n = {n}"),
    xlab = "Sample mean (x̄)",
    ylab = "Probability density"
  )

  # 标准误被定义为抽样分布的标准差
  # 基于样本统计量的拟合（Fitted）分布线：N(mean(xbar), sd(xbar)^2)
  curve(dnorm(x, mean = mean(xbar), sd = sd(xbar)),
        add = TRUE, col = "red", lwd = 1.5)

  # 基于总体参数的理论（Theoretical）分布线：N(mu, sigma^2/n)
  curve(dnorm(x, mean = mu, sd = sigma / sqrt(n)),
        add = TRUE, col = "darkgreen", lwd = 1.5, lty = 2)

  legend(
    "topright",
    legend = c("Fitted", "Theoretical"),
    col = c("red", "darkgreen"),
    lwd = 1.5,
    lty = c(1, 2),
    bty = "n",
    cex = 0.8
  )
}

# 3. 计算模拟得到的样本均值标准差，并与理论标准误比较
comparison <- data.frame(
  member = names(sample_size), # 组员名称
  n = as.integer(sample_size), # 样本量
  empirical_sd = sapply(sample_means, sd), # 模拟得到的样本均值标准差
  theoretical_se = sigma / sqrt(sample_size), # 理论标准误
  stringsAsFactors = FALSE # 避免字符串被转换为因子
)

# 计算绝对差和相对差百分比
comparison$abs_diff <- abs(comparison$empirical_sd - comparison$theoretical_se)
comparison$rel_diff_pct <- 100 * comparison$abs_diff / comparison$theoretical_se

# 打印比较结果
comparison_print <- comparison
comparison_print[, c("empirical_sd",
                     "theoretical_se",
                     "abs_diff",
                     "rel_diff_pct")] <-
  round(comparison_print[, c("empirical_sd",
                             "theoretical_se",
                             "abs_diff",
                             "rel_diff_pct")], 3) # 保留3位小数

cat("\nEmpirical SD (of sample means) vs Theoretical SE:\n")
print(comparison_print, row.names = FALSE) # 不显示行名

cat("\nInterpretation:\n")
for (i in seq_len(nrow(comparison_print))) {
  cat(glue(
    "- {comparison_print$member[i]} (n={comparison_print$n[i]}): ", # 显示组员名称及样本量
    "Empirical SD = {comparison_print$empirical_sd[i]}, ", # 显示模拟得到的样本均值标准差
    "Theoretical SE = {comparison_print$theoretical_se[i]}, ", # 显示理论标准误
    "Relative difference = {comparison_print$rel_diff_pct[i]}%" # 显示相对差百分比
  ), "\n")
}
