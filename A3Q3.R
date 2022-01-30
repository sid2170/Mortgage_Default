install.packages("readxl")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("Rcpp")

library("Rcpp")
library("readxl")
library("dplyr")
library("ggplot2")
update.packages()



mydata <- read_excel("C:\\Users\\Siddharth\\Desktop\\fall21\\data mining\\MortageDefaulter.xlsx")
StateData <- read_excel("C:\\Users\\Siddharth\\Desktop\\fall21\\data mining\\StateData.xlsx")

#Change colname in State Data
colnames(StateData) <- c("State","Median_Income","Poverty_Percentage")
#Delete first row of State Data
StateData <- StateData[-1 ,]
#Placed the decimal numbers in Excel for column Poverty percentage
StateData$Poverty_Percentage <- as.numeric(StateData$Poverty_Percentage)
StateData$Poverty_Percentage <- round(StateData$Poverty_Percentage, digits = 0)

#Add abbrevation in State column of State Data using state.abb() function 
StateData$State <- state.abb[match(StateData$State, state.name)]
#Add District of columbia as it isn't available in state.abb function
StateData$State[is.na(StateData$State)] <- "DC"
#Used left join to merge both the dataset keeping the "State" as the primary key
new_data <- merge(x=mydata,y=StateData,by="State",all.x = TRUE) 


#Checked the sum of NULL values of each columns
new_data %>% summarise(across(everything(), ~ sum(is.na(.))))

#Remove the NULL values
new_data <- na.omit(new_data)
sum(is.null(new_data))

#Check the class for all the variable
lapply(new_data, class)

# Applying ggplot function
# Boxplot to check the outliers Borrower's Age v/s Status
attach(new_data)
ggplot(new_data, aes(x = OUTCOME, y = Bo_Age, fill = OUTCOME)) + 
  labs(x="Status",y="Borrower's Age")+
  geom_boxplot()

#Boxplot Ln_Orig
ggplot(new_data, aes(x = OUTCOME, y = Credit_score, fill = OUTCOME)) + 
  labs(x="Status",y="Credit Score")+
  geom_boxplot()

State <- as.factor(State)
OUTCOME <- as.factor(OUTCOME)
First_home<- as.factor(First_home)
Status <- as.factor(Status)
Median_Income <- as.numeric(Median_Income)

ggplot(new_data, aes(x = OUTCOME,fill=OUTCOME)) + 
  labs(x="Status",y="Credit Score")+
  geom_bar()

ggplot(new_data, aes(x = Status,fill=Status)) + 
  labs(x="Status",y="Count")+
  geom_bar()

ggplot(new_data, aes(x = Bo_Age,fill=Bo_Age)) + 
  labs(x="Borrower's",y="Count")+
  geom_histogram()



