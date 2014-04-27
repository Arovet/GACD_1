```R

require(package=reshape2)

temp<-tempfile()
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename<-basename(fileURL)
download.file(fileURL,dest=filename, method="curl")
unzip(filename,exdir= temp)
list.files(temp)

setwd(temp)

activity_labels<-read.table("./UCI HAR dataset/activity_labels.txt",col.names=c("Activity_ID","Activity_Label"))
features_list<-read.table("./UCI HAR Dataset/features.txt",col.names=c("ref_id","feature"))

sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names=c("Subject_ID"))
traininglabel_test<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names=c("Activity_ID"))
test_set<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features_list$feature)
test_set<-cbind(c(sub_test,traininglabel_test),test_set)

sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names=c("Subject_ID"))
traininglabel_train<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names=c("Activity_ID"))
train_set<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features_list$feature)
train_set<-cbind(c(sub_train,traininglabel_train),train_set)


merge_set<-rbind(test_set,train_set)
merge_set$Activity_ID<-factor(merge_set$Activity_ID,labels=activity_labels$Activity_Label)

mean_match<-c("\\.mean\\.\\.")
std_match<-c("\\.std\\.\\.")

mean_cols<-grep(mean_match,colnames(merge_set))
std_cols<-grep(std_match,colnames(merge_set))
col_select<-sort(c(1,2,mean_cols,std_cols),decreasing=F)
cropped_set<-merge_set[,col_select]

melt_cropped<-melt(cropped_set,id.vars=c("Subject_ID","Activity_ID"))
ls()->clear_list
tidy_set<-dcast(melt_cropped,Subject_ID+Activity_ID~variable,fun=mean)

rm(list=clear_list)
'write.table(tidy_set,file="/Users/Mick/Desktop/GACD tidy set.txt",sep=" ",row.names=F) 
```
