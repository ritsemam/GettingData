#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

# Do it slightly out of order. Label and give avtivity names 
#and then find mean std stad columns

#load libraries
install.packages("reshape2")
library(reshape2)
install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)

#1. Merges the training and the test sets to create one data set.
TestX <- read.table("./test/X_test.txt")
TrainX <- read.table("./train/X_train.txt")
TestY <- read.table("./test/Y_test.txt")
TrainY <- read.table("./train/Y_train.txt")
TrainSub <- read.table("./train/subject_train.txt")
TestSub <- read.table("./test/subject_test.txt")

# 3 and 4 Gives desscriptive activity names and 
# labels the data set with descriptive variable names
Actlabel <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")

colnames(TestX)<-features$V2
colnames(TrainX)<-features$V2
colnames(TestY)<-c("Activity")
colnames(TrainY)<-c("Activity")
colnames(TestSub)<-c("Subject")
colnames(TrainSub)<-c("Subject")

#Merge after new labels
CompTest <- cbind(TestX, TestY, TestSub)
CompTrain <- cbind(TrainX, TrainY, TrainSub)
CompAll <- rbind(CompTest, CompTrain)
#Give descriptive activity names after the merge
CompAll$Activity <- factor(CompAll$Activity, Actlabel[[1]], Actlabel[[2]])
#write.table(CompAll, file="CompAll.txt", row.names=FALSE)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

meanstd <- CompAll[, grep("mean|std|Subject|Activity", names(CompAll))]
#write.table(CompAll, file="CompAllmeanstd.txt", row.names=FALSE)

#5 Create a second, independent tidy data set with the average of each variable for each activity and each subject

avgdata = melt(meanstd, id.var = c("Subject", "Activity"))
meanstd = dcast(avgdata , Subject + Activity ~ variable, mean)

write.table(meanstd, "tidyavgdata.txt", row.name=FALSE)
