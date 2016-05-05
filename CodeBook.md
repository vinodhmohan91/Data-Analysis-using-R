### Variable Names

The original dataset contains 561 variables(measurements) for each train and test data. 
The train data contains 7352 rows for 6 activities and 30 subjects in the training experiment.
The test data contains 2947 rows for the same 6 activities and 30 subjects in the test experiment.
Please refer to the features.txt file in the downlaoded dataset for the original variable names.

The resulting dataset is a local dataframe [180 rows and 68 columns] that provides a summary(average) of only the mean and std measurements
Here are the list of variable names - which are self explanatory. X,Y,Z refers to the axis in which the measurement was observed.STD - standard deviation.
There are 6 activities namely LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.There are 30 subjects named Subject 1 - 30.

 names(galaxySummary)
 [1] "Activity"                                 "Subject"                                 
 [3] "timeBodyAccelerationMeanXaxis"            "timeBodyAccelerationMeanYaxis"           
 [5] "timeBodyAccelerationMeanZaxis"            "timeGravityAccelerationMeanXaxis"        
 [7] "timeGravityAccelerationMeanYaxis"         "timeGravityAccelerationMeanZaxis"        
 [9] "timeBodyAccelerationJerkMeanXaxis"        "timeBodyAccelerationJerkMeanYaxis"       
[11] "timeBodyAccelerationJerkMeanZaxis"        "timeBodyGyroscopeMeanXaxis"              
[13] "timeBodyGyroscopeMeanYaxis"               "timeBodyGyroscopeMeanZaxis"              
[15] "timeBodyGyroscopeJerkMeanXaxis"           "timeBodyGyroscopeJerkMeanYaxis"          
[17] "timeBodyGyroscopeJerkMeanZaxis"           "timeBodyAccelerationMagnitudeMean"       
[19] "timeGravityAccelerationMagnitudeMean"     "timeBodyAccelerationJerkMagnitudeMean"   
[21] "timeBodyGyroscopeMagnitudeMean"           "timeBodyGyroscopeJerkMagnitudeMean"      
[23] "fourierBodyAccelerationMeanXaxis"         "fourierBodyAccelerationMeanYaxis"        
[25] "fourierBodyAccelerationMeanZaxis"         "fourierBodyAccelerationJerkMeanXaxis"    
[27] "fourierBodyAccelerationJerkMeanYaxis"     "fourierBodyAccelerationJerkMeanZaxis"    
[29] "fourierBodyGyroscopeMeanXaxis"            "fourierBodyGyroscopeMeanYaxis"           
[31] "fourierBodyGyroscopeMeanZaxis"            "fourierBodyAccelerationMagnitudeMean"    
[33] "fourierBodyAccelerationJerkMagnitudeMean" "fourierBodyGyroscopeMagnitudeMean"       
[35] "fourierBodyGyroscopeJerkMagnitudeMean"    "timeBodyAccelerationSTDXaxis"            
[37] "timeBodyAccelerationSTDYaxis"             "timeBodyAccelerationSTDZaxis"            
[39] "timeGravityAccelerationSTDXaxis"          "timeGravityAccelerationSTDYaxis"         
[41] "timeGravityAccelerationSTDZaxis"          "timeBodyAccelerationJerkSTDXaxis"        
[43] "timeBodyAccelerationJerkSTDYaxis"         "timeBodyAccelerationJerkSTDZaxis"        
[45] "timeBodyGyroscopeSTDXaxis"                "timeBodyGyroscopeSTDYaxis"               
[47] "timeBodyGyroscopeSTDZaxis"                "timeBodyGyroscopeJerkSTDXaxis"           
[49] "timeBodyGyroscopeJerkSTDYaxis"            "timeBodyGyroscopeJerkSTDZaxis"           
[51] "timeBodyAccelerationMagnitudeSTD"         "timeGravityAccelerationMagnitudeSTD"     
[53] "timeBodyAccelerationJerkMagnitudeSTD"     "timeBodyGyroscopeMagnitudeSTD"           
[55] "timeBodyGyroscopeJerkMagnitudeSTD"        "fourierBodyAccelerationSTDXaxis"         
[57] "fourierBodyAccelerationSTDYaxis"          "fourierBodyAccelerationSTDZaxis"         
[59] "fourierBodyAccelerationJerkSTDXaxis"      "fourierBodyAccelerationJerkSTDYaxis"     
[61] "fourierBodyAccelerationJerkSTDZaxis"      "fourierBodyGyroscopeSTDXaxis"            
[63] "fourierBodyGyroscopeSTDYaxis"             "fourierBodyGyroscopeSTDZaxis"            
[65] "fourierBodyAccelerationMagnitudeSTD"      "fourierBodyAccelerationJerkMagnitudeSTD" 
[67] "fourierBodyGyroscopeMagnitudeSTD"         "fourierBodyGyroscopeJerkMagnitudeSTD"

###Code Logic
1) 'read.table' function is used to read the train and test data along with the activity names and subject names
2) Names of the resulting data frames are again read from the 'features.txt' file
3) Both the train and test data frames are merged using the 'rbind' function
4) An extract dataframe is created by selecting only the mean and std measurements out of the 561 total columns
5) The activity names and subject names are described by replacing the numbers with descriptive names
6) The variable names in the extract data frame are made tidy by removing special characters and abbreviating short forms using 'gsub' function
7) Using the 'dplyr' package, a summary data frame is created that summarizes the average values of the 66 mean and std measurements grouped by the Activity and subject names
8) The resulting dataframe contains 180 rows(grouping combination) and 68 variables

###Output
The output of the run_analysis.R can be found in the 'galaxySummaryOutput.txt' file
