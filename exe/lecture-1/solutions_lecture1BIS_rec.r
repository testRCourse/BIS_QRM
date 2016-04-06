
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  EXE 1.1 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#

#################################################################
######################### read datafile  #########################
#################################################################
######## work from the file and save it where you can find it
######## if you see a plus in the console (the lower right window)
######## press ESC to be able to run commands again
######## when you want to save everything you have done, you can save this
######## as your workspace (see interface menu: sessions/save workspace)
######## try to work from one directory (= folder) so it is easy to find your stuff

# set directory
setwd("U:/Rcourses_2016/Datasets") # note / instead of \ in windows 
getwd() # print the current working directory

### read dataset as table & create dataframe
# first save spss dataset to csv or open the csv file (download from github)

# look up function read.table in help (right lower pane) or use ?read.table
?read.table

# read the csv file (remember separated by ;)
# give a name to the file by <-
dataSet <- read.table("WVS2005.csv", sep=";",header=T) 



###################################################################
########################## explore data  ##########################
###################################################################
##### below you learn different ways to select elements 
##### from a datafile. You need to view this datafile as a matrix
##### where the rows represent the individuals and the 
##### columns the variables

# use the square brackets 
# the first space represents the rows
# the second space the columns (see lecture slides)

# 1. how does the first line of the file look like?
dataSet[1,]

# 2. select first column
dataSet[,1]

# 3. how many variables are there? (use function ncol)
# before you use the function, look it up using ?ncol
ncol(dataSet)

# 4. how many observations (use the function nrow)
nrow(dataSet)

# 5. how are the variables labeled? (use the function colnames)
colnames(dataSet)


# 6. give the variables new names 
# first create a vector with the new names
newNames <-c("country","satis","trust","cosmo1","cosmo2","cosmo3","cosmo4",
             "work1","work2","work3","work4","work5","work6",
             "envcom1","envcom2","envcom3","envwrld1","envwrld2","envwrld3",
             "wtp1","wtp2","wtp3","emanc1","emanc2","emanc3","emanc4",
             "insight1","insight2","insight3","insight4",
             "PC","gender","age","ageR", "marital","child","edu","eduR",
             "employ","chief","socclass","income","weight")

# then replace the column names by this new vector of names
colnames(dataSet)<- newNames


# if you look in the right upper window in your Rstudio, you can see your environment.
# here are all the objects you create within R. the dataset you just created should be
# here under 'Data'. Explore the variables by selecting this dataset (press blue round)
# and scroll down to the last line
# here you see (depending on the excel version you use) that the last variable
# weight is stored as a factor. This is caused by the comma where R expects points in numbers
# therefore we are going to substitute the comma with dot (function sub)
# and save this new variable as numbers (as.numeric) in the original datafile
dataSet$weight <- as.numeric(sub(",",".",dataSet$weight))


####################################################################################
################################### manipulate data  ###############################
####################################################################################
##### below you learn different ways to manipulate elements 
##### from a datafile. using the squared brackets you can select
##### elements, rows and columns (as we have seen above) 
##### These subsets can be used in other commands to 
##### count the number of rows in matrix or the length of a vector


# 1. how many males are there in the dataset (males are numbered 2 in gender)?
# there are three different ways to do this:
# a) select the part of the matrix (=dataSet) 
#    where the gender variable is 2 (i.e. only the males) 
#    and count the number of rows
nrow(dataSet[dataSet$gender==2,]) # number of males

# b) select the part of the vector gender(=dataSet$gender) that is 2 (i.e. only the males) 
#    and count the length of this vector 
length(dataSet$gender[dataSet$gender==2]) 

# c) use the table command (see lecture slides) 
#    and count the frequencies of the values in this vector 
table(dataSet$gender)




# 2. count the percentage of males in your dataset
# the easiest way to do this, is to follow three steps
# a) get the number of males
Nmen<-nrow(dataSet[dataSet$gender==2,])

# b) get the total number of individuals in your dataset
N<-nrow(dataSet)

# c) calculate the percentage using the numbers you got under a) and b)
(Nmen/N)*100



# 3. calculate the variance of one variable using algebra
# look at the lecture slides for the formula (or check it online)
# in the formula you see that both the mean, the variable and the standard deviation are used
# so first get these elements.
# TIP: exclude the missing values!

# a) look at the variable to see how it looks like
# if you have missing values assigned to NA, you need to use ?is.na (see below)
table(dataSet$cosmo1)

# b) calculate the mean for all the nonmissing values (use function mean)
meanCosmo1 <- mean(dataSet$cosmo1[dataSet$cosmo1>0])

# c) calculate the variance (use either function var or sum & length)
varCosmo1 <- sum((dataSet$cosmo1[dataSet$cosmo1>0]-meanCosmo1)^2/(length(dataSet$cosmo1[dataSet$cosmo1>0])-1))

# c1) you can also do it in steps:
numerator <- (dataSet$cosmo1[dataSet$cosmo1>0]-meanCosmo1)^2
denominator <-length(dataSet$cosmo1[dataSet$cosmo1>0])-1
sum(numerator/denominator)

# d) check by var function
var(dataSet$cosmo1[dataSet$cosmo1>0])




# The NA are now read by R as missing, and therefore, you
# need to specify in your commands that you do not want to include them
# you can do this by function is.na (see lecture 2 slides)
mean(dataSet$cosmo1[!is.na(dataSet$cosmo1)])
sum((dataSet$cosmo1[!is.na(dataSet$cosmo1)]-meanCosmo1)^2/(length(dataSet$cosmo1[!is.na(dataSet$cosmo1)])-1))

#_________________________________________  OPTIONAL _______________________________________________________________#

# calculate a z-score using the variance calculated above 
# you can find the formula on the formula sheet (see bb)
zcosmo1 <- (dataSet$cosmo1[dataSet$cosmo1>0]-meanCosmo1)/sqrt(varCosmo1)

# check that mean is zero, and sd is one
summary(zcosmo1)
sd(zcosmo1)

#_________________________________________  END OPTIONAL _______________________________________________________________#


#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   EXE 1.2 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#

#####################################################################
########################### frequencies  ###########################
#####################################################################
##### the function table can be used to know how many observations 
##### exist of each level of a variable
##### look up function table.
?table

# 1. how many people have a low education level?
# first look up the variable edu and eduR using table
# and get a crosstable using table for the two variables: (table(x,y)
# then look at the number under either 1 (eduR) 
# or take the sum of the values under 1,2,3 (edu)
table(dataSet$eduR)
table(dataSet$edu)
table(dataSet$eduR, dataSet$edu)




#####################################################################
########################### descriptives  ###########################
#####################################################################
##### for descriptives (mean, min, max) you can use the function
##### summary. Another way to calculate the mean is to use the 
##### function mean. Look up the functions before you start
?summary
?mean

# 2. what is the average answer to cosmo1 ('I see myself as a world citizen') in the dataset?
# note that the 1 signifies a 'strongly agree' and a 4 means 'strongly disagree'.
# compare the values when misisng values are included and excluded
# exclude the missing values by selecting only the positive numbers
mean(dataSet$cosmo1)
mean(dataSet$cosmo1[dataSet$cosmo1>0])

# 3. compare the mean answer between the following countries
# Argentina (country 32) and the USA (country 840)
# for this assignment you need to combine the square brackets as is
# done in exercise 1_1 to select the males (now countries)
# and use the '&' signal to select also the postive values on cosmo1
mean(dataSet$cosmo1[dataSet$cosmo1>0 & dataSet$country==32])
mean(dataSet$cosmo1[dataSet$cosmo1>0 & dataSet$country==840])


#####################################################################
############################# recode missing values #################
#####################################################################
###### MISSING VALUES
###### missing values are commonly labeled NA in R
###### NA means 'not available'
###### this value is not taken into account in analyses
###### there are several commands to work with these missings:
###### is.na, na.rm, na.omit (more on this in lecture 2)


# 1. set the negative values on cosmo1 to missing
# you first select the part of the dataset$cosmo1 that 
# has negative numbers (those are missing in WVS)
# and then assign the NA to these values
# count the missing values using is.na and table at the same time
dataSet$cosmo1[dataSet$cosmo1<0]<- NA 
table(is.na(dataSet$cosmo1))

# check first values with table (the negative values should not appear,
# those are now set to NA)
table(dataSet$cosmo1)
# calculate the mean and check with the mean calculated above
# use na.rm=TRUE as an extra argument to the function mean
mean(dataSet$cosmo1,na.rm=TRUE)



# 2. replace the negative values in the entire dataset to missing
# use the squared brackets and the < sign
dataSet[dataSet<0]<-NA

#_________________________________________  OPTIONAL _______________________________________________________________#

# use na.rm = TRUE to exclude missing values
?t.test

# select one variable and two countries (for instance 32 and 840)
# save this varibale for two countries separately in 'x' and 'y'
# select only the not missing values using !is.na in the subsetting command []
# conduct the t-test on these x and y vectors using algebra 
# look up the formula online or in lecture slides
# conduct significance test using 2*pnorm (twosided t-test)
x <- dataSet$cosmo1[dataSet$country==32]
y <- dataSet$cosmo1[dataSet$country==840]

xc <- x[!is.na(x)]
yc <- y[!is.na(y)]
tvalue <-(-abs(mean(yc)-mean(xc))/sqrt(var(yc)/length(yc)+var(xc)/length(xc)))
2*pnorm(tvalue)

# check with function t.test
# look up t.test
t.test(y,x)
#_________________________________________  END OPTIONAL _______________________________________________________________#

#####################################################################
############################# factors  ##############################
#####################################################################
###### factors are another way to represent data in R
###### the advantage of factors is that they are treated nominal (or
###### ordinal in analyses). another advantage is that you can add labels
###### to the values which will be shown in analyses or frequencies tables
###### In this part of the exercise we will change a nominal and ordinal variable
###### to nominal and respectively ordinal factors

# 1. change gender to factor 
# TIP: first do this outside the dataframe by creating new variable gender
# and when correct, do this within dataframe by overwriting dataSet$gender
# by this new variable that you created

# a) start with exploring gender in a table
table(dataSet$gender)

# b) add labels to the two levels (1= female, 2= male)
gender <-factor(dataSet$gender,levels = c(1,2), 
                labels=c("female","male")) # add labels
# c) use the function attributes to explore the new variable that you've created
attributes(gender)

# d) add to the datafile (i.e. overwrite the original variable)
dataSet$gender <- gender


# 2. change ageR into an ordinal factor
# to treat the factor as ordinal
# look up function 'ordered' (it is under factor)
?ordered
# ageR values are labeled as:
# 1 :  15-24
# 2 :  25-34
# 3 :  35-44
# 4 :  45-54
# 5 :  55-64
# 6 :  65 and more years
# check the variable and recode values that are outside these numbers
table(dataSet$ageR)
dataSet$ageR[dataSet$ageR==98]<-6
dataSet$ageR <-ordered(dataSet$ageR,levels = c(1,2,3,4,5,6),
                       labels=c("15-24","25-34", "35-44", "45-54","55-64", "65+")) # add labels
attributes(dataSet$ageR)



#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  EXE 1.3 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#

#####################################################################
############################## plot ########################################
#####################################################################
###### R is exceptionally useful for plots. It has many possibilities to
###### create all sorts of plots, whereby you can identify all kinds of
###### parameters such as the axis labels, the font of the labels, the colors
###### of the dots in your graph. For now, we focus on the plots that can be
###### made within the base program of R (i.e. we do not need to install a package)

# 1. create variable using rnorm, rbinom and rchisq function and plot them
# first you need to create variables, which is very easy in R. For a normal 
# variable you use rnorm. You can adjust the number of values generated, 
# the mean and the standard deviation. For rbinom you have to give the number
# of failures and the chance to pass. For chisquare you have to set the degrees of freedom.
# a) generate the rnorm variable and use the function plot to make a graph
X <- rnorm(100)
plot(X)

# b) create a binomial variable and use plot
Y <- rbinom(100,10,.2)
plot(Y)

# c) create & plot a chisquared distr variable and use plot
Z <- rchisq(n=100, df=2)
plot(Z)

# d) To place the graphs you just created next to each other, you need to set
# the parameters of the graphs by the function par. the argument mfrow shows 
# how many graphs need to be shown next or under each other.
# look for function 'par'
par(mfrow = c(1, 2))
plot(X); plot(Y)

par(mfrow = c(1, 3))
plot(X); plot(Y);plot(Z)

# to set back to simple graph 
par(mfrow = c(1,1))

#####################################################################
############################## barplot ##############################
#####################################################################
###### a barplot is especially useful for nominal or ordinal variables
###### and shows the frequencies of the various categories
###### the input of barplots are the frequencies. To obtain the 
###### frequencies use the table function.

# 2. make a barplot a single variable: employment status
# first save your table of employment status to another file
# create the barplot of this file
counts <- table(dataSet$employ)
barplot(counts, main = "employment status", xlab="number of people")

# 3. create a stacked barplot. This shows for each gender, the employment status separately
# TIP1: first backtransform the gender variables into numeric variables 
# (if you still work from the data obtained in the previous exercise)
# as.numeric(dataSet$gender)
# and save this to the old variable (i.e. overwrite) or create a new variable
# TIP2: change missing values into NA (not available, see exe1_2.r)
# then these values will not be taken into account
counts <- table(dataSet$gender, dataSet$employ)
barplot(counts, main = "employment status & gender", 
        xlab="employment status", col=c("blue","red"))


#_________________________________________  OPTIONAL _______________________________________________________________#

# add label names to x-axis, vertically, and legend
# labels of employment status:
# 1 : Full time
# 2 : Part time
# 3 : Self employed
# 4 : Retired
# 5 : Housewife
# 6 : Students
# 7 : Unemployed
# 8 : Other

counts <- table(dataSet$gender, dataSet$employ)
LabEmploy <- c("fulltime","partime","selfempl","retired","housewife",
               "student","unemployed","other")
barplot(counts, main = "employment status & gender", 
        col=c("blue","red"), legend = c("male", "female"),
        names.arg=LabEmploy,las=2)

#_________________________________________ END OPTIONAL _______________________________________________________________#

############################################################################
############################## histogram #####################################
############################################################################
# a histogram is useful to show the distribution of 
# a interval or continuous variable. This illustrates
# whether the variable has a normal or other distribution
# NOTE. this is not a test of normality!

# 4. create a two histograms, one of income and one of age
# use function hist
?hist
hist(dataSet$income)
hist(dataSet$age)



#_________________________________________  OPTIONAL _______________________________________________________________#
# to test the normality
# use functions 'skewness/kurtosis'
# from package 'moments'
# to install the package, go to the lower right window in Rstudio and press 'packages',
# then press ' install'. This should open a window in which you can type the package you need
skewness(dataSet$income)
kurtosis(dataSet$income)

#_________________________________________  END OPTIONAL _______________________________________________________________#

#####################################################################
############################## boxplot ##############################
#####################################################################
# a boxplot is useful to visually detect outliers which is
# especially appropriate with interval or continuous variables
# which is split by groups

# 5. create a boxplot of a normally distributed variable 
# for three groups (hint: create a matrix of three columns)

# a) first create normally distributed variable 
x<- rnorm(15)
# b) create a matrix, where the values are the distributed variable you just created
# c) divide the values over three columns in the matrix where each column represents a group
x0 <- matrix(x, ncol=3)

# set limits of boxplot
lmts <- range(x0)


# make boxplot
boxplot(x0,ylim=lmts)


#_________________________________________  OPTIONAL _______________________________________________________________#
# place two boxplots next to each other
# create another normally distr variable for three groups
x1 <- matrix(rnorm(15), ncol=3)


# set par values
par(mfrow = c(1, 2))
boxplot(x0,ylim=lmts)
boxplot(x1,ylim=lmts)
