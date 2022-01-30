# Wrangling

This folder contains the scripts for importing and cleaning the NHANES data. 
After performing the importation and wrangling scripts contained here, a final 
clean data set will be available to perform analysis and modelling on.

Two new variables are adding the existing data sets using information from 
other variables: BMI categories as an ordered factor (underweight, healthy, 
overweight, obese) and ASMI (appendicular skeletal muscle index) as a 
continuous variable.

The BMI categories are useful to explore the population characteristics within 
each category, particularly in comparison to other physical characteristics 
such as body fat and ASMI. The ASMI variable provides an indication of each 
participant's muscle tissue in relation to body weight.

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
