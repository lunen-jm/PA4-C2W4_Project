In this repository, there is one script:

* run_analysis.R

This script uses the following 8 documents, which were located in my computer when I made this:

* General Notes
    * activity_labels.txt - This provided a translation for the activity integers
    * features.txt - This provided a list of the variables in the "X_.txt" files
* Test Data
    * subject_test.txt - Provided Subjects for each observation
    * y_test.txt - Provided Activities for each observation
    * X_test.txt - Provided the actual measurements
* Train Data
    * subject_train.txt - Provided Subjects for each observation
    * y_train.txt - Provided Activities for each observation
    * X_train.txt - Provided the actual measurements

The script itself reads the 6 data files into R, merges the columns for Test/Train documents, and then combines the data for both the Test and Train into one dataframe. It also changes the Subject and Activity into Factor variables.

After the data is cleaned up, we select out just the mean/SD columns, and apply `group_by` and `summarize_all` to provide the necessary average data for each subject and activity.