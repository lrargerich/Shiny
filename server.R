library(shiny)

textCruncher <- function(s,level) {
    s1 = tolower(s)
    s1 = gsub("[^[:alnum:] ]", " ", s1)
    
    if (level>=4) {
        words = unlist(strsplit(s1," "))
        s1 = ""
        for (word in words) {
            if (nchar(word)>5) {
                pos = floor(runif(1,2,nchar(word)))
                word = paste(substr(word,1,pos-1),substr(word,pos+1,nchar(word)),sep="")
            }
            s1 = paste(s1,word)
        }
        
    }
    
    s1 = gsub(" as far as i know "," AFAIK ",s1)
    s1 = gsub(" away from keyboard "," AFK ",s1)
    s1 = gsub(" love "," luv ",s1)
    s1 = gsub(" thanks "," THX ",s1)
    s1 = gsub(" have "," hav ",s1)
    s1 = gsub(" hav a nice day "," HAND ",s1)
    s1 = gsub(" see you "," CU ",s1)
    s1 = gsub(" great "," gr8 ",s1)
    s1 = gsub(" at the moment "," ATN ",s1)
    s1 = gsub(" by the way "," BTW ",s1)
    s1 = gsub(" as soon as possible "," ASAP ",s1)
    s1 = gsub(" oh my gosh "," OMG ",s1)
    s1 = gsub(" oh my god "," OMG ",s1)
    
    if (level>=2) {
        s1 = gsub(" you "," U ",s1)    
        s1 = gsub(" at "," @ ",s1)
        s1 = gsub("one","1",s1)
        s1 = gsub("won","1",s1)
        s1 = gsub("your","ur",s1)
        s1 = gsub(" be "," b ",s1)
        s1 = gsub(" see "," c",s1)
        s1 = gsub(" ok "," k ",s1)
        s1 = gsub(" are "," r ",s1)
        s1 = gsub(" why "," y ",s1)
        s1 = gsub("friend","frd",s1)
        s1 = gsub(" enjoy ", "njoy",s1)
        s1 = gsub("and ","& ",s1)
        s1 = gsub(" to"," 2",s1)
        s1 = gsub("too","2",s1)
    }
    
    if (level>=3) {
        s1 = gsub("for ","4 ",s1)
        s1 = gsub(" for"," 4",s1)
        s1 = gsub("ate ","8 ",s1)
        s1 = gsub(" ate"," 8",s1)    
        s1 = gsub(" and "," & ",s1)
        s1 = gsub("see "," C",s1)
        s1 = gsub("to ","2 ",s1)
        s1 = gsub("ing ","ng ",s1)
    }
    
    
    if (level==5) {
        s1 = gsub("a","",s1)
        s1 = gsub("e","",s1)
        s1 = gsub("o","",s1)
    }
    return(s1)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # Expression that generates a histogram. The expression is
    # wrapped in a call to renderPlot to indicate that:
    #
    #  1) It is "reactive" and therefore should re-execute automatically
    #     when inputs change
    #  2) Its output type is a plot
    output$l1 <- renderText({paste("Original text length:",toString(nchar(input$longform))
                                   , " Compressed text length:"
                                   ,toString(nchar(textCruncher(input$longform,input$level))))})
    
    output$text1 <- renderText({ 
        sale = textCruncher(input$longform,input$level)
        
    })
    
    
})