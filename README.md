Getting-and-Cleaning-Data-Course-Project
========================================
#Overview
This README file contains guidance on running the run_analysis.R script on the UCI Human Activity Recognition (HAR) Dataset to generate a tidy summary data set as well as relevant background information.
In addition to this README file, a code book file is provided which details the name, field width, definition, and range of values for each variable in the data set.
####Objective: 
In the original data set, the X_[test|train].txt files contains the main facts or measures, but it does not identify what each activity was, or which subject was performing the activity. Additionally, it does not contain a column header that explains what each column is. We need to combine the data to tidy it up.
##Script Output
The run_analysis.R script outputs a text file containing a tidy data set with the mean of each variable for each activity and subject within the UCI HAR Dataset.
##Prerequisites
In order to successfully run the script and generate the tidy data set, a zip file containing the UCI HAR Dataset must be downloaded (link) and extracted. The root folder from the zip file must be in the same directory as the run_analysis.R script.
##Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Source: https://class.coursera.org/getdata-006/human_grading/index
##Running the Script
The script must be ran in the same directory as the folder "UCI Har Dataset" that contains the data set. It can be ran in a R environment using the command source("run_analysis.R").

It requires the package reshape2. It can be installed also in the R environment with the command install.packages("reshape2").

###1. **Loading and Merging the data sets:**

  All the text files containing data about the values of the variables, the activities performed for each measure and the  subject id of the person performing them, for both the train and the test data sets, are read into R. The name of the files include 'features.txt','x_train.txt','x_test.txt','y_train.txt','y_test.txt','subject_train.txt','subject_test.txt','activity_labels.txt'
The features.txt file contains the column headers/names for the X_[test|train].txt file. We need to load the X_test.txt and X_train.txt data sets separately, and then add a column to each with the command "colnames". The column names are contained in the features.txt file. 
"subject_train and subject_test" files contain rows that identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. The column name is named as 'SUBJECT_ID'
'activity_labels.txt' file links the class labels with their activity name. Its columns are named as "ACTIVITY_ID" and "ACTIVITY_LABEL".
The subject information is in the subject[test|train].txt file, and the activity information is in the y_[test|train].txt. However, the activity labels are in the activity_lables.txt file, which identifies the IDs as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.

For subject, we can just add the column to the X_[test|train] set using variable creation, but for the activity, it would be more useful to have the name of the activity, rather than the meaningless integer, so after adding the integer column representing the activity, we merge (join) the y_[test|train] sets with the activity_labels, so we will have the more useful information along with the id. We have to add the ID onto the X sets first, because if we do the merge first, it destroys the order of the ids, which is the only information we have to map them to the correct X set observation/row.

subject_train,x_train,y_train columns are combined in the data set 'train_data' with the cbind function in R.
subject_test,x_test,y_test columns are combined in the data set 'test_data' with the cbind(Coulmn bind) function in R.
Finally, the datasets are merged in the 'merge_data" with the rbind(Row bind) function in R.

###2.Get Mean and Std Columns with ID Columns:

Here we find the columns viz., mean(),std(),ACTIVITY_ID,SUBJECT_ID in the merge_data data set using the 'grep'command in R.

###3.Using descriptive activity names to name the activities in the data set:

  Merge the data sets on the basis of columns ACTIVITY_ID common in both the data sets 'filter_data and activity_label' so that we have the Activity names/labels. The resuls are stored in the data set desc_data.

###4.Appropriately labels the data set with descriptive variable names:

We need to substitue potentially problematic characters in the column names to ease future programmatic utility as well as enhance human readability. A "t" character at the beginning of a variable name represents "time", according to the features_info.txt file, so we will replace that with "time_". An "f" character at the beginning of a var name indicates "frequency", so we will replace the beginning "f" with "frequency_".
Note: The Activity ID is not important in the end, so we pass the NULL value to remove it from the final data set.

###5.Averaging groups separated by Activity and Subject:

  Ultimately we need to group every measurement by its activity and subject, than take the average of every variable for each group. The reshape2 module is used for that purpose. First we melt the data set using the function melt, setting the attributes Activity and Subject as ids. This transforms the data into a long form table, that makes one row for attribute value, and creates one attribute called variable to store the name of the original variables. The function dcast is then called, passing the aggregate function mean, which results in a new transformation to a wide form table, where now each row represents the average of the values (for each variable) from each set of indexes.

As we have 30 different subjects and 6 different activities, we end up with a 180 x 68 table, which is our final tidy data. The final table is outputted to a file called "tidy_data.txt" using the function write.table.




