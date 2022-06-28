# Initializing Variables

location <- "C:/Users/jaden/source/repos/Programming Notes - Data Languages/R Guide/Programming Assignments JH/Programming Assignment 4 - C2W4 Project/"
columnNames <- read.table(paste0(location, "features.txt"))
activityNames <- c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying")

# Setting up Test Data

testData <- read.table(paste0(location, "X_test.txt"))
colnames(testData) <- columnNames$V2
testNames <- read.table(paste0(location, "y_test.txt"))
colnames(testNames) <- "Activity"
testNames$Activity <- cut(testNames$Activity, breaks=6, activityNames)
testSubject <- read.table(paste0(location, "subject_test.txt"))
colnames(testSubject) <- "Subject"
testSubject$Subject <- as.factor(testSubject$Subject)

# Setting up Train Data

trainData <- read.table(paste0(location, "X_train.txt"))
colnames(trainData) <- columnNames$V2
trainNames <- read.table(paste0(location, "y_train.txt"))
colnames(trainNames) <- "Activity"
trainNames$Activity <- cut(trainNames$Activity, breaks=6, activityNames)
trainSubject <- read.table(paste0(location, "subject_train.txt"))
colnames(trainSubject) <- "Subject"
trainSubject$Subject <- as.factor(trainSubject$Subject)

# Merging the Datasets

testDataset <- cbind(testSubject, testNames, testData)
trainDataset <- cbind(trainSubject, trainNames, trainData)
mergedData <- rbind(testDataset, trainDataset)

# Extracting Mean/SD Columns

library(dplyr)
neededData <- select(mergedData, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545))

# Finding New Averages

averageData <- neededData %>%
    group_by(Subject, Activity) %>%
    summarise_all(mean)
str(averageData)
head(averageData)
