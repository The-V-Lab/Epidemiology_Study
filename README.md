# The V Lab Epidemiology Learning Hub

一个面向公共卫生、医学和健康数据科学学习者的中英双语流行病学学习网站。内容涵盖疾病频率指标、研究设计、偏倚与混杂、筛查与诊断、暴发调查、因果推断、常见研究方向，以及可复现的 R 示例。

## 在线网站

访问 [The V Lab Epidemiology Learning Hub](https://laboratoirev.github.io/Epidemiology_Study/) 选择中文或英文学习指南：

- [English guide: Foundations of Epidemiology](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_basics_en.html)
- [中文指南：流行病学基础、方法与常见研究](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_basics_zh.html)

## 网站文件

- `index.html`：双语课程首页和学习入口。
- `epidemiology_basics_en.html`：英文流行病学基础指南。
- `epidemiology_basics_zh.html`：中文流行病学基础指南。
- `styles.css`：两份教程页的共享品牌样式，以及手机和打印适配。
- `og-learning-hub.png`：首页的社交分享预览图。
- `.nojekyll`：让 GitHub Pages 原样发布静态文件。
- `render.R`：在本地 Rmd 源文件存在时自动生成同名 HTML。

## 本地源文件与重新渲染

`.Rmd` 源文件包含完整教学内容和生成代码，只保存在本地工作副本中，并通过 `.gitignore` 排除；它们不会上传到 GitHub，也不会作为网站文件发布。公开仓库只保留生成后的 HTML，因此没有本地 Rmd 的公开克隆仍可直接作为静态网站使用。

在包含本地 Rmd 源文件的工作副本中运行：

```bash
Rscript render.R
```

脚本会自动发现项目根目录中的全部 Rmd 文件，寻找系统或 RStudio 自带的 Pandoc，并生成同名 HTML。所需 R packages 可安装到默认用户 library：

```r
install.packages(c("rmarkdown", "knitr"), repos = "https://cloud.r-project.org")
```

也可以使用项目内、已被 Git 忽略的 `.Rlib`：

```r
dir.create(".Rlib", showWarnings = FALSE)
install.packages(c("rmarkdown", "knitr"), lib = ".Rlib",
                 repos = "https://cloud.r-project.org")
```

教学示例使用模拟或汇总数据，不包含真实个人健康信息。
