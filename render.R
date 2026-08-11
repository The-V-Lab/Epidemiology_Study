#!/usr/bin/env Rscript

# Render all local R Markdown guides from any working directory. The published
# repository intentionally omits the Rmd sources, so a checkout without them is
# a valid no-op rather than an error.
file_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
project_dir <- if (length(file_arg)) {
  script_path <- sub("^--file=", "", file_arg[[1]])
  dirname(normalizePath(script_path, mustWork = TRUE))
} else {
  getwd()
}

setwd(project_dir)

# Use a project-local library when the developer has created one, while
# retaining the normal user and system libraries. Nothing is installed here.
project_library <- file.path(project_dir, ".Rlib")
if (dir.exists(project_library)) {
  .libPaths(unique(c(normalizePath(project_library), .libPaths())))
}

required_packages <- c("rmarkdown", "knitr")
missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing_packages)) {
  stop(
    "Missing R packages: ", paste(missing_packages, collapse = ", "),
    ". Install them first; see README.md.",
    call. = FALSE
  )
}

# RStudio bundles Pandoc in different locations across releases and platforms.
# Prefer an explicit setting, then PATH, then common RStudio installations.
pandoc_binary <- if (.Platform$OS.type == "windows") "pandoc.exe" else "pandoc"
path_pandoc <- unname(Sys.which(pandoc_binary))
path_pandoc_dir <- if (nzchar(path_pandoc)) dirname(path_pandoc) else character()

rstudio_apps <- unique(c(
  Sys.glob("/Applications/RStudio*.app"),
  Sys.glob(path.expand("~/Applications/RStudio*.app"))
))

macos_candidates <- unlist(lapply(rstudio_apps, function(app) {
  c(
    file.path(app, "Contents/Resources/app/quarto/bin/tools/aarch64"),
    file.path(app, "Contents/Resources/app/quarto/bin/tools/x86_64"),
    file.path(app, "Contents/Resources/app/quarto/bin/tools"),
    file.path(app, "Contents/MacOS/pandoc")
  )
}), use.names = FALSE)

windows_roots <- unique(c(
  Sys.getenv("ProgramFiles"),
  Sys.getenv("ProgramW6432"),
  Sys.getenv("LOCALAPPDATA")
))
windows_roots <- windows_roots[nzchar(windows_roots)]
windows_candidates <- unlist(lapply(windows_roots, function(root) {
  c(
    file.path(root, "RStudio/resources/app/quarto/bin/tools"),
    file.path(root, "RStudio/resources/app/bin/quarto/bin/tools")
  )
}), use.names = FALSE)

pandoc_candidates <- unique(c(
  Sys.getenv("RSTUDIO_PANDOC"),
  path_pandoc_dir,
  macos_candidates,
  windows_candidates,
  "/usr/lib/rstudio/resources/app/quarto/bin/tools",
  "/usr/lib/rstudio/bin/pandoc",
  Sys.glob("/usr/lib/rstudio/resources/app/quarto/bin/tools/*")
))
pandoc_candidates <- pandoc_candidates[nzchar(pandoc_candidates)]
pandoc_candidates <- pandoc_candidates[
  file.exists(file.path(pandoc_candidates, pandoc_binary))
]

if (length(pandoc_candidates)) {
  Sys.setenv(RSTUDIO_PANDOC = normalizePath(pandoc_candidates[[1]]))
}

if (!rmarkdown::pandoc_available()) {
  stop(
    "Pandoc was not found. Install Pandoc or RStudio, or set RSTUDIO_PANDOC ",
    "to the directory containing the Pandoc executable.",
    call. = FALSE
  )
}

render_inputs <- sort(list.files(
  path = project_dir,
  pattern = "[.]rmd$",
  full.names = TRUE,
  ignore.case = TRUE
))

if (!length(render_inputs)) {
  message("No local R Markdown sources were found; nothing to render.")
} else {
  message("Found ", length(render_inputs), " R Markdown source(s) to render.")
  failures <- character()

  for (input in render_inputs) {
    output_file <- paste0(tools::file_path_sans_ext(basename(input)), ".html")
    message("\nRendering ", basename(input), " -> ", output_file, " ...")

    tryCatch(
      rmarkdown::render(
        input = input,
        output_file = output_file,
        output_dir = project_dir,
        envir = new.env(parent = globalenv()),
        encoding = "UTF-8",
        quiet = FALSE
      ),
      error = function(error) {
        failures <<- c(failures, basename(input))
        message("Rendering failed for ", basename(input), ": ", conditionMessage(error))
      }
    )
  }

  if (length(failures)) {
    stop(
      "Rendering failed for: ", paste(failures, collapse = ", "),
      call. = FALSE
    )
  }

  message("\nRendered ", length(render_inputs), " guide(s) successfully.")
}
