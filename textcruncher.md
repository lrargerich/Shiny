textcruncher
========================================================
author: Frog
date: August 2014

Text Cruncher
========================================================

Presenting: **Text Cruncher** a lossy text compression
engine.

- It can compress text more than 30%
- It's still readable
- No decompression needed

How it Works
========================================================




```r
text = "As far as I know this is the greatest example of lossy compression! You have to see it"
c1 = textCruncher(text,4)
c1
```

```
[1] " AFAIK this is the gretest examle of lossy compession  U hav 2 cit"
```


In Action
========================================================


```
[1] " AFAIK this is luv & i hav 2 cit 4 U the gr8 thng that we r dong thans my fried @ the momet U r the thng that makes this work"
```



```r
x1 = nchar(text)
# Maximum compression test
x2 = nchar(textCruncher(text,5))
print(paste("Compression:",round(x2/x1*100),"%"))
```

```
[1] "Compression: 68 %"
```

Planned Improvements
========================================================

* More compression!
* Encrypting result
* Lossless compression of result


Applications
========================================================

* SMS messages
* Semi-ciphered communications
* Preventing indexed content
