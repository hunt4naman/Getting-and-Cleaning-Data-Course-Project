##########################################################################################################

## Coursera: Getting and Cleaning Data Course Project
## Naman Jain
## 2016-04-10

# File Description:- run_analysis.R 

# This script will perform the following steps on the UCI "Human Activity Recognition" dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##########################################################################################################
# Shows the Current WOrking Directory
getwd()
# Sets the current working directory 
setwd("C:/Coursera- Data Science/Getting and Cleaning Data/Project/UCI HAR dataset")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
HAR_dataset_zip <- download.file(fileUrl,destfile="HAR_dataset.zip")
# Unzips the UCI HAR dataset
unzip("HAR_dataset.zip")

#***********************************
# Read featutres.txt file 
#***********************************
#-------------------------------------------------------------------------------------------------------------------
features<-read.table("features.txt",header=F) # Imports features.txt file from UCI HAR dataset
str(features) # Displays the internal structure of the dataset features.txt
head(features) # Displays first six lines of the dataset features.txt
#-------------------------------------------------------------------------------------------------------------------
x_train<-read.table("X_train.txt",header=F) # Imports X_train.txt file from UCI HAR dataset
str(x_train) # Displays the internal structure of the dataset X_train.txt
names(x_train) # Displays first six lines of the dataset X_train.txt
colnames(x_train) = features[,2] 


x_test<-read.table("X_test.txt",header=F) # Imports X_test.txt file from UCI HAR dataset
str(x_test) # Displays the internal structure of the dataset X_test.txt
names(x_test) # Displays first six lines of the dataset X_test.txt
colnames(x_test) = features[,2]
#-------------------------------------------------------------------------------------------------------------------
subject_train<-read.table("subject_train.txt",header=F) # Imports subject_train.txt file from UCI HAR dataset
str(subject_train) # Displays the internal structure of the dataset subject_train.txt
head(subject_train) # Displays first six lines of the dataset subject_train.txt
colnames(subject_train)  = "SUBJECT_ID"

subject_test<-read.table("subject_test.txt",header=F) # Imports subject_test.txt file from UCI HAR dataset
str(subject_test) # Displays the internal structure of the dataset subject_test.txt
head(subject_test) # Displays first six lines of the dataset subject_test.txt
colnames(subject_test)  = "SUBJECT_ID"
#-------------------------------------------------------------------------------------------------------------------
activity_label<-read.table("activity_labels.txt",header=F) # Imports activity_labels.txt file from UCI HAR dataset
colnames(activity_label) = c("ACTIVITY_ID","ACTIVITY_LABEL")
activity_label
#-------------------------------------------------------------------------------------------------------------------

y_train<-read.table("Y_train.txt",header=F) # Imports Y_train.txt file from UCI HAR dataset
str(y_train) # Displays the internal structure of the dataset Y_train.txt
head(y_train) # Displays first six lines of the dataset Y_train.txt
colnames(y_train) = "ACTIVITY_ID"

y_test<-read.table("Y_test.txt",header=F) # Imports Y_test.txt file from UCI HAR dataset
str(y_test) # Displays the internal structure of the dataset Y_test.txt
head(y_test) # Displays first six lines of the dataset Y_test.txt
colnames(y_test) = "ACTIVITY_ID"

# Combining columns to create "train_data"
train_data = cbind(subject_train,x_train,y_train)
dim(train_data) # Displays the dimension of the data frame

# Combining columns to create "test_data"
test_data  = cbind(subject_test,x_test,y_test)
dim(test_data) # Displays the dimension of the data frame

#*********************************************************************************
# 1) Merges the training and the test sets to create one data set.
#*********************************************************************************
merge_data = rbind(train_data,test_data)
head(merge_data)
names(merge_data)
str(merge_data)

#*******************************************************************************************
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#*******************************************************************************************
filter_data <- grep("-(mean|std)\\(\\)|ACTIVITY_ID|SUBJECT_ID",names(merge_data),value=TRUE) # Selects only the columns with mean() and std() in their names
filter_data <- merge_data[,filter_data] # Subsets the desired column names with values of mean() and std()
filter_data                   # Displays the entire dataset
names(filter_data)            # Dsiplay names
str(filter_data)              # Gives the structure of the dataset

#***************************************************************************
# 3) Uses descriptive activity names to name the activities in the data set
#***************************************************************************

#---- Merge 'filter' with with 'activity label'-----
desc_data = merge(filter_data,activity_label,by.x = "ACTIVITY_ID",by.y = "ACTIVITY_ID")
str(desc_data)
dim(desc_data)
names(desc_data)
head(desc_data)
#***************************************************************************
# 4) Appropriately labels the data set with descriptive variable names.
#***************************************************************************
# Replace 't' with 'time'
colnames(desc_data) <- gsub("^t","time_",colnames(desc_data))
# Replace 'f' with 'frequency'
colnames(desc_data) <- gsub("^f","frequency_",colnames(desc_data))
# Replace '-+,' with '_'
colnames(desc_data) <- gsub("[-+,]","_",colnames(desc_data))
# Remove all Parentheses,(), as they are superfluous and adding no useful information
colnames(desc_data) <- gsub("[()]","",colnames(desc_data))

head(desc_data) # Displays the tidy data set

#*****************************************************************************************************
# 5) From the data set in step 4, create a second, 
#   independent tidy data set with the average of each variable for each activity and each subject.
#*****************************************************************************************************

desc_data$ACTIVITY_ID <- NULL  # Dropping 'ACTIVITY_ID' as it is no longer needed

library(reshape2)              

# Melting the data set, using Activity and Subject as ids
molten_data <- melt(desc_data, id = c("SUBJECT_ID","ACTIVITY_LABEL"))
head(molten_data)

#Taking the mean for each combination of Activity and Subject
mean_data <- dcast(molten_data, SUBJECT_ID + ACTIVITY_LABEL ~ variable, mean)
head(mean_data)

# Write to text file
write.table(mean_data, "tidy_data.txt", row.name = FALSE, quote = FALSE)
# Write to CSV file
write.csv(mean_data, "tidy_data.csv")
dim(mean_data)                 # Displays dimensions 
