#Pick a business name for your group, it could be a company or your favorite team, it should be one word. Use this name in your project presentations, file names, and when referring to other groups/vendors.
#Mckintel

#Exercise 2 (30 points):
 # Create the following three functions
#1) B_Classifier: This function takes a single input of one numeric value and returns class type of that value ‘bn’ or ‘bo’
#Syntax: b_class = B_Classifier(value)
#This value comes from file dataset_bx.csv

my_data<-read.csv("dataset_b0.csv",header = TRUE,sep = ",")
head(my_data)
threshold_value <- median(my_data$X0.42232895672346293, na.rm = TRUE)
B_Classifier <- function(value) {
if (!is.numeric(value)) {
    stop("The input value must be numeric.")
    }
  if (value > threshold_value) {
    return('bo')
    } else {
      return('bn')
      }
  }
b_class <- B_Classifier(0.83260403)#pick any value randomly
print(b_class)

#2)C_Classifier: This function takes a single vector input of numeric values and returns a vector of strings that has the same size/length as the input vector. Each element in the output vector is the class type of its corresponding value in the input vector ‘cb’ or ‘cw’
#Syntax: vector_classes = C_Classifier(vector_values)
#This vector_values comes from file cx.csv, this vector contains all the values in that file

c0_data<-read.csv("c0.csv",header = TRUE,sep = ",")
threshold <- median(c0_data$X115.20418513271142, na.rm = TRUE)
C_Classifier <- function(vector_values) {
  if (!is.numeric(vector_values)) {
    stop("The input must be a numeric vector.")
    }
  classes <- ifelse(vector_values > threshold, 'cw', 'cb')
  return(classes)
  }
vector_values <- c0_data$X115.20418513271142
vector_classes <- C_Classifier(202.9106214)# pick any value
print(vector_classes)

#3)O_Classifier: This function takes a single vector input of numeric values and returns a single string value that is the class type of the input vector. The input vector has a size/length of eight. These values represent features for different classes. Possible values for the output include: ‘o0’, ‘o1’, ‘o2’, ‘o3’, ‘o4’, ‘o5’, ‘o6’, ‘o7’, ‘o8’, ‘o9’
#Syntax: o_class = O_Classifier(vector_values)
#This vector_values comes from file dataset_ox.csv, this vector contains all the eight numeric values in a row/record

install.packages(c("caret", "glmnet", "e1071"))
library(caret)
library(glmnet)
o_dataset <- read.csv("dataset_o0.csv")
colnames(o_dataset) <- c('Class', paste0('V', 1:(ncol(o_dataset)-1)))
o_dataset <- na.omit(o_dataset)
trControl <- trainControl(method = "repeatedcv", number = 10, repeats = 5)
set.seed(121)
model <- train(Class ~ ., data = o_dataset, method = 'glmnet',
                 tuneLength = 5, trControl = trControl)
new_observation <- data.frame(
  V1 = 1.116036242,
  V2 = 0.838743267,
  V3 = 0.000550746,
  V4 = 0.767142275,
  V5 = 0.094321112,
  V6 = 0.929259996,
  V7 = 0.110389814,
  V8 = 0.0806573 #pick any randow row values)
  )
predicted_class <- predict(model, new_observation)
print(predicted_class)