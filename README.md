# Final_Project_Razieh_Askari
Peer-graded Assignment: Getting and Cleaning Data Course Project
##Getting and Cleaning Data - peer assessment project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#In the run_analysis.R script, were recreated each step.

This file 'run_analysis.R' contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

About this R script
File with R code "run_analysis.R" perform 5 following steps (in accordance assigned task of course work):

1.Merging the training and the test sets to create one data set.
1.1 Reading files
1.1.1 Reading feature vector
1.1.2 Reading testing tables
1.1.3 Reading trainings tables
1.1.4 Reading activity labels
1.1 Add y_test and y_train as "label" to test and train dataset
1.2 Assigning column names to test and train
1.3 Merging all data in one set
1.3 
1.4 

2.Extracting only the measurements on the mean and standard deviation for each measurement
2.1 Reading subject_train and subject_test
2.2 Add "Subject" to test and train dataset
2.3 Create vector for defining label, subject, mean and standard deviation
2.4 Making nessesary subset from data named measurement

3.Using descriptive activity names to name the activities in the data set
3.1 use match and subsetting to add descriptive activity names instead of label (in my code label = activityes)

4.Appropriately labeling the data set with descriptive variable names

5.Creating a second, independent tidy data set with the average of each variable for each activity and each subject
5.1 Making second tidy data set
5.2 Writing second tidy data set in txt file
