#Begin by naming and loading the dataset into R.  From the course notes it is located from the
#UC Irvine Learning Repository and in particular the "Individual household electric power consumption
#dataset".  It is a 20MB file that contains measurements of electric power consumption in one 
#household with one minute sampling rate over a period of almost 4 years.

# Check to see if file already exists in current working directory of /Data Science
# If it does not, download and unzip it.

if (!file.exists("household_power_consumption.txt")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata_data_household_power_consumption.zip"
  download.file(fileURL, destfile="exdata_data_household_power_consumption.zip")
  unzip("exdata_data_household_power_consumption.zip")
  
}


dt <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=F)
dt <- dt[(dt$Date == "1/2/2007") | (dt$Date == "2/2/2007"),]
dt$DateTime <- strptime( paste(dt$Date, dt$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png",width=480,height=480)
plot(dt$DateTime, dt$Sub_metering_1, type="l", lwd=1.5, col="black", xlab="", ylab='Energy sub metering')
lines(dt$DateTime, dt$Sub_metering_2, type="l", lwd=1.5, col="red")
lines(dt$DateTime, dt$Sub_metering_3, type="l", lwd=1.5, col="blue")
legend("topright", col=c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1.5, bty= "n")

dev.off()