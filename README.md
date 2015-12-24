
This script uses data from "Human Activity Recognition Using Smartphones Data Set". A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data for the project were downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

File "run_analysis.R" does the following:

  1. Reads dataset files. It assumes that the data are in the "data" folder in the same directory as the script. This can be changed by modifying the "datadir" variable in the script.
  2. Extracts features that correspond to means and standard deviations of each measurement.
  3. Assigns descriptive names to the extracted features.
  4. Adds activity and subject columns to feature dataframes using descriptive labels for activities.
  5. Merges train and test datasets.
  6. Computes averages of all variables for all activity-subject combinations.
  7. Saves the resulting dataframe to "averages.txt" file.
  
Full list of variables of the resulting dataset is available in the "CodeBook.md" file.
