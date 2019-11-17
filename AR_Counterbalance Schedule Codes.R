## Each participant will watch all four stories and be randomly assigned to one of 24 possible orders of stories. 
library(gtools)
order <- 1:4                                                              #We have four stories
n <- 1:30                                                                 #The amount of participants
possible.order <- prod(order)                                             #How many different orders can we have
all.possible.orders <- permutations(n=4,r=4,v=order,repeats.allowed=F)    #permutations of all possible orders
set.seed(02200059)                                                        #The random numbers are the same all the time
order.for.all <- sample(1:24, 30, replace = T)                            #generate a random number from 1:24 for each participant

## Participants will see the false belief version of two stories and the true belief version of the other two. 
## They will be randomly assigned to one of the following six orders of conditions: FFTT, FTFT, FTTF, TFFT, TFTF, TTFF.
conditions <- c("FFTT","FTFT","FTTF","TFFT","TFTF","TTFF")                #six orders of conditions
condition.order.for.all <- conditions[sample(1:6, 30, replace = T)]

counterbalance <- matrix(, nrow = 30, ncol = 6)                           #create a new matrix to store our counterbalance schedule
for (i in n){
  counterbalance[i,1] <- i
  counterbalance[i,2:5] <- all.possible.orders[order.for.all[i],]
  counterbalance[i,6] <- condition.order.for.all[i]
}
colnames(counterbalance) <- c("ID","1st","2nd","3rd","4th","Conditions")  #rename the column names
counterbalance


