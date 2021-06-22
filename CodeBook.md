
##Variables with assigned data

features <- features.txt (561 rows, 2 columns)
The features selected.
activity_labels<- activity_labels.txt (6 rows, 2 columns)
List of activities labels 
subject_test <- test/subject_test.txt (2947 rows, 1 column)
contains test data of 9 out of 30 test subjects
x_test <- test/X_test.txt (2947 rows, 561 columns)
contains recorded features test data
y_test <- test/y_test.txt (2947 rows, 1 columns)
contains test data of activities’code labels
subject_train <- test/subject_train.txt (7352 rows, 1 column)
contains train data of 21 out of 30 subjects
x_train <- test/X_train.txt (7352 rows, 561 columns)
contains recorded features train data
y_train <- test/y_train.txt (7352 rows, 1 column)
contains train data of activities’code labels

##Merge training and test sets to create one data set

x_bind(10299 rows, 561 columns) is x_train and x_test merged
y_bind(10299 rows, 1 column) is y_train and y_test merged
subject(10299 rows, 1 column) is subject_train and subject_test merged
Merged (10299 rows, 563 column) is Subject, Y and X merged


##Extract only the measurements on the mean and standard deviation for each measurement

TidyData (10299 rows, 88 columns) selecting only columns from Merged_Data: subject, code and the measurements on the mean and standard deviation (std) for each measurement


##Use descriptive activity names to name the activities in the data set

Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable

## label the data set with descriptive variable names

code column in TidyData renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time


##From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

FinalData (180 rows, 88 columns): sumarizing TidyData taking the means of each variable for each activity and each subject, grouped by subject and activity.
Export FinalData into FinalData.txt file.