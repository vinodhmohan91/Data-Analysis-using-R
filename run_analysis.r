#Reading train data, adding subject & activity columns and naming DF
file <- "./UCI HAR Dataset/train/X_train.txt"
train <- read.table(file,header = FALSE)

file1 <- "./UCI HAR Dataset/train/y_train.txt"
activityNames <- read.table(file1,header = FALSE)

file2 <- "./UCI HAR Dataset/train/subject_train.txt"
subjectNames <- read.table(file2,header = FALSE)

trainData <- cbind(activityNames,subjectNames,train)

file3 <-  "./UCI HAR Dataset/features.txt"
features <- read.table(file3,header = FALSE,colClasses = "character")
variableNames <- features$V2
names(trainData) <- c("Activity","Subject",variableNames)

#Reading test data, adding subject & activity columns and naming DF
file4 <- "./UCI HAR Dataset/test/X_test.txt"
test <- read.table(file4,header = FALSE)

file5 <- "./UCI HAR Dataset/test/y_test.txt"
activityNames1 <- read.table(file5,header = FALSE)

file6 <- "./UCI HAR Dataset/test/subject_test.txt"
subjectNames1 <- read.table(file6,header = FALSE)

testData <- cbind(activityNames1,subjectNames1,test)
names(testData) <- c("Activity","Subject",variableNames)

#Merging train and test Data
galaxyData <- rbind(trainData,testData)

#Extracting only mean and std measurements for each row along with activity and sujbject
meanExtractPos <- grep("mean()",names(galaxyData),fixed = TRUE)
stdExtractPos <- grep("std()",names(galaxyData),fixed = TRUE)
galaxyExtarct <- galaxyData[,c(1,2,meanExtractPos,stdExtractPos)]

#Describe activity names for each value present
galaxyExtarct$Activity <- replace(galaxyExtarct$Activity,grep("1",galaxyExtarct$Activity),"WALKING")
galaxyExtarct$Activity <- replace(galaxyExtarct$Activity,grep("2",galaxyExtarct$Activity),"WALKING_UPSTAIRS")
galaxyExtarct$Activity <- replace(galaxyExtarct$Activity,grep("3",galaxyExtarct$Activity),"WALKING_DOWNSTAIRS")
galaxyExtarct$Activity <- replace(galaxyExtarct$Activity,grep("4",galaxyExtarct$Activity),"SITTING")
galaxyExtarct$Activity <- replace(galaxyExtarct$Activity,grep("5",galaxyExtarct$Activity),"STANDING")
galaxyExtarct$Activity <- replace(galaxyExtarct$Activity,grep("6",galaxyExtarct$Activity),"LAYING")

#Describe Subject names for each value present
galaxyExtarct$Subject <- paste0("Subject",galaxyExtarct$Subject)

#Describe variable names in a tidy manner
varNames <- strsplit(names(galaxyExtarct),"-") #splitting names into 3 parts

FUN2 <- function(x){x[2]}
varPart2 <- sapply(varNames,FUN2)
varPart2 <- gsub("\\()","",varPart2) #removing '()' and upperCasing names
varPart2 <- gsub("mean","Mean",varPart2)
varPart2 <- gsub("std","STD",varPart2)


FUN3 <- function(x){x[3]}
varPart3 <- sapply(varNames,FUN3)
varPart3 <- gsub("X","Xaxis",varPart3) #adding 'axis' keyword to X,Y,Z
varPart3 <- gsub("Y","Yaxis",varPart3)
varPart3 <- gsub("Z","Zaxis",varPart3)

FUN1 <- function(x){x[1]}
varPart1 <- sapply(varNames,FUN1)
varPart1 <- gsub("^t","time",varPart1) #abbreviating short names
varPart1 <- gsub("^f","fourier",varPart1)
varPart1 <- gsub("Acc","Acceleration",varPart1)
varPart1 <- gsub("Gyro","Gyroscope",varPart1)
varPart1 <- gsub("Mag","Magnitude",varPart1)
varPart1 <- gsub("BodyBody","Body",varPart1)

columnNames <- paste0(varPart1,varPart2,varPart3) #combining names and removing NAs
columnNames <- gsub("NA$","",columnNames)
columnNames <- gsub("NA$","",columnNames)
names(galaxyExtarct) <- columnNames

#Independent tidy dataset with average of each variable based on activity and subject
library(dplyr)
galaxySummary <- galaxyExtarct%>%group_by(Activity,Subject)%>%summarise_each(funs(mean))
print(galaxySummary)

#write.table(galaxySummary,file = "galaxySummaryOutput.txt",row.names = FALSE)