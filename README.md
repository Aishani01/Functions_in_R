# Functions_in_R

FUNCTIONS
Functions have 3 parts: arguments, body, and environment.
formals() -- list of arguments, control how you call function
body() -- code inside the function
environment(), the data structure that determines how the function
finds the values associated with the names.
While the formals and body are specified explicitly when you create a func-
tion, the environment is specified implicitly, based on where you defined the
function. The function environment always exists, but it is only printed when
the function isn’t defined in the global environment.

Functions are created using the function() directive and are stored as R objects just like anything else. 
In particular, they are R objects of class “function”.
f <- function(<arguments>) {
## Do something interesting
}
The return value of a function is the last expression in the function
body to be evaluated.

FUNCTIONS - FIRST CLASS OBJECTS
They can be treated much like any other R object. 
Functions can be passed as arguments to other functions
Functions can be nested, so that you can define a function inside of another function
There is no special syntax for defining and naming a function:
You simply create a function object (with function) and bind it to a name with <-
ANONYMOUS
LIST
DO.CALL
CALLING FUNCTIONS

LEXICAL SCOPING
Lexical Scoping is a set of rules that helps to determine how R represents the value of a symbol. 
Lexical scope - where not when to look for values. R looks for values when function is run not created.
R uses lexical scoping2: it looks up the values of names based on how a function is defined, not how it is called.
Name masking - names defined inside mask names defined outside
LAZY EVALUATION
Lazy evaluation is a programming strategy that allows a symbol to be evaluated only when needed.
Lazy evaluation is implemented in R as it allows a program to be more efficient when used interactively: only the necessary symbols are evaluated, that is to say that only the needed objects will be loaded in memory and/or looked for. 

EXITING FUNCTION
Return.
 Implicit vs explicit
 Visible vs invisible 
Error.
Exit handlers - allows you to run code when a function exits

4 types of function forms: prefix, infix, replacement, special
Any call can be written in prefix form
GOOD PRACTICE
Naming convention
When to use? You should consider writing a function whenever you’ve copied and pasted a block of code more than twice.
Why use?
It’s easier to start with working code and turn it into a function; it’s harder to create a function and then try to make it work.
Types of function in R Language

    Built-in Function: Built function R is sq(), mean(), max(), these function are directly call in the program by users.
    User-defined Function: R language allow us to write our own function.
    
    Remember that there are also functions that don’t carry names; These are called “anonymous functions”.

Make sure that the name that you choose for the function is not an R reserved word. This means that you, for example, don’t want to pick the name of an existing function for your own UDF, because it can cause you a lot of headaches since R will not know whether you mean your recently defined UDF or the existing function that was loaded with one of the libraries.

One of the ways to avoid this is by using the help system: if you get some information back by entering {r eval=FALSE} ? OurFunctionName, you know it is better not to use that name because it has already been taken.

Note that it’s still possible to take the name of an existing function for your own UDF but that it’s not recommended; It will require you to hide the one function from the other!
As shown in the figure above, an essential feature of functions is that the variables used within are local. This means that, for example, their scope lies within -and is limited to- the function itself and are therefore invisible outside the function body.

Clearly, functions need a way to communicate to the external world, typically the piece of code that calls them, by means of one or more arguments (the ‘input’) and one or more values that the function returns to the caller (the ‘output’).
