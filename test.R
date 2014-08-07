compressText <- function(s) {
    s1 = gsub(" you "," U ",s)    
    return s1
}


s = "hey you how are you greentins your friend two at the dinner table"
sale = compressText(s)
sale
