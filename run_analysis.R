#### Downloading Data
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

#### File Preparation
# Load secondary files
activitylabels <- read.csv("./activity_labels.txt",header=F,sep=" ",col.names=c("id","activitylabel"))
features <- read.csv("./features.txt",header=F,sep=" ",col.names=c("id","featurelabel"))

# Prep the test file
subjecttest <- read.table("./test/subject_test.txt",header=F,col.names="subjectid")
xtest <- read.table("./test/x_test.txt",header=F,col.names=tolower(gsub("[\\,\\(\\)\\.\\-]","",features[,2])))
ytest <- read.table("./test/y_test.txt",header=F,col.names="activityid")
test <- cbind("test",subjecttest,ytest,xtest)
colnames(test)[1] <- "filesource"
test[1:5,1:7]

# Prep the train file
subjecttrain <- read.table("./train/subject_train.txt",header=F,col.names="subjectid")
xtrain <- read.table("./train/x_train.txt",header=F,col.names=tolower(gsub("[\\,\\(\\)\\.\\-]","",features[,2])))
ytrain <- read.table("./train/y_train.txt",header=F,col.names="activityid")
train <- cbind("train",subjecttrain,ytrain,xtrain)
colnames(train)[1] <- "filesource"
train[1:5,1:7]

# Merge the two files together
tidy <- rbind(test,train)
tidy[c(1:5,8000:8004),1:7]

#### Extract Mean & Standard Deviation Measurements
tidyms <- tidy[,c(1:3,grep("mean.*\\(\\)",features[,2],ignore.case=T)+3,
        grep("std\\(\\)",features[,2],ignore.case=T)+3)]
tidyms[c(1:5,8000:8004),1:7]

# Create codebook
write.csv(colnames(tidyms),"./codebook.csv")
