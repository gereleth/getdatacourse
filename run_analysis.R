library(dplyr)
library(tidyr)
# folder with the data
datadir <- "data"
# Read data files
X_train         <- read.table(file.path(datadir,"train","X_train.txt"))
y_train         <- read.table(file.path(datadir,"train","y_train.txt"))
subject_train   <- read.table(file.path(datadir,"train","subject_train.txt"))
X_test          <- read.table(file.path(datadir,"test","X_test.txt"))
y_test          <- read.table(file.path(datadir,"test","y_test.txt"))
subject_test    <- read.table(file.path(datadir,"test","subject_test.txt"))
features        <- read.table(file.path(datadir,"features.txt"))
activity_labels <- read.table(file.path(datadir,"activity_labels.txt"))
# Select columns that contain mean() or std() in their names
subset <- grepl("mean()", features$V2, fixed=TRUE) | grepl("std()", features$V2, fixed=TRUE)
features <- features$V2[subset]
X_train <- X_train[,subset]
X_test  <- X_test[,subset]
# Rename X_ columns
colnames(X_train) <- features
colnames(X_test)  <- features
# Add activity and subject columns to X_ dataframes
# using descriptive labels for activities
X_train$activity <- activity_labels$V2[y_train$V1]
X_train$subject  <- subject_train$V1
X_test$activity  <- activity_labels$V2[y_test$V1]
X_test$subject   <- subject_test$V1
# Merge train and test datasets
df <- bind_rows(X_train, X_test)
# Compute averages of all variables for all activity-subject combinations
averages <- df %>%
  gather(variable, value, -c(activity, subject)) %>%
  group_by(activity, subject, variable) %>%
  summarize(average = mean(value)) %>%
  spread(variable, average)
# Write results file
write.table(averages, file='averages.txt', row.names = FALSE)