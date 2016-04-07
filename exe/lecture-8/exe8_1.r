#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   EXE 8.1  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#

#########################################################
##################### conduct MCAR test  #################
#########################################################
# you can find the entire function on github:
# https://github.com/cran/BaylorEdPsych/blob/master/R/LittleMCAR.R
# First install the package:

# a) install accompagning package "mvnmle"


# b) Then load the package into your environment so you can use the commands:


# c) select a set of interval variables (likert scales included)
# note that Little MCAR assumes multivariate normal distribution




# d) conduct test
# TIP: write results away immediately because test takes a long time to run




# e) get the chisquare value that tests the missingness
# TIP: the results of LittleMCAR are written away in a list
# to fetch different values from this list, use $ or []
# for possible values in the list look at the ?LittleMCAR function






#########################################################
##################### conduct MAR test  #################
#########################################################
# 1. create a function to test for missingness on one variable
# using a t-test at another set of (interval) variables
# for instance education 

# a) create missingness variable that is a dummy variable



# b) run the t-test on this dummy variable and 
# an interval variable such as income, edu or satis
# use function you created before or the t.test function
# group is the missingness variable


