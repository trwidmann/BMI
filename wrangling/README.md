# Wrangling

## bmi_import.R

Scripts for importing the NHANES data files. The CDC provides documentation 
for importing the mortality files specifically, including trimming the data.

## bmi_clean.R

Scripts for cleaning the NHANES files. Includes joins to combine data sets 
into one. Also includes scripts for creating new variables (most importantly, 
ASMI). Provides final form of data set.

### Note

The DXA data has multiple rows for each participant, so one row is 
selected for each.
