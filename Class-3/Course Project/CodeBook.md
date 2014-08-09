---
title: "CodeBook"
author: "Orian Breaux"
date: "July 25, 2014"
output: html_document
---

Describing variables in 'tidyData.txt':
==================================================================
[1] "subject ID": ID number of subject performing activities.
        1:30
        
[2] "activityName": Name of activity performed by subject.
        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LAYING

[3]-[68] "mean()" and "std()" variables: Mean and standard deviation values of the following feature vectors, as described in "UCI HAR Dataset/features_info.txt":
        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag


Describing variables in 'run_analysis.R':
==================================================================
In order of apperance:

- features: 561-length chracter vector containing names of features from "/UCI HAR Dataset/features.txt"

- train_subject: 7352-length character vector containing numeric IDs of subjects, with column name "subjectID"
- train_y: 7352x1 data.frame containing table data from "/UCI HAR Dataset/train/y_train.txt", with column name "activityName"
- train_x: 7352x561 data.frame containing table data from "/UCI HAR Dataset/train/X_train.txt", with column names corresponding to values in features vector

- data_train: 7352x563 data.frame binding columns of train_subject, train_y, train_x in aforementioned order

- test_subject: 2947-length character vector containing names of features from "/UCI HAR Dataset/test/features.txt", with column name "subjectID"
- test_y: 2947x1 data.frame containing table data from "/UCI HAR Dataset/test/y_test.txt", with column name "activityName"
- test_x: 2947x561 data.frame containing table data from "/UCI HAR Dataset/test/X_test.txt", with column names specified in features character vector

- data_test: 2947x563 data.frame binding columns of train_subject, train_y, train_x in aforementioned order

- data_combined: 10299x68 data.frame, result of rbind() of data_train and data_test

- activityNames: 6x2 data.frame containing names and numeric IDs of activities, from "UCI HAR Dataset/activity_labels.txt"

- data_tidy: 180x68 data.frame of melted and recasted data_combined, where all feature values' means are calculated by grouping subjectId and activityName