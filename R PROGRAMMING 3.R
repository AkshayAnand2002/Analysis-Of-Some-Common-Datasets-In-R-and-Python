bank<-read.csv("C:/RFILES/bank.csv",stringsAsFactors = FALSE)
bank
head(bank)
str(bank)
bank$marital<-factor(bank$marital)###converting strings as factors
str(bank$marital)
subset1<-data.frame(bank$age,bank$marital,bank$salary,bank$y)
bank[2,]
bank[,2]
bank[,2]<-factor(bank[,2])###converting strings as factors
bank[,2]
str(bank)
####converting characters into factors.
###converting 5th,6th,7th,8th,10th,11th column into factors.
factor_col<-c(5,6,7,8,10,11)
for(i in factor_col){
  bank[,i]<-factor(bank[,i])
}
str(bank)

####built-in function
str(bank)
mean(bank$age)
mean(bank$salary)####output will be NA as if anyone value is NA output will be NA.
##TO REMOVE NA VALUES WE USE na.rm =TRUE. TO REMOVE THEM.
mean(bank$salary,na.rm=TRUE)
sum(is.na(bank))###total no. of cells which are NA values.
sum(is.na(bank$salary))
which(is.na(bank$salary))###row ids or row numbers which are NA.
length(bank$salary)###length or no. of salary values in column
length(which(bank$ 'creditcard y/n' =='Yes'))
####to calculate no. of yes in creditcard y/n column we earlier added in bank.
length(which(bank$ 'creditcard y/n' =='Yes' & bank$marital =='single'))
#### no.of values satisfying both info 
str(bank$marital)
bank$marital
length(which(bank$'creditcard y/n' =='Yes' & bank$marital =='married'))

#creating functions
age_vector<-c(29,18,50,16,1,66)
f_license_yn <- function(age)
{###function
 if(age>18)
 {out_license_yn<-"Yes"
 }
 else
 {
   out_license_yn<-"No"
 }
  
  return (out_license_yn)
}
f_license_yn(age_vector[1])
f_license_yn(age_vector[4])

frac_num<-c(0.82,0.018,0.2,0.98)
p_convert_percentage<-function(f)
{
  out_percent<- f*100
  
  return (out_percent)
}
p_convert_percentage(frac_num[2])

credit_issue_yn <- function(bankcust)
{
  if(bankcust$marital == "married")
  {
    if(bankcust$housing =="yes" | (!is.na(bankcust$salary) & bankcust$salary)>60000)
    {
      issue_yn<-"yes"
    }
    else
    {
      issue_yn<-"no"
    }
  } else if (bankcust$marital =="single")
  {
    if(bankcust$education =="tertiary" & (!is.na(bankcust$salary) & bankcust$salary)>40000)
    {
      issue_yn<-"yes"
    }
    else
    {
      issue_yn<-"no"
    }
  }
  return(issue_yn)
}
for(i in 1:nrow(bank))
{
  bankcust<-bank[i,]
  bank[i,"creditcard_yn_fun"]<- credit_issue_yn(bankcust)
}

###APPLY FUNCTION sapply(),vapply(),lapply()
frac_num<-c(0.82,0.018,0.2,0.98)
p_convert_percentage<-function(f)
{
  out_percent<- f*100
  
  return (out_percent)
}
p_convert_percentage(frac_num[2])
for(i in 1:length(frac_num))
{
  print(p_convert_percentage(frac_num[i]))
}
sapply(frac_num,function(x) x*100)###sapply(list,function)
###got the output in 1 line.
for(i in 1:ncol(bank))
{
  bank[,i]<-factor(bank[,i])
}
str(bank)
bank2<-read.csv("C:/RFILES/bank.csv",stringsAsFactors = FALSE)
bank2f<-data.frame(sapply(bank2,factor))
str(bank2f)

#VISUALIZATION USING R.
#IRIS DATASET.
iris<-iris
str(iris)
plot(iris$Sepal.Length,iris$Sepal.Width)
points(iris$Petal.Length,iris$Petal.Width,col="red")
plot(iris$Sepal.Length,iris$Sepal.Width,col=iris$Species)
#histogram
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
#boxplot
boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Width)
summary(iris$Sepal.Width)
##ggplot
install.packages("ggplot2")
library(ggplot2)
search()
mtcars
mtcars<-mtcars
ggplot(mtcars,aes(x=mtcars$cyl,y=mtcars$mpg))+geom_point()
###there are no values of cyl corresponding to 5 and 7.
###we can use factor() function to show only values corresponding to which values exist.
ggplot(mtcars,aes(x=factor(mtcars$cyl),y=mtcars$mpg))+geom_point()
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg))+geom_point()
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg,col=factor(cyl)))+geom_point()
###used color as cylinder factor which has 3 values 4,6 and 8.
?geom_point
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg,col=factor(cyl)))+geom_point(shape=1,size=4)
###different shapes and sizes by using geom_point()
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg,size=hp))+geom_point()
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg,col=hp))+geom_point(shape=1,size=4)
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg,col=hp,size=disp))+geom_point()
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg))+geom_text(aes(label= cyl))
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg))+geom_text(aes(label= hp))
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg))+geom_text(aes(label= carb))
#plotting large datasets
str(diamonds)
df_diamond<-diamonds
ggplot(df_diamond,aes(x=df_diamond$carat,y=df_diamond$price))+geom_point()
ggplot(df_diamond,aes(x=df_diamond$carat,y=df_diamond$price))+geom_point()+geom_smooth()
ggplot(df_diamond,aes(x=df_diamond$carat,y=df_diamond$price))+geom_smooth()
ggplot(df_diamond,aes(x=df_diamond$carat,y=df_diamond$price,col=df_diamond$clarity))+geom_smooth()
ggplot(df_diamond,aes(x=df_diamond$carat,y=df_diamond$price,col=df_diamond$clarity))+ geom_point()
ggplot(df_diamond,aes(x=df_diamond$carat,y=df_diamond$price,col=df_diamond$clarity))+ geom_point(alpha=0.4)
###transparency introduced by alpha value.
###storing the plot as variable.
diamond_plot<-ggplot(df_diamond,aes(x=df_diamond$carat,y=df_diamond$price))
#we can use diamond plot at any portion. eg---
diamond_plot+geom_point()
diamond_plot+geom_smooth()
#barchart
mtcars_df<-mtcars
mtcar_cyl<-ggplot(mtcars_df,aes(x=factor(mtcars_df$cyl)))
mtcar_cyl+geom_bar()
mtcar_cyl<-mtcar_cyl+aes(fill=factor(mtcar_df$am))
mtcar_cyl+geom_bar()
mtcar_cyl+geom_bar(position="fill")
###all bargraphs become of same size.
###it gives the ratio of factors of mtcars_df$am.0=automatic
### 1=manual it can be seen by using ?mtcars as it is inbuilt dataset.
###(position="fill") gives an idea about proportions of different variables.

###jitters
ggplot(mtcars_df,aes(x=factor(mtcars_df$cyl),y=mtcars_df$wt))+geom_point(position="jitter")

###different way of writing code for jitter
jitter_pos<-position_jitter(width=0.05)
ggplot(mtcars_df,aes(x=factor(mtcars_df$cyl),y=mtcars_df$wt))+geom_jitter(position=jitter_pos)
###scatter plot
ggplot(mtcars_df,aes(x=factor(mtcars_df$cyl),y=mtcars_df$wt))+geom_point()

library(ggplot2)
mtcars_df<-mtcars
mtcar_cyl<-gglot(mtcars_df,aes(x=factor(mtcars_df$cyl)))
mtcar_cyl+geom_bar()
mtcar_cyl<-mtcar_cyl+aes(fill=factor(mtcars_df$am))
mtcar_cyl+geom_bar()
mtcar_cyl+geom_bar(position="fill")
####above code done earlier also but important.
mtcar_cyl+geom_bar(position="dodge")
###to convert stacked graph into 2 sideways bargraphs and not stacked.
###so,we clearly see differences between automatic and manual.

ggplot(mtcars_df,aes(x=mpg))+geom_histogram(binwidth=1)
ggplot(mtcars_df,aes(x=mpg,fill=factor(cyl)))+geom_histogram(binwidth=1)
###fills graph by different colors
ggplot(mtcars_df,aes(x=mpg,col=factor(cyl)))+geom_histogram(binwidth=1)
####frequency polygon--to understand trend of data.
ggplot(mtcars_df,aes(x=mpg,col=factor(cyl)))+geom_freqpoly(binwidth=1)
ggplot(mtcars_df,aes(x=mpg))+geom_freqpoly(binwidth=1)

####timeseries plot
##using economic dataset
?economics
economics_df<-economics
ggplot(economics_df,aes(x=economics_df$date,y=economics_df$unemploy))+geom_line()
ggplot(economics_df,aes(x=economics_df$date,y=economics_df$unemploy/economics_df$pop,
                        col=economics_df$psavert))+geom_line()
ggplot(economics_df,aes(x=economics_df$date,y=economics_df$unemploy/economics_df$pop,
                        col=economics_df$psavert))+geom_line()+geom_point()
economics_2010<-economics_df[economics_df$date > as.Date("2010-01-01"),]
View(economics_2010)
#####subsetting the data for more than 2010.
ggplot(economics_2010,aes(x=economics_2010$date, y=economics_2010$unemploy
                        ))+geom_line()
ggplot(economics_2010,aes(x=economics_2010$date, y=economics_2010$unemploy
))+geom_step()
