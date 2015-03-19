## File description
Describe the variables, the data, and any transformations or work that you performed to clean up the data.

## Steps
1. Unzip the data files and firstly get the feature names into a character vector as the header of sensor data.  
2. Load the sensor data, activity data, and subject data from both training and test group with descriptive variable names.  
3. Merge the training and the test sets to create one data set.  
4. Extract only the measurements on the mean and standard deviation for each measurement.
5. Use descriptive activity names to name the activities in the data set, and already appropriately label the data set.  
6. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Major datasets along steps, and their variables
- sensorTrain/sensorTest (Step2)
  561-feature vectors with time and frequency domain variables. Please refer to 'features_info.txt' for variable names and information.
- activityTrain/activityTest (Step2)
  1-variable-only data recording activity label with variable name 'activityCd'.
- subjectTrain/subjectTest (Step2)
  1-variable-only data recording identifier of the subject who carried out the experiment with variable name 'subjectId'.
- mergedData (Step3)
  563-variable data composed of the training datasets and the test datasets. Two variables, 'activityCd' and 'subjectId', are binded with the 561-feature variables.
- extractedData (Step4,5)
  88-variable data with 'activityCd', 'subjectId', and the variables whose names containing 'mean' or 'std'.
- meanData (Step6)
  4-variable data with 'activityCd', 'subjectId', 'variable', and 'meanValue'. 'meanValue' is the average of each variable for each activity and each subject.