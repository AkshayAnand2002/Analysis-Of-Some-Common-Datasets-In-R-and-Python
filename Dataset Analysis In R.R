data <- read.csv('C:/cps.csv')
data
library(ggplot2)
## Distribution Of Wage with respect to Age and distinguished by gender
wage_age <- ggplot(data , aes(age,wage, color = sex))+ geom_point()
wage_age
# a relation of quantity vs quantity for wage and age distinguished by
#gender at a particular age
#Wage vs race distribution
wage_race <- ggplot(data, aes(race,wage,color = race)) +
  geom_bar(stat = 'identity')
wage_race
# Wage vs Marriage
wage_married <- ggplot(data , aes(married,wage ))+geom_boxplot()
wage_married

### Using Iris dataset
d <- iris
d
# Relation between sepal length and sepal width differentiating based on 
# species
width_length <- ggplot(d, aes(Sepal.Width , Sepal.Length , color = Species)) +
  geom_point()
width_length
install.packages("plotly")
library(plotly)
## creating interactive plots using plotly.
plot1 <- plot_ly(d , x = ~Sepal.Width , y = ~Sepal.Length, type = 'scatter') %>%
  layout(title ="Variation of sepal length vs sepal width", xaxis = list(title =
          "Sepal Width" , yaxis = list(title = "Sepal Length")))
plot1
## above is a scatterplot.
plot2 <- plot_ly(d, x =~ Species , y= ~Sepal.Length , type= 'bar') %>%
  layout(title ="Variation of sepal length vs species", xaxis = list(title =
            "Species" , yaxis = list(title = "Sepal Length")))
plot2
## above is barplot.
plot3 <- plot_ly(d , x= ~Species , y=~Sepal.Length, type ='bar', name='Sepal Length') %>%
  add_trace(y=~Sepal.Width , name = 'Sepal Width') %>%layout(barmode='stack')
plot3
## Made stacked barplot using add_trace .
plot4 <- plot_ly(d , labels= ~Species, values = ~Petal.Length , type = "pie",textinfo = 
    "label+percent", insidetextorientation = "radial") %>% 
  layout(title = "Share Of Petal Lengths")
plot4
##above is a pie chart.

data<-read.csv("C:/LifeExpectancy.csv")
data
nrow(data)
ncol(data)
plot(data$Age,data$Male.babies,type="l",lty=1,xlab="Age",ylab="Male Babies")
title(main=" Male life expectancy rate change over the years")
#type="l means line and lty =1 means single line with solid line type.
plot(data$Age, data$Female.babies, type = "l", lty = 1,xlab = "Age",ylab = "Female babies",col="red")
title(main=" Female life expectancy rate change over the years")
library(ggplot2)
scatterplot<-ggplot(data, aes(x=Male.babies, y=Female.babies))+geom_point()+
  ggtitle("Relationship between Male and Female Life Expectancy")
scatterplot
###Built scatterplot using ggplot
plot(data$Male.babies,data$Female.babies, type = "l", lty = 1,xlab="MaleBabies",ylab="Female.babies",col="blue")
title(main="Relationship between Male and Female Life Expectancy")
##Life expectancy during times of world war 1 and 2 
## we will use annotations of data here to get years before and after world wars 1 and 2.
a1<-subset(data,Annotations=="WW1 starts"| Annotations=="WW1 ends",select = Age)
a2<-subset(data,Annotations=="WW2 starts"| Annotations=="WW2 ends",select = Age)
a3<-subset(data,(Age>=a1$Age[1] & Age<=a1$Age[2])|(Age>=a2$Age[1] & Age<=a2$Age[2]),select = Age:Female.babies)
ggplot(a3, aes(Age)) + geom_point(aes(y = Male.babies, colour = "Male.babies"),size=1) + 
  geom_point(aes(y = Female.babies, colour = "Female.babies"),size=1)+scale_x_continuous(name="Years") 
+scale_y_continuous(name="Life Expectancy")+ggtitle("Male and Female life Expectancies during World Wars")
##In R Language indexing starts from 1 and not 0.
##In above plot represented only times of world wars i.e. 1914 to 1918 and 1939 to 1945.
## To plot Male/Female Relationship during WW2.
## WW2 WAS FROM 1939 TO 1945. SO WE TAKE THE DATA FROM YEAR 1939 TO 1945.
##So we take a new dataframe with required records by slicing.
s<-data[99:105,] ### using excel indexes for slicing.
datanew1<-data.frame(x=s$Male.babies,y=s$Age) ##male relationship
datanew2<-data.frame(x=s$Female.babies,y=s$Age)## female relationship
ggplot(NULL,aes(x,y))+geom_line(data=datanew1,col="blue")+
  geom_line(data=datanew2,col="red")+ggtitle("Male/Female relationship during WW2")
##drawn relationship graph
## To draw jitter plot forage vs male babies.
q<-ggplot(data, aes(x = data$Age, y = data$Male.babies)) 
q+geom_jitter(alpha = 0.1)+ggtitle("Age And Male Babies Life Expectancy Relation ")
##To plot Age vs Male and Femal babies life expectancy
i<-data[1:243,]### To take all datapoints in thde data done using ms excel.
data10<-data.frame(x=i$Male.babies,y=i$Age)## tAKING all required records in required range of i
data20<-data.frame(x=i$Female.babies,y=i$Age)## tAKING all required records in required range of i
ggplot(NULL,aes(x,y))+geom_line(data=data10,col="blue")+geom_line(data=data20,col="red")+
  ggtitle("Male/Female life expectancy")##plotting for both datas
##Plot life expectancy of male vs female babies using fill value as age.
q<-ggplot(data, aes(x = data$Female.babies, y = data$Male.babies)) 
q+geom_boxplot(aes(fill = Age))

##Using text file into dataframe using read.delim
data <-read.delim('C:/weight_chart.txt')
plot(data,type="b")
##used to draw this as a point and line graph.
# Change the point character to be a filled square (pch=15)
# Change the plot point size to be 1.5x normal size (cex=1.5)
# Change the line thickness to be twice the default size (lwd=2)
# Change the y-axis to scale between 2 and 10kg (ylim=c(2,10))
# Change the x-axis title to be Age (months) (xlab="Age (months)")
# Change the y-axis title to be Weight (kg) (ylab="Weight (kg)")
# Add a suitable title to the top of the plot (main="Some title"
plot(data,type="b",pch=15)
plot(data,type="b",pch=15,cex=1.5)
plot(data,type="b",pch=15,cex=1.5,lwd=2)
plot(data,type="b",pch=15,cex=1.5,lwd=2,ylim=c(2,10))
plot(data,type="b",pch=15,cex=1.5,lwd=2,ylim=c(2,10),xlab="Age(months)")
plot(data,type="b",pch=15,cex=1.5,lwd=2,ylim=c(2,10),xlab="Age(months)",ylab="
Weight(kg)")
plot(data,type="b",pch=15,cex=1.5,lwd=2,ylim=c(2,10),xlab="Age(months)",ylab="W
eight(kg)",main="Weight chart for infants upto 9 months ")
# The bars should be horizontal rather than vertical (horiz=TRUE).
# The count axis should be labelled (xlab="A title")
# The feature names should be added to the y axis. (set names.arg to the Feature column 
#of the data frame)
# The plot should be given a suitable title (main="Some title")
#The text labels should all be horizontal (las=1) Note that you can pass this parameter 
#either via par, or as an additional option to barplot.
#The margins should be adjusted to accommodate the labels (par mar parameter). You 
#need to supply a 4 element vector for the bottom,left,top and right margin values. 
#Look at the value of par()$mar to see what the default values are so you know where to 
#start. Note that you will have to redraw the barplot after making the changes with par.
data <-read.delim('C:/feature_counts.txt')
barplot(data$Count)
barplot(data$Count,horiz=TRUE)
barplot(data$Count,horiz=TRUE,xlab="COUNT")
barplot(data$Count,horiz=TRUE,xlab="COUNT",names.arg=data$Feature)
barplot(data$Count,horiz=TRUE,xlab="COUNT",names.arg=data$Feature,main="GRCm38 
GENOME")
barplot(data$Count,horiz=TRUE,xlab="COUNT",names.arg=data$Feature,main="GRCm38 
GENOME",las=1)
par()$mar #output--[1] 5.1 4.1 4.1 2.1
par(mar=c(5,12,4,2))
barplot(data$Count,horiz=TRUE,xlab="COUNT",names.arg=data$Feature,main="GRCm38 
GENOME",las=1)
#Make all bars different colours using the rainbow function
# rainbow takes a single argument, which is the number of colours to generate, 
#eg rainbow(10) Try making the vector of colours separately before passing it as 
#the col argument to barplot (col=rainbow(10)).
# Rather than hard coding the number of colours, think how you could 
#use nrow to automatically generate the correct number of colours for the size 
#of dataset.
#Replot, and make the bars for the males a different colour to those for the females. In 
#this case the male and female samples alternate so you can just pass a 2 colour vector 
#to the col parameter to achieve this effect. (col=c("blue2","red2")) .
#Using male-female count text file dataset.
data <-read.delim('C:/male_female_counts.txt')
barplot(data$Count,names.arg=data$Sample)
count=nrow(data)
barplot(data$Count,names.arg=data$Sample,col=rainbow(count))
barplot(data$Count,names.arg=data$Sample,col=c("blue2","red2"))
barplot(data$Count,names.arg=data$Sample,col=c("green","yellow"))