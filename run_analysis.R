url='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip '
download.file(url=url,destfile='project_data.zip',method='curl' )
unzip('project_data.zip')

# 0. load training and test set
y_train=read.table('./UCI HAR Dataset/train/y_train.txt')
X_train=read.table('./UCI HAR Dataset/train/X_train.txt')
subject_train=read.table('./UCI HAR Dataset/train/subject_train.txt')
y_test=read.table('./UCI HAR Dataset/test/y_test.txt')
X_test=read.table('./UCI HAR Dataset/test/X_test.txt')
subject_test=read.table('./UCI HAR Dataset/test/subject_test.txt')

# 1. Merge the training and the test sets to create one data set.

y=rbind(y_train,y_test)
x=rbind(X_train,X_test)
subject=rbind(subject_train,subject_test)
names(subject)='individual'


# 4. Appropriately labels the data set with descriptive variable names. 
features=read.table('./UCI HAR Dataset/features.txt')
names(x)=features[,2]

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
indexes=grep('mean|std',names(x),ignore.case=T)
x_sub=x[,indexes]

# 3. Use descriptive activity names to name the activities in the data set
activity=read.table('./UCI HAR Dataset/activity_labels.txt',stringsAsFactors = F)
activity_label=activity[y[,1],2]
names(x_sub)=gsub('-','_',names(x_sub))
names(x_sub)=gsub('[()]','',names(x_sub))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# combine dataset with subject and activity labels
x_sub=cbind(subject,activity_label,x_sub)
# new aggregated dataset
Xsubset_aggr=aggregate(x = x_sub[, 3:ncol(x_sub)], by = list(individual = x_sub$individual,activity=x_sub$activity_label), FUN = "mean", na.rm = T)
write.table(Xsubset_aggr,file='new_dataset.txt',row.name=FALSE)
