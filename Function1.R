library(magrittr)
library(data.table)


#EXAMPLE 1.1: NO ARGUMENTS
eg1 <- function()
{
    rnorm(10)

}
eg1()

#SINGLE ARGUMENT

cube <- function(a)
{
    a*a*a
}
cube(4)
prod1 <- function(p,q,r)
{
    z <- (p-q)/r
}
prod1(1,2,3)

#MULTIPLE ARGUMENTS

prod1 <- function(p,q,r)
{
    z <- (p-q)/r
}
prod1(1,2,3)

#LAZY EVALUATION
lazy_eval <- function(a,b)
{
    a*a*a
}
lazy_eval()
lazy_eval(5)

#DEFAULT ARGS
reps2 <- function(num = 5){
    num_mat <- c()
    for(i in 1:num){
        for(j in 1:i){
            num_mat <- c(num_mat, i)
        }
       print(num_mat)
    }
}
reps2()
reps2(10)

def <- function(a, bb = cc)
{

    cc=log(a)
    print(a)
    print(bb)
}
def(6)


#EXAMPLE FOR SHOWING ELLIPSIS


el1 <- function(n,...){
    l <- c(n,...)
    print(sum(l))
}

el1(1,2,3,4)
el1(3,4,5,8,10,37,20)

USArrests
el2 <- function(n,...){
    l <- c(n,...)
    for(i in 1:length(l))
        {
     avg <- mean(USArrests[[l[i]]])

        print(paste("Average number of ", l[i], " ", avg))
    }
}
el2("Murder","Assault")
mean(USArrests$Assault)
el2(1,2,3,4)

#DOT DOT DOT
D1 <- function(...){

    list(...)
}
p1 <- D1(1,2,3,4)
p2 <- D1("rose","sam","Frodo")
p1
p2

#EXAMPLE FOR SHOWING YOU NEED TO EXECUTE EVERY TIME. ADD \n
reps <- function(num) {
    for(i in seq_len(num)){
        cat("Hello\n")
    }

}
reps(5)

#ATTRIBUTES
f1 <- function(x,y)
{
    x+y
    #comment comment
}
f1(1,2)
formals(f1)
body(f1)
environment(f1)

attributes(f1)
attr(f1, "srcref")
body(f1)

f_name <- funtion()


#ANONYMOUS FUNCTIONS
iris
lapply(iris, function(x) length(unique(x)))
integrate(function(x) x^2, 0, 25)

#LISTS

LF <- list(
    nraise  = function(x,n) x^n,
    nroot = function(x,n) (round(x^(1/n),2)))  #use = not <-
LF$nraise(5,3)
LF$nroot(342,7)

#DO.CALL
c1 <- 1:10
c1
is.numeric(c1)
mean(c1)
c2 <- list(1:10)
c2
mean(c2)
is.numeric(c2)
do.call(mean, c2)


#FUNCTION CALLS - NESTED, INTERMEDIATE OBJECTS, PIPING
x <- 1:100
x
p <- sqrt(log(x)) #suitable for short sequences
q <- log(x)
plot(q)
q <- sqrt(q) #if intermediate objects are used anywhere
r <- x%>%log()%>%sqrt() # x%>%f() equivalent to f(x); suitable for longer sequences
p
q
r


#LEXICAL SCOPING
ls1 <- 1
ls2 <- 2
ls3 <- 3
#NAME MASKING
l_scope1 <- function()
{
    ls1 <- 10
    ls2 <- 20
    c(ls1,ls2)
}
l_scope1()
ls1
ls2
l_scope2 <- function() {
    ls2 <-33
    c(ls1,ls2)
}
l_scope2()
ls1
ls2
l_scope3 <- function() {
    ls2 <- 20
    ls3 <- 30
    l <- function(){

        ls3 <- 300
        c(ls1,ls2,ls3)
    }
    l()
}
l_scope3()
#Functions vs variables: Functions are ordinary objects; scoping rules applying to variables apply to functions
l_s1 <- function(x) x + 1
l_s2 <- function()
{
    l_s1 <- function(x) x + 100
    l_s1(20)

}
l_s2()
l_s1(20)

#Fresh start
a <- function(){
if(!exists("ddsf"))
{
  ddsf <- 10
}
else
{
  ddsf <- ddsf+10
}
ddsf
}
a()
a()

#Dynamic lookup - where not when to look for values. R looks for values when function is run, not created.


#WRAPPER FUNCTION
path1 <- "/home/aishani/2022_resources/perfv-1.csv"
path2 <- "/home/aishani/2022_resources/perfv-2.csv"
path3 <- "/home/aishani/2022_resources/hhfv201920.csv"
p1 <- read.csv(path1, sep="|", header=TRUE)
p2 <- read.csv(path2, sep="|", header=TRUE)
hh <- read.csv(path3, sep="|", header=TRUE)
as.data.table(p1)
as.data.table(p2)
as.data.table(hh)
#read.my is a wrapper for read.csv
read.my <- function(path)
{
   read.csv(path, header = TRUE, sep = "|")
}

p4 <- read.my(path1)
p4 <- as.data.table(p4)
p4

#RETURN VALUE
eval_ret <- function(a,b)
{
    num1 <- a + b
    num2 <- a-b
   # a-b
   return(num1)
   return(num2)
    mylist <- list("add" =  num1, "sub" =  num2)
    return(mylist)
}
eval_ret(8,5)
eval_ret(8,5)[[1]]
eval_ret(8,5)[[2]]

#RETURN: IMPLICIT AND EXPLICIT, INVISIBLE AND VISIBLE

ret1 <- function(x)
{
    if(x<50){0}
    else {1}
}
ret1(75)
ret2 <- function(x)
{
    if(x<50){return(0)}
    else{return(1)}
}
ret2(80)
ret3 <- function()(1)
ret3()
ret4 <- function() invisible(1)
ret4() #1 not printed automatically
ret5 <- function(x1) #invisible(x1)
{
    x1*x1
}
ret5(5)
a <- 2 #returns invisibly
(a <- 2) #returns visibly
#PREFIX
p1 <- function(a,b,c)
{
    list(a1 = a, b1 = b, c1 = c)
}
p1("dog", "cat","mouse")
p1(1,2,3)
p1(1,2,a=5)

#INFIX FUNCTION
'%sqGreater%' <- function(a,b){
    if(a*a <b) print(paste(a , " squared is lesser than ", b))
    else print(paste(a, " squared in not lesser than ", b))
}

4%sqGreater%20

'%Greater%' <- function(a, b)
{
  if(a > b) print(a)
  else if(b > a) print(b)
  else print("equal")
}
'%sqGreater%' <- function(a,b){
    if(a*a <b) print(paste(a , " squared is lesser than ", b))
    else print(paste(a, " squared in not lesser than ", b))
}
5%Greater%7
 #REPLACEMENT FUNCTION; SPECIAL NAME: xxx<-
l1 <- c("rose","peony","iris","sunflower","orchid")
'second<-'  <- function(x, value)
{
    x[2] <- value
    x
}
second(l1) <- "daisy"
l1
tracemem(l1)
l2 <- 1:10
l2
second(l2) <- 5L
l2

#RECURSIVE FUNCTION

recursive.factorial <- function(x)
{

    if (x == 0)    return (1)
    else           return (x * recursive.factorial(x-1)) #recursion
}
recursive.factorial(5)

#FUNCTION AS ARGUMENT
fun <- function(x, fun2)
{
    return(fun2(x))
}
fun(c(1:10), sum)


help('print')

library(dplyr)
library(data.table)
path <- "~/foodprices.csv"
CQGR <- function(a) #a = commodity. For eg. Bajra.
{
    data <- as.data.table(read.csv(path, header = TRUE, sep = "|"))
    data <- data[Commodity%in%a,]
    data <- setorder(data, Year)
    data$lagged_price <- shift(data$price, 3)
    data$GR <- (data$price/data$lagged_price)^(1/3)-1
    data <- data%>% mutate(Month = factor(Month, levels = month.name) ) %>% arrange(Month)
    data$GR[is.na(data$GR)] <- 0
    return(data$GR) #returns CQGR
}
CQGR("Bajra")
CAGR <- function(a) #a = commodity. For eg. Bajra.
{
    data <- as.data.table(read.csv(path, header = TRUE, sep = "|"))
    data <- data[Commodity%in%a,]
    data <- data%>% mutate(Month = factor(Month, levels = month.name) ) %>% arrange(Month)
    data$lagged_price <- shift(data$price, 1)
    data$GR <- (data$price/data$lagged_price)^(1/12)-1
    data <- data[!Year%in%"2001"]
    data$GR[is.na(data$GR)] <- 0
    return(data$GR) #returns CAGR
}
