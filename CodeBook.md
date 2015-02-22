Variables, Data and Transformations
-----------------------------------

Initial dataset uses the following variables to describe measurements
of accelerometer and hyroscope. Please refer to the original documentation
to get more info on these:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The dataset contains different statistics on those measurements.
After filtering only the interesting to us (means and stds of these),
the script gets the following list of variables, all measured in
corresponding units of initial features (note that "Variable no." are
numbers of variables in initial dataset vector):

"Variable no." "Variable name"

* 1 "tBodyAcc-mean()-X"
* 2 "tBodyAcc-mean()-Y"
* 3 "tBodyAcc-mean()-Z"
* 4 "tBodyAcc-std()-X"
* 5 "tBodyAcc-std()-Y"
* 6 "tBodyAcc-std()-Z"
* 41 "tGravityAcc-mean()-X"
* 42 "tGravityAcc-mean()-Y"
* 43 "tGravityAcc-mean()-Z"
* 44 "tGravityAcc-std()-X"
* 45 "tGravityAcc-std()-Y"
* 46 "tGravityAcc-std()-Z"
* 81 "tBodyAccJerk-mean()-X"
* 82 "tBodyAccJerk-mean()-Y"
* 83 "tBodyAccJerk-mean()-Z"
* 84 "tBodyAccJerk-std()-X"
* 85 "tBodyAccJerk-std()-Y"
* 86 "tBodyAccJerk-std()-Z"
* 121 "tBodyGyro-mean()-X"
* 122 "tBodyGyro-mean()-Y"
* 123 "tBodyGyro-mean()-Z"
* 124 "tBodyGyro-std()-X"
* 125 "tBodyGyro-std()-Y"
* 126 "tBodyGyro-std()-Z"
* 161 "tBodyGyroJerk-mean()-X"
* 162 "tBodyGyroJerk-mean()-Y"
* 163 "tBodyGyroJerk-mean()-Z"
* 164 "tBodyGyroJerk-std()-X"
* 165 "tBodyGyroJerk-std()-Y"
* 166 "tBodyGyroJerk-std()-Z"
* 201 "tBodyAccMag-mean()"
* 202 "tBodyAccMag-std()"
* 214 "tGravityAccMag-mean()"
* 215 "tGravityAccMag-std()"
* 227 "tBodyAccJerkMag-mean()"
* 228 "tBodyAccJerkMag-std()"
* 240 "tBodyGyroMag-mean()"
* 241 "tBodyGyroMag-std()"
* 253 "tBodyGyroJerkMag-mean()"
* 254 "tBodyGyroJerkMag-std()"
* 266 "fBodyAcc-mean()-X"
* 267 "fBodyAcc-mean()-Y"
* 268 "fBodyAcc-mean()-Z"
* 269 "fBodyAcc-std()-X"
* 270 "fBodyAcc-std()-Y"
* 271 "fBodyAcc-std()-Z"
* 345 "fBodyAccJerk-mean()-X"
* 346 "fBodyAccJerk-mean()-Y"
* 347 "fBodyAccJerk-mean()-Z"
* 348 "fBodyAccJerk-std()-X"
* 349 "fBodyAccJerk-std()-Y"
* 350 "fBodyAccJerk-std()-Z"
* 424 "fBodyGyro-mean()-X"
* 425 "fBodyGyro-mean()-Y"
* 426 "fBodyGyro-mean()-Z"
* 427 "fBodyGyro-std()-X"
* 428 "fBodyGyro-std()-Y"
* 429 "fBodyGyro-std()-Z"
* 503 "fBodyAccMag-mean()"
* 504 "fBodyAccMag-std()"
* 516 "fBodyBodyAccJerkMag-mean()"
* 517 "fBodyBodyAccJerkMag-std()"
* 529 "fBodyBodyGyroMag-mean()"
* 530 "fBodyBodyGyroMag-std()"
* 542 "fBodyBodyGyroJerkMag-mean()"
* 543 "fBodyBodyGyroJerkMag-std()"

Also, in the tidy dataset we have the following two variables to indicate
subject and activity this particular observation is for:

* "subject" - no. of subject of experiment (1 - 30)
* "activity" - one from the list in the original dataset: WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING

In general we have several measurements of the above "mean-std" quantities for each
subject and for each activity (for different times). 
The script aggregates this data in a natural manner: using 'by' function
it subsets the data in dimension (subject x activity), and for each such
combination computes means of all variables across corresponding observations
and shapes them to target (tidy) data frame.

So, the result we have is table, each row of which contains means of
variables of interest for one observation (subject x activity), and each
column - one variable we measure (corresponding means). Thus, the data
corresponds to the definition of tidy dataset.
