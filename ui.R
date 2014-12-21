library(shiny)
library(datasets)
library(caret)
library(rattle)
library(rpart.plot)

shinyUI(fluidPage(
  headerPanel("Iris Dataset Explorator"), 
  sidebarLayout(
    

    mainPanel(

      tabsetPanel(
        tabPanel("Plot",
          
          
          br(),
          h4('Pick variables to be drawn on the plot'),
          column(5,
                 selectInput("Xaxis", label = h5("X axis"), 
                             choices = list("Sepal length" = 2, "Sepal width" = 3,
                                            "Petal length" = 4, "Petal width" = 5), selected = 1)
          ),
          
          column(5,
                 selectInput("Yaxis", label = h5("Y axis"), 
                             choices = list("Sepal length" = 2, "Sepal width" = 3,
                                            "Petal length" = 4, "Petal width" = 5), selected = 1)
          ),
          column(5,
                 submitButton("Submit")
          ),
          plotOutput("plot"),
          br(),
          br(),
          br(),
          br(),
          br(),
          br(),
          br()
        ),
        tabPanel("Prediction",
                 plotOutput("model"),
                 br(),
                 br(),
                 h4('Prediction for:'),
                 column(5,
                        textInput("p_sepal_length", label = h5("Sepal length"), value = mean(iris$Sepal.Length)),
                        br(),
                        textInput("p_sepal_width", label = h5("Sepal width"), value = mean(iris$Sepal.Width)),
                        br(),
                        textInput("p_petal_length", label = h5("Petal length"), value = mean(iris$Petal.Length)),
                        br(),
                        textInput("p_petal_width", label = h5("Petal width"), value = mean(iris$Petal.Width)),
                        br(),
                        submitButton("Predict"),
                        br()
                  ),
                 column(5, 
                        h4('Prediction for specified iris is'),
                        h2(textOutput("prediction"))
                  )
                 
                 
        )
      )
      
        
    ),
    sidebarPanel(     
      width = 3,
      h3('About the App'),
      p('The Iris Dataset Explorator enables exploring the Iris dataset(from the Dataset Package in R). It draws customed plots and counts predictions based on prediction tree. Enjoy the exploring experience !'),
      br(),
      h3('How to use'),
      h4('Plot Tab'),
      p('In order to change plot, pick the variable to be drawn on each axis and click submit. If you pick the same variable for both axis - a histogram will be drawn.'),
      h4('Prediction Tab'),
      p('In order to predict the type of iris, specify the petal and sepal width and length and click submit button. The default values are the average values in the dataset.')
      
    )
    
  )
  
  
  

))
  