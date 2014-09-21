GCD
===

The script `run_analysis.R` performs the following steps, the scope being a tidy data set, according to the rules suggested in [Hadley Wickham's tidy data paper](http://www.jstatsoft.org/v59/i10):

1. Reads the data sets, along with the dictionaries:
    a) **subject** variable: `UCI HAR Dataset/train/subject_train.txt` and `UCI HAR Dataset/test/subject_test.txt`
    a) **activity** variable: `UCI HAR Dataset/train/y_train.txt` and `UCI HAR Dataset/test/y_test.txt`
    a) **feature** measurments: `UCI HAR Dataset/train/X_train.txt` and `UCI HAR Dataset/test/X_test.txt`
    a) dictionaries: activities and features: `UCI HAR Dataset/activity_labels.txt` and `UCI HAR Dataset/features.txt`
1. Merges the training and the test sets to create one data set.
    a) Merging colwise and rowwise.
    a) The resulting data frame `bound.all` has a wide format: 10299 observations od 563 variables (1 subject, 1 activity and 561 feature variables).
    a) The data is then converted to a long format `tidy.all` with 4 columns: subject, activity, feature id, and value.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
    a) Out of 561 features, only 66 are selected. The filtered `tidy.all` data frame has 679734 rows and 4 columns.
1. Uses descriptive activity names to name the activities in the data set.
    a) The activities dictionary is used.
1. Appropriately labels the data set with descriptive variable names.
    a) Each feature gets a descriptive label from the features dictionary.
1. From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    a) The resulting data frame `tidy.mean` is eventually written to the file `tidy_mean.txt`.
