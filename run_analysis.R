## Unzip the data files and firstly get the feature names into a character vector as the header of sensor data
unzip("./getdata_projectfiles_UCI HAR Dataset.zip")
featureNm<-read.table("./UCI HAR Dataset/features.txt")
header561Features<-as.character(featureNm$V2)

## Load the sensor data, activity data, and subject data from both training and test group with descriptive variable names
sensorTrain<-read.table("./UCI HAR Dataset/train/X_train.txt", col.names=header561Features)
activityTrain<-read.table("./UCI HAR Dataset/train/y_train.txt", col.names="activityCd", colClasses="factor")
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subjectId", colClasses="factor")
sensorTest<-read.table("./UCI HAR Dataset/test/X_test.txt", col.names=header561Features)
activityTest<-read.table("./UCI HAR Dataset/test/y_test.txt", col.names="activityCd", colClasses="factor")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="subjectId", colClasses="factor")

## Merge the training and the test sets to create one data set
trainData<-cbind(subjectTrain, activityTrain, sensorTrain)
testData<-cbind(subjectTest, activityTest, sensorTest)
mergedData<-rbind(trainData, testData)

## Extract only the measurements on the mean and standard deviation for each measurement
extractedData<-mergedData[ ,c(1, 2, grep("*[Mm]ean*|std", names(mergedData)))] # Keep first(ie. subjectId), and second(ie. activityCd) columns additonally

## Use descriptive activity names to name the activities in the data set, and already appropriately label the data set
extractedData$activityCd<-factor(extractedData$activityCd, labels=c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

## Create a second, independent tidy data set with the average of each variable for each activity and each subject
library(reshape2) # Transform data into a long format which is easier to calculate the mean value of each combination
meltedData<-melt(extractedData, id.vars=c("subjectId","activityCd"))

library(plyr) # Use the handy function 'ddply' to get the values
meanData<-ddply(meltedData, .(subjectId, activityCd, variable), summarize, meanValue=mean(value))

write.table(meanData, "./CourseProject2Result.txt", row.name=FALSE) # Output the result dataset in text file format