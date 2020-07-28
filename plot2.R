library(tidyverse)
library(lubridate)

data<-read.table("household_power_consumption.txt",header = T, sep = ";" )

data1<-data%>%mutate(Date=as.Date(Date,format="%d/%m/%Y" ))%>%  filter(Date ==as.Date("2007-02-02") | Date ==as.Date("2007-02-01"))
data2<-data1%>%mutate(Timehr= strptime( paste(Date,Time)   , format="%Y-%m-%d %H:%M:%S") )  
                    
with(data2, plot(Timehr,as.numeric(Global_active_power) , type="l", xlab = "", 
                 ylab = "Global active power (Kilowatts)")    )                     

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
