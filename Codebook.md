<B>CodeBook</b>

For an understanding of the project, go to 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set is a set of experiments carried out by a group of 30 volunteers within an age bracket of 19-48 years. They each consisted of performing six activity and each activity was recorded by a Samsung Galaxy S II. The activities were:
Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying. Using the embedded accelerometer and gyroscope each activity was captured with 3-axiela linear acceleration and 3-axial angular velocity. 

<b>All data can be found in:</B>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

All files came from these .txt files

      'features_info.txt': Shows information about the variables used on the feature vector.
      
      'features.txt': List of all features.
      
      'activity_labels.txt': Links the class labels with their activity name.
      
      'train/X_train.txt': Training set.
      
      'train/y_train.txt': Training labels.
      
      'test/X_test.txt': Test set.
      
      'test/y_test.txt': Test labels.

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
