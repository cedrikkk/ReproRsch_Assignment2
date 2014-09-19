# download the data
# create trainData and testData variables to be used later

url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(url, "./FStormData.csv")
downloadDate<- date();downloadDate


 # load the data
FStormData<- read.csv("./FStormData.csv",header=T)
head(FStormData)
fix(FStormData)

str(FStormData)
dim(FStormData)
summary(FStormData)





