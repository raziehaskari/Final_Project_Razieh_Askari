getwd()
setwd("F:/CV and Job Offer in Netherland/Improvement CV/Coursera- Getting and Cleaning Data/week4/PeerAssignment")

#represent data collected from the accelerometers from the Samsung Galaxy S smartphone

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "UCI_HAR_Dataset.zip", mode = "wb")
unzip(zipfile="UCI_HAR_Dataset.zip")

#Read features
fileF <- "F:\\CV and Job Offer in Netherland\\Improvement CV\\Coursera- Getting and Cleaning Data\\week4\\PeerAssignment\\UCI HAR Dataset\\features.txt"
features <- read.table(fileF, header = FALSE)


### Read Test Files
fileT1 <- "F:\\CV and Job Offer in Netherland\\Improvement CV\\Coursera- Getting and Cleaning Data\\week4\\PeerAssignment\\UCI HAR Dataset\\test\\X_test.txt"
X_test <- read.table(fileT1, header = FALSE)
names(X_test) <- features$V2

fileT2 <- "F:\\CV and Job Offer in Netherland\\Improvement CV\\Coursera- Getting and Cleaning Data\\week4\\PeerAssignment\\UCI HAR Dataset\\test\\y_test.txt"
y_test <- read.table(fileT2, header = FALSE)


## rename col name of y_test and add it as label to x_test
names(y_test) <- "label"
test <- cbind(X_test, y_test)

### Read Train Files
fileTr1 <- "F:\\CV and Job Offer in Netherland\\Improvement CV\\Coursera- Getting and Cleaning Data\\week4\\PeerAssignment\\UCI HAR Dataset\\train\\X_train.txt"
X_train <- read.table(fileTr1, header = FALSE)
names(X_train) <- features$V2

fileTr2 <- "F:\\CV and Job Offer in Netherland\\Improvement CV\\Coursera- Getting and Cleaning Data\\week4\\PeerAssignment\\UCI HAR Dataset\\train\\y_train.txt"
y_train <- read.table(fileTr2, header = FALSE)

## Rename colname of y_test and add label (y_train) to train
names(y_train) <- "label"
train <- cbind(X_train, y_train)

head(X_train)
head(X_test)

#1. Merges the training and the test sets to create one data set
data <- rbind(train,test)


#2. Extracts only the measurements on the mean and standard deviation for each measurement
### add subject to the dataset
fileSbTr <- "F:\\CV and Job Offer in Netherland\\Improvement CV\\Coursera- Getting and Cleaning Data\\week4\\PeerAssignment\\UCI HAR Dataset\\train\\subject_train.txt"
Subject_Train <- read.table(fileSbTr, header = FALSE)

fileSbTs <- "F:\\CV and Job Offer in Netherland\\Improvement CV\\Coursera- Getting and Cleaning Data\\week4\\PeerAssignment\\UCI HAR Dataset\\test\\subject_test.txt"
Subject_Test <- read.table(fileSbTs, header = FALSE)

Subject_data <- rbind(Subject_Train, Subject_Test)
names(Subject_data) <- "Subject"
data <- cbind(data, Subject_data)

mean_std <- grep("Subject|mean|std|label", names(data))# I add label to have label and Subject in my output as well
measurement <- data[,mean_std]




#3. Uses descriptive activity names to name the activities in the data set

#Read activity_labels.txt
fileA <- "F:\\CV and Job Offer in Netherland\\Improvement CV\\Coursera- Getting and Cleaning Data\\week4\\PeerAssignment\\UCI HAR Dataset\\activity_labels.txt"
activity_labels <- read.table(fileA, header = FALSE)

matchAL <- match(measurement$label, activity_labels$V1)
measurement$label <- activity_labels[matchAL,"V2"]

summary(measurement$label)

#4. Appropriately labels the data set with descriptive variable names.
#done already in step 1





### change column names of measurement to approperiate name
names(measurement) <- gsub("^t","Time",names(measurement))
names(measurement) <- gsub("^f","Frequency",names(measurement))
names(measurement) <- gsub("[aA]cc","Acceleration",names(measurement))
names(measurement) <- gsub("[t]Mm]ag","Magtitude",names(measurement))
names(measurement) <- gsub("BodyBody","Body",names(measurement))
names(measurement) <- gsub("[Gg]yr","Gyroscope",names(measurement))
names(measurement) <- gsub("mean","Mean",names(measurement))
names(measurement) <- gsub("std","STD",names(measurement))
names(measurement) <- gsub("mad","MAD",names(measurement))
names(measurement) <- gsub("max","MAX",names(measurement))
names(measurement) <- gsub("min","MIN",names(measurement))
names(measurement) <- gsub("angles","Angles",names(measurement))
names(measurement) <- gsub("gravity","Gravity",names(measurement))







#5. From the data set in step 4, creates a second,
#independent tidy data set with the average of each variable 
#for each activity and each subject.

install.packages("reshape2")
library(reshape2)

rcm<- recast(measurement, label~..., id.var= 80, mean)
rcSub <- recast(measurement, Subject+label~..., id.var= 80:81, mean)

tidy_data <- rcSub


write.table(tidy_data,"tidy_dataset.txt" , row.names = FALSE)



