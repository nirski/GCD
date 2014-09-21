Code Book
=========

### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

### Study Information

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data Set Copy

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Analysis Variables

| Variable      | Description            | Range of values  |
| ------------- | ---------------------- | ---------------- |
| subject       | ID of the subject      | Between 1 and 30 |
| activity.name | Activity peformed      | One of: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS" |
| feature.name  | Feature name           | One of 66 features listed in the table below |
| n.obs         | Number of observations |                  |
| mean          | Mean value             |                  |

### Feature Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (**tBodyAcc-XYZ** and **tGravityAcc-XYZ**) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (**tBodyAccJerk-XYZ** and **tBodyGyroJerk-XYZ**). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (**tBodyAccMag**, **tGravityAccMag**, **tBodyAccJerkMag**, **tBodyGyroMag**, **tBodyGyroJerkMag**).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing **fBodyAcc-XYZ**, **fBodyAccJerk-XYZ**, **fBodyGyro-XYZ**, **fBodyAccJerkMag**, **fBodyGyroMag**, **fBodyGyroJerkMag**. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:

- '-mean()', '-std()' are used for the estimated mean and standard deviations,
- '-X', '-Y', '-Z' are used to denote 3-axial signals in the X, Y and Z directions.

| stem              | suffixes                                                      |
| ----------------- | ------------------------------------------------------------- |
| tBodyAcc-         | -mean()-X, -mean()-Y, -mean()-Z, -std()-X, -std()-Y, -std()-Z |
| tGravityAcc-      | -mean()-X, -mean()-Y, -mean()-Z, -std()-X, -std()-Y, -std()-Z |
| tBodyAccJerk-     | -mean()-X, -mean()-Y, -mean()-Z, -std()-X, -std()-Y, -std()-Z |
| tBodyGyro-        | -mean()-X, -mean()-Y, -mean()-Z, -std()-X, -std()-Y, -std()-Z |
| tBodyGyroJerk-    | -mean()-X, -mean()-Y, -mean()-Z, -std()-X, -std()-Y, -std()-Z |
| tBodyAccMag-      | -mean(), -std()                                               |
| tGravityAccMag-   | -mean(), -std()                                               |
| tBodyAccJerkMag-  | -mean(), -std()                                               |
| tBodyGyroMag-     | -mean(), -std()                                               |
| tBodyGyroJerkMag- | -mean(), -std()                                               |
| fBodyAcc-         | -mean()-X, -mean()-Y, -mean()-Z, -std()-X, -std()-Y, -std()-Z |
| fBodyAccJerk-     | -mean()-X, -mean()-Y, -mean()-Z, -std()-X, -std()-Y, -std()-Z |
| fBodyGyro-        | -mean()-X, -mean()-Y, -mean()-Z, -std()-X, -std()-Y, -std()-Z |
| fBodyAccMag-      | -mean(), -std()                                               |
| fBodyAccJerkMag-  | -mean(), -std()                                               |
| fBodyGyroMag-     | -mean(), -std()                                               |
| fBodyGyroJerkMag- | -mean(), -std()                                               |
