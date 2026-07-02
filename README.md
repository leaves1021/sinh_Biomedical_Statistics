# sinh_Biomedical_Statistics

本仓库用于整理《生物医学统计学》课程作业、配套数据与 R 代码，主要供个人复习、查阅，也可供同学参考。

仓库中的代码从早期的分题 `.R` 脚本逐步过渡到 Quarto `.qmd` 文档。后续作业通常以 `hwXX_main.qmd` 作为主文档，通过 `include` 汇总各题代码与文字说明，并可渲染为 HTML 便于复习浏览。

## 仓库结构

每次作业通常以 `0*_mmddyy/` 命名，其中 `mmddyy` 表示日期。常见结构如下：

```text
0*_mmddyy/
├── homeworkDOC/      # 作业题目文档与助教提供的答案文档
├── src/              # 本人作答代码与说明，包含 .R 或 .qmd 文件
├── data/raw/         # 作业配套原始数据
└── _output/src/      # Quarto 文档渲染后的 HTML 输出
```

说明：

- 早期部分作业不要求使用代码作答，因此可能没有 `src/` 或代码文件。
- `02_040326/src/` 中主要是分题 `.R` 脚本。
- 从 `03_041726/` 起，主要使用 Quarto `.qmd` 文档组织作答。
- `_output/src/` 中的 HTML 文件适合直接打开阅读，用于快速复习代码、图表与文字结论。

## 作业内容概览

本课程每次作业没有固定主题。下表根据题目与代码内容概括各次作业涉及的主要统计学知识点。

| 目录 | 内容概览 |
| --- | --- |
| `01_*` | 概率论基础：加法公式（Addition Rule）、德·摩根定律（De Morgan's Laws）、全概率公式（Law of Total Probability）、波利亚罐模型（Pólya's Urn Model）变体、超几何分布（Hypergeometric Distribution）、二项分布（Binomial Distribution）、贝叶斯定理（Bayes' Theorem）等。 |
| `02_040326` | 常见概率分布、抽样分布与置信区间：Poisson distribution、Exponential distribution、Normal distribution、sampling distribution、standard error、confidence interval 等。 |
| `03_041726` | 假设检验基础：one-sample t-test、paired t-test、unpaired t-test、F-test、permutation test、Wilcoxon signed-rank test，以及对应的前提假设检查和基础可视化。 |
| `04_050826` | 自动化假设检验流程、正态性与方差齐性判断、Student's / Welch's t-test、Wilcoxon rank-sum test、BH-FDR 校正、power analysis、one-way ANOVA、Tukey's HSD post-hoc test 等。 |
| `05_052226` | 相关分析与回归模型：Pearson / Spearman correlation、simple linear regression、multiple linear regression、多重共线性、非线性关系与二次项回归、logistic regression、训练集/测试集划分等。 |
| `06_060526` | 综合统计建模与数据分析流程：one-way ANOVA、two-way ANOVA、pairwise t-test with BH correction、多元线性回归、logistic regression、PCA、K-means clustering，以及 Seurat 单细胞 RNA-seq 标准分析流程。 |

## 使用方法

### 1. 阅读已有结果

如果只希望复习作业思路和代码结果，可以优先查看：

```text
0*_mmddyy/_output/src/*.html
```

这些文件是 `.qmd` 文档渲染后的 HTML 输出，通常包含代码、运行结果、图表和文字解释。

### 2. 查看或运行 R 脚本

早期作业中的 `.R` 文件可以直接在 R / RStudio 中运行，例如：

```r
source("02_040326/src/q1.R")
```

运行前请确认当前工作目录与代码中的相对路径一致。

### 3. 渲染 Quarto 文档

对于包含 `_quarto.yml` 的作业目录，可以进入对应目录后运行：

```bash
cd 06_060526
quarto render
```

多数 Quarto 作业使用 `src/hwXX_main.qmd` 作为主文档，并在主文档中 include 各题的 `.qmd` 文件。

## 常用 R 包与工具

本仓库主要使用：

- R
- Quarto
- 常用 R 包：`dplyr`、`glue`、`knitr`、`pwr`、`ggplot2`、`GGally`、`MASS`、`Seurat`、`patchwork` 等

不同作业所需包不同。若运行某个脚本或文档时报错提示缺少包，可在 R 中安装，例如：

```r
install.packages("dplyr")
```

对于 `Seurat` 等较大的分析包，建议根据其官方安装说明配置环境。

## 文件管理说明

`.gitignore` 已排除常见本地环境文件、编辑器配置、R 历史文件、RStudio 缓存、Quarto 临时文件和 R Markdown 中间文件。因此，仓库主要保留课程文档、源码、原始数据与必要的渲染输出。

## 说明

本仓库仅用于个人课程学习、复习与同学间参考。作业题目、课程材料、助教答案及配套数据的版权归课程或原作者所有。
