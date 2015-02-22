Script for making tidy version of the UCI HAR dataset
-----------------------------------------------------

The script is extensively commented, so pretty everything
should be clear from its code. Nevertheless, the main steps:

* (lines  1 -  9) loads required libraries
* (lines 15 - 21) loads and determines features interesting to us
* (lines 23 - 25) loads description of activities
* (lines 27 - 50) function for loading required data for the specified case (train on test)
* (lines 52 - 56) loads raw data and prepares it
* (lines 58 - 67) makes tidy dataset using 'by' and saves it to 'result.txt'
