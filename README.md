# Final Project: Diabetes Data Analysis

## Project overview
This repository contains my DATA 550 final project. The project uses a diabetes dataset to perform a simple descriptive analysis and create a final report in R Markdown.

The report includes:
- an introduction to the dataset
- a descriptive summary table
- a figure showing the relationship between BMI and glucose by diabetes status
- brief written interpretation of the table and figure

## Repository structure
```text
.
├── final_report.Rmd
├── diabetes.csv
├── Makefile
├── README.md
├── code/
│   ├── 01_load_clean_data.R
│   ├── 02_make_table.R
│   ├── 03_make_figure.R
│   └── 04_render_report.R
└── output/
```

## Data
- `diabetes.csv` contains the dataset used for the analysis.

## How to generate the final report
Open the terminal in the project directory and run:

```bash
make
```

This command will:
1. load and clean the data
2. create the summary table
3. create the figure
4. render the final HTML report

The final report will be saved as:

```text
output/final_report.html
```

## Where the table is created
The code for creating the required table is located in:

```text
code/02_make_table.R
```

This script reads the cleaned analysis dataset and creates the descriptive summary table saved as:

```text
output/summary_tbl.rds
```

## Where the figure is created
The code for creating the required figure is located in:

```text
code/03_make_figure.R
```

This script reads the cleaned analysis dataset and creates the scatterplot saved as:

```text
output/glucose_bmi_plot.png
```

## How the report is rendered
The final report is rendered by:

```text
code/04_render_report.R
```

This script renders:

```text
final_report.Rmd
```

and writes the final HTML output to:

```text
output/final_report.html
```
