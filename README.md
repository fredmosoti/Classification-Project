# Classification-Project

## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Classifier](#R-functions-for-classification)
- [Recommendations](#recommendations)

### Project Overview
---
As part of the classification project, three essential R functions for classification tasks are being developed. The project's goal is to categorize numerical values into distinct groups according to predetermined thresholds by analyzing various datasets.
The B_Classifier, C_Classifier, and O_Classifier functions are the three that I developed. Every function has a unique function and is linked to a particular dataset.

### Data Sources

Classification Data: The primary dataset used for this analysis is the "dataset_b0.csv","dataset_b0.csv" "c0", to "c499" file, containing detailed information about the vector values: ('bo' or 'bn'), ('cw' or 'cb') and ('o0', 'o1', ..., 'o9').

### Tools

- Excel - Data Cleaning
- RStudio - Data Analysis

### Data Cleaning/Preparation

In the initial data preparation phase, we performed the following tasks:
1.  Package Loading: The function starts by loading the necessary packages: caret, glmnet, and e1071. These packages provide tools for data preparation, model training, and prediction.
2.  Data Loading and Preprocessing: The function reads the data from the dataset_o0.csv file into a dataframe called o_dataset. It also renames the dataframe columns to reflect the feature names.
4.  Missing Value Handling: The function removes any missing values from the dataframe using the na.omit() function to ensure data integrity during model training.
5.  Train Control Setup: A train control object is created using the trainControl() function. This object specifies the evaluation method for the model, which in this case is 10-fold repeated cross-validation.
6.  Random Seed Setting: The function sets the seed for the random number generator using the set.seed() function. This ensures reproducibility of the model training process.
7.  Model Training: A regularized logistic regression model is trained using the train() function. The model is trained on the o_dataset dataframe and utilizes the glmnet method. The function also specifies hyperparameter tuning using 5-fold cross-validation.
8.  New Observation Creation: A new observation dataframe called new_observation is created. This dataframe contains the eight numeric values that the function will use for class prediction.
9.  Class Prediction: The function predicts the class of the new observation using the predict() function. The function returns the predicted class as a string value.

### R functions for classification 
The B_Classifier, C_Classifier, and O_Classifier functions are the three that were developed. Every function has a unique function and is linked to a particular dataset:

#### B_Classifier:
The B_Classifier function takes a single numeric value as input and returns a string value representing the class of that value, either 'bn' or 'bo'.
- The function first checks if the input value is numeric using the is.numeric() function. If the input value is not numeric, it throws an error message using the stop() function.
- The function then calculates the threshold value using the median () function. The threshold value is the median of the X0.42232895672346293 column in the my_data dataframe. This threshold value is used to classify the input value.
- If the input value is greater than the threshold value, the function returns 'bo'. Otherwise, it returns 'bn'.
```
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

# Example usage:
b_class <- B_Classifier(0.83260403)
print(b_class)
```
Step-by-step breakdown:
- Input Validation: The function begins by checking if the input value is numeric using the is.numeric() function. If the input is not numeric, an error message is thrown using the stop() function, informing the user that the input must be a numeric value.
- Threshold Calculation: The function calculates the median value of the X0.42232895672346293 column in the my_data dataframe using the median() function. This median value serves as the threshold for classification.
- Classification Logic: Based on the input value and the calculated threshold, the function determines the class label. If the input value is greater than the threshold, the class is 'bo', and if it's less than or equal to the threshold, the class is 'bn'.

#### C_Classifier:
The C_Classifier function takes a vector of numeric values as input and returns a vector of strings of the same length as the input vector. Each element in the output vector is the class of its corresponding value in the input vector, either 'cb' or 'cw'.
- The function first checks if the input vector is numeric using the is.numeric() function. If the input vector is not numeric, it throws an error message using the stop() function.
- The function then calculates the threshold value using the median () function. The threshold value is the median of the X115.20418513271142 column in the c0_data dataframe. This threshold value is used to classify the input vector values.
- For each value in the input vector, the function compares it to the threshold value. If the value is greater than the threshold value, the function returns 'cw'. Otherwise, it returns 'cb'.
```
C_Classifier <- function(vector_values) {
  if (!is.numeric(vector_values)) {
    stop("The input must be a numeric vector.")
  }
  classes <- ifelse(vector_values > threshold, 'cw', 'cb')
  return(classes)
}

# Example usage:
vector_values <- c0_data$X115.20418513271142
vector_classes <- C_Classifier(202.9106214) # pick any value
print(vector_classes)
```
Step-by-step breakdown:

- Input Validation: Similar to the B_Classifier function, the C_Classifier function also checks if the input vector is numeric using the is.numeric() function. If the input is not numeric, an error message is displayed using the stop() function.

- Threshold Calculation: The function determines the median value of the X115.20418513271142 column in the c0_data dataframe using the median() function. This median value serves as the threshold for classification.

- Vector Classification: The function iterates through the input vector, classifying each element based on the threshold value. If an element is greater than the threshold, it's assigned the class 'cw', and if it's less than or equal to the threshold, it's assigned the class 'cb'

#### O_Classifier:
The O_Classifier function takes a vector of eight numeric values as input and returns a single string value representing the class of the input vector. The function uses a regularized logistic regression model to classify the input vector.
- The function first loads the required packages: caret, glmnet, and e1071.
- The function then reads the data from the dataset_o0.csv file into a dataframe called o_dataset. The function also renames the columns of the dataframe to reflect the feature names.
- The function then removes any missing values from the dataframe using the na.omit() function.
- The function then creates a train control object using the trainControl() function. The train control object specifies that the function should use 10-fold repeated cross-validation to evaluate the model.
- The function then sets the seed for the random number generator using the set.seed() function. This ensures that the model is reproducible.
- The function then trains a regularized logistic regression model using the train() function. The model is trained on the o_dataset dataframe and uses the glmnet method. The function also specifies that the function should tune the model parameters using 5-fold cross-validation.
- The function then creates a new observation dataframe called new_observation. The new observation dataframe contains the eight numeric values that the function will use to predict the class.
- The function then predicts the class of the new observation using the predict() function. The function returns the predicted class as a string value.
```
O_Classifier <- function(vector_values) {
  # (Install and load necessary packages)
  # (Read and preprocess the dataset)
  
  # (Train the model using glmnet)
  
  # (Create a new observation with random values)
  new_observation <- data.frame(
    V1 = 1.116036242,
    V2 = 0.838743267,
    V3 = 0.000550746,
    V4 = 0.767142275,
    V5 = 0.094321112,
    V6 = 0.929259996,
    V7 = 0.110389814,
    V8 = 0.0806573
  )
  
  # (Make predictions using the trained model)
  predicted_class <- predict(model, new_observation)
  
  return(predicted_class)
}

# Example usage:
o_class <- O_Classifier(vector_values)
print(o_class)
```
### Expected Outputs:
- The class output for B_Classifier ('bo' or 'bn').
- The class vector output for C_Classifier ('cw' or 'cb').
- The predicted class for O_Classifier ('o0', 'o1', ..., 'o9').

### Description of the Method Used to Compare Algorithms
1. Comparative Analysis:
Accuracy Calculation: The accuracy was calculated as the ratio of correctly classified instances to the total number of instances. Mathematically, accuracy = (TP + TN) / (TP + TN + FP + FN), where TP = True Positives, TN = True Negatives, FP = False Positives, FN = False Negatives.
2. Test Set/Samples:
Dataset Selection: We utilized diverse datasets, including dataset_b0.csv, c0.csv, and dataset_o0.csv, to evaluate the adaptability and robustness of our algorithms across various domains.
Randomized Sampling: To ensure unbiased evaluation, we employed randomized sampling techniques to split the datasets into training and testing sets.


### Recommendations
- Three classification functions are successfully implemented in R, enabling the classification of numerical values using preset criteria and machine learning models. 
- The functions enable flexibility for a range of datasets and serve as a basis for additional analysis and automation.
