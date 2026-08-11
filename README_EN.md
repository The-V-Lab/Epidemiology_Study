# The V Lab Epidemiology Learning Hub

[中文](README.md) | **English**

[![The V Lab Epidemiology Learning Hub](og-learning-hub.png)](https://laboratoirev.github.io/Epidemiology_Study/)

A bilingual epidemiology learning website for students and practitioners in public health, medicine, and health data science. The curriculum starts with population thinking and develops a practical understanding of disease frequency, study design, bias and confounding, screening, outbreak investigation, causal inference, and reproducible analysis in R.

## Learn online

- [Course home: Epidemiology Learning Hub](https://laboratoirev.github.io/Epidemiology_Study/)
- [English guide: Foundations of Epidemiology](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_basics_en.html)
- [Chinese guide: 流行病学基础、方法与常见研究](https://laboratoirev.github.io/Epidemiology_Study/epidemiology_basics_zh.html)

## What you will learn

- distinguish prevalence, cumulative incidence, incidence rate, risk, odds, and person-time;
- calculate and interpret risk ratios, odds ratios, rate ratios, risk differences, and confidence intervals;
- match cross-sectional, case-control, cohort, ecological, and experimental designs to research questions;
- recognize selection bias, information bias, confounding, effect modification, and random error;
- evaluate screening and diagnostic tests, including how prevalence affects predictive values;
- outline surveillance, outbreak investigation, DAG, and target-trial reasoning workflows;
- use R for data checks, descriptive analysis, introductory regression, and reproducible reporting; and
- turn common research topics into clear, ethical, and answerable questions.

## Repository contents

- `index.html`: bilingual learning-hub home and course navigation.
- `epidemiology_basics_en.html`: complete English guide.
- `epidemiology_basics_zh.html`: complete Chinese guide.
- `styles.css`: shared branding, mobile, and print styles for both guides.
- `includes/vlab-brand.html`: The V Lab home link shown above each guide.
- `og-learning-hub.png`: social-sharing preview image.
- `render.R`: rebuilds the HTML guides when local Rmd sources are present.
- `.nojekyll`: publishes the static files unchanged through GitHub Pages.
- `README.md` / `README_EN.md`: Chinese and English project documentation.

## Local sources and rendering

> **Important:** The `.Rmd` source files remain only in the local working copy and are excluded by `.gitignore`. They are not uploaded to GitHub or published as website files. The public repository contains only the generated HTML.

To rebuild the guides in a working copy that contains the local Rmd files, install R, Pandoc (or RStudio), and these R packages:

```r
install.packages(c("rmarkdown", "knitr"), repos = "https://cloud.r-project.org")
```

Then run this command from the project root:

```bash
Rscript render.R
```

`render.R` discovers Rmd files in the project root, locates an available Pandoc installation, and produces same-named HTML files. In a public clone without Rmd sources, it exits safely without modifying the website.

For an isolated local package library, you may use the Git-ignored `.Rlib` directory:

```r
dir.create(".Rlib", showWarnings = FALSE)
install.packages(c("rmarkdown", "knitr"), lib = ".Rlib",
                 repos = "https://cloud.r-project.org")
```

## Reproducibility and privacy

The teaching examples use simulated data, aggregate data, or datasets distributed with R. They contain no real personal health information. The material is educational and does not replace a research protocol, statistical analysis plan, ethics review, clinical judgment, or local public-health guidance.

The website is deployed as static files from the root of the `main` branch through GitHub Pages. It requires no server-side code or external database.
