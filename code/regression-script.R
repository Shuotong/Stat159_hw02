csv_data <- read.csv("../data/Advertising.csv")

#regression
reg <-  lm(csv_data$Sales ~ csv_data$TV)
summary(reg)

#save R object
save(reg, file = "../data/regression.RData")

#scatter plot in pdf
pdf("../images/scatterplot-tv-sales.pdf")
plot(csv_data$TV, csv_data$Sales, pch = 19, col = "red")
abline(reg, lwd = 2)
dev.off()

#scatter plot in png
png(file = "../images/scatterplot-tv-sales.png")
plot(csv_data$TV, csv_data$Sales, pch = 19, col = "red")
abline(reg, lwd = 2)
dev.off()