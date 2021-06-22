
library(dplyr)

file_dir = "UCI HAR DATASET/"
train_dir = paste0(file_dir, "train/")
test_dir = paste0(file_dir, "test/")


features <- read.table(paste0(file_dir,"features.txt"), col.names = c("n","functions"))
activity_labels <- read.table(paste0(file_dir,"activity_labels.txt"), col.names = c("code", "activity"))
subject_test <- read.table(paste0(test_dir, "subject_test.txt"), col.names = "subject")
x_test <- read.table(paste0(test_dir, "X_test.txt"), col.names = features$functions)
y_test <- read.table(paste0(test_dir, "y_test.txt"), col.names = "code")
subject_train <- read.table(paste0(train_dir, "subject_train.txt"), col.names = "subject")
x_train <- read.table(paste0(train_dir, "X_train.txt"), col.names = features$functions)
y_train <- read.table(paste0(train_dir, "y_train.txt"), col.names = "code")


x_bind <- rbind(x_train, x_test)
y_bind <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
Merged <- cbind(subject, y_bind, x_bind)

TidyData <- Merged %>% select(subject, code, contains("mean"), contains("std"))

TidyData$code <- activity_labels[TidyData$code, 2]


names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

Final <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(Final, "FinalData.txt", row.name=FALSE)
