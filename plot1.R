# Download File, Unzip it and extract relevant data 
FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(FileUrl,destfile="./data/Power.zip")
unzip("./data/Power.zip",exdir="./data")
x<-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";")
y<-x[x$Date=="1/2/2007" | x$Date=="2/2/2007",]

# Get Date and Time together
Dat<-strptime(paste(y$Date,y$Time), "%d/%m/%Y %H:%M:%S")

# Adapt data from Global Active Power Column
GAP <- y$Global_active_power
GAP <- as.numeric(levels(GAP))[GAP]

# Generate Plot 1 and save it
hist(GAP,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png") 
dev.off()