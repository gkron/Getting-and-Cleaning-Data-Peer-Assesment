# Set the url for the file to download and download
localfilepath = "./UCI HAR Dataset.zip"

# Check to see if the zip file is there. If it is then don't download it.
if (file.exists(localfilepath)){
        warning("Zip file exists in working directory.")
} else {
        fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileurl, "./UCI HAR Dataset.zip")
}

# Print file time
file.info(localfilepath)$ctime

## Check out the files
al <- read.csv("activity_labels.txt",header=F,sep=" ",col.names=c("ID","Class Labels"))
