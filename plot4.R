data<-read.table("household_power_consumption.txt",header = T, sep = ";" )

data1<-data%>%mutate(Date=as.Date(Date,format="%d/%m/%Y" ))%>%  filter(Date ==as.Date("2007-02-02") | Date ==as.Date("2007-02-01"))
data2<-data1%>%mutate(Timehr= strptime( paste(Date,Time)   , format="%Y-%m-%d %H:%M:%S") )  

par(mfrow=c(2,2), mar=c(2,4,1,1),oma=c(0,0,0,0))
with(data2, {
  plot(Timehr,as.numeric(Global_active_power) , type="l", xlab = "", 
       ylab = "Global active power ")        
  
   plot(Timehr,as.numeric(Voltage) , type="l", xlab = "datetime", 
       ylab = "Voltage")
   
   plot(Timehr,as.numeric(Sub_metering_1) , type="l", xlab = "", 
                         ylab = "Energy Sub metering")      
        lines(data2$Timehr, data2$Sub_metering_2, col="red")
        lines(data2$Timehr, data2$Sub_metering_3, col="blue")
        legend("topright", pch = "-", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

        
  
  
  plot(Timehr,as.numeric(Global_reactive_power) , type="l", xlab = "", 
       ylab = "Global reactive power ")
        
})

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

