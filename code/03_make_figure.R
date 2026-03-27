library(ggplot2)

diab2 <- readRDS("output/diab_analysis.rds")

p <- ggplot(diab2, aes(x = BMI, y = Glucose, color = factor(Outcome))) +
  geom_point()

ggsave("output/glucose_bmi_plot.png", plot = p)
