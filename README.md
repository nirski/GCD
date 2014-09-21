GCD
===

The script `run_analysis.R` performs the following steps, the scope being a tidy data set, according to the rules suggested in [Hadley Wickham's tidy data paper](http://www.jstatsoft.org/v59/i10):

1. Reads the data sets, along with the dictionaries:
    - **subject** variable: `UCI HAR Dataset/train/subject_train.txt` and `UCI HAR Dataset/test/subject_test.txt`
    - **activity** variable: `UCI HAR Dataset/train/y_train.txt` and `UCI HAR Dataset/test/y_test.txt`
    - **feature** measurements: `UCI HAR Dataset/train/X_train.txt` and `UCI HAR Dataset/test/X_test.txt`
    - dictionaries: activities and features: `UCI HAR Dataset/activity_labels.txt` and `UCI HAR Dataset/features.txt`
2. Merges the training and the test sets to create one data set.
    - Merging colwise and rowwise.
    - The resulting data frame `bound.all` has a wide format: 10299 observations od 563 variables (1 subject, 1 activity and 561 feature variables).
    - The data is then converted to a long format `tidy.all` with 4 columns: subject, activity, feature id, and value.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
    - Out of 561 features, only 66 are selected. The filtered `tidy.all` data frame has 679734 rows and 4 columns.
4. Uses descriptive activity names to name the activities in the data set.
    - The activities dictionary is used.
5. Appropriately labels the data set with descriptive variable names.
    - Each feature gets a descriptive label from the features dictionary.
6. From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    - The resulting data frame `tidy.mean` is eventually written to the file `tidy_mean.txt`.
