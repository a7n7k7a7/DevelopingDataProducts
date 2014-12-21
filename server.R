


shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      if (input$Xaxis == 2) {datax <- iris$Sepal.Length; xlabel <- "Sepal length"}  
      else if (input$Xaxis == 3) {datax <- iris$Sepal.Width; xlabel <- "Sepal width"}
      else if (input$Xaxis == 4) {datax <- iris$Petal.Length; xlabel <- "Petal length"}
      else if (input$Xaxis == 5) {datax <- iris$Petal.Width; xlabel <- "Petal width"}
      
      if (input$Yaxis == 2) {datay <- iris$Sepal.Length; ylabel <- "Sepal length"}  
      else if (input$Yaxis == 3) {datay <- iris$Sepal.Width; ylabel <- "Sepal width"}
      else if (input$Yaxis == 4) {datay <- iris$Petal.Length; ylabel <- "Petal length"}
      else if (input$Yaxis == 5) {datay <- iris$Petal.Width; ylabel <- "Petal width"}
      
      
      if (xlabel == ylabel) {hist(as.numeric(datax), col = rgb(0.2, 0.3, 0.9, 0.9), xlab = xlabel, main = paste("Histogram of", xlabel)) }
      else {plot(datax, datay, pch = 19,  col = iris$Species, xlab = xlabel, ylab = ylabel, main = (paste("Scatter Plot of", xlabel, "and", ylabel)))
            legend("topright", legend = c("setosa", "versicolor", "virginica"), col = c("black", "red", "green"), pch = 19)}
      
    })
    
    output$model <- renderPlot({
      tree <<- train(Species ~ ., data = iris, method = "rpart")
      fancyRpartPlot(tree$finalModel)
    
    })
    
    output$prediction <- renderText({
      pred_data <- data.frame(Sepal.Length = as.numeric(input$p_sepal_length), Sepal.Width = as.numeric(input$p_sepal_width), Petal.Length = as.numeric(input$p_petal_length), Petal.Width = as.numeric(input$p_petal_width))
      p <- predict(tree, pred_data)
      p <- as.numeric(p)
      if (p == 1) {prediction = "setosa"}
      else if (p == 2) {prediction = "versicolor"}
      else if (p == 3) {prediction = "virginica"}
      prediction
    })
   
})