library(tidyverse)
data<-read.table("household_power_consumption.txt",header = T, sep = ";" )
sum(as.Date(data$Date, format = "%d/%m/%Y") %in% c(as.date("2007/02/01" )))

data1<-data%>%mutate(Date=as.Date(Date,format="%d/%m/%Y" ))%>%  filter(Date ==as.Date("2007-02-02") | Date ==as.Date("2007-02-01"))

with(data1, hist(as.numeric(Global_active_power), col = "red", main = "Global active power" , xlab = "Global active power") )                       
dev.copy(png, file="plot1.png")
dev.off()
