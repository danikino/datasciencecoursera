Sys.setlocale("LC_TIME", "C")
datos <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
fecha1 <- as.Date("2007/02/01")
fecha2 <- as.Date("2007/02/02")
elige <- (as.Date(datos[,1],format="%d/%m/%Y")==fecha1 | as.Date(datos[,1],format="%d/%m/%Y")==fecha2)
datosdosdias <- datos[elige,]
activepower <- datosdosdias[,c(1,2,3)]
fechas <- as.Date(datosdosdias[,1],format="%d/%m/%Y")
horas <- datosdosdias[,2]
fecha_hora <- paste(fechas,horas)
tiempo <- strptime(fecha_hora,"%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(tiempo,activepower[,3],type='l')
plot(tiempo,activepower[,3],type='l',xlab="",ylab="Global Active Power (kilowats)")
dev.off()
