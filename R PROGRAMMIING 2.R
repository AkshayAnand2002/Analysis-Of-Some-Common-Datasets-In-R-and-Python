# DATAFRAMES
emp_name<-c("rick","ryan","gary")
emp_salary<-c(5000,6500,9500)
emp_years<-c(5,6,10)
emp_info<-data.frame(emp_name,emp_salary,emp_years)
emp_info
head(emp_info)
tail(emp_info)
str(emp_info)####structure of dataframe.
#### we saw emp_name character or string as factor with 3 levels gary,rick,ryan
emp_info<-data.frame(emp_name,emp_salary,emp_years,stringAsFactors=FALSE)
str(emp_info)
iris_df<-iris
head(iris_df)
tail(iris_df)
str(iris_df)
summary(iris_df)###some statistics for each column

emp_name<-c("rick","ryan","gary")
emp_salary<-c(5000,6500,9500)
emp_years<-c(5,6,10)
emp_info<-data.frame(emp_name,emp_salary,emp_years)
emp_info
emp_info[1,1]
emp_info[1,"emp_name"]
emp_info[1,]###1st entire row.
emp_info[2,]
emp_info[,2]###2nd entire column
emp_info$emp_name 
emp_info$emp_salary
emp_info$emp_years
emp_info[2:3,1:2]###fetching 2nd,3rd row and 1st,2nd column
emp_info[2:3,"emp_name"]

emp_name<-c("rick","ryan","gary")
emp_salary<-c(5000,6500,9500)
emp_years<-c(5,6,10)
emp_info<-data.frame(emp_name,emp_salary,emp_years)
emp_info
emp_name<-c("martin","jacob","linda")
emp_salary<-c(5000,6500,9500)
emp_years<-c(5,6,10)
emp_info<-data.frame(emp_name,emp_salary,emp_years)
emp_info
emp_depart<-c("IT","HR","Operations")
emp_info$department<-emp_depart 
emp_info
emp_info1<-data.frame(emp_name,emp_salary,emp_years,emp_depart)
emp_new<-rbind(emp_info,emp_info1)
#####Error in match.names(clabs, names(xi)) : 
###names do not match previous names
####to rectify the error.
names(emp_info1)[4]<-"department"###to rename emp_depart to department.
emp_new_df<-rbind(emp_info,emp_info1)####to add new row columns.
emp_info1###when making use of rbind column name should be same.
emp_new_df####both previous tables into 1 table.
emp_age<-c(24,45,31,29,25,55)
emp_new_df<-cbind(emp_new_df,emp_age)####to add new age column.
emp_new_df###when making use of cbind no. of rows in both the objects should be same.
nrow(emp_new_df)##no.of rows
ncol(emp_new_df)##no.of columns
summary(emp_new_df)###summary of data

###xyz<-read.csv("----")
###ncol()
###nrow()
###is.data.frame()
###str()
###if some values are factors as seen by str() function then to 
###not keep it as factor we can use---> stringAsFactors =FALSE.
###summary()
###max()
###max_age<-max(xyz$age)##just statement eg.
###details_maxage<-subset(xyz,age==max(age))
### to export the data of a dataframe into csv file
###write.csv(--datatframe name---,"filename.csv")
### filename(whatever we want to give) will be saved into directory.

###text file import
data<-read.table("--location of file(filename.txt)--")
###by above the header will not come as in text file so we use--
data<-read.table("--location of file(filename.txt)--",header=TRUE)
###by above we get header as in text file.

#list (file not available)
###loan_demo1<-read.table("C:/RFILES/loan_demography1.txt",header=TRUE)
###income<-c(5000,6000,7000,8000,9000,1000,500,8600)
###id_matrix<-matrix(1:16,nrow=2)
###list_loan<-list(loan_Demo1,income,id_matrix)
###output consists of 1st part which is list_demo1,2nd--income,3rd--matrix.
###list_loan<-list(LOAN=loan_Demo1,SALARY=income,ID=id_matrix)
###list_loan$LOAN ### to see individual data structure i.e. LOAN.
###OR list_loan[[1]]###for LOAN.
###OR list_loan[["LOAN"]
##list_loan[4]###to add new element in list_loan
###to remove new added 4th element--we use below.
###we use list_loan[4]<-NULL
###to overwrite the value.
###list_loan[2]<-1000
###so 2nd value changes to 1000.

####merging 2 lists.
list1<-list(1,2,3)
list2<-list("jan","feb","march")
list_final<-c(list1,list2)
list_final
# got to merged lists.

list_v<-unlist(list1)
list_v1<-unlist(list2)
list_v
list_v1

##relational operators on vectors.
7>c(1,8,5,0,-10)##comparing 7 with all elements of vector
c(11,2,3,4,5)>c(1,3,5,2,4)##comparing each element of 1 vector to that of other.
c(1,2,4,5,7)>c(2,3,4,5)###7 will be compared against 2.

##logical operators
6>5 & 7>4
6>5 & 1>4
6>5 | 7>4
6>5 | 1>4
##not operator
7 !=6
7!=7
c(8,5,7,1,0) != c(2,9,6,8,0)

student1 <- c(99, 85, 39, 48, 90, 45)

student2 <- c(98, 87, 39, 50, 91 ,47)
student1_greater<- student2>student1
student1_greater
##if true is more than 50% it means that student 2 marks are higher.

marks<-c(50,50,50,50,45)
total_marks<-sum(marks)
if(total_marks==500)
{
  print("you are genius.")
}else if(total_marks<250)
{
  print("SORRY,you need to study hard.")
}else
{
  print("you can do better.")
}
####sorry you need to study hard.

student1 <- c(99, 85, 39, 48, 90, 45)
if(mean(student1) >= 75)
  
{  print("Congratulations, you got the highest marks")
  
}
else if(mean(student1) >= 60)
  
{  print("You are quite close to become the best. Keep working hard.")
  
}
## in above example:--Syntax error. else if ( ) should always be mentioned in 
##the same line, where if( ) block gets over, after the closing curly bracket.

bank<-read.csv("C:/RFILES/bank.csv",stringsAsFactors = TRUE)
bank
head(bank)
str(bank)
###by using str() WE SEE THAT STRINGS OR CHARACTERS ARE FACTORS.
###IF WE NEED TO CONVERT IT INTO CHARACTER WE USE stringsAsFactors = FALSE.

bank<-read.csv("C:/RFILES/bank.csv",stringsAsFactors = FALSE)
bank
head(bank)
str(bank)
### WE SEE THAT ALL FACTORS HAVE BEEN CONVERTED INTO CHARACTERS CHR.
### IF WE USE AS FACTORS WE CAN'T CHANGE THE VALUES OR REPLACE THEM.
bank$marital<-factor(bank$marital)
str(bank$marital)
###subsetting the dataframe.
subset1<-data.frame(bank$age,bank$marital,bank$salary,bank$y)
bank[2,]
bank[,2]
###credit card issuance logic
bankcust<-bank[5,]
bankcust
if(bankcust$marital =="married")
{
  if(bankcust$housing =="yes" | bankcust$salary > 60000)
  {
    print("ISSUE CREDIT CARD.")
  }
  else
  {
    print("SORRY,NOT ELIGIBLE FOR CREDIT CARD.")
  }
} else if(bankcust$marital =="single")
{
  if(bankcust$education =="tertiary" | bankcust$salary >40000)
  {
     print("ISSUE CREDIT CARD.")
  }
  else
  {
    print("SORRY NOT ELIGIBLE FOR CREDIT CARD.")
  }
}

###LOOPS
for(i in 1:10)
{
  print("HELLO I AM R-STUDIO.")
}
nrow(bank)

for(i in 1:nrow(bank))
{
  bankcust<-bank[i,]###for all values in data
  bankcust
  if(bankcust$marital =="married")
  {
    if(bankcust$housing =="yes" | (! is.na(bankcust$salary) & bankcust$salary)> 60000)
    {###SOME NA VALUES PRESENT PREVENT EXECUTION OF PROGRAM SO TO REMOVE THEN WE USE--
      ##(! is.na(bankcust$salary) & bankcust$salary) 
      bank[i,"credit card y/n"]<-"YES"
      ##print("ISSUE CREDIT CARD.")###FOR ALL COLUMN WE NEED TO PRINT ELIGIBLE OR NOT 
    }
    else
    {
      bank[i,"credit card y/n"]<-"NO"
      ##print("SORRY,NOT ELIGIBLE FOR CREDIT CARD.")
    }
  } else if(bankcust$marital =="single")
  {
    if(bankcust$education =="tertiary" | (! is.na(bankcust$salary) & bankcust$salary)>40000)
    {
      bank[i,"credit card y/n"]<-"YES"
      ##print("ISSUE CREDIT CARD.")
    }
    else
    {
      bank[i,"credit card y/n"]<-"NO"
      ##print("SORRY NOT ELIGIBLE FOR CREDIT CARD.")
    }
  }
}