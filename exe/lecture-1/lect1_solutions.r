
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  EXE 1.1 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#

#################################################
################# read datafile  #################
#################################################
# set directory
setwd("D:/Rcourses_2016/WVS") # note / instead of \ in windows 
getwd() # print the current working directory


# read dataset as table & create dataframe
# first save spss dataset to csv (already done for you)

# look up function read.table in help (right lower pane) or use ?read.table
?read.table

# read the csv file (remember separated by ;)
# give a name to the file by <-
dataSet <- read.table("WVS2005.csv", sep=";",header=T) 



#################################################
################# explore data  #################
#################################################

# how does the first line of the file look like?
dataSet[1,]

# select first column
dataSet[,1]

# how many variables are there 
ncol(dataSet)

# how many observations (use nrow)
nrow(dataSet)

# how are the variables labeled? (use colnames)
colnames(dataSet)


# give the variables new names using this vector:
newNames <-c("country","satis","trust","cosmo1","cosmo2","cosmo3","cosmo4",
             "work1","work2","work3","work4","work5","work6",
             "envcom1","envcom2","envcom3","envwrld1","envwrld2","envwrld3",
             "wtp1","wtp2","wtp3","emanc1","emanc2","emanc3","emanc4",
             "insight1","insight2","insight3","insight4",
             "PC","gender","age","ageR", "marital","child","edu","eduR",
             "employ","chief","socclass","income","weight")
colnames(dataSet)<- newNames




#################################################
################# manipulate data  ##############
#################################################

# select elements from file
# how many males are there in the dataset (males are numbered 2 in gender)?
nrow(dataSet[dataSet$gender==2,]) # number of males
length(dataSet$gender[dataSet$gender==2]) # using vectors instead of entire dataset
table(dataSet$gender)

# in percentages?
Nmen<-nrow(dataSet[dataSet$gender==2,])
N<-nrow(dataSet)
(Nmen/N)*100



# calculate the variance of one variable using algebra
# TIP: exclude the missing values!
table(dataSet$cosmo1)
meanCosmo1 <- mean(dataSet$cosmo1[dataSet$cosmo1>0])
varCosmo1 <- sum((dataSet$cosmo1[dataSet$cosmo1>0]-meanCosmo1)^2/(length(dataSet$cosmo1[dataSet$cosmo1>0])-1))

# or in steps:
numerator <- (dataSet$cosmo1[dataSet$cosmo1>0]-meanCosmo1)^2
denominator <-length(dataSet$cosmo1[dataSet$cosmo1>0])-1
sum(numerator/denominator)


# do the same by setting all missing values to NA
dataSet$cosmo1[dataSet$cosmo1<0]<- NA # overwrite missinng values to NA
mean(dataSet$cosmo1[!is.na(dataSet$cosmo1)])
sum((dataSet$cosmo1[!is.na(dataSet$cosmo1)]-meanCosmo1)^2/(length(dataSet$cosmo1[!is.na(dataSet$cosmo1)])-1))

# check whether is same as var function
var(dataSet$cosmo1[dataSet$cosmo1>0])



# calculate a z-score using the variance calculated above 
# you can find the formula on the formula sheet (see bb)
zcosmo1 <- (dataSet$cosmo1[dataSet$cosmo1>0]-meanCosmo1)/sqrt(varCosmo1)

# check that mean is zero, and sd is one
summary(zcosmo1)
sd(zcosmo1)


#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   EXE 1.2 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#

#################################################
################# frequencies  #################
#################################################

# table can be used to now how many observations 
# exist of each level of a variable
# look up function table.

?table

# how many people have a low education level?
# use recoded variable eduR
table(dataSet$eduR[dataSet$eduR>0])



#################################################
################# descriptives  #################
#################################################
# what is the average answer to cosmo1 ('I see myself as a world citizen') in the dataset?

mean(dataSet$cosmo1[dataSet$cosmo1>0])

# compare the mean answer between the following countries
# Argentina (country 32)

mean(dataSet$cosmo1[dataSet$cosmo1>0 & dataSet$country==32])


# and the USA (country 840)

mean(dataSet$cosmo1[dataSet$cosmo1>0 & dataSet$country==840])


#################################################
################### recode missing values #######
#################################################

# TIP1: missing values are commonly labeled NA in R
# NA is not available
# this value is not taken into account in analyses

# one variable
# check first values with table
table(dataSet$cosmo1)
dataSet$cosmo1[dataSet$cosmo1<0] <- NA
mean(dataSet$cosmo1,na.rm=TRUE)
# entire dataset
# convert weight to numeric value 
# using functions 'sub' and 'as.numeric'
# (the comma is not interpreted as such by R)
dataSet[dataSet<0]<-NA
dataSet$weight <- as.numeric(sub(",",".",dataSet$weight))
dataSet[dataSet<0]<- NA

## OPTIONAL
# execute t-test using function
# look up ttest
# use na.rm = TRUE to exclude missing values
?t.test

x <- dataSet$cosmo1[dataSet$country==32]
y <- dataSet$cosmo1[dataSet$country==840]

t.test(x,y)

# check
xc <- x[!is.na(x)]
yc <- y[!is.na(y)]
2*pnorm((-abs(mean(yc)-mean(xc))/sqrt(var(yc)/length(yc)+var(xc)/length(xc))))

#################################################
################### factors  ####################
#################################################
# NOTE factor appears to be the same as integer
# but is treated as nominal in analyses

# change gender to factor 
## TIP1: set missing values to NA (see above)
## TIP2: first do this outside the dataframe by creating new variable gender
## and when correct, do this within dataframe by overwriting dataSet$gender
# add labels (1= male, 2= female)
table(dataSet$gender)
dataSet$gender <-factor(dataSet$gender,levels = c(1,2), 
                        labels=c("male","female")) # add labels
attributes(dataSet$gender)




# change ageR into an ordinal factor
# to treat the factor as ordinal
# look up function 'ordered'
?ordered
# age recoded values are labeled
# 15-24
# 25-34
# 35-44
# 45-54
# 55-64
# 65 and more years
table(dataSet$ageR)
dataSet$ageR[dataSet$ageR==98]<-6
dataSet$ageR <-ordered(dataSet$ageR,levels = c(1,2,3,4,5,6),
                       labels=c("15-24","25-34", "35-44", "45-54","55-64", "65+")) # add labels
attributes(dataSet$ageR)



#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  EXE 1.3 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#


#################################################
#################### plot ####################
#################################################
# create variable using rnorm function
# plot the variable using plot
X <- rnorm(100)
plot(X)

# create a binomial variable
Y <- rbinom(100,10,.2)
plot(Y)

# create & plot a chisquared distr variable
Z <- rchisq(n=100, df=2)
plot(Z)

# next to each other
# look for function 'par'

par(mfrow = c(1, 2))
plot(X); plot(Y)


#################################################
#################### barplot ####################
#################################################
# a barplot is especially useful for nominal or ordinal variables
# and shows the frequencies of the various categories

# make a barplot a single variable: employment status
counts <- table(dataSet$employ)
barplot(counts, main = "employment status", 
        xlab="number of people")

# to set back to simple graph 
par(mfrow = c(1,1))

# stacked barplot: gender vs employment status
# TIP1: first backtransform the gender variables
# into numeric variables (if you still work from the data 
# obtained in the previous exercise)
# 'as.numeric(as.character(dataSet$gender))'

# TIP2: change misisng values into NA (not available, see exe1_2.r)
#   then these values will not be taken into account


counts <- table(dataSet$gender, dataSet$employ)
barplot(counts, main = "employment status & gender", 
        xlab="employment status", col=c("blue","red"))




# OPTIONAL: add label names to x-axis, vertically, and legend
# labels of employment status:
# 1 Full time
# 2 Part time
# 3 Self employed
# 4 Retired
# 5 Housewife
# 6 Students
# 7 Unemployed
# 8 Other

counts <- table(dataSet$gender, dataSet$employ)
LabEmploy <- c("fulltime","partime","selfempl","retired","housewife",
               "student","unemployed","other")
barplot(counts, main = "employment status & gender", 
        col=c("blue","red"), legend = c("male", "female"),
        names.arg=LabEmploy,las=2)


#################################################
#################### histogram ####################
#################################################
# a histogram is useful to show the distribution of 
# a interval or continuous variable. This illustrates
# whether the variable has a normal or other distribution
# NOTE. this is not a test of normality!

# create a histogram of income
# use function hist
?hist
hist(dataSet$income)
hist(dataSet$age)



#### OPTIONAL
# test the normality
# use functions 'skewness/kurtosis'
# from package 'moments'

skewness(dataSet$income)
kurtosis(dataSet$income)

#################################################
#################### boxplot ####################
#################################################
# a boxplot is useful to visually detect outliers
# especially appropriate with interval or continuous variables
# which is split by groups

# TIP: to split by groups, a factor variable is useful
# create boxplot of a normally distributed variable 
# for three groups (hint: matrix)

# create normally distributed variable 
# each column represents a group
d0 <- matrix(rnorm(15), ncol=3)

# set limits of boxplot
lmts <- range(d0,d1)


# make boxplot
boxplot(d0,ylim=lmts)


#### OPTIONAL
# place two boxplots next to each other
# create another normally distr variable for three groups
d1 <- matrix(rnorm(15), ncol=3)


# set par values
par(mfrow = c(1, 2))
boxplot(d0,ylim=lmts)
boxplot(d1,ylim=lmts)
