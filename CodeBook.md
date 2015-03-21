#CodeBook

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## The data source 
 
* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##Data Transformation

Following data transformations are carried out by the `run_analysis.R` script. 
  
1. After loading all train & test sets, combine each test & tran set to subject,activity & features, being subject(subject_test,subject_train), activity(y_test,y_train) and features(x_test,x_train).
2. Give names to the subject and activity data. For features, take the names from the `features.txt`.
3. Merge the features, subject and activity data as in step 1 to create one data set. 
4. Extract the subset of data where the features names are mean and standard deviation values.
5. Associate activity column with descriptive activity names as specified in `activity_labels.txt`. 
6. Labels the data set with descriptive variable names.
7. Require the `plyr` library and use the aggregate function
8. Save the result in dataset as `tidydata.txt` 

##Variables Description

The data for this data set was derived from sources mentioned in the "Original data" section of this document. Part of the description below has been taken from the original data description. 
   
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
   
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
   
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
   
These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 
  
The set of variables that were estimated from these signals are: 

* mean: Mean value 
* std: Standard deviation 