#Experimental Study Design
Original data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Below is taken straight from the README in the raw data's source.

Human Activity Recognition Using Smartphones Dataset Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Universit‡ degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.
#Tidy Data
Contains aggregated mean values of all mean and standard deviation values from original data set grouped by activity and subject, resulting in a total of 180 records.
#Attribute Information:
For each record in the tidy data it is provided:
* Its activity label (one out of 6 different activities):
 * LAYING
 * SITTING
 * STANDING
 * WALKING
 * WALKING_DOWNSTAIR
 * WALKING_UPSTAIRS
* An identifier of the subject who carried out the experiment (30 different subjects, IDs ranging from {1,2,3,...,30})
* 79 features with the
 * Mean of Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
 * Mean of Triaxial Angular velocity from the gyroscope.
 * numerical value ranging in [-1,1]


#Code Book for tidy.csv
* **time_** indicates time domain variables
* **frequency_** indicates frequency domain variables
* **mean** indicates Mean value
* **std** indicates Standard deviation
* **meanFreq** indicates Weighted average of the frequency components to obtain a mean frequency

* **Jerk** Indicates the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
1. SUBJECT_ID - integer - identifies the subject who performed the activity for each sample. Range: 1 to 30
2. ACTIVITY_LABEL - character/factor - Describes what the activity was. Values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING)
3. time_BodyAcc_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
4. time_BodyAcc_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
5. time_BodyAcc_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
6. time_GravityAcc_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
7. time_GravityAcc_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
8. time_GravityAcc_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
9. time_BodyAccJerk_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
10. time_BodyAccJerk_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
11. time_BodyAccJerk_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
12. time_BodyGyro_std_X - numeric - units are radians/second -- ex: -0.45345956
13. time_BodyGyro_std_Y - numeric - units are radians/second -- ex: -0.45345956
14. time_BodyGyro_std_Z - numeric - units are radians/second -- ex: -0.45345956
15. time_BodyGyroJerk_std_X - numeric - units are radians/second -- ex: -0.45345956
16. time_BodyGyroJerk_std_Y - numeric - units are radians/second -- ex: -0.45345956
17. time_BodyGyroJerk_std_Z - numeric - units are radians/second -- ex: -0.45345956
18. time_BodyAccMag_std - numeric - standard gravity units 'g' -- ex: -0.45345956
19. time_GravityAccMag_std -- ex: -0.45345956
20. time_BodyAccJerkMag_std - numeric - standard gravity units 'g' -- ex: -0.45345956
21. time_BodyGyroMag_std - numeric - units are radians/second -- ex: -0.45345956
22. time_BodyGyroJerkMag_std - numeric - units are radians/second -- ex: -0.45345956
23. frequency_BodyAcc_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
24. frequency_BodyAcc_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
25. frequency_BodyAcc_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
26. frequency_BodyAccJerk_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
27. frequency_BodyAccJerk_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
28. frequency_BodyAccJerk_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
29. frequency_BodyGyro_std_X - numeric - units are radians/second -- ex: -0.45345956
30. frequency_BodyGyro_std_Y - numeric - units are radians/second -- ex: -0.45345956
31. frequency_BodyGyro_std_Z - numeric - units are radians/second -- ex: -0.45345956
32. frequency_BodyAccMag_std - numeric - standard gravity units 'g' -- ex: -0.45345956
33. frequency_BodyBodyAccJerkMag_std - numeric - standard gravity units 'g' -- ex: -0.45345956
34. frequency_BodyBodyGyroMag_std - numeric - units are radians/second -- ex: -0.45345956
35. frequency_BodyBodyGyroJerkMag_std - numeric - units are radians/second -- ex: -0.45345956
36. time_BodyAcc_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
37. time_BodyAcc_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
38. time_BodyAcc_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
39. time_GravityAcc_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
40. time_GravityAcc_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
41. time_GravityAcc_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
42. time_BodyAccJerk_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
43. time_BodyAccJerk_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
44. time_BodyAccJerk_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
45. time_BodyGyro_mean_X - numeric - units are radians/second -- ex: -0.45345956
46. time_BodyGyro_mean_Y - numeric - units are radians/second -- ex: -0.45345956
47. time_BodyGyro_mean_Z - numeric - units are radians/second -- ex: -0.45345956
48. time_BodyGyroJerk_mean_X - numeric - units are radians/second -- ex: -0.45345956
49. time_BodyGyroJerk_mean_Y - numeric - units are radians/second -- ex: -0.45345956
50. time_BodyGyroJerk_mean_Z - numeric - units are radians/second -- ex: -0.45345956
51. time_BodyAccMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
52. time_GravityAccMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
53. time_BodyAccJerkMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
54. time_BodyGyroMag_mean - numeric - units are radians/second -- ex: -0.45345956
55. time_BodyGyroJerkMag_mean - numeric - units are radians/second -- ex: -0.45345956
56. frequency_BodyAcc_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
57. frequency_BodyAcc_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
58. frequency_BodyAcc_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
59. frequency_BodyAcc_meanFreq_X - numeric - standard gravity units 'g' -- ex: -0.45345956
60. frequency_BodyAcc_meanFreq_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
61. frequency_BodyAcc_meanFreq_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
62. frequency_BodyAccJerk_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
63. frequency_BodyAccJerk_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
64. frequency_BodyAccJerk_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
65. frequency_BodyAccJerk_meanFreq_X - numeric - standard gravity units 'g' -- ex: -0.45345956
66. frequency_BodyAccJerk_meanFreq_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
67. frequency_BodyAccJerk_meanFreq_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
68. frequency_BodyGyro_mean_X - numeric - units are radians/second -- ex: -0.45345956
69. frequency_BodyGyro_mean_Y - numeric - units are radians/second -- ex: -0.45345956
70. frequency_BodyGyro_mean_Z - numeric - units are radians/second -- ex: -0.45345956
71. frequency_BodyGyro_meanFreq_X - numeric - units are radians/second -- ex: -0.45345956
72. frequency_BodyGyro_meanFreq_Y - numeric - units are radians/second -- ex: -0.45345956
73. frequency_BodyGyro_meanFreq_Z - numeric - units are radians/second -- ex: -0.45345956
74. frequency_BodyAccMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
75. frequency_BodyAccMag_meanFreq - numeric - standard gravity units 'g' -- ex: -0.45345956
76. frequency_BodyBodyAccJerkMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
77. frequency_BodyBodyAccJerkMag_meanFreq - numeric - standard gravity units 'g' -- ex: -0.45345956
78. frequency_BodyBodyGyroMag_mean - numeric - units are radians/second -- ex: -0.45345956
79. frequency_BodyBodyGyroMag_meanFreq - numeric - units are radians/second -- ex: -0.45345956
80. frequency_BodyBodyGyroJerkMag_mean - numeric - units are radians/second -- ex: -0.45345956
81. frequency_BodyBodyGyroJerkMag_meanFreq - numeric - units are radians/second -- ex: -0.45345956




