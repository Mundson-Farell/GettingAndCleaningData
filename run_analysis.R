# -------------------------------------------------------------------------------------------
# Course Project
# -------------------------------------------------------------------------------------------
# You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
# -------------------------------------------------------------------------------------------

# Load Feature-Names
features <- read.csv("./UCI HAR Dataset/features.txt",header=FALSE, sep="")
features$V2 <- as.character(features$V2)

# Load Activity-Labels
activity <- read.csv("./UCI HAR Dataset/activity_labels.txt",header=FALSE, sep="")
activity$V2 <- as.character(activity$V2)
# str(activity)

# Load test data sets
test <- read.csv("./UCI HAR Dataset/test/X_test.txt",header=FALSE, sep="")
subject_test <- read.csv("./UCI HAR Dataset/test/subject_test.txt",header=FALSE, sep="")
y_test <- read.csv("./UCI HAR Dataset/test/y_test.txt",header=FALSE, sep="")

# Add variable names to test data set
names(test) <- features$V2
# names(test)

# Add subject and lables to test data set
test$subject <- subject_test$V1
test$activity <- y_test$V1

# Converting activity labels into factors
test$activity <- factor(test$activity, levels=c(1,2,3,4,5,6))
# is.factor(test$activity)
levels(test$activity) <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')

# Load training data sets
train <- read.csv("./UCI HAR Dataset/train/X_train.txt",header=FALSE, sep="")
subject_train <- read.csv("./UCI HAR Dataset/train/subject_train.txt",header=FALSE, sep="")
y_train <- read.csv("./UCI HAR Dataset/train/y_train.txt",header=FALSE, sep="")

# Add variable names to train data set
names(train) <- features$V2
# names(train)

# Add subject and lables to train data set
train$subject <- subject_train$V1
train$activity <- y_train$V1

# Converting activity labels into factors
train$activity <- factor(train$activity, levels=c(1,2,3,4,5,6))
# is.factor(train$activity)
levels(train$activity) <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')

# 1. Merges the training and the test sets to create one data set.
HAR <- rbind(train,test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# names(HAR)
relevant_columns <- grep("mean[()]|std[()]|activity|subject", names(HAR))
HAR_extract <- HAR[,relevant_columns]
# str(HAR_extract)


# 3. Uses descriptive activity names to name the activities in the data set
# see above

# 4. Appropriately labels the data set with descriptive variable names. 
# see above

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.

library(dplyr)
data_groups <- HAR_extract %>% group_by(subject, activity)
tidy_data <- data_groups %>% summarise_each(funs(mean))
# str(tidy_data)

# Write file with tidy_data-Set
write.table(tidy_data,file="tidy_data.txt",row.name=FALSE)

