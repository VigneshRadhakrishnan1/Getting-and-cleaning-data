# From the course descriptiom - the following code does the below mentioned activities 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. From the data in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


# Clean up workspace
rm(list=ls())

#Set seed for random number reproducibility
set.seed(6583)

#set working directory to the location where the data is located
setwd('D:/Coursera/Getting and cleaning data/Course Project/UCI HAR Dataset/');

# Step 1 - Merge the training and the test sets.

features        = read.table('./features.txt',header=FALSE)
activity_labels = read.table('./activity_labels.txt',header=FALSE)
subject_train   = read.table('./train/subject_train.txt',header=FALSE)
x_train         = read.table('./train/x_train.txt',header=FALSE)
y_train         = read.table('./train/y_train.txt',header=FALSE)

# Assign column names to the dataset
colnames(activity_labels)  = c('activityID','activityType')
colnames(subject_train)  = 'subjectID'
colnames(x_train)        = features[,2] 
colnames(y_train)        = "activityID"

# merge training data
Data_train = cbind(y_train,subject_train,x_train);

# Read in the test data
subject_test = read.table('./test/subject_test.txt',header=FALSE); #imports subject_test.txt
x_test       = read.table('./test/x_test.txt',header=FALSE); #imports x_test.txt
y_test       = read.table('./test/y_test.txt',header=FALSE); #imports y_test.txt

# Assign column names to the test data 
colnames(subject_test) = "subjectID";
colnames(x_test)       = features[,2]; 
colnames(y_test)       = "activityID";


# Merge test data 
Data_test = cbind(y_test,subject_test,x_test);

# Merge training andd test data
Data_merged = rbind(Data_train,Data_test)
activity_ids <- rbind(y_train, y_test)
subject_ids <- rbind(subject_train, subject_test)
x_merged <- rbind(x_test, x_train)
#End of Step 1 #

# Create a vector for the column names from the Data_merged, which will be used
# to select the desired mean() & stddev() columns
colNames  = colnames(Data_merged); 


# Step 2-Extract only the measurements on the mean and standard deviation for each measurement. 
# get columns  with mean() or std()
mean_sd <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset Data_merged table based on extracted features
x_merged = x_merged[, mean_sd]
#fix the column names
names(x_merged) <- features[mean_sd, 2]
#merge with activity and subject name filtered out
Data_merged2 <- cbind(activity_ids, subject_ids,x_merged)
# end of step 2#

# Step3 Use descriptive activity names to name the activities in the data set

# Merge combined with the acitivityType table for activity names
Data_merged3 = merge(Data_merged2,activity_labels,by='activityID',all.x=TRUE);
# Updating the colNames vector to include the new column names after merge
colNames  <- colnames(Data_merged3) 
#end of step 3 #

# Step 4-  Appropriately label the data set with descriptive activity names. 

##### Already takencare of in earlier steps #### 
### Data_merged2 & 3 table contains the accurately named columns ###

# Step 5 -  Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Summarizing table to include mean of each variable for each activity and each subject
# and the activity name for the win ... 
library(plyr)
Data_merged_mean <- ddply(Data_merged3, .(subjectID, activityID, activityType), function(x) colMeans(x[, 3:68]))

# Export the dataset 
write.table(Data_merged_mean, './MeanDataset.txt',row.names=TRUE,sep='\t')
