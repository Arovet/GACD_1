GACD_1
======
Code for Getting and Cleaning Data Peer Assessment 27th April 2014
===
Line 1          – Requires the **_Reshape2_** package to perform **melt** and **dcast** functions

Lines 2-8     – Set up a temporary file and directory, downloads and unzips ZIP file into the temporary location

Lines 10-11  - Reads in the activity labels (*activity_labels*) and feature list (*features_list*)

Lines 13-16 – Reads in subject list (*sub_test*), **Activity ID** (*traininglabel_test*) and  test (*test_set*) datasets and combines into a single data frame with variable names provided by *features_list*

Lines 18-21 – Reads in subject list (*sub_train*), **Activity ID** (*traininglabel_train*) and  train (*train_set*) datasets and combines into a single data frame with variable names provided by *features_list*

Lines 23-24 – Combines test and train datasets into *merge_set* and changes **Activity_ID** variable to a factor with levels provided by *activity_labels* frame.

Lines 26-31 – Searches variable column names for strings containing “**.mean..**” and “**.std..**” and drops columns that do not contain the strings

lines 33-35 – **melt**s cropped set with ID variables of **Subject_ID** and **Activity_ID** then reshapes the set calculating the mean of all variables for each activity for each subject as the final tidy data set (*tidy_set*).

The remaining lines clear the workspace except for the tidy dataset and writes a .txt file to my desktop (commented out here)
