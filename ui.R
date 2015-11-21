library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Body Mass Index Classification in Adults"),
  
  sidebarPanel(
    numericInput(inputId="heightM", label="Your height in cm", value=0, min=0, max=300),
    numericInput(inputId="weightM", label="Your weight in kg", value=0, min=0, max=300),
    radioButtons(inputId="gender", label="Gender", choices=c("Female","Male")),
    actionButton("goButton", "Go!"),
    br(),
    p(strong(em("Documentation:",a("Body Mass Index Classification in Adults",href="readme.html"))))
    ),
  
  mainPanel(
    h1('BMI Calculation and Classification'),
    h5('Your BMI coefficient kg/m^2'),
    verbatimTextOutput("oiBMI"),
    h5('Your BMI Classification'),
    verbatimTextOutput("oiBMIclass"),
    img(src="bmi.png", height=206, width=300)
  )
))