---
title: "CodeBook.md"
author: "Anurag"
date: "Saturday, December 20, 2014"
output: html_document
---
This codebook details all the variable used in this analysis.

1. Local Variables for preparing test and training data.

a.filepath :- URL for the original data.

b.destfile:- location to store the original zip file.

c.activity_lables:-holder for 6 activity labels in data set viz WALKING , RUNNING etc.

d.features_info:- holder for 561 variables in which experiment was recorded.

e subject_train:- subject IDs for the data set.

f.x_train:- Observations for the training data set.

g.y_train:- activity ID for the training data set.

h. y train_data:- a combination of activity IDs and activity lables. Used to make activity ID more readable.

i. x train_data:-combination of training set , subject ID and activity ID and lables

j subject_test:- subject IDs for the data set.

k.x_test:- Observations for the test data set.

l.y_test:- activity ID for the test data set.

m. y test_data:- a combination of activity IDs and activity lables. Used to make activity ID more readable.

n. x test_data:-combination of training set , subject ID and activity ID and lables

2. Local variables for performing data manipulation operations of the processed dataset

a. master data :- formed by merging x_train_data and x_test_data

b. meanstdvector:- a numeric vector containing column numbers of columns that have word "mean" of "std" within them.

c. othercolvector:- a numeric vector containing column numbers of factors like activity_id, activity_name, subject_id.

d. susetvector:- concatination of meanstdvector and othercolvector.

e. master_subset:- subset of master data which have all columns denoted by subsetvector.

f. tidy master_sub:- final tidy data set in which all variables have been aggregated and their means are shown for 
each subject and activity.
  
  
  