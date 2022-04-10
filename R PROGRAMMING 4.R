uber_df<-read.csv("C:/RFILES/Uber Request Data.csv",stringsAsFactors = TRUE)
str(uber_df)
#library lubridate
install.packages("lubridate")
library(lubridate)
uber_df$Request.timestamp<-parse_date_time(uber_df$Request.timestamp,orders = c("dmy_HMS","dmy_HM"))
uber_df$Drop.timestamp<-parse_date_time(uber_df$Drop.timestamp,orders = c("dmy_HMS","dmy_HM"))
uber_df$Request.date<-as.Date(uber_df$Request.timestamp)
####TO MAKE NEW COLUMN REQUEST.DATE CONTAINING DATE FROM REQUEST.TIMESTAMP COLUMN
uber_df$Request.time<-format(uber_df$Request.timestamp,"%H:%M:%S")
### TO MAKE A NEW COLUMN COTAINING TIME IN FORMAT HOURS:MINUTES:SECONDS
uber_df$Drop.time<-format(uber_df$Drop.timestamp,"%H:%M:%S")
uber_df$Drop.date<-as.Date(uber_df$Drop.timestamp)
###TO CHECK FOR DUPLICATED VALUES IN COLUMNS.
sum(duplicated(uber_df$Request.id))
allocate_slots<- function(p)
{if(p>="04:00:00" && p<"08:00:00")
{
  timeslot<-"04-08"
}
else if(p>="08:00:00" && p<"12:00:00")
{
  timeslot<-"08-12"
}
  else if(p>="12:00:00" && p<"15:00:00")
  {
    timeslot<-"12-15"
  }
  else if(p>="15:00:00" && p<"17:00:00")
  {
    timeslot<-"15-17"
  }
  else if(p>="17:00:00" && p<"20:00:00")
  {
    timeslot<-"17-20"
  }
  else if(p>="20:00:00" && p<"22:00:00")
  {
    timeslot<-"20-22"
  }
  else if(p>="22:00:00" && p<"24:00:00")
  {
    timeslot<-"22-24"
  }
  else if(p>="00:00:00" && p<"04:00:00")
  {
    timeslot<-"00-04"
  }
  else
  {
    timeslot="NO TIMESLOTS"
  }
  return(timeslot)
}
uber_df$request.slot<-sapply(uber_df$Request.time, function(x) allocate_slots(x))
library(ggplot2)
ggplot(uber_df,aes(x=uber_df$Status , fill=uber_df$Pickup.point))+geom_bar(stat='count',position ='dodge')
ggplot(uber_df,aes(x=uber_df$Status , fill=uber_df$Pickup.point))+geom_bar(stat='count',position ='dodge')+
  ggtitle("cab demand from city/airport")+labs(x='status of trips' , y='count of trips')+
labs(fill="pickup point")  

plot_status<-ggplot(uber_df,aes(x=uber_df$request.slot, fill=uber_df$Status))+geom_bar(stat='count',position ='dodge')+
  ggtitle("cab demand from city/airport")+labs(x='time slot' , y='count of trips')+
  labs(fill="status")  

plot_pickup<-ggplot(uber_df,aes(x=uber_df$request.slot, fill=uber_df$Status))+geom_bar(stat='count')+
  ggtitle("cab demand from city/airport")+labs(x='time slot' , y='count of trips')+
  labs(fill="status") 
plot_pickup

grid.arrange(plot_status,plot_pickup ,ncol=2)
###morning and evening demand is at peak.
##cancellation is high in the morning.
####no cars available--- is high in the evening.
uber_df$Journey.time<-round(uber_df$Drop.timestamp - uber_df$Request.timestamp)
uber_df_tripcomplete<-uber_df[which(uber_df$Status=="Trip Completed"),]
ggplot(uber_df_tripcomplete,aes(y=uber_df_tripcomplete$Journey.time,x=uber_df_tripcomplete$request.slot,fill=uber_df_tripcomplete$Pickup.point))+
  geom_boxplot()+
  ggtitle("CAB DEMAND PER SLOT")+labs(x="time slots" , y="journey time")+
  labs(fill="Pickup Point")
####visualization tells that after there are differences between journey
###times of the airport and city but after 8 pm to 12 am they are nearly same.