diab <- read.csv("diabetes.csv")

diab$BMI[diab$BMI == 0] <- NA
diab2 <- subset(diab, !is.na(BMI))

saveRDS(diab, file = "output/diab_raw_cleaned.rds")
saveRDS(diab2, file = "output/diab_analysis.rds")
