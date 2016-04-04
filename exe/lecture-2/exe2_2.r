#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   EXE 2.2  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#

#########################################################
##################### conduct MCAR test  #################
#########################################################
# you can find the entire function on github:
# https://github.com/cran/BaylorEdPsych/blob/master/R/LittleMCAR.R
# First install the package:

# install accompagning package "mvnmle"


# Then load the package into your environment so you can use the commands:


# select a set of interval variables (likert scales included)
# make sure that all the negative values are coded as NA
# note that Little MCAR assumes multivariate normal distribution


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
