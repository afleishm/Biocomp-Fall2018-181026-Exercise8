rm(list=ls()) #remove global environment
setwd("/Users/Ashley/Documents/Biocomputing_2018/Biocomp-Fall2018-181026-Exercise8")

#1
library(ggplot2)

game = read.table("UWvMSU_1-22-13.txt", header = TRUE)
UW_time = c() #Create empty data frames for x and y variables
MSU_time = c()
UW_cum = c()
MSU_cum = c()
UW_score = 0 #Create cumulative score counter
MSU_score = 0

for (i in 1:nrow(game)) {
  if(game[i,2] == "UW") {
    UW_score = UW_score + game[i,3]
    UW_cum = rbind(UW_cum, UW_score) #Appends score to UW score vector
    
    school_time = game[i,1]
    UW_time = rbind(UW_time,school_time) #Appends time to UW time vector
  } else {
    MSU_score = MSU_score + game[i,3]
    MSU_cum = rbind(MSU_cum, MSU_score)
    
    school_time = game[i,1]
    MSU_time = rbind(MSU_time, school_time)
  }
}

plot(UW_time, UW_cum, type = "l", xlab = "", ylab = "")
lines(MSU_time, MSU_cum, type = "l" , col = "blue")


#2
#"Guess my number" game
print("I'm thinking of a number between 1 and 100...")

num = sample(1:100,1) #Select random number
input = readline(prompt = "Guess: ") #Ask for user input
  
while(!(input == num)) {
  if (input < num) {
    print ("Higher")
    input = read.integer()
  } else if (input > num) {
    print("Lower")
    input = read.integer()
  }
}

if (input == num) {
  print ("Correct")
}



