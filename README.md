# Project Title: Exploratory Data Analysis of Mushroom Classification

A data analysis project that investigates patterns in mushroom characteristics to understand which features are most associated with edible vs. poisonous mushrooms.

## Overview

This project explores the Mushroom (Agaricus-Lepiota) dataset using Exploratory Data Analysis (EDA) to identify relationships between physical mushroom features, such as cap shape, odor, gill color, bruising, and classification as edible or poisonous.

Using R and tools from the tidyverse ecosystem, we clean, analyze, and visualize the dataset to uncover meaningful patterns. Our goal is not to build predictive models, but to understand which observable traits are the strongest indicators of toxicity and to communicate these insights through a reproducible Quarto report.

### Interesting Insight

One of the most significant findings from our analysis is that odor is strongly associated with mushroom toxicity. Mushrooms with foul, pungent, or fishy odors are highly associated with poisonous classes, while those with almond, anise, or no odor are more likely to be edible.

![Odor chart](plots/odor.jpeg)

## Data Sources and Acknowledgements

Primary Dataset: Mushroom Dataset (Agaricus-Lepiota) from the UCI Machine Learning Repository.

The dataset contains 8,124 observations and 22 categorical attributes describing mushroom characteristics. The class label identifies each mushroom as edible (`e`) or poisonous (`p`).

Observations are derived from field guide descriptions of real mushroom species in the Agaricus and Lepiota families.
Features include:

- cap shape
- cap surface
- cap color
- odor
- gill size
- gill spacing
- gill color
- bruising
- habitat
- population
- spore print color

All variables are encoded using single-character categorical codes. Attribute meanings are defined in a dataset dictionary and must be decoded before analysis.

Acknowledgements:

- Dataset originally donated by Jeff Schlimmer.
- Replacement and distribution supported by Wayne Iba.
- Documentation and maintenance by David W. Aha.

## Current Plan

Our project follows a structured workflow combining data analysis, visualization, and collaborative version control.

1. Dataset Understanding
- Review dataset documentation and attribute dictionary.
- Decode categorical variables such as cap shape, odor, and gill color.
- Understand class labels for edible and poisonous mushrooms.

2. Research Question Definition
- Which features are the strongest indicators of toxicity?
- How do feature distributions differ between edible and poisonous mushrooms?
- Which combinations of traits provide the most insight?

3. GitHub Collaboration Setup
- Use branches to isolate work.
- Use commits for version tracking.
- Use pull requests for peer review.

4. Data Import and Cleaning
- Load the raw dataset into R.
- Handle missing or ambiguous values.
- Recode categorical values for interpretability.

5. Data Validation
- Cross-check the cleaned dataset.
- Ensure consistency, accuracy, and readiness for analysis.

6. Exploratory Data Analysis
- Compute frequency distributions of features.
- Summarize class balance for edible and poisonous mushrooms.
- Analyze relationships between variables and class label.

7. Visualization Design and Development
- Establish consistent colors, themes, and labels.
- Create visualizations using `ggplot2`.
- Refine plots with clear titles, legends, and captions.

8. Interpretation and Storytelling
- Interpret visual findings.
- Write clear explanations of observed patterns.
- Connect visual insights to the research questions.

9. Report Construction
- Integrate code, outputs, and narrative into a Quarto report.
- Render the final report as a PDF.
- Verify formatting, clarity, and completeness.

## Repo Structure

```text
data/                          # Dataset files
plots/                         # Generated visualizations
Data_Cleaning.R                # Data cleaning and preprocessing script
summarystat_analysis_visuals.R # Summary statistics and visualization script
linting_script.R               # Code quality and linting checks
Mushroom_project.qmd           # Main Quarto report file
Mushroom_project.pdf           # Rendered PDF report
Project Plan                   # Project planning document
Project_Guidelines.md          # Course project guidelines
README.md                      # Project documentation
.gitignore                     # Files ignored by Git
.gitattributes                 # Git file handling configuration
.lintr                         # R linting rules
MLA9.csl                       # MLA citation style file
apa7.csl                       # APA citation style file
```

## Key Files

- `Data_Cleaning.R`: Handles dataset import, cleaning, recoding of categorical variables, and formatting for analysis.
- `summarystat_analysis_visuals.R`: Performs exploratory data analysis, computes summary statistics, and generates visualizations.
- `Mushroom_project.qmd`: Main Quarto document integrating code, analysis, and narrative into a reproducible report.
- `Mushroom_project.pdf`: Rendered PDF version of the final report.
- `plots/`: Stores individual plots created during the analysis process.
- `Project Plan`: Describes the workflow, task division, and methodology followed by the team.
- `Project_Guidelines.md`: Provides project requirements and expectations.
- `linting_script.R` and `.lintr`: Support consistent coding style and quality across the project.
- `MLA9.csl` and `apa7.csl`: Citation style files used in the Quarto report.

## Authors

- Anchita Mitra: Summary statistics, visualizations, pattern analysis.
- Fatmah: Data import, cleaning, variable recoding, documentation review.
- Heet: Report writing, data provenance, conclusions, formatting.
