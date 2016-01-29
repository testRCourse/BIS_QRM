#########################################################
##################### conduct ML imputation  #################
#########################################################
# impute values using maximum likelihood
# using package 'mvnlme'


# select part of dataset 
# include satisfaction
# you are free to select another set of variables
# they should be interval
# maximum = 4



# explore correlations/covariances 
# use function 'cor'




# use function 'mlest' to estimate missing values
# write results to object
# extract only covariance matrix




#########################################################
##################### conduct MI imputation  #############
#########################################################
# impute values using multiple imputation
# using package 'amelia'


# select a set of variables (interval!)
# set the boundaries of the varibales (positive, infinity)


# takes some time
# save the results right away in a new object



#########################################################
############## inspect effect of MI imputation  ######
#########################################################
# estimate a simple linear model 'lm'
# with the variables included in the imputed dtaa above

# TIP: estimate the model on each imputed dataset
# use 'mi.meld' to combine the coefficients 



# estimate the model on the dataset with missing data
