ReproRsch_Assignment2
=====================
http://stackoverflow.com/questions/3053833/using-r-to-download-zipped-data-file-extract-and-import-data

http://www.inside-r.org/packages/cran/data.table/docs/fread

> install.packages('iterators')
> library(iterators)
> con <- bzfile('1988.csv.bz2', 'r')
OK, now you have a connection to your file. Let's create an iterator:

> it <- ireadLines(con, n=1) ## read just one line from the connection (n=1)
Just to test:

> nextElem(it)
and you will see something like:

1 "1988,1,9,6,1348,1331,1458,1435,PI,942,NA,70,64,NA,23,17,SYR,BWI,273,NA,NA,0,NA,0,NA,NA,NA,NA,NA"

> nextElem(it) 
and you will see the next line, and so on. Be aware that you are reading a line at a time, so you are not loading all the file to RAM.

If you want to read line by line till the end of the file you can use

> tryCatch(expr=nextElem(it), error=function(e) return(FALSE))
for example. When the file ends it return a logical FALSE.





Zip archives are actually more a 'filesystem' with content metadata etc. See help(unzip) for details. So to do what you sketch out above you need to

Create a temp. file name (eg tempfile())
Use download.file() to fetch the file into the temp. file
Use unz() to extract the target file from temp. file
Remove the temp file via unlink()
which in code (thanks for basic example, but this is simpler) looks like

temp <- tempfile()
download.file("http://www.newcl.org/data/zipfiles/a1.zip",temp)
data <- read.table(unz(temp, "a1.dat"))
unlink(temp)
Compressed (.z) or gzipped (.gz) or bzip2ed (.bz2) files are just the file and those you can read directly from a connection. So get the data provider to use that instead :)





sampleData <- read.csv("huge-file.csv", header = TRUE, nrows = 5)
classes <- sapply(sampleData, class)
largeData <- read.csv("huge-file.csv", header = TRUE, colClasses = classes)
str(largeData)
