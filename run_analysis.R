# Set the url for the file to download and download

localfilepath = "./UCI HAR Dataset.zip"

if (file.exists(localfilepath)){
        warning("Zip file exists in working directory.")
} else {
        fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileurl, "./UCI HAR Dataset.zip")
}

file.info(localfilepath)$ctime