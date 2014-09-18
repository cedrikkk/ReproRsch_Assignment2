# download the data
# create trainData and testData variables to be used later

url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(url, "./FStormData.csv")
downloadDate<- date();downloadDate

# löad the data
FStormData<- read.csv("./FStormData.csv",header=T)#,Colclasses= "classes")
head(FStormData)
fix(FStormData)

str(FStormData)
dim(FStormData)
summary(FStormData)

.csv.bz2

sampleData <- read.csv("./FStormData.csv", header = TRUE, nrows = 3)
classes <- sapply(sampleData, class)
names(classes)
classes
largeData <- read.csv("./FStormData.csv", header = TRUE, colClasses = colclasses)
str(largeData)

temp <- tempfile()
temp
download.file(url,temp)
data <- read.csv(unz(temp, "a1.csv"),h=T)
unlink(temp)



data<-fread("./FStormData.csv", sep=",", nrows=-1L, header="auto", na.strings="NA",
            stringsAsFactors=FALSE, colClasses=NULL)