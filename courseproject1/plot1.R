Sys.setlocale("LC_TIME", "C")
datos <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
fecha1 <- as.Date("2007/02/01")
fecha2 <- as.Date("2007/02/02")
elige <- (as.Date(datos[,1],format="%d/%m/%Y")==fecha1 | as.Date(datos[,1],format="%d/%m/%Y")==fecha2)
datosdosdias <- datos[elige,]
activepower <- datosdosdias[,c(1,2,3)]
png("plot1.png")
hist(activepower[,3],col="red",main="Global Active Power",xlab="Global Active Power(kilowats)")
dev.off()
