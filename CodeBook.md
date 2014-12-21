## Getting and Cleaning Data Project

### Description
Details regd the variables, dataset and data manipulations for the Getting and Cleaning Data course project.

### Source Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Data description at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Link for source data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Develop an R data scrip to:
#### 1. Merge the training and the test sets to create one data set.
Set the source directory for the files, read the data sets into tables
Assign column names and merge to create one data set.

#### 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Subset the merged data to keep only the necessary columns - mean/ stdev/ id

#### 3. Use descriptive activity names to name the activities in the data set 
by merging the subset from previous part with the activityType table to get the descriptive activity

#### 4. Appropriately label the data set with descriptive activity names 
gsub function for matching the data labels.

#### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Create new data set with the average of each variable for each activity and each subject
