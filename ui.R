shinyUI(pageWithSidebar(
        headerPanel("Simple Calculator"),
        
        sidebarPanel(
                
                
                sliderInput("input1", 
                            "Numeric input 1", 
                            min = 0, 
                            max = 1000, 
                            value = 500),
                numericInput("input2", 'Numeric input 2', 90),
                radioButtons("op", " operator",
                                   c("+" = "plus",
                                     "-" = "minus",
                                     "*" = "multiply",
                                     "/" = "divide")),
                checkboxGroupInput("sci", "Result in Scientific format:",
                             c("YES" = "T"))
                ),
        
      
        mainPanel(
                p('This table shows the two input numeber,selected operater and
                  result.'),
                p('The numbers are displayed in scientific or standard 
                  form depending on your choice.'),
                tableOutput("values")
               
        )


))

