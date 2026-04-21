library(dplyr)

data <- read.table("agaricus-lepiota.data", header = FALSE, sep = ",")

data_with_columns <- data |>
  rename(
    `classes` = V1,
    `cap-shape` = V2,
    `cap-surface` = V3,
    `cap-color` = V4,
    `bruises?` = V5,
    `odor` = V6,
    `gill-attachment` = V7,
    `gill-spacing` = V8,
    `gill-size` = V9,
    `gill-color` = V10,
    `stalk-shape` = V11,
    `stalk-root` = V12,
    `stalk-surface-above-ring` = V13,
    `stalk-surface-below-ring` = V14,
    `stalk-color-above-ring` = V15,
    `stalk-color-below-ring` = V16,
    `veil-type` = V17,
    `veil-color` = V18,
    `ring-number` = V19,
    `ring-type` = V20,
    `spore-print-color` = V21,
    `population` = V22,
    `habitat` = V23
  )
