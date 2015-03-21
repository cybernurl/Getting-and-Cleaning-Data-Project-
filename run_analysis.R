##1.Merges the training and the test sets to create one data set.
##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##3.Uses descriptive activity names to name the activities in the data set
##4.Appropriately labels the data set with descriptive variable names. 
##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Load test & train sets
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
x_test<-read.table("UCI HAR Dataset/test/X_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
x_train<-read.table("UCI HAR Dataset/train/X_train.txt")

#Combine each test & train set
subject<-rbind(subject_test,subject_train)
activity<-rbind(y_test,y_train)
features<-rbind(x_test,x_train)

#Set names to each variable
names(subject)<-c("subject")
names(activity)<-c("activity")
featuresNames<-read.table("UCI HAR Dataset/features.txt")
names(features)<-featuresNames$V2

#Merge features,subject & activity data
data<-cbind(features,subject,activity)

#Extract the features names of mean or standard deviation 
extractFeaturesNames<-featuresNames$V2[grepl("mean|std", featuresNames$V2)]

selectedNames<-c(as.character(extractFeaturesNames),"subject","activity")
data<-subset(data,select=selectedNames)

#Load activity labels
activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt")

#Name the activities
data$activity<-factor(data$activity,labels=activitylabels$V2)

#Label the data sets
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))


if (!require("plyr")) { 
  install.packages("plyr") 
} 
library(plyr)

#For average data set
data2<-aggregate(.~subject+activity,data,mean)
data2<-data2[order(data2$subject,data2$activity),]

write.table(data2, file = "tidydata.txt",row.name=FALSE)
