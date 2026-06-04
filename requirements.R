# R package requirements for the breast cancer classification project.
# Run from the project root with: source("requirements.R")

required_packages <- c(
  "dplyr",
  "caTools",
  "MASS",
  "corrplot",
  "caret",
  "factoextra",
  "pROC",
  "knitr",
  "rmarkdown"
)

missing_packages <- required_packages[
  !required_packages %in% rownames(installed.packages())
]

if (length(missing_packages) > 0) {
  install.packages(missing_packages)
}

invisible(lapply(required_packages, library, character.only = TRUE))
