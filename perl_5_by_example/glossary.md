# Glossary

## Abstraction

The principle of abstraction means 
that information can be accessed in a way that isolates how data is stored from 
how it is accessed and used. 
<P>See also Classes, Encapsulation, Inheritance, and Polymorphism. 

## Alternation

Alternation is the term used when a 
regular expression pattern chooses between two or more choices. For example, 
*m/one|two|three/* will match if the string in *$_* contains any 
one of the three character sequences: *one*, *two*, or 
*three*. 
<P>See also Regular Expression. 

## Alternative Quotes

Perl has three distinctive types of quotes: single-quotes('), double-quotes("), and 
back-quotes(`). If you'd like to be a bit more explicit in quoting, you can use 
the alternates that are also provided: q() for single-quotes, qq() for 
double-quotes, and qx() for back-quotes. For example, *q(This)* is 
equivalent to *'This'*. Perl also has a alternative mechanism that can be 
used to quote a lot of small single words. For example, *qw(one, two, 
three)* is equivalent to(*'one', 'two', 'three')*. 

## Anchor

See Pattern Anchor.

## Anonymous Functions and Variables

It is often very useful to create a function or variable 
without identifying names; these programming elements are called anonymous. You 
allude to them using references. For example, if you initialize *$foo* 
using *$foo = { 'John' => 10, 'Karen' => 20}*, then *$foo* 
becomes a reference to the anonymous hash. You access the hash entries by 
dereferencing *$foo*. For example, *@{$foo}{'John'}* is equal to 
*10*. 
<P>See also Reference and Dereference. 

## ANSI

ANSI refers to the American National Standards 
Institute. ANSI serves to administer and coordinate the U.S. private sector 
voluntary standardization system. Founded in 1918 by five engineering societies 
and three government agencies, the Institute remains a private, nonprofit, 
membership organization supported by a diverse constituency of private and 
public sector organizations. Their home page is 
<B>http://www.ansi.org/home.html</B> and you can find many references to the 
different standards there. The American National Standards Institute is located 
at 11 West 42<SUP>nd</SUP> Street, New York, New York 10036(Telephone:(212) 
642-4900; Telefax:(212) 398-0023). 
<P>See ASCII. 

## Argument

See Parameter. 

## Array

An array is a collection of values stored as a 
unit. I think of an array in the same way that I think of a list because both 
are composed of many things. An array can be composed of numbers, strings, 
hashes, or even other arrays. A basic array assignment looks like this: 
*@array =(1, 2, 'Three', 4);*. 

## Array Context

See Context(Array & Scalar).

## Array Range

A range is a shorthand method for 
generating consecutive elements of an array. For example, *@array 
=(1..6)* is equivalent to *@array =(1, 2, 3, 4, 5, 6)*. You can also 
create letter ranges-Perl will automatically generate the missing letters. For 
example, *@array =('AA'..'AD')* is equivalent to *@array =('AA', 'AB', 
'AC', 'AD')*. 

## Array Slice

A slice is a shorthand method for 
specifying specific elements of an array. Instead of specifying one index inside 
the square brackets, you can specify multiple indexes. You can either assign the 
result of a slice of another array variable or assign new values to the 
specified elements. For example, *@array[0, 6]* refers to the 
1<SUP>st</SUP> and 7th elements in the array. *@array[0..4]* refers to 
the elements from 0 to 4-five in all. Slice assignments look like this: 
*@array[0..2] = @foo;* or *@array[0..2] =('one', $two, 'three');*. 

## Array Splice

A splice is a way to modify an 
array variable to add, delete, or replace elements. See the description of the 
*splice()* function in Appendix D, "<A 
href="xp0d.htm">Function List</A>." 

## ASCII

ASCII is a bit-mapped character set standard for 
interchanging text encoded with 7-bits in an 8-bit byte. The ASCII standard was 
created by the American National Standards Institute(ANSI). Each character maps 
directly to a number from 0 to 127. For example, the letter 'A' is numbered 65 
and 'a' is numbered 97. Generally, these numbers are displayed in hexadecimal 
format. For example, the letter 'A' is 0x41 and 'a' is 0x61. While ASCII is 
satisfactory for displaying the English language, it is not considered adequate 
for non-English languages because the 128 character choice is too limiting. For 
instance, many European langugaes use accented characters which ASCII can't 
easily handle. 
<P>See also ANSI. 

## Assignment

An assignment statement stores a value 
into a variable. For example, *$foo = 4* stores the value of *4* 
into the *$foo* variable. The left side of the statement must be an 
lvalue-something that ultimately will resolve to a memory location where the 
storage will take place. 
## Associative Array

An associative array-also called a hash-uses strings as indexes instead of numbers; for 
example, *$hash{'david'}* or *$hash{'Larry Wall'}*. Note that 
hashes use curly brackets around the index while arrays use square brackets. 

## Associativity (left-to-right & right-to-left)

Every Perl operator and function has a tendency to 
favor its left or right when looking for operands. If the operator looks left 
first-like the string concatenation operator-then it has left associativity. If 
it looks right first-like the minus sign-then it has right associativity. 

## awk

*awk* is a UNIX-based utility that scans 
input lines for a specific pattern. Perl has most, if not all, of the abilities 
of *awk*. 
<P>See also Pattern. 

## Backtracking

Backtracking happens when the 
internal routines that perform pattern matching head down the wrong path when 
looking for a pattern. Since the current path-the set of characters being 
searched-is wrong, a new path needs to be found. Because this process is 
internal to Perl, you don't need to worry about the details. If you want to know 
more, please see the documentation that came with your Perl distribution. 
<P>See also Regular Expression. 

## Binary Mode

When using files, you can use 
either binary mode or text mode. Binary mode means that Perl will not change 
your input or output in any way. By the way, this is my preferred mode of 
operation. Text mode-only available on some operating systems like Windows 95 
and Windows NT-will convert newline/carriage return character pairs into a 
single newline. It will also interpret any byte that has a value of 26 as the 
end-of-file marker. 

## Bitwise Operations

Bitwise operators 
view values at the bit level. Usually, Perl looks at the entire value. However, 
bitwise operators will see a value of 15 as a series of ones and zeros.Chapter 
4, "<A href="ch04.htm">Operators</A>" , talks about 
bitwise operators and how they can be used. 

## Block

A block of code is a series of statements 
surrounded by curly braces. Code blocks can be viewed as single-pass loops. 
Using the *my()* function inside a code block will create a variable 
local to that block. 
<P>See also Scope. 

## Call by Reference

Many functions need 
information before they can do their work. This information is given to 
functions in the form of parameters. For example, in the function call 
*foo('one', 'two')*, the strings *'one'* and *'two'* are 
parameters. When parameters are passed to the function by reference, the 
function can modify the parameters and the change can be seen by the calling 
function or program. For example, *foo(\$result)* passes a reference to 
the $result variable into the *foo()* function. Inside the function, the 
reference can dereferenced to get at and modify the value of *$result*. 
<P>See also Call by Value. 

## Call by Value

Many functions need 
information before they can do their work. This information is given to 
functions in the form of parameters. For example, in the function call 
*foo('one', 'two')*, the strings *'one'* and *'two'* are 
parameters. When parameters are passed to the function by value, changes to the 
value inside the function are not seen outside the function. 
<P>See also Call by Reference. 

## Character Classes

A character class-used in pattern matching-defines a type of character. The character class 
[0123456789] defines the class of decimal digits. And [0-9a-f] defines the class 
of hexadecimal digits. [](./regular-expressions.md), discusses 
character class in detail. 
<P>See Regular Expression. 

## Child Process

Some operating systems-such as 
UNIX-let your program create clones of itself using the *fork()* 
function. These clones are called child processes or sub-processes. Child 
processes are frequently used by server processes. For example, you might fork a 
process(create a child process) to handle multiple request on a single socket. 

## Class

A class is a combination of variables and 
functions designed to emulate an object. An object can be anything you want it 
to be-a pen, an ATM machine, a car, whatever. The class's variables(also called 
properties) and functions(also called methods) are the computer's way of 
modeling the object. See [](./objects.md) for more information. 
<P>See also Encapsulation, Inheritance, Polymorphism. 

## Client/Server

Client/Server is a buzzword that 
is past its prime. Use object-oriented or rad, instead. Seriously though, C/S 
refers to the concept of splitting the workload for a given task. Typically, the 
work is broken into user-interface tasks(like presenting information and 
inputting information) and back-end tasks(querying databases, printing reports, 
and sorting information). A standard C/S Internet application would use a web 
browser for the client and a cgi-enabled Web server as the server. 

## Command-line Options

Perl has several 
options you can control when invoking your Perl script. They are called 
command-line options because you add them to the command that invokes Perl. For 
example, in the command *perl -w test.pl*, the *-w* is a 
command-line option which causes Perl to display messages about questionable 
code. [](./cli.md), has a description of all of the available options. 

## Compiler

A compiler reads your program code and 
converts it into another form-typically, a language that your CPU can directly 
understand. The secondary form is sometimes written to disk in the form of an 
executable file; however, this is not always the case. In fact, Perl does not 
currently create executable files-although some people are researching this 
topic. 
<P>See also Interpreter. 

## Compile-time Error

The errors caught during the compilation phase are called compile-time errors. When the compiler 
converts a program to an internal format, it checks for syntax errors and, if 
the *-w* option is turned on, questionable coding practices. 

## Concatenation

Concatenation consists of taking 
two things and sticking them together. The operation is frequently used with 
strings. In fact, Perl has its own concatenation operator-the period; for 
example, *'one' . 'two'* is equivalent to *'onetwo'*. 

## Constant

In programming circles, a constant is a 
value that doesn't change. Constants are very similar to variables because both 
use a name to refer to a memory location that holds a value. The exception is 
that, with constants, that value can't change; with variables, it can. Normally, 
trying to change a constant would generate a compile-time error. Unfortunately, 
Perl does not have true constants, but you can emulate them by initializing a 
variable and then never assigning a second value to it. Some programmers like to 
emulate constants by using a function to return a value. This works, but it is 
very, very slow. 

## Constructor

Classes use constructor functions to 
create an object. This is usually done by creating an anonymous hash and storing 
the classes properties inside the hash as entries. Most constructor functions 
are named *new()*. 
<P>See also Classes, Deconstructor. 

## Context(Array & Scalar)

Sometimes you can control the type of value-either array or 
scalar-that is returned from a function. If you place parentheses around the 
function call, the return value will be placed in an array(of course, it might 
only be a one-element array). Function calls that are themselves parameters to 
another function are usually evaluated in an array context also. You can use the 
*scalar()* function to create a scalar context. This is valuable when 
determining the size of an array. For example, *scalar(@array)* will 
return the number of elements in @array. 
<P>Functions can use the *wantarray()* function to determine their own 
calling context. Appendix D, "<A 
href="xp0d.htm">Function List</A>", has an example 
that uses the *wantarray()* function. 

## Control Characters

Control characters are characters that control devices-like the display. For example, displaying 
the value 7 usually causes a beep to sound. The control values map directly onto 
the English alphabet. Therefore, a value of 7 is Control G-also written as 
Ctrl+G or ^G. 

## CR

CR is the abbreviation for carriage return. A CR is 
represented by \r in strings. The carriage return can also be referred to as 
Ctrl+J, ^J, 0x0a, or as an ASCII value of 10. 
<P>See also ASCII, Control Characters. 

## Database

A database is a grouping of related 
information. For example, your book collection might be one database and your 
stamp collection might be another. Each book or stamp would typically have its 
own record that contains information specific to that particular item. Records 
are broken into fields of information. For example, a book's title and the 
author's name might be fields in the records of the book collection. 

## Data Type

The data type is simply the type of 
information that a variable holds. Perl has four main data types: scalars, 
arrays, associative arrays or hashes, and references. 
<P>See also Scalars, Arrays, Hashes. 

## Debugger

Perl has a feature that lets you step line-by-line through your programs. This feature is called a debugger because it is generally used to find logic errors or bugs in your programs. [](./debugging.md), shows how to use the debugger. 

## Declaration

A declaration tells Perl that you 
want to use a variable. Most languages require you to declare the variables that 
you intend to use. This enables the compiler to perform some optimizations and 
perhaps see if you use a variable incorrectly. Perl does not require and does 
not have any declaration statement-the closest thing is the *my()* 
function. 

## Deconstructor

Deconstructor functions are used by classes to clean up after you are done with an object. You might need to 
close a socket or file, or to write some log messages. All deconstructor 
functions are named *DESTROY()*. 
<P>See also Classes, Constructor. 

## Defined

A defined variable is one that has been initialized with a value. 

## Delimiter

A delimiter is used to tell when one 
thing ends and another begins. Delimiters are widely used in text-based 
databases to separate one field from another. For example, in the string 
*"one:two:three"* the colon is the delimiter. You can break a string into 
components based on a delimiter using the *split()* function; you can put 
the string back together again using the *join()* function. 

## Dereference

A reference is a scalar that points 
to a value. The act of dereferencing means to follow the link to arrive at the 
value. For example, you can create a reference with the following *$foo = 
\10;*. This makes *$foo* a reference to an anonymous literal value of 
10. Printing *$foo* prints the value of the reference. To get at the 
value, you need to dereference $foo like this *${$foo}*. The symbol in 
front of the curly brace depends on the type of reference. Use $ for scalars, @ 
for arrays, and % for hashes. 
<P>See also Reference. 

## Detail Line

You use detail lines to display information about individual items in reports. Reports can also have header, footer, sub-total, and total lines. [](./reports.md), has examples of how to prepare reports. 

## Diamond Operator

The diamond operator(<>) is used to read a line of input from a file. Some operating systems, like UNIX, can use the diamond operator to read from sockets. [](./files.md) has examples that use the diamond operator. 

## Directory

Directories are used by operating 
systems and users to group files in a hierarchical or tree fashion. See your 
system's documentation for more information. 

## Dotted Decimal Address

All Internet 
servers have a Internet Protocol(IP) address that consists of 4 numbers 
connected by dots. For example, 207.3.100.98 is the IP address of my personal 
server. Please don't try connecting to it though; my IP address changes every 
day. 

## Empty Strings, Arrays, Lists, and Hashes

Empty strings have no characters and have a length and 
value of zero. They are literally represented by *""*. Empty arrays have 
no elements and are literally represented by(). Empty hashes have no entries and 
are literally represented by {}. If you have a variable that contains a large 
string, you can free up or release memory by assigning the empty string to it. 
You can use the same technique to release memory used by arrays and hashes. 

## Encapsulation

Encapsulation means that the 
information about an object(its properties) and functions that manipulate that 
information(its methods) are stored together. 
<P>See also Abstraction, Classes, Inheritance, Polymorphism. 

## Encryption

Encryption is the act of changing 
plain text into text which is not readable. Encryption is enables you to to 
store text while ensuring that it is safe from prying eyes. 

## Endless Loop

See Infinite Loop

## Environment Variables

Environment variables are stored by the operating system. You can change and/or add 
environment variables on a per-process basis. Any changes made to environment 
variables will be passed on to child processes, but, when your process ends, the 
changes go away. 

## EOF

EOF stands for end-of-file. UNIX uses a character 
value of 4 to represent the end-of-file, and DOS/Windows uses a value of 26. 
These end-of-file values are ignored in binary mode. 
<P>See also Binary Mode. 

## Escape Sequence

In Perl, some letters and 
characters can have more than one meaning depending on the situation in which 
they are used. The period could mean to match any character in a regular 
expression or it could simply be needed to represent a period. You can force 
Perl to use a literal context by placing a slash(\) in front of the character to 
create an escape sequence. For example, *\.* means that a regular period 
should be matched in a regular expression pattern. This simple definition is 
complicated by the fact that some escape sequences have meanings all their own. 
For example, *\t* indicates the tab character.<B> See</B> Table 2.1 in 
[](./literals.md), for a list of all of the special escape sequences. 

## Expression

An expression is one or more operands 
connected by one or more operators. The operands can be either literal values, 
variables, or functions. For example, *$foo* is an expression. *$foo 
+(34 * bar())* is also an expression. Expressions can be arbitrarily 
complex. 
<P>See also Statement. 

## FF

FF is the abbreviation for form feed or page eject. 
This character is typically sent to a printer to force a page ejection. A FF is 
represented by \f in strings. The form feed can also be referred to as Ctrl+L, 
^L, 0x0b, or as an ASCII value of 12. 
<P>See also ASCII, Control Characters. 

## Field

See Database. 

## Filehandle

You use a filehandle to let your 
program access files. It is essentially a pointer to an internal data structure 
maintained by the operating system. Perl naming conventions indicate that all 
filehandles should have names that use all capitals. 

## Footer

You use footer lines to display information at 
the bottom of the page in reports. Reports can also have header, detail-line, 
sub-total, and total lines. See [](./reports.md) for more information. 

## Formats

You use formats to control a report's 
appearance. You can specify both the static text and the variables that will be 
displayed in the report. [](./reports.md) shows you 
how to create reports. 

## ftp

ftp is an abbreviation for File Transfer Protocol. 
This protocol is used on the Internet to transfer files between two computers. 

## Function

See Procedure. 

## Globbing

You use globbing(what a funny word!) to 
expand a file specification into a list of matching files. For example, *.pl 
might be matched by *test.pl* and *foo.pl*. Use the 
*glob()* function to do your globbing. 

## Greedy Regular Expressions

Regular expressions are normally greedy-they try to find the 
longest sequence of characters that match a given pattern. For example, if you 
use *"qqBqqBqqB"* as your search space and */(qqB)+/* as your 
pattern, there are three matching possibilities. They are *"qqB"*, 
*"qqBqqB"*, and *"qqBqqBqqB"*. Perl will find the longest matching 
string, so *$&amp;* will be equal to *"qqBqqBqqB"*. You can 
reverse this behavior by adding a *?* to the pattern. For example, 
*/(qqB)+?/* will match *"qqB"*. Don't use the *** 
meta-character with the *?* meta-character because it will always match 
the empty string.

See also Regular Expression. 

## Grep

You use yhis utility to search files for patterns. 

## Hash

See Associative Array. 

## Header

Header lines are used to display information 
at the top of a report's page. Reports can also have footer, detail-line, 
sub-total, and total lines. [](./reports.md) shows you 
how to create headers for your reports. 

## Here Documents

You use a here document to specify input to a variable or function. It is typically used with the 
*print()* functon. An example will explain better than words: 

```
print <<"_END_";
This is the first line of output.
The value of \$foo is $foo.
This is the third line of output.
_END_

print("This is the fourth line of output\n");
```

The syntax for here documents is both freeform and rigid. The ending label must be immediately to 
the right of the << symbol and must be enclosed in quotes. The ending 
label-after the document-must be by itself on a line and at the beginning of the 
line. 
<P>Here documents are useful if you need to output a lot of lines at one time. 

## Hexadecimal

Hexadecimal refers to numbers using base 16. 

## Infinite Loop

See Endless Loop. 

## Inheritance

This is an object-oriented term that means that one object inherits properties and methods from another object in a 
parent-child relationship. 
<P>See also Abstraction, Classes, Encapsulation, Polymorphism. 

## Initialization

Initialization is the act of 
assigning a value to a variable for the first time or it can also be a series of 
actions taken to create a situation. For example, the initialization phase of a 
socket program would include getting the protocol and port number, determining 
the remote server's address, and creating and binding a socket. 

## Interpolation

Interpolation means the replacement of a variable name with its value. For example, if *$foo* 
equals *"dinner"* then *"big $foo"* is equal to *"big 
dinner"*. 

## Interpreter

An interpreter executes your program 
without first creating an executable file. It interprets your program into the 
language of the CPU, on-the-fly. Compilers and interpreters do a lot of the same 
work. However, since interpreters can't create executable files, the source code 
must always be available to users. 
<P>See also Compiler. 

## Inter-process Communication

You use inter-process communication, or IPC, when two or 
more processes need to communicate. The communication can take place using 
databases, shared memory, semaphores, or sockets. 

## I/O

I/O is an abbreviation for Input/Output. 

## IPC

See Inter-process Communication. 

## Key-value Pair

Each entry in a hash is a key-value pair. The key is used as the index to retrieve the value. 

## Label

You use labels to mark locations in your program 
to which you need to return. Typically, you label the outer loop in a nested 
series of loops so that you can jump out of the inner loops if needed. 

## LF

LF is the abbreviation for linefeed or newline. A LF 
is represented by \n in strings. The linefeed can also be referred to as Ctrl+M, 
^M, 0x0d, or as an ASCII value of 13. 
<P>See also ASCII, Control Characters. 

## Library

A library is a file that groups related functions together. Libraries are loaded into your program using the 
*require* compiler directive. [](./modules.md) talks a little bit about libraries. 

## List

See Array. 

## Literal

A literal is a value that is represented "as is" in your source code. There are four types of Perl literals: Number, Strings, Arrays, and Hashes. [](./literals.md), shows many examples of literals. 

## Loop

A loop is a series of statements that are executed more than once. Each loop has a control mechanism to stop looping. [](./control-statements.md) discusses the different types of looping and controls that are used. 

See also Endless Loop 

## Meta Characters

Meta characters are characters that have more than one meaning inside regular expressions. [](./regular-expressions.md) has an in-depth discussion of meta-characters.

See also Regular Expressions. 

## Module

A module is a file that holds a related group of functions-such as a library. However, modules are a bit more complex. Modules can control which function and variable names get exported from the module namespace into the main namespace. See [](./modules.md) for more information. 

## Namespace

Namespaces are used to segregate 
function and variable names. Each data type has its own namespace. This means 
that you can use the same variable name for different data types. For example, 
*$foo*, *@foo*, and *%foo* are different data types with 
the same name. You can create your own namespace with the *Package* 
keyword. See [](./objects.md) for more information. 

## Object

See Class. 

## Octal

Octal refers to numbers using base 8. 

## Operator

The operators in a computer language tell the computer what actions to perform. For example, the plus sign(+) is an 
operator. 

## Parameter

Some functions need outside information before they can perform their tasks. The outside information is called a 
parameter. For example, the *print()* function needs to know what it 
should print and where. 

## Polymorphism

Polymorphism is a term from the object-oriented world. It means that a child class can redefine a method already defined in the parent class. [](./objects.md) discusses polymorphism. 

## Port

A port is the address of a socket on an Internet 
server. In addition to the server address, each socket also needs a port number. 
The port number is added to the end of the server address to create a full 
address. For example, www.locked.com:80 is a full Internet address that 
specifies a port number of 80. 

## Precedence

Every Perl operator and function has an associated priority. This priority or precedence level tells Perl which operators should be evaluated first. [](./operators.md) lists all of the operators and their priorities. 

## Procedure

Functions, procedures, routines, and 
subroutines are all basically the same thing-a set of statements that are 
grouped together for a common cause. If you like to be picky, functions are 
routines that return values while subroutines don't return values. Procedure is 
the generic name used to refer to both functions and subroutines. 

## Protocol

A protocol is a set of agreed-upon 
commands and responses. The Internet has a plethora of protocols that you can 
use. [](./internet-resources.md) for information about how to find more information. 

## Range

See Array Range. 

## Record

See Database. 

## Reference

A reference is a scalar value that points to a memory location that holds some type of data. See [](./references.md) for more information. 

## Regular Expression

A Regular Expression is used to find patterns in strings. See [](./regular-expressions.md) for more information. 

## Return Value

All Perl functions return a value when they are finished. The return value is the value of the last executed 
statement or you can use the *return()* to explicitly state it. You may 
always choose to ignore the return value by not assigning the function call to a variable. 

## Run-time Error

Run-time errors happen while your program is executing. Run-time errors are logic errors and therefore 
usually harder to track down than compile-time errors. 

## Scalar

A scalar variable can hold one string or number value at a time. [](./variables.md) shows you how scalars can be used. 

## Scalar Context

See Context(Array & Scalar). 

## Scope

Normal Perl variables can be used by any 
function and therefore are said to have a global visibility or scope. You can 
create variables that are local to a particular function or block of code with 
the *my()* function. These variables have a local scope. 

## Short-circuit Operators

The *&&* and *||* operators are considered short-circuit 
operators because the second operand might not be evaluated. For example, in the 
statement *0 &amp;&amp; die();* the *die()* function will not be 
executed. However, in the statement *0 || die();* the *die()* 
function will be executed. 

## Signals

A signal is a message sent to your program by the operating system. When a signal is received by your program, it interrupts the normal flow of execution. If you don't have a signal handler function defined, default internal functions will be called. See [](./errors.md) for more information. 

## Slice

See Array Slice. 

## Socket

A socket is the end link of a connection between two computers. The first step to using any of the Internet protocols is to create a connection to another computer using the socket functions. Then, you can send and receive information over the sockets. See [](./internet-protocols.md) for more information. 

## Splice

See Array Splice. 

## Stack

A stack is a data structure that has the same 
properties as a stack of potato chips in a Pringles can. Only the top chip is 
accessible. And, therefore, two operations are possible: add a chip or remove a 
chip. A stack works exactly the same way. You can push a new item onto the stack 
or you can pop an item off the stack. 

## Statement

A statement is an expression with a semi-colon at the end. The semi-colon transforms an expression into an 
executable statement. 

## STDERR, STDIN, and STDOUT

*STDERR*, *STDIN*, and *STDOUT* are 
pre-defined filehandles that every program can use. You use *STDERR* to 
display error messages, usually on the computer's monitor. You use 
*STDIN* to get input, usually from the keyboard. And you use 
*STDOUT* to display messages, usually on the computer's monitor. 

## Subroutine

See Procedure. 

## Text Mode

When using files, you can use either binary mode or text mode. Binary mode means that Perl will not change your input 
or output in any way. This is my preferred mode of operation, by the way. Text 
mode-only available on some operating systems like Windows 95 and Windows 
NT-will convert newline/carriage return character pairs into a single newline. 
It will also interpret any byte that has a value of 26 as the end-of-file 
marker. 

## Undefined Value

The undefined value(*undef*) can be returned by functions to indicate an error 
condition. It is also the value returned when a non-existent hash entry is accessed. 

## Variable

A variable is a changeable piece of information used in computer programs. Typically, variables have a name and a 
data type. Perl variables can be scalars, arrays, or hashes. Every variable has 
a life-cycle. It gets created, used, and is then destroyed. Regular Perl 
variables are created when they are initialized and destroyed when the program 
ends. The *my()* function can create a variable that only exists inside a function or code block. 

## Whitespace

Whitespace is a term that refers to space, tab, and newline characters. These characters create white space on a 
page when printed. You can use the *\s* symbolic character class in 
patterns to match whitespace characters. 
