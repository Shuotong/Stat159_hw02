csv_data <- read.csv("../data/Advertising.csv")

#Summary of data
sink("../data/eda-output.txt")
summary(csv_data)
sink()

#histogram for tv in png
png("../images/histogram-tv.png")
hist(csv_data$TV)
dev.off()

#histogram for tv in pdf
pdf("../images/histogram-tv.pdf")
hist(csv_data$TV)
dev.off()

#histogram for sales in png
png("../images/histogram-sales.png")
hist(csv_data$Sales)
dev.off()

#histogram for sales in pdf
pdf("../images/histogram-sales.pdf")
hist(csv_data$Sales)
dev.off()
