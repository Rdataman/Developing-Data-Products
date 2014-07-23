library(shiny)
shinyServer(
        function(input, output) {
                
                
               
                # include all information in a data frame
                alldata <- reactive({
                        # Get the input values
                        if (is.null(input$sci)) {fv = FALSE
                                                 form = "standard"
                        }else {fv=TRUE;form = "scientific"}
                        n1 <- input$input1
                        n2 <- input$input2
                        oper <- which(c("plus","minus","multiply","divide")==input$op)
                        # Calculation part
                        n3 <- c(n1+n2,n1-n2,n1*n2,n1/n2)
                        nt <- format(c(n1,n2,n3[oper]),scientific=fv)
                        # Include all information in a dataframe
                        data.frame(
                        Name = c("Format",
                                 "1st Number", 
                                 "2nd Number",
                                 "Operator",
                                 "Result"),
                        Value = as.character(c(form,
                                               nt[1], 
                                               nt[2],
                                               input$op,
                                               nt[3])))   

                        })
                # Show the values using an HTML table
                output$values <- renderTable({
                        alldata()  
                })
        }
        )
