#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   EXE 2.2  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#

#########################################################
##################### conduct MCAR test  #################
#########################################################
# you can find the entire function on github:
# https://github.com/cran/BaylorEdPsych/blob/master/R/LittleMCAR.R
# First install the package:

# install accompagning package "mvnmle"


# Then load the package into your environment so you can use the commands:


# look for information about function
# Note that Little MCAR assumes multivariate normal distribution
# i.e. this requires interval assumption



# select a set of interval variables (minimum of 3, maximum of 10)
# make sure that all the negative values are coded as NA
# and do not include variables that only have missing values!
# select only one country so the function does not take too long
# create a new matrix with these variables



# conduct test
# TIP: write results away immediately because test takes a long time to run




# explore results by either $
# or by []





#########################################################
##################### conduct MAR test  #################
#########################################################
# create a function to test for missingness on one variable
# using a t-test at another set of (interval) variables

# for instance education 
# 1. create missingness variable




# 2. t-test
# use function you created before.
# group is not the missingness variable
