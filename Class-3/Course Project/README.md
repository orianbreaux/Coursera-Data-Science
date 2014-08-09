---
title: "README"
author: "Orian Breaux"
date: "July 25, 2014"
output: html_document
---

This directory contains the following folders and files:
==================================================================
- 'README.md'

- 'run_analysis.R': Defines function "run_analysis()" that reads data from the "test" and "train" folders in the "UCI HAR Dataset" and outputs a tidy data file "tidyData.txt" into the main level of the working directory.

- 'tidyData.txt': Output file generated when calling "run_analysis()" function, as defined in 'run_analysis.R'

- 'CodeBook.md': Describes the variables, the data, and any transformations or work performed to clean up the data.

- 'UCI HAR Dataset/': Folder containing dataset that 'run_analysis.R' processes into the output 'tidyData.txt' in the main directory. Refer to 'README.txt' in this folder for more information on the dataset.


Overview steps of How 'run_analysis.R' script works:
==================================================================
PROCESS TRAINING DATA:
1) Read training data, labeling columns with descriptive names.

2) Combine training data.

3) Extract only measurements for mean() and std() in training data using regex in grep() command.


PROCESS TEST DATA:
4) Read test data, labeling columns with descriptive names.

5) Combine test data.

6) Extract only measurements for mean() and std() in test data using regex in grep() command.


CREATE TIDY DATA SET:
7) Combine final training and test data sets into "data_combined"

8) Apply descriptive activity names to name the activities in the data set.

9) Create tidy data set by melting and casting "data_combined", grouping by columns subjectId and activityName.

10) Write tidy data set to "tidyData.txt" file in working directory.