
CODE BOOK
=========


Description of Data and Variables 
=================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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


The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of 66 variables of each feature vector is available in 'features.txt'


For each record it is provided:
===============================

- Its activity label (activity). 
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING
	
- An identifier of the subject who carried out the experiment (subject).
	1 SUBJECT_1
	2 SUBJECT_2
	3 SUBJECT_3
	4 SUBJECT_4
	5 SUBJECT_5
	6 SUBJECT_6
	7 SUBJECT_7
	8 SUBJECT_8
	9 SUBJECT_9
	10 SUBJECT_10
	11 SUBJECT_11
	12 SUBJECT_12
	13 SUBJECT_13
	14 SUBJECT_14
	15 SUBJECT_15
	16 SUBJECT_16
	17 SUBJECT_17
	18 SUBJECT_18
	19 SUBJECT_19
	20 SUBJECT_20
	21 SUBJECT_21
	22 SUBJECT_22
	23 SUBJECT_23
	24 SUBJECT_24	
	25 SUBJECT_25
	26 SUBJECT_26
	27 SUBJECT_27
	28 SUBJECT_28
	29 SUBJECT_29
	30 SUBJECT_30		
	
	
	
Transformations 
================

Original data has been transformed using a sript written in R (run_analysis.R). The script can be run as long as the original data has been extracted into the working directory.

The R script does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For each variable the average was calculated aggregated by activity (1-6) and subject (1-30).




