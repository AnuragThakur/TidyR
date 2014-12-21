library(dplyr)
filepath<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile<-"fucidata.zip"
download.file(filepath,destfile)
#read dataset meta
activity_labels<-read.table(".\\fucidata\\UCI HAR Dataset\\activity_labels.txt",header=F)
colnames(activity_labels)<-c("activity_id","activity_name")
features_info<-read.table(".\\fucidata\\UCI HAR Dataset\\features.txt",header=F)
colnames(features_info)<-c("feature_id","feature_name")

#Read training data, assign readable names to columns
subject_train<-read.table(".\\fucidata\\UCI HAR Dataset\\train\\subject_train.txt",header=F)
colnames(subject_train)<-c("subject_id")

x_train<-read.table(".\\fucidata\\UCI HAR Dataset\\train\\X_train.txt",header =F)
colnames(x_train)<-as.vector(features_info[,2])# features info file contains column names

y_train<-read.table(".\\fucidata\\UCI HAR Dataset\\train\\y_train.txt",header =F)
colnames(y_train)<-c("activity_id")

#join activity ID to activity name combine with x_train data set to get a data set which
#has all the info i.e x_train plus activity id plus activity_name plus subject id
y_train_data<-inner_join(y_train,activity_labels)
x_train_data<-cbind(x_train,y_train_data,subject_train)

#Read test data and assign readable column names
subject_test<-read.table(".\\fucidata\\UCI HAR Dataset\\test\\subject_test.txt",header=F)
colnames(subject_test)<-c("subject_id")

x_test<-read.table(".\\fucidata\\UCI HAR Dataset\\test\\X_test.txt",header =F)
colnames(x_test)<-as.vector(features_info[,2])# features info file contains column names

y_test<-read.table(".\\fucidata\\UCI HAR Dataset\\test\\y_test.txt",header =F)
colnames(y_test)<-c("activity_id")

#join activity ID to activity name combine with y_train data set to get a data set which
#has all the info i.e y_train plus activity id plus activity_name plus subject id

y_test_data<-inner_join(y_test,activity_labels)
x_test_data<-cbind(x_test,y_test_data,subject_test)

#merge test and train data to create a master data
master_data<-rbind(x_train_data,x_test_data)
#select all columns that have either mean or standard deviation in their names
meanstdvector<-grep("mean|std",colnames(master_data))
#select activity_id, activity_name and subject_id for further processing
othercolvector<-grep("activity_id|activity_name|subject_id",colnames(master_data))

#extract the columns that have either mean or std data and otherID fields selected above
subsetvector<-c(meanstdvector,othercolvector)
master_subset<-master_data[,subsetvector]

#aggregate the subset to  creates a second tidy data set that contains average of each variable by each activity and subject
master_subset<-transform(master_subset,activity_id=as.factor(activity_id))
master_subset<-transform(master_subset,activity_name=as.factor(activity_name))
master_subset<-transform(master_subset,subject_id=as.factor(subject_id))

tidy_master_sub<-with(master_subset,aggregate(master_subset[,1:79],by=list(activity_name,subject_id),FUN="mean"))
colnames(tidy_master_sub)[1:2]<-c("activity_name","subject_id")
#write the tidy data to a file.
write.table(tidy_master_sub,"tidyRFile.txt",row.names=FALSE)