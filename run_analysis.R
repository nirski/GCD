# Getting and Cleaning Data Project
# Jarosław Nirski

# Dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Copy: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Dataset is unzipped into the working directory.
list.files()
# [1] "GCD.Rproj" "README.md" "run_analysis.R" "UCI HAR Dataset"
list.files("UCI HAR Dataset")
# [1] "activity_labels.txt" "features.txt" "features_info.txt" "README.txt" "test" "train"
list.files("UCI HAR Dataset/train")
# [1] "Inertial Signals" "subject_train.txt" "X_train.txt" "y_train.txt"
list.files("UCI HAR Dataset/test")
# [1] "Inertial Signals" "subject_test.txt" "X_test.txt" "y_test.txt"

# Dive into Hadleyverse!
install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

# Set the read.table proper defaults
options(stringsAsFactors = FALSE)
default.stringsAsFactors() # should be FALSE

# Read the dictionaries
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity", "activity.name"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("feature", "feature.name"))
features.selected <- features %>% filter(grepl("mean\\(\\)|std\\(\\)", feature.name))

# Read the data
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
activity.train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
activity.test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
data.train <- read.table("UCI HAR Dataset/train/X_train.txt")
data.test <- read.table("UCI HAR Dataset/test/X_test.txt")

# Merge the data colwise and rowwise
bound.train <- data.frame(subject.train, activity.train, data.train) %>% tbl_df
bound.test <- data.frame(subject.test, activity.test, data.test) %>% tbl_df
bound.all <- rbind_list(bound.train, bound.test)

# Tidy!
tidy.all <- bound.all %>%
    gather(feature, value, -subject, -activity) %>% # convert to long format
    tbl_df %>%
    mutate(feature = extract_numeric(feature)) %>% # convert 'V1' to '1' etc.
    filter(feature %in% features.selected$feature) %>% # get only selected features (mean and std)
    arrange(subject, activity, feature) %>% # arrange by subject, then activity id, then feature id
    left_join(activities) %>% # grab activity names
    left_join(features.selected) %>% # grab feature names
    select(subject, activity.name, feature.name, value) # drop activity id and feature id

# Get the summarized data
tidy.mean <- tidy.all %>%
    group_by(subject, activity.name, feature.name) %>%
    summarise(n.obs = n(), mean = mean(value)) %>%
    ungroup

# Write the tidy data set into file
write.table(tidy.mean, "tidy_mean.txt", row.name = FALSE)
