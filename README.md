# Breast Cancer Classification Using Leakage-Safe PCA and Logistic Regression

## Project Overview

This project builds a reproducible binary classification workflow for the Wisconsin Diagnostic Breast Cancer dataset. The goal is to distinguish malignant from benign breast tumors using diagnostic image-derived features while avoiding preprocessing leakage.

The final workflow follows the correct report and presentation:

1. Define the breast cancer classification problem and research question.
2. Describe dataset metadata, class labels, and feature groups.
3. Clean the data by removing the ID field and encoding the diagnosis label.
4. Split train/test data before fitting preprocessing steps.
5. Fit scaling and PCA on the training data only.
6. Train logistic regression on the first four training-derived principal components.
7. Evaluate with accuracy, precision, recall/sensitivity, specificity, F1 score, ROC AUC, and a confusion matrix.
8. Discuss interpretation, impact, limitations, reproducibility, and next steps.

## Research Question

Can a leakage-safe PCA and logistic regression workflow accurately classify breast masses as malignant or benign using diagnostic features computed from fine needle aspirate images?

## Dataset

The project uses the Wisconsin Diagnostic Breast Cancer dataset in `data/wdbc.data`.

Dataset summary:

- 569 total samples
- 357 benign samples
- 212 malignant samples
- 30 numeric image-derived diagnostic features
- 2 target classes: malignant and benign
- 90/10 train/test split used for the reported holdout evaluation

See `data/README.md` for dataset metadata.

## Methods

The key methodological choice is leakage-safe preprocessing. PCA is not fit on the full dataset. Instead, the data is split first; scaling and PCA are fit only on the training features, then applied to the held-out test features.

Modeling workflow:

```text
Data loading
-> label encoding
-> train/test split
-> train-only scaling and PCA
-> first 4 principal components
-> logistic regression
-> holdout evaluation
```

## Results

The correct report and presentation summarize the holdout test results:

| Metric | Value |
|---|---:|
| Accuracy | 0.983 |
| Precision | 1.000 |
| Recall / Sensitivity | 0.955 |
| Specificity | 1.000 |
| F1 Score | 0.977 |
| ROC AUC | 0.997 |

Confusion matrix:

|  | Predicted Benign | Predicted Malignant |
|---|---:|---:|
| Actual Benign | TN = 36 | FP = 0 |
| Actual Malignant | FN = 1 | TP = 21 |

The model performs strongly on this split, but recall/sensitivity is especially important because a false negative can delay clinical attention.

## Repository Structure

```text
Breast Cancer Analysis/
|-- data/
|   |-- README.md
|   `-- wdbc.data
|-- figures/
|   |-- README.md
|   |-- figure-1-class-distribution.png
|   |-- figure-2-correlation-heatmap.png
|   |-- figure-3-pca-cumulative-variance.png
|   `-- figure-4-confusion-matrix.png
|-- presentation/
|   `-- _Presentation (This is the correct file)_.pptx
|-- reports/
|   |-- _Report(Correct file).docx
|   |-- Report.docx
|   `-- Report.pdf
|-- src/
|   |-- RCode.Rmd
|   `-- evaluation_summary.R
|-- .gitignore
|-- README.md
`-- requirements.R
```

## Setup Instructions

Install R, then install the required packages from the project root:

```r
source("requirements.R")
```

To run the full analysis, open `src/RCode.Rmd` in RStudio and knit the notebook. The notebook is designed to be run from the `src/` folder because it reads the dataset using `../data/wdbc.data`.

To print only the model evaluation summary, run this from the `src/` folder:

```r
source("evaluation_summary.R")
```

## Required R Packages

The project uses:

- `dplyr`
- `caTools`
- `MASS`
- `corrplot`
- `caret`
- `factoextra`
- `pROC`
- `knitr`
- `rmarkdown`

## Deliverables

- Report: `reports/_Report(Correct file).docx`
- Clean report copy: `reports/Report.docx`
- PDF report: `reports/Report.pdf`
- Presentation: `presentation/_Presentation (This is the correct file)_.pptx`
- Source notebook: `src/RCode.Rmd`
- Evaluation script: `src/evaluation_summary.R`
- Figures: `figures/`
- Dataset: `data/wdbc.data`

## Rubric Alignment

This repository addresses the major grading categories:

- Problem definition and research question
- Explanation of need and real-world impact
- Dataset selection, labels, metadata, and augmentation decision
- Data cleaning, preprocessing, and leakage prevention
- Feature engineering through PCA
- Data visualization and insight communication
- Logistic regression modeling
- Validation with multiple classification metrics
- Result interpretation and clinical caution
- GitHub documentation, structure, reproducibility, and code execution
- Final report and presentation deliverables

