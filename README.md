# The V Lab Epidemiology Learning Hub

**中文** | [English](README_EN.md)

[![The V Lab Epidemiology Learning Hub](og-learning-hub.png)](https://laboratoirev.github.io/Epidemiology_Study/)

一个面向公共卫生、医学和健康数据科学学习者的中英双语流行病学学习网站。三组课程从人群视角出发，系统介绍疾病频率、研究设计、偏倚与混杂、筛查与诊断、暴发调查、因果推断、进阶流行病学方法，以及可重复的 R 分析。

## 在线学习

- [课程首页：Epidemiology Learning Hub](https://laboratoirev.github.io/Epidemiology_Study/)
- [中文教程：流行病学基础、方法与常见研究](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_basics_zh.html)
- [English guide: Foundations of Epidemiology](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_basics_en.html)
- [中文专题：流行病学研究设计、研究类型、抽样与方案制定](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_research_designs_zh.html)
- [English guide: Epidemiologic Research Designs](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_research_designs_en.html)
- [中文专题：进阶流行病学方法](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_advanced_methods_zh.html)
- [English guide: Advanced Epidemiologic Methods](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_advanced_methods_en.html)

## 你将学习

- 区分患病率、累积发病率、发病密度、风险、优势和人时；
- 计算并解释风险比、优势比、率比、风险差和置信区间；
- 根据问题选择横断面、病例对照、队列、生态学或实验研究；
- 识别选择偏倚、信息偏倚、混杂、效应修饰和随机误差；
- 评价筛查与诊断试验，并理解预测值与患病率的关系；
- 概述疾病监测、暴发调查、DAG 和目标试验思维；
- 用 R 完成数据检查、描述分析、基础回归及可重复报告；
- 将常见研究主题转化为明确、合乎伦理且可回答的问题；
- 比较常用研究类型的适用问题、优点、局限及主要偏倚；
- 定义目标人群、来源人群与抽样框，选择概率或非概率抽样方法；
- 将研究问题转化为包含样本量、招募、测量、质量控制、伦理和分析计划的完整方案；
- 运用生存与竞争风险分析、现代因果效应估计、缺失数据方法、可迁移性分析和定量偏倚分析。

## 项目文件

- `index.html`：双语学习中心首页与课程导航。
- `epidemiology_basics_zh.html`：完整中文教程。
- `epidemiology_basics_en.html`：完整英文教程。
- `epidemiology_research_designs_zh.html`：中文研究设计、研究类型与抽样专题。
- `epidemiology_research_designs_en.html`：英文研究设计、研究类型与抽样专题。
- `epidemiology_advanced_methods_zh.html`：中文进阶流行病学方法专题。
- `epidemiology_advanced_methods_en.html`：英文进阶流行病学方法专题。
- `styles.css`：六份教程共享的品牌、移动端和打印样式。
- `includes/vlab-brand.html`：教程页顶部的 The V Lab 品牌入口。
- `og-learning-hub.png`：网站社交分享预览图。
- `render.R`：在本地 Rmd 源文件存在时重新生成 HTML。
- `.nojekyll`：让 GitHub Pages 原样发布静态文件。
- `README.md` / `README_EN.md`：中文和英文项目说明。

## 本地源文件与重新渲染

> **重要：** `.Rmd` 源文件只保存在本地工作副本中，并由 `.gitignore` 排除。它们不会上传到 GitHub，也不会作为网站文件发布。公开仓库仅保留生成后的 HTML。

需要重新生成教程时，请在包含本地 Rmd 文件的工作副本中安装 R、Pandoc（或 RStudio）及以下 R packages：

```r
install.packages(c("rmarkdown", "knitr"), repos = "https://cloud.r-project.org")
```

然后在项目根目录运行：

```bash
Rscript render.R
```

`render.R` 会自动发现根目录中的 Rmd 文件、寻找可用的 Pandoc，并生成同名 HTML。如果公开克隆中没有 Rmd，脚本会安全退出而不会修改网站文件。

如需隔离本地 R packages，也可以使用已被 Git 忽略的 `.Rlib`：

```r
dir.create(".Rlib", showWarnings = FALSE)
install.packages(c("rmarkdown", "knitr"), lib = ".Rlib",
                 repos = "https://cloud.r-project.org")
```

## 可重复性与隐私

教程中的分析示例使用模拟数据、汇总数据或 R 自带数据集，不包含真实个人健康信息。示例用于教学，不替代研究方案、统计分析计划、伦理审查、临床判断或当地公共卫生规范。

网站以纯静态文件形式从 GitHub Pages 的 `main` 分支根目录发布，不依赖服务器端代码或外部数据库。
