library(shiny)

BMI<-function(wght,hght) {
  if (wght==0 | hght==0) return(NA) 
  else  return(round(wght/(hght/100)^2,1))
}

classBMI<-function(bmic) {
  if (is.na(bmic)) return ("")
  else {
    if (bmic<18.5) return("Your BMI is less than 18.5. You are considered UNDERWEIGHT") 
    if (bmic>=8.5 & bmic<24.9) return("Your BMI is in the range 18.5 to 24.9. You are in the HEALTHY WEIGHT RANGE")
    if (bmic>=25 & bmic<29.9) return("Your BMI is in the range 25 to 29.9. You are OVERWEIGHT")
    if (bmic>=30) return("Your BMI is higher than 30. You are OBESE")
  }
}

shinyServer(
  
  function(input, output) {
    
    output$oiBMI <- renderPrint({
      input$goButton
      isolate(BMI(input$weightM,input$heightM))
    })
    
    output$oiBMIclass<-renderText({
      input$goButton
      isolate(classBMI(BMI(input$weightM,input$heightM)))
    })
    
    output$oid1 <- renderPrint({input$id1})
  }
)