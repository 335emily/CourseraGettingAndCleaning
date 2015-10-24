# Getting and Cleaning Data Course Project
###By: 335emily

This file describes how the "run_Analysis.r" script works.

###Data Source Information
The "run_Analysis.r" script uses data from experiments with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, testers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

For each record (i.e. subject and activity combination) it provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 

More information about the data set is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###Other Files in This Repository
* CodeBook.md: Explains the variables in the resulting file "HumanActivitySmartphonesMeans.txt"
* run_Analysis.r: A script to convert the initial data to "HumanActivitySmartphonesMeans.txt"

###Downloading the Data and Running the Script
* Before running the script, download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip to your working directory. Rename the folder "SamsungData"
* Make sure that the "SamsungData" folder and the "run_Analysis.R" script are both in the working directory
* Make sure you have the plyr and dplyr packages installed and loaded
* Write source("run_Analysis.r") in R studio
* The script will automatically download two required packages, plyr and dplyr; you may need to restart R if prompted
* The script will create a new file in your working directory called "HumanActivitySmartphonesMeans.txt"
	* "HumanActivitySmartphonesMeans.txt" considers the all variables related to mean and standard deviation for the three measurements listed above (excludes measurements such as Mean Frequency)
	* The numeric data in the file contains the average of those variables for each activity done by each subject
	* Total dimension is 180 rows by 68 columns. This file has 6 activities and 30 subjects, with 180 rows for all combinations; there are 68 rows, 1 for subject ID, 1 for activity name and 66 for the measures
