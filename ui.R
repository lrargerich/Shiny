library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("!=- Text Cruncher -=!"),
    
    # Sidebar with a slider input for the number of bins
    sidebarLayout(
            sidebarPanel(
                HTML('<textarea id="longform" rows="10" cols="80">Enter text here...</textarea>'),
                sliderInput("level",
                            "Compression Level:",
                            min = 1,
                            max = 5,
                            value = 1),
                br()
                
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            
            textOutput("l1"),
            h4('Compressed Text'),
            br(),
            verbatimTextOutput("text1"),
            br(),
            div('Instructions: Type or copy paste your text on the left, then choose the compression level you want. Copy and paste the result where you want to use the text.',style="color:blue")
        )
    )
))