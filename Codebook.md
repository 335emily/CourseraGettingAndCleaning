#Code Book for 335emily’s Submission
## Study Design Section
### Information about the experimental study design used
* For a detailed description of the study design, please see [here] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and refer to the README.txt file in the data set (available for download [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) )
* The raw data set (unprocessed by 335emily) is available [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Summary Choices Section
### Information about how the data was summarized
* ”HumanActivitySmartphonesMeans.txt" considers the all variables related to mean and standard deviation for the three measurements listed above (excludes measurements such as Mean Frequency)
* Total dimension is 180 rows by 68 columns. This file has 6 activities and 30 subjects, with 180 rows for all combinations; there are 68 rows, 1 for subject ID, 1 for activity name and 66 for the measures
* The numeric data (columns 3-68) in the file contains the average of those variables for each activity done by each subject
* Calculations are normalized and bounded within [-1,1] (in the raw data)

## Code Book Section
### Describes each variable and its units
”HumanActivitySmartphonesM]eans.txt"  contains :
* Column 1 (subject): a numeric identifier of who did the experiment. Range is from 1-30.
* Column 2 (action): an string action label. Range is walking, sitting, standing, walkingdownstairs, walkingupstairs, laying
* Columns 3-68: the mean measurement of the mean and standard deviation variables collected from experiment (again, described [here] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) )
	* The format of 3-68 column titles is "featurevectorVariabledirection"
	* The feature vectors are:
		* tbodyacc
		* tgravityacc
		* tbodyaccjerk
		* tbodygyro
		* tbodygyrojerk
		* tbodyaccmag
		* tgravityaccmag
		* tbodyaccjerkmag
		* tbodygyromag
		* tbodygyrojerkmag
		* fbodyacc
		* fbodyaccjerk
		* fbodygyro
		* fbodyaccmag
		* fbodyaccjerkmag
		* fbodygyromag
		* fbodygyrojerkmag
	* The variables (denoted with a capitalized first letter) are
		* Mean
		* Standard deviation (Std)
	* The direction, when applicable, is X, Y or Z


## Instruction List (Used in Conjunction with the run_Analysis.r script)
### In case a user is not familiar with code, this is the pseudocode for transform the data
run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set (e.g. walking, running, laying)
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set ("HumanActivitySmartphonesMeans.txt”) with the average of each variable for each activity and each subject.
