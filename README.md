Getting_and_Cleaning_Data_final_project
=====================

Code description

The code is performing the following tasks:

1.	Loads zip archive and unzips it
2.	Loads all data from training and test sets into R
3.	Merges training and test data
4.	Loads names of variables from file, assigns these names to variables in joint dataset, removes “-” and “()” symbols from variable names
5.	Select variable names that refer to mean and standard deviation measurements, creates a subset of dataset with only these variables included
6.	Reads descriptive names of activities from file, creates a vector with activity names for each measurement
7.	Includes number of individual and activity name in the dataset
8.	Creates a new aggregated dataset with the average of each variable for each activity and each subject
9.	Writes final dataset to file
	

List of variables:

initial training set

- y_train - activity code for each measurement
- X_train - training set (561 variables)
- subject_train - individual number for each measurement

initial test set

-	y_test - activity code for each measurement
-	X_test - test set (561 variables)
-	subject_test - individual number for each measurement

merged dataset

-	y - activity code
-	x - full dataset of 561 variables
-	subject - subject code

descriptive variables

-	features - table with variable names in the second column
-	activity - table with activity labels in the second column
-	activity_label - activity labels for all rows of x dataset

subsetting

-	indexes - indexes of variables in the x dataset referring to mean and std measurements (86 variables out of initial set of 561)
-	x_sub - subset of x dataset with variables referring to mean and std measurements as well as individual codes and activity labels in the first two columns (88 variables in total)

final data

-	Xsubset_aggr - final 'tidy' dataset with the average of each variable for each activity and each subject
-	new_dataset.txt - output file with the dataset
