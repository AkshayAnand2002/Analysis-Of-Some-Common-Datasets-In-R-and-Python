1+1 ## control+enter or use run button
###arithmetic operations
5+3
5-2
5*2
5/2
(2+7)/(2+7)
7%%2 ##RETURNS REMAINDER ON DIVISION OF 7 BY 2 WHICH IS 1.
2^6 ##EXPONENT

####RELATIONAL OPERATORS.
5>4###RETURNS TRUE OR FALSE
4>5
5==5
5<=5

##BUIT-IN FUNCTIONS.
sqrt(2)
sin(10)
cos(10)
help("cos")### gets info about data on bottom-right part of screen.
help("sqrt")
?cos ### other way of using help function.
?log

log10(10)

#function within a function
log(sqrt(2))

#assignment of variables.
x <-1
y <-2
x+y
x-y
dummyvar001 <-5
001dummyvar <-5###variables should start with letters not numbers.##wrong variable name.

X <- 5
x <-6
x+X #### R-LANGUAGE IS CASE-SENSITIVE. X and x are different.

"rstudio"=="Rstudio"  ### false as R is case-sensitive.

x <-20
y <- "TRUE"
z <- 20.20
w= TRUE
typeof(x)###double
typeof(y)###character
typeof(z)###double
typeof(w)###logical

x<-"apple"
y<-"my"
x+y ### we cannot perform arithmetic operation on strings.

###booleans
#TRUE =1
#FALSE=0
TRUE==FALSE
TRUE>FALSE
x<-TRUE
y<-FALSE
x+y###gives 1

x<-"apples"
y<-5
z<-6.88
class(x)
class(y)
class(z)
typeof(x)
typeof(y)
typeof(z)
class(TRUE)
typeof(TRUE)
class(5==6)
typeof(5==6)
int <-3.14
class(int)
int<-as.integer(3.14)
class(int)

##vectors
firstvector<-c(1,2,5,8)
firstvector
class(firstvector)
vector1<-c("apple","orange")
class(vector1)
vector2<-c("apple","orange",1,10,11)
class(vector2)
vector3<-c("apple","orange",1,10,11,TRUE)
vector3
class(vector3)
vector4<-c(1,10,11,TRUE)
vector4
class(vector4)
vector4<-c(1,10,11,FALSE)
vector4
class(vector4)
vect1<-c(1,2,3,4,5)
vect2<-c(10,11,12,13,14)
vect3<-vect1+vect2
vect3
vect1<-c(1,2)
vect2<-c(10,11,12,13,14)
vect3<-vect1+vect2
vect3
vect1a<-c(1,2,3)
vect2a<-c(10,11,12,13)
vect3a<-vect1a+vect2a
vect3a
age<-c(15,12,13,14,17)####access of vectors
age[2]###prints 2nd element from left or starting.
age[2:4]###prints 2nd,3rd and 4th elements including all.
age[-2]###removes 2nd element and prints remaining elements.
age[-1]###removes 1st element and prints remaining elements.

####function on vectors
age<-c(15,12,13,14,17)
min(age)
min_age<-min(age)
min_age
max_age<-max(age)
max_age
sort_age<-sort(age)
sort_age
######exploring more functions--->
###rep()
age<-c(15,12,13,14,17)
rep(age,times=2)###output--15 12 13 14 17 15 12 13 14 17
rep(age,each=2)###output--15 15 12 12 13 13 14 14 17 17
rep(age,each=3)
rep(age,c(1,2,1,3,2))##replacing each value in vector by no. of times written.
num_seq<-1:10###prints nos. from 1 to 10 including 1 and 10.
num_seq
typeof(num_seq)
num_seq1<-1:-10
num_seq1
typeof(num_seq1)

seq(from=-1,to=5,by=0.5)
seq(from=-1,to=-10,by=-1)
seq(from=5,to=25,length.out=40)

###any function
num_seq<-1:10
any(num_seq>11)
any(num_seq>5)
any(num_seq<5)

###all function
num_seq<-1:10
all(num_seq>0)

##is.na
vector1<-c(10,20,30,NA,50,60)
is.na(vector1)
any(is.na(vector1),TRUE)
###which
which(is.na(vector1))
vector1<-c(10,20,30,NA,50,60,NA) 
is.na(vector1)
which(is.na(vector1))
length(which(is.na(vector1)))
###since,we have 2 NA values so length function has value = 2.

#Factors
dice<-c(1,2,4,5,5,3,2,6,3,5,6,2,1,4,3,6,5,3,2,2,5)
factor(dice)###gives us unique values which are 1,2,3,4,5,6.
direction<-c("east","east","west","north")
factor(direction)####unique values given as output.
summary(dice)
weight <-c(23,45,67,34,89)
weight[1]<-26
weight
weight_factor<-factor(weight)
weight_factor
weight_factor[1]<-99 ## does not allow weight_factor first term to be changed.
weight_factor

direction<-c("east","west","south","north","east","south","east","north","south")
direction_factor<-factor(direction)
direction_factor####gives as output===>east north south west
new_order_direction<-factor(direction_factor,levels=c("east","west","north","south"))
new_order_direction#### gives output===>east west north south.
new_order_direction<-factor(direction_factor,levels=c("east","south"))
new_order_direction###gives output only as east and south others are kept as <NA>.
 
#####factors
direct<-c("North","East","South","North","West","East")
factor(direct,levels=c("North","East","South","West"),labels=c("N","E","S","W"))
###TO DISPLAY A PARTICULAR LEVEL WORD BY LABEL. 
factor(direct,levels=c("North","East","South","West"),exclude="South")
####this excludes South .

#factors creation.
data_languages<-gl(3,4,labels=c("R","Python","SQL"))
data_languages
###3=n=no.of discrete values , 4=k=no.of times we want elements to be repeated.
###label=element we want.
dice<-c(1,2,4,5,5,3,2,6,3,5,6,2,1,4,3,6,5,3,2,2,5)
dice[4]
dice[c(2,3)]
dice[-1] 
dice[c(TRUE,FALSE,TRUE,TRUE)]##accessing using logical vectors.

####changing elements in a factor and vector.
dice_fact<-factor(dice)
dice_fact[1]<-7
dice_fact[1]<-2
dice_fact
dice_fact<-factor(dice)
is.factor(dice_fact)
as.factor(dice)
is.ordered(dice_fact)
as.ordered(dice_fact)

f_data<- c(2,3,4,5)
factor(f_data)
###factor function will convert elements into factors.

##MATRICES
matrix(1:9,byrow=TRUE,nrow=3)
matrix(1:9,byrow=FALSE,nrow=3)
1:9
3:14
matrix(3:14,byrow=TRUE,nrow=4)
matrix(3:14,byrow=TRUE,nrow=3)
matrix(3:14,byrow=FALSE,nrow=2)

###convering different vectors into one matrix
tom_dice<-c(3,1,5,7,6,1)
dick_dice<-c(5,6,6,1,1,3)
harry_dice<-c(4,3,1,2,5,6)
dice_players<-c(tom_dice,dick_dice,harry_dice)
dice_players
dice_players_matrix<-matrix(dice_players,nrow=3,byrow=TRUE)
dice_players_matrix

###ACCESSING THE ELEMENTS IN A MATRIX.
dice_m<-dice_players_matrix
dice_m[1,2]
dice_m[1,4]
dice_m[3,2]
dice_m[3,]
dice_m[,3]

#####arithmetic operations
m1<-matrix(c(1,2,3,4,5,6),nrow=2)
m2<-matrix(c(6,2,0,9,3,1),nrow=2)
m3_add<-m1+m2
m3_add
m3_multiply<-m1*m2
m3_multiply

m_1<-matrix(c(1,2,3,4,5,6),nrow=2)
m_2<-matrix(c(6,2,0,9),nrow=2)
m3_add<-m1+m2
m3_add####non-conformable arrays i.e.dimension of arrays should be same.
