#STEP 1: Merges the training and the test sets to create one data set.

## Reading in related data and creating a single "Training" dataset with column names
trainset <- read.table("./SamsungData/train/X_train.txt")


## Reading in related data and creating a single "Training" dataset with column names
testset <- read.table("./SamsungData/test/X_test.txt")

## Merging the "Training" and "Test" datasets
fulldf <- rbind(trainset, testset)

## Additionally, adding in the subject and action labels data, and merging
trainsubjects <- read.table("./SamsungData/train/subject_train.txt", col.names=("subjects"))
trainlabels <- read.table("./SamsungData/train/y_train.txt", col.names=("action"))
testsubjects <- read.table("./SamsungData/test/subject_test.txt", col.names=("subjects"))
testlabels <- read.table("./SamsungData/test/y_test.txt", col.names=("action"))

labeldf <- rbind(trainlabels, testlabels)
subjectdf <- rbind(trainsubjects, testsubjects)

## Removing no longer needed data sets
rm(trainsubjects,trainlabels,trainset, testsubjects,testlabels, testset)


#STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

## Only the variables related to mean and standard deviation will be kept
setcolnames <- read.table("./SamsungData/features.txt")

## Selecting all mean and std variables to ensure completeness, excludes things like "MeanFreq"
reqcolumns <- grep("mean\\(\\)|std\\(\\)", setcolnames[, 2]) 

selecteddf <- fulldf[, reqcolumns]


#STEP 3: Uses descriptive activity names to name the activities in the data set

## Read in the activity_labels.txt
actiondf <-read.table("./SamsungData/activity_labels.txt", col.names=c("actioncode","actionlabel"),stringsAsFactors = FALSE)

actiondf[,2] <- sub("_","",actiondf$actionlabel) #replace _ with ""
actiondf[,2] <- tolower(actiondf$actionlabel) #lower case all letters

## Replace the numbers in the action label dataset with the related named action
labeldf$action <- actiondf$actionlabel[labeldf$action]


#STEP 4: Appropriately labels the data set with descriptive variable names

names(selecteddf) <- gsub("\\(\\)", "", setcolnames[reqcolumns, 2]) # add names and remove "()"
names(selecteddf) <- gsub("-", "", names(selecteddf)) # remove "-" in column names

## capitalising some words will make the column titles more readable
names(selecteddf) <- gsub("mean", "Mean", names(selecteddf)) #capitalise Mean
names(selecteddf) <- gsub("std", "Std", names(selecteddf)) # capitalize Std, keeping short form for readability

## Merge the subjects, action names and data into a single dataset
cleandf <- cbind(subjectdf, labeldf, selecteddf)

## Removing no longer needed data sets
rm(actiondf, labeldf, subjectdf)

# STEP 5: From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
df1 <- group_by(cleandf, subjects, action)
df2 <- summarize_each(df1, funs(mean))
write.table(df2, "HumanActivitySmartphonesMeans.txt", row.name=FALSE)
