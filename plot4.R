# Download File, Unzip it and extract relevant data 
FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(FileUrl,destfile="./data/Power.zip")
unzip("./data/Power.zip",exdir="./data")
x<-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";")
y<-x[x$Date=="1/2/2007" | x$Date=="2/2/2007",]

# Get Date and Time together
Dat<-strptime(paste(y$Date,y$Time), "%d/%m/%Y %H:%M:%S")

# Adapt data from Global Active Power Column and Sub_metering
GAP <- y$Global_active_power
GAP <- as.numeric(levels(GAP))[GAP]
SUB1 <- y$Sub_metering_1
SUB2 <- y$Sub_metering_2
SUB3 <- y$Sub_metering_3
SUB1 <- as.numeric(levels(SUB1))[SUB1]
SUB2 <- as.numeric(levels(SUB2))[SUB2]
VOLT <- y$Voltage
VOLT <- as.numeric(levels(VOLT))[VOLT]
GRP <- y$Global_reactive_power
GRP <- as.numeric(levels(GRP))[GRP]

#Setting of 4 plots
png(filename = 'plot4.png', width = 500, height = 500, units = 'px')
par(mfcol=c(2,2))

# Plot 1
plot(Dat,GAP, type="l", ylab= "Global Active Power (kilowatts)", xlab="")

# Plot 2
plot(Dat,SUB1, type="l", ylab= "Global Active Power (kilowatts)", xlab="")
points(Dat,SUB2, type="l",col="RED")
points(Dat,SUB3, type="l",col="BLUE")
legend("topright", pch="-",col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# Plot 3
plot(Dat,VOLT,type="l",ylab="Voltage",xlab="datetime")

# Plot 4
plot(Dat,GRP,type="l",ylab="Global Reactive Power",xlab="datetime")

dev.off()