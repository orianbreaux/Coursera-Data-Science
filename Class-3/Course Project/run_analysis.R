run_analysis <- function()
{
        # Read data features.
        features <- as.character(read.table("./UCI HAR Dataset/features.txt")[,2])
        
        # Read training data, labeling columns with descriptive names.
        train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names=c("subjectID"))
        train_y <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names=c("activityName"))
        train_x <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features)
        
        # For training data, extract only the measurements on the mean() and std() for each feature.
        train_x <- train_x[,grepl("mean\\(\\)|std\\(\\)",features)]
        
        # Combine training data.
        data_train <- cbind(train_subject, train_y, train_x)
        
        # Read test data.
        test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names=c("subjectID"))
        test_y <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names=c("activityName"))
        test_x <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names=c(features))
        
        # For test data, extract only the measurements on the mean and standard deviation for each feature.
        test_x <- test_x[,grepl("mean\\(\\)|std\\(\\)",features)]
        
        # Combine test data.
        data_test <- cbind(test_subject, test_y, test_x)
        
        # Merge training and test sets to create one data set.
        data_combined <- rbind(data_train, data_test)
        
        # Apply descriptive activity names to name the activities in the data set.
        activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")
        data_combined$activityName <- factor(data_combined$activityName,levels=activityNames[,1],labels=activityNames[,2])
        
        # Create a second, independent tidy data set with the average of each variable for each activity and each subject.
        data_tidy <- melt(data_combined, id=c("subjectID","activityName"),measure.vars=colnames(data_combined[-c(1,2)]))
        data_tidy <- dcast(data_tidy, subjectID + activityName ~ variable, mean)

        # Create data output file of data_tidy
        write.table(data_tidy, file="tidyData.txt", row.names=FALSE, col.names=colnames(data_tidy))       
}