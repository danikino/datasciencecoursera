Sys.setlocale("LC_TIME", "C")
datos <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
fecha1 <- as.Date("2007/02/01")
fecha2 <- as.Date("2007/02/02")
elige <- (as.Date(datos[,1],format="%d/%m/%Y")==fecha1 | as.Date(datos[,1],format="%d/%m/%Y")==fecha2)
datosdosdias <- datos[elige,]
metering <- datosdosdias[,c(7,8,9)]
fechas <- as.Date(datosdosdias[,1],format="%d/%m/%Y")
horas <- datosdosdias[,2]
fecha_hora <- paste(fechas,horas)
tiempo <- strptime(fecha_hora,"%Y-%m-%d %H:%M:%S")
png("plot3.png")
plot(tiempo,metering[,1],type='l',xlab="",ylab = "Energy sub metering")
points(tiempo,metering[,2],type="l",col="red")
points(tiempo,metering[,3],type="l",col="blue")
legend("topright",legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lty=1,col=c("black","red","blue"))
dev.off()