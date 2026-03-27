library(dplyr)

diab2 <- readRDS("output/diab_analysis.rds")

summary_tbl <- diab2 %>%
  summarise(
    n = n(),
    diabetes_rate = mean(Outcome == 1),
    pregnancies_mean = mean(Pregnancies, na.rm = TRUE),
    glucose_mean = mean(Glucose, na.rm = TRUE),
    blood_pressure_mean = mean(BloodPressure, na.rm = TRUE),
    bmi_mean = mean(BMI, na.rm = TRUE),
    age_mean = mean(Age, na.rm = TRUE)
  )

saveRDS(summary_tbl, file = "output/summary_tbl.rds")
