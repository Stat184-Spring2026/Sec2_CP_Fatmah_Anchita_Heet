
# MEMBER B: Summary statistics, analysis & visualisation
# Project: Mushroom Exploratory Data Analysis 


# Load Required Libraries
library(dplyr)
library(ggplot2)
library(scales)
library(knitr)  

# 1. Import and Prepare Cleaned Data
source("Data_Cleaning.R")

data_clean <- data_with_columns_and_string_values |>
  mutate(across(everything(), as.factor))


# SUMMARY STATISTICS & PATTERNS :

# Overall class distribution
class_summary <- data_clean |>
  count(classes) |>
  mutate(proportion = n / sum(n))

# Odor vs Class
odor_summary <- data_clean |>
  count(odor, classes) |>
  group_by(odor) |>
  mutate(proportion = n / sum(n))

# Gill Color vs Class
gill_color_summary <- data_clean |>
  count(`gill-color`, classes) |>
  group_by(`gill-color`) |>
  mutate(proportion = n / sum(n))

# Bruises vs Class
bruises_summary <- data_clean |>
  count(`bruises?`, classes) |>
  group_by(`bruises?`) |>
  mutate(proportion = n / sum(n))

# Spore Print Color vs Class
spore_summary <- data_clean |>
  count(`spore-print-color`, classes) |>
  group_by(`spore-print-color`) |>
  mutate(proportion = n / sum(n))

# Print summaries
print(class_summary)
print(odor_summary)




# PROFESSIONAL TABLES 

# Table 1: Overall Distribution
class_table <- data_clean |>
  count(classes) |>
  mutate(Percentage = n / sum(n) * 100) |>
  rename(Classification = classes, Count = n)

kable(class_table, digits = 1,
      caption = "Table 1: Distribution of Edible vs. Poisonous Mushrooms")


# Table 2: Odor Toxicity
odor_table <- data_clean |>
  count(odor, classes) |>
  group_by(odor) |>
  mutate(Toxicity_Rate = n / sum(n)) |>
  filter(classes == "poisonous") |>
  select(Odor = odor,
         `Poisonous Count` = n,
         `Toxicity Rate` = Toxicity_Rate) |>
  arrange(desc(`Toxicity Rate`))

kable(odor_table, digits = 2,
      caption = "Table 2: Mushroom Toxicity Based on Odor")


# Table 3: Gill Color
gill_table <- data_clean |>
  count(`gill-color`, classes) |>
  group_by(`gill-color`) |>
  mutate(Rate = n / sum(n)) |>
  filter(classes == "poisonous") |>
  select(`Gill Color` = `gill-color`,
         `Toxicity Rate` = Rate) |>
  arrange(desc(`Toxicity Rate`))

kable(gill_table, digits = 2,
      caption = "Table 3: Toxicity Rate by Gill Color")


# Table 4: Bruising
bruise_table <- data_clean |>
  count(`bruises?`, classes) |>
  group_by(`bruises?`) |>
  mutate(Rate = n / sum(n)) |>
  filter(classes == "poisonous") |>
  select(Bruises = `bruises?`,
         `Toxicity Rate` = Rate)

kable(bruise_table, digits = 2,
      caption = "Table 4: Probability of Toxicity Based on Bruising")


# Table 5: Spore Print Color
spore_table <- data_clean |>
  count(`spore-print-color`, classes) |>
  group_by(`spore-print-color`) |>
  mutate(Rate = n / sum(n)) |>
  filter(classes == "poisonous") |>
  select(`Spore Print Color` = `spore-print-color`,
         `Toxicity Rate` = Rate) |>
  arrange(desc(`Toxicity Rate`))

kable(spore_table, digits = 2,
      caption = "Table 5: High-Accuracy Predictors in Spore Print Color")




# DESIGN STANDARDS:
mushroom_colors <- c(
  edible = "#2c7a4b",
  poisonous = "#8b3f8f"
)

mushroom_theme <- theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 11),
    axis.title = element_text(size = 11),
    legend.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )


# Visual 1: Odor Analysis (Proportion Bar)
ggplot(data_clean, aes(y = odor, fill = classes)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values = mushroom_colors) +
  scale_x_continuous(labels = percent) +
  mushroom_theme +
  labs(
    title = "Mushroom Edibility by Odor",
    subtitle = "Foul and pungent odors are strong indicators of toxicity",
    x = "Proportion of Samples",
    y = "Odor Type",
    fill = "Class"
  )



# Visual 2: Gill Color (Grouped Bar Chart)
ggplot(data_clean, aes(x = `gill-color`, fill = classes)) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = mushroom_colors) +
  mushroom_theme +
  labs(
    title = "Edibility Patterns in Gill Color",
    subtitle = "Certain gill colors show higher association with toxicity",
    x = "Gill Color",
    y = "Total Count",
    fill = "Class"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



# Visual 3: Odor vs Class (HEATMAP)
ggplot(data_clean, aes(x = classes, y = odor)) +
  geom_bin2d() + 
  scale_fill_gradient(low = "#2c7a4b", high = "#8b3f8f") + 
  mushroom_theme +
  labs(
    title = "Heatmap: Odor Frequency by Class",
    subtitle = "Intensity shows where most samples are concentrated",
    x = "Classification (Edible vs Poisonous)",
    y = "Odor Type",
    fill = "Count"
  )




# Visual 4: Spore Print (DOT PLOT)
ggplot(data_clean |> count(`spore-print-color`, classes),
       aes(x = n, y = `spore-print-color`, color = classes)) +
  geom_point(size = 3) +
  scale_color_manual(values = mushroom_colors) +
  mushroom_theme +
  labs(
    title = "Distribution of Mushrooms by Spore Print Color",
    subtitle = "Dot size and position show count distribution",
    x = "Count",
    y = "Spore Print Color",
    color = "Class"
  )

# additional visuals:
# Visual: Dot Plot - Gill Color Counts by Class


gill_counts <- data_clean |>
  count(`gill-color`, classes)

ggplot(gill_counts, aes(x = n, y = fct_reorder(`gill-color`, n), color = classes)) +
  geom_point(size = 4) +
  scale_color_manual(values = mushroom_colors) +
  mushroom_theme +
  labs(
    title = "Gill Color Distribution by Class",
    subtitle = "Dot position shows how common each gill color is by class",
    x = "Count",
    y = "Gill Color",
    color = "Class"
  )



# visual: Bubble Plot - Spore Print Color and Class

spore_bubble <- data_clean |>
  count(`spore-print-color`, classes)

ggplot(spore_bubble, aes(x = classes, y = `spore-print-color`, size = n, color = classes)) +
  geom_point(alpha = 0.7) +
  scale_color_manual(values = mushroom_colors) +
  mushroom_theme +
  labs(
    title = "Spore Print Color by Mushroom Class",
    subtitle = "Bubble size shows how many mushrooms fall into each group",
    x = "Class",
    y = "Spore Print Color",
    size = "Count",
    color = "Class"
  )


# visual: Density-style Count Plot - Population Type 

population_counts <- data_clean |>
  count(population, classes)

ggplot(population_counts, aes(x = n, color = classes, fill = classes)) +
  geom_density(alpha = 0.3) +
  scale_color_manual(values = mushroom_colors) +
  scale_fill_manual(values = mushroom_colors) +
  mushroom_theme +
  labs(
    title = "Distribution of Population Counts by Class",
    subtitle = "Density shape shows how population categories vary by class",
    x = "Count Across Population Types",
    y = "Density",
    color = "Class",
    fill = "Class"
  )


# visual: Top Poisonous Feature Combinations - Bubble Plot

top_poisonous_patterns <- data_clean |>
  filter(classes == "poisonous") |>
  count(odor, `gill-color`, `spore-print-color`) |>
  arrange(desc(n)) |>
  slice_head(n = 10) |>
  mutate(pattern = paste(odor, `gill-color`, `spore-print-color`, sep = " / "))

ggplot(top_poisonous_patterns, aes(x = n, y = reorder(pattern, n), size = n)) +
  geom_point(color = "#8b3f8f", alpha = 0.7) +
  mushroom_theme +
  labs(
    title = "Top Poisonous Mushroom Feature Combinations",
    subtitle = "Larger bubbles show the most common poisonous patterns",
    x = "Number of Poisonous Mushrooms",
    y = "Feature Combination",
    size = "Count"
  )


# Visual 9: Faceted Dot Plot - Major Features

major_features_long <- data_clean |>
  select(classes, odor, `gill-color`, `spore-print-color`, habitat, population, `ring-type`) |>
  pivot_longer(
    cols = -classes,
    names_to = "Feature",
    values_to = "Category"
  ) |>
  count(Feature, Category, classes)

ggplot(major_features_long, aes(x = n, y = fct_reorder(Category, n), color = classes)) +
  geom_point(size = 2.8) +
  facet_wrap(~ Feature, scales = "free_y") +
  scale_color_manual(values = mushroom_colors) +
  mushroom_theme +
  labs(
    title = "Major Mushroom Features by Class",
    subtitle = "Dot plots compare class patterns across several important features",
    x = "Count",
    y = "Category",
    color = "Class"
  )
