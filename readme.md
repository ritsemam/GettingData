<b>run_analysis.R</b>

This R script takes 

The goal is to prepare tidy data that can be used for later analysis.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the script:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_anaylis.R will be able to do the follwoing

1. You should create one R script called run_analysis.R that does the following. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

<B>Code</B><BR>
1.1 Load all libraries<BR>

      1.2 reshape2
      1.3 plyr
      1.4 dplyr
      
2.Read all the tables from the zip file and give them a name<BR>

3.Rename the activities names to be descriptive from the ‘activity_labels.txt’ file<BR>

4.Label the data set with descriptive variable names<BR>

5.1 Merge all the new tables<BR>

      5.2 Merge the Test Tables by combining the columns (CompTest)
      
      5.3 Merge the Train Tables by combining the columns (CompTrain)
      
      5.4 Merge the new Test and new Train tables combining the rows (CompAll)
      
      5.5 Give descriptive activity names for the new merged table (CompAll)

6. Remove or subset to only have the measurements on the mean and standard deviation for each measurement (meanstd)<BR>

7.1 Create a second, independent tidy data set with the average of each variable for each activity and each subject <BR>

      7.2.Use the melt function from the meanstd table on Subject and Activityand create a new table (avgdata) so that each row is a unique id-variable combination.<BR>
      7.3 Use the dcast function to reshape the avgdata on Subject and Activity <BR>
      7.4 Use the write.table function to create a tidy. txt file of meadstd.
