# Functions

<P>This chapter takes a look at <I>functions</I>. Functions are blocks of codes 
that are given names so that you can use them as needed. Functions help you to 
organize your code into pieces that are easy to understand and work with. They 
let you build your program step by step, testing the code along the way. </P>
<P>After you get the idea for a program, you need to develop a program outline - 
either in your head or on paper. Each step in the outline might be one function 
in your program. This is called <I>modular programming</I>. Modular programming 
is very good at allowing you to hide the details so that readers of your source 
code can understand the overall aim of your program. 
<P>For instance, if your program has a function that calculates the area of a 
circle the following line of code might be used to call it: <B><PRE>$areaOfFirstCircle = areaOfCircle($firstRadius);</PRE></B>By looking at the 
function call, the reader knows what the program is doing. Detailed 
understanding of the actual function is not needed. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Well thought out function and variable names help 
      people to understand your program. If the line of code was 
      <P><PRE>$areaFC = areaCirc($fRad);</PRE>Its meaning would not be as 
    clear.<BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Calling a function means that Perl stops executing 
      the current series of program lines. Program flow jumps into the program 
      code inside the function. When the function is finished, Perl jumps back 
      to the point at which the function call was made. Program execution 
      continues from that point onward.<BR></TD></TR></TBODY></TABLE>
<P>Let's look at the function call a little closer. The first thing on the line 
is a scalar variable and an assignment operator. You already know this means 
Perl assigns the value on the right of the assignment operator to 
<TT>$areaOfFirstCircle</TT>. But what exactly is on the right? 
<P>The first thing you see is the function name: <TT>areaOfCircle()</TT>. The 
parentheses directly to the right and no <TT>$</TT>, <TT>@</TT>, or <TT>%</TT> 
beginning the name indicates that this is a function call. Inside the 
parentheses is a list of parameters or values that get passed to the function. 
You can think of a parameter just like a football. When passed, the receiver 
(for example, the function) has several options: run (modify it in some way), 
pass (call other routines), fumble (call the error handler). 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Perl allows you to use the <TT>&amp;</TT> character 
      to start function names, and in a few cases it is needed. Those few 
      situations that the <TT>&amp;</TT> character is needed are beyond the 
      scope of this book.<BR></TD></TR></TBODY></TABLE>
<P>Listing 5.1 shows a short program that calls and defines the 
<TT>areaOfCircle()</TT> function. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign $areaOfFirstCircle the value that is returned by the function 
      areaOfCircle(). 
      <P>Print $areaOfFirstCircle. 
      <P>Define the areaOfCircle() function. 
      <P>Get the first parameter from the @_ parameter array. 
      <P>Calculate the area and return the new 
value.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 5.1-05LST01.PL - Calculating the Area of a 
    Circle</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>$areaOfFirstCircle = areaOfCircle(5);
print("$areaOfFirstCircle\n");

sub areaOfCircle {
    $radius = $_[0];
    return(3.1415 * ($radius ** 2));
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program prints: <B><PRE>78.5375</PRE></B>The fact that something prints tells you that the program 
flow returned to the print line after calling the <TT>areaOfCircle()</TT> 
function. 
<P>A function definition is very simple. It consists of: <B><PRE>sub functionName {
}</PRE></B>That's it. Perl function definitions never get any more complex. 
<P>The complicated part comes when dealing with parameters. <I>Parameters 
</I>are values passed to the function (remember the football?). The parameters 
are specified inside the parentheses that immediately follow the function name. 
In Listing 5.1, the function call was <TT>areaOfCircle(5)</TT>. There was only 
one parameter, the number 5. Even though there is only one parameter, Perl 
creates a parameter array for the function to use. 
<P>Inside the <TT>areaOfCircle()</TT> function, the parameter array is named 
<TT>@_</TT>. All parameters specified during the function call are stored in the 
<TT>@_</TT> array so that the function can retrieve them. Our small function did 
this with the line: <B><PRE>$radius = $_[0];</PRE></B>This line of code assigns the first element of 
the <TT>@_</TT> array to the <TT>$radius</TT> scalar. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Because parameters are always passed as lists, Perl 
      functions are also referred to as list operators. And if only one 
      parameter is used, they are sometimes referred to as unary operators. 
      However, I'll continue to call them functions and leave the finer points 
      of distinction to others.<BR></TD></TR></TBODY></TABLE>
<P>The next line of the function: <B><PRE>return(3.1415 * ($radius ** 2));</PRE></B>calculates the circle's area and 
returns the newly calculated value. In this case, the returning value is 
assigned to the <TT>$areaOfFirstCircle</TT> scalar variable. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>If you prefer, you don't need to use the 
      <TT>return()</TT> function to return a value since Perl automatically 
      returns the value of the last expression evaluated. I prefer to use the 
      <TT>return()</TT> function and be explicit so that there is no mistaking 
      my intention.<BR></TD></TR></TBODY></TABLE>
<P>You may have used programming languages that distinguish between a function 
and a subroutine. The difference being that a function returns a value and a 
subroutine does not. Perl makes no such distinctions. Everything is a function - 
whether or not it returns a value. 

## Example: Using the Parameter Array (@_>)

All parameters to a function are stored in 
an array called <TT>@_</TT>. One side effect of this is that you can find out 
how many parameters were passed by evaluating <TT>@_</TT> in a scalar context. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the firstSub() function with a variety of parameters. 
      <P>Define the firstSub() function 
      <P>Assign $numParameters the number of elements in the array @_. 
      <P>Print out how any parameters were 
passed.</TT></P></TD></TR></TBODY></TABLE><B><PRE>firstSub(1, 2, 3, 4, 5, 6);
firstSub(1..3);
firstSub("A".."Z");

sub firstSub {
    $numParameters = @_;
    print("The number of parameters is $numParameters\n");
}</PRE></B>This program prints out: <B><PRE>The number of parameters is 6
The number of parameters is 3
The number of parameters is 26</PRE></B>Perl lets you pass any number of 
parameters to a function. The function decides which parameters to use and in 
what order. The <TT>@_</TT> array is used like any other array. 
<P>Let's say that you want to use scalar variables to reference the parameters 
so that you don't have to use the clumsy and uninformative <TT>$_[0]</TT> array 
element notation. By using the assignment operator, we can assign array elements 
to scalars in one easy step. </P>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the areaOfRectangle() function with varying parameters. 
      <P>Define the areaOfRectangle() function. 
      <P>Assign the first two elements of @_ to $height and $width respectively. 

      <P>Calculate the area. 
      <P>Print the three variables: $height, $width and 
  $area.</TT></P></TD></TR></TBODY></TABLE><B><PRE>areaOfRectangle(2, 3);
areaOfRectangle(5, 6);

sub areaOfRectangle {
    ($height, $width) = @_;

    $area = $height * $width;

    print("The height is $height. The width is $width.
        The area is $area.\n\n");
}</PRE></B>This program prints out: <B><PRE>The height is 2. The width is 3.
        The area is 6.

The height is 5. The width is 6.
        The area is 30.</PRE></B>The statement <TT>($height, $width) = @_;</TT> 
does the array element to scalar assignment. The first element is assigned to 
<TT>$height</TT> and the second element is assigned to <TT>$width</TT>. After 
the assignment is made you can use the scalar variables to represent the 
parameters. 

## Example: Passing Parameters by Reference

Using scalar variables inside your functions is 
a good idea for another reason - besides simple readability concerns. When you 
change the value of the elements of the <TT>@_</TT> array, you also change the 
value of the parameters in the rest of the program. This is because Perl 
parameters are called by reference. When parameters are called by reference, 
changing their value in the function also changes their value in the main 
program. Listing 5.2 shows how this happens. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with 6 elements. 
      <P>Print the elements of the array. 
      <P>Call the firstSub() function. 
      <P>Print the elements of the array. 
      <P>Define the firstSub() function. 
      <P>Change the values of the first two elements of 
  @_.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 5.2-05LST02.PL - Using the @_ Array to Show Call by 
      Reference</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P><PRE>@array = (0..5);
print("Before function call, array = @array\n");
firstSub(@array);
print("After function call, array =  @array\n");

sub firstSub{
    $_[0] = "A";
    $_[1] = "B";
}</B></PRE></TT></PRE></TD></TR></TBODY></TABLE>
<P>This program prints: <B><PRE>Before function call, array =  0 1 2 3 4 5
After function call, array =   A B 2 3 4 5</PRE></B>You can see that the 
function was able to affect the <TT>@array</TT> variable in the main program. 
Generally this is considered bad programming practice because it does not 
isolate what the function does from the rest of the program. If you change the 
function so that scalars are used inside the function this problem goes away. 
Listing 5.3 shows how to redo the program in Listing 5.2 so that scalars are 
used inside the function. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with 6 elements. 
      <P>Print the elements of the array. 
      <P>Call the firstSub() function. 
      <P>Print the elements of the array. 
      <P>Define the firstSub() function. 
      <P>Assign the first two elements of @_ to $firstVar and $secondVar.P&gt; 
      Change the values of the scalar variables.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 5.3-05LST03.PL - Using Scalars Instead of the @_ Array inside 
      Functions</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>@array = (0..5);
print("Before function call, array = @array\n");
firstSub(@array);
print("After function call, array =  @array\n");

sub firstSub{
    ($firstVar, $secondVar) = @_;

    $firstVar = "A";
    $secondVar = "B";
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program prints: <B><PRE>Before function call, array =  0 1 2 3 4 5
After function call, array =   0 1 2 3 4 5</PRE></B>This example shows that the 
original <TT>@array</TT> variable is left untouched. However, another problem 
has quietly arisen. Let's change the program a little so that the values of 
<TT>$firstVar</TT> are printed before and after the function call. Listing 5.4 
shows how changing a variable in the function affects the main program. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign a value to $firstVar. 
      <P>Create an array with 6 elements. 
      <P>Print the elements of the array. 
      <P>Call the firstSub() function. 
      <P>Print the elements of the array. 
      <P>Define the firstSub() function. 
      <P>Assign the first two elements of @_ to $firstVar and $secondVar. 
      <P>Change the values of the scalar variables.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 5.4-05LST04.PL - Using Variables in Functions Can Cause 
      Unexpected Results</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>$firstVar = 10;
@array    = (0..5);

print("Before function call\n");
print("\tfirstVar = $firstVar\n");
print("\tarray    = @array\n");

firstSub(@array);

print("After function call\n");
print("\tfirstVar = $firstVar\n");
print("\tarray    = @array\n");

sub firstSub{
    ($firstVar, $secondVar) = @_;

    $firstVar = "A";
    $secondVar = "B";
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program prints: <B><PRE>Before function call
        firstVar = 10
        array    = 0 1 2 3 4 5

After function call
        firstVar = A
        array    = 0 1 2 3 4 5</PRE></B>By using the <TT>$firstVar</TT> variable 
in the function you also change its value in the main program. By default, all 
Perl variables are accessible everywhere inside a program. This ability to 
globally access variables can be a good thing at times. But it doesn't help when 
trying to isolate a function from the rest of your program. The next section 
shows you how to create variables that can only be used inside functions. 

## Example: Scope of Variables

<I>Scope</I> refers to the visibility of variables. In other 
words, which parts of your program can see or use it. Normally, every variable 
has a global scope. Once defined, every part of your program can access a 
variable. 
<P>It is very useful to be able to limit a variable's scope to a single 
function. In other words, the variable will have a limited scope. This way, 
changes inside the function can't affect the main program in unexpected ways. 
Listing 5.5 introduces two of Perl's built-in functions that create variables of 
limited scope. The <TT>my()</TT> function creates a variable that <I>only</I> 
the current function can see. The <TT>local()</TT> function creates a variable 
visible inside the current function and inside any functions that are called by 
the current function. If that sounds confusing, don't worry. It is confusing, 
but Listing 5.5 should clear things up. In this case, it's a listing that is 
worth a thousand words, not a picture! </P>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call firstSub() with two parameters. 
      <P>Define the firstSub() function. 
      <P>Assign the first parameter to local variable $firstVar. 
      <P>Assign the second parameter to my variable $secondVar. 
      <P>Print the variables. 
      <P>Call the second function without any parameters. 
      <P>Print the variables to see what changed. 
      <P>Define the secondSub() function. 
      <P>Print the variables. 
      <P>Assign new values to the variables. 
      <P>Print the variables to see that the new values were assigned 
      correctly.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 5.5-05LST05.PL - Using the Local and My Functions to Create 
      Local Variables</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>firstSub("AAAAA", "BBBBB");
print("done: firstVar  = $firstVar\n");
print("done: secondVar = $secondVar\n\n");

sub firstSub{
    local ($firstVar) = $_[0];
    my($secondVar)    = $_[1];

    print("firstSub: firstVar  = $firstVar\n");
    print("firstSub: secondVar = $secondVar\n\n");

    secondSub();

    print("firstSub: firstVar  = $firstVar\n");
    print("firstSub: secondVar = $secondVar\n\n");
}

sub secondSub{
    print("secondSub: firstVar  = $firstVar\n");
    print("secondSub: secondVar = $secondVar\n\n");

    $firstVar  = "CCCCC";
    $secondVar = "DDDDD";

    print("secondSub: firstVar  = $firstVar\n");
    print("secondSub: secondVar = $secondVar\n\n");
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program prints: <B><PRE>firstSub: firstVar = AAAAA
firstSub: secondVar = BBBBB

secondSub: firstVar  = AAAAA
Use of uninitialized value at test.pl line 19.
secondSub: secondVar =

secondSub: firstVar  = CCCCC
secondSub: secondVar = DDDDD

firstSub: firstVar  = CCCCC
firstSub: secondVar = BBBBB

Use of uninitialized value at test.pl line 3.
done: firstVar  =
done: secondVar = DDDDD</PRE></B>The output from this example shows that 
<TT>secondSub()</TT> could not access the <TT>$secondVar</TT> variable which was 
created with <TT>my()</TT> inside <TT>firstSub()</TT>. Perl even prints out an 
error message that warns about the uninitialized value. The <TT>$firstVar</TT> 
variable, however, can be accessed and valued by <TT>secondSub()</TT>. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>It's generally a better idea to use <TT>my()</TT> 
      instead of <TT>local()</TT> so that you can tightly control the scope of 
      local variables. Think about this way - It's four in the morning and the 
      project is due. Is that the time to be checking variable scope? No, using 
      <TT>my()</TT>enforces good programming practices and reduces 
    headaches.<BR></TD></TR></TBODY></TABLE>
<P>Actually, the <TT>my()</TT> function is even more complex than I've said. The 
easy definition is that it creates variables that only the current function can 
see. The true definition is that it creates variables with lexical scope. That 
is, variables that are local to the file, block, or eval. This distinction is 
only important when creating modules or objects so let's ignore the complicated 
definition for now. You'll hear more about it in Chapter 15, "<A 
href="ch15.htm">Perl Modules</A>." 
<P>If you remember, I mentioned calling parameters by reference. Passing 
parameters by reference means that functions can change the variable's value and 
the main program sees the change. When <TT>local()</TT> is used in conjunction 
with assigning the <TT>@_</TT> array elements to scalars, then the parameters 
are essentially being called by value. The function can change the value of the 
variable, but only the function is affected. The rest of the program sees the 
old value. 

## Example: Using a List as a Function Parameter

Now that you understand about the scope of 
variables, let's take another look at parameters. Since all parameters are 
passed to a function in one array, what if you need to pass both a scalar and an 
array to the same function? This next example shows you what happens. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the firstSub() function with two parameters: a list and a scalar. 
      <P>Define the firstSub() function. 
      <P>Assign the elements of the @_ array to @array and $firstVar. 
      <P>Print @array and $firstVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>firstSub((0..10), "AAAA");

sub firstSub{
    local(@array, $firstVar) = @_;

    print("firstSub: array    = @array\n");
    print("firstSub: firstVar = $firstVar\n");
}</PRE></B>
<P>This program prints: <B><PRE>firstSub: array    = 0 1 2 3 4 5 6 7 8 9 10 AAAA
Use of uninitialized value at test.pl line 8.
firstSub: firstVar =</PRE></B>When the local variables are initialized, the 
<TT>@array</TT> variables grab all of the elements in the <TT>@_</TT> array, 
leaving none for the scalar variable. This results in the uninitialized value 
message displayed in the output. You can fix this by merely reversing the order 
of parameters. If the scalar value comes first, then the function processes the 
parameters without a problem. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the firstSub() function with two parameters: a scalar and a list. 
      <P>Define the firstSub() function. 
      <P>Assign the elements of the @_ array to $firstVar and @array. 
      <P>Print @array and $firstVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>firstSub("AAAA", (0..10));

sub firstSub{
    local($firstVar, @array) = @_;

    print("firstSub: array    = @array\n");
    print("firstSub: firstVar = $firstVar\n");
}</PRE></B>This program prints: <B><PRE>firstSub: array    = 0 1 2 3 4 5 6 7 8 9 10
firstSub: firstVar = AAAA</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>You can pass as many scalar values as you want to a 
      function, but only one array. If you try to pass more than one array, the 
      array elements become joined together and passed as one array to the 
      function. Your function won't be able to tell when one array starts and 
      another ends.<BR></TD></TR></TBODY></TABLE>

## Example: Nesting Function Calls

Function calls can be nested many levels deep. Nested function 
calls simply means that one function can call another which in turn can call 
another. Exactly how many levels you can nest depends on which version of Perl 
you are running and how your machine is configured. Normally, you don't have to 
worry about it. If you want to see how many levels your system can recurse try 
the following small program. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the firstSub() function. 
      <P>Define the firstSub() function. 
      <P>Print $count 
      <P>Increment $count by one. 
      <P>Call the firstSub() function 
recursively.</TT></P></TD></TR></TBODY></TABLE><B><PRE>firstSub();

sub firstSub{
    print("$count\n");
    $count++;
    firstSub();
}</PRE></B>My system counts up to 127 before displaying the following message: 
<B><PRE>Error: Runtime exception</PRE></B>While it is important to realize that 
there is a limit to the number of times your program can nest functions, you 
should never run into this limitation unless you are working with recursive 
mathematical functions. 
<H3><A name="Example: Using a Private Function">Example: Using a Private 
Function</A></H3>Occasionally, you might want to create a private function. A 
private function is one that is only available inside the scope where it was 
defined. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign the return value from performCalc() to $temp. 
      <P>Print $temp. 
      <P>Define the performCalc() function which accepts two parameters and 
      returns the sum of the parameters squared. An anonymous function is used 
      to perform the square function. 
      <P>Assign my scalar variables values from the @_ parameter array. 
      <P>Define the private function referred to by $square. 
      <P>Return the first element of the @_ parameter array raised to the 
      2<SUP>nd</SUP> power. 
      <P>Return the value of $firstVar raised to the 2<SUP>nd</SUP> power and 
      $secondVar raised to the 2<SUP>nd</SUP> 
power.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$temp = performCalc(10, 10);
print("temp = $temp\n");

sub performCalc {
    my ($firstVar, $secondVar) = @_;

    my $square = sub {
        return($_[0] ** 2);
    };

    return(&amp;$square($firstVar) + &amp;$square($secondVar));
};</PRE></B>This program prints: <B><PRE>temp = 200</PRE></B>This example is rather trivial but it serves to show 
that in Perl it pays to create little helper routines. A fine line needs to be 
draw between what should be included as a private function and what shouldn't. 
I'd draw the line at 5 or 6 lines of code. Anything longer should probably be 
made into its own function. I'd also say that a private function should only 
have one purpose for existence. Performing a calculation and then opening a file 
is too much functionality for a single private function to have. 
<P>The rest of the chapter is devoted to showing you some of the built-in 
function of Perl. These little nuggets of functionality will become part of your 
arsenal of programming weapons. 

## String Functions

The first set of functions that we'll look at are those that deal with strings. These functions 
let you determine a string's length, search for a sub-string, and change the 
case of the characters in the string, among other things. Table 5.1 shows Perl's 
string functions. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 5.1-String Functions</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Function </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>chomp(STRING) OR chomp(ARRAY)</TT> </TD>
    <TD vAlign=top>Uses the value of the <TT>$/</TT> special variable to 
      remove endings from <TT>STRING</TT> or each element of <TT>ARRAY</TT>. The 
      line ending is only removed if it matches the current value of 
    <TT>$/</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>chop(STRING) OR chop(ARRAY)</TT> </TD>
    <TD vAlign=top>Removes the last character from a string or the last 
      character from every element in an array. The last character chopped is 
      returned.</TD></TR>
  <TR>
    <TD vAlign=top><TT>chr(NUMBER)</TT> </TD>
    <TD vAlign=top>Returns the character represented by <TT>NUMBER</TT> in the 
      ASCII table. For instance, <TT>chr(65)</TT> returns the letter 
    <TT>A</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>crypt(STRING1, STRING2)</TT> </TD>
    <TD vAlign=top>Encrypts <TT>STRING1</TT>. Unfortunately, Perl does not 
      provide a decrypt function. This function is not supported under the 
      Windows operating systems.</TD></TR>
  <TR>
    <TD vAlign=top><TT>index(STRING, SUBSTRING, POSITION)</TT> </TD>
    <TD vAlign=top>Returns the position of the first occurrence of 
      <TT>SUBSTRING</TT> in <TT>STRING</TT> at or after <TT>POSITION</TT>. If 
      you don't specify <TT>POSITION</TT>, the search starts at the beginning of 
      <TT>STRING</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>join(STRING, ARRAY)</TT> </TD>
    <TD vAlign=top>Returns a string that consists of all of the elements of 
      <TT>ARRAY</TT> joined together by <TT>STRING</TT>. For instance, 
      <TT>join("&gt;&gt;", ("AA", "BB", "CC"))</TT> returns 
      <TT>"AA&gt;&gt;BB&gt;&gt;CC"</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>lc(STRING)</TT> </TD>
    <TD vAlign=top>Returns a string with every letter of <TT>STRING</TT> in 
      lowercase. For instance, <TT>lc("ABCD")</TT> returns 
<TT>"abcd"</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>lcfirst(STRING)</TT> </TD>
    <TD vAlign=top>Returns a string with the first letter of <TT>STRING</TT> 
      in lowercase. For instance, <TT>lcfirst("ABCD")</TT> returns 
      <TT>"aBCD"</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>length(STRING)</TT> </TD>
    <TD vAlign=top>Returns the length of <TT>STRING</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>ord(STRING)</TT> </TD>
    <TD vAlign=top>Returns the ascii value of the first character of 
      <TT>STRING</TT>. If <TT>STRING</TT> is omitted, then $_ is used. For 
      instance, <TT>ord("ABC")</TT> returns the number <TT>65</TT>. 
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
            Note</B></FONT></TD></TR>
        <TR>
          <TD bgColor=lightcyan>This function has been added to the list after 
            the printed version was completed. Its utility as a string function 
            was initially overlooked. Randal Schwartz was kind enough to mention 
            that it should be added.</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top><TT>rindex(STRING, SUBSTRING, POSITION)</TT> </TD>
    <TD vAlign=top>Returns the position of the last occurrence of 
      <TT>SUBSTRING</TT> in <TT>STRING</TT> at or before <TT>POSITION</TT>. If 
      you don't specify <TT>POSITION</TT>, the search starts at the end of 
      <TT>STRING</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>split(PATTERN, STRING, LIMIT)</TT> </TD>
    <TD vAlign=top>Breaks up a STRING using PATTERN as the delimiter. The 
      LIMIT parameter indicates how many parts to create from STRING. In an 
      array context, it returns a list of the parts that were found. In a scalar 
      context, the number of parts found.</TD></TR>
  <TR>
    <TD vAlign=top><TT>substr(STRING, OFFSET, LENGTH)</TT> </TD>
    <TD vAlign=top>Returns a portion of <TT>STRING</TT> as determined by the 
      <TT>OFFSET</TT> and <TT>LENGTH</TT> parameters. If <TT>LENGTH</TT> is not 
      specified, then everything from <TT>OFFSET</TT> to the end of 
      <TT>STRING</TT> is returned. A negative <TT>OFFSET</TT> can be used to 
      start from the right side of <TT>STRING</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>uc(STRING)</TT> </TD>
    <TD vAlign=top>Returns a string with every letter of <TT>STRING</TT> in 
      uppercase. For instance, <TT>uc("abcd")</TT> returns 
<TT>"ABCD"</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>ucfirst(STRING)</TT> </TD>
    <TD vAlign=top>Returns a string with the first letter of <TT>STRING</TT> 
      in uppercase. For instance, <TT>ucfirst("abcd")</TT> returns 
      <TT>"Abcd"</TT>.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>As a general rule, if Perl sees a number where it 
      expects a string, the number is quietly converted to a string without your 
      needing to do anything. 
      <P>Some of these functions use the special variable <TT>$_</TT> as the 
      default string to work with. More information about <TT>$ </TT>can be 
      found in Chapter 9, "<A href="ch09.htm">Using 
      Files</A>," and Chapter 12, "<A 
      href="ch12.htm">Using Special Variables</A>." 
      <BR></P></TD></TR></TBODY></TABLE>
<P>The next few sections demonstrate some of these functions. After seeing some 
of them work, you'll be able to use the rest of them. 
<H3><A name="Example: Changing a String's Value">Example: Changing a String's 
Value</A></H3>Frequently, I find that I need to change part of a string's value, 
usually somewhere in the middle of the string. When this need arises, I turn to 
the <TT>substr()</TT> function. Normally, the <TT>substr()</TT> function returns 
a sub-string based on three parameters: the string to use, the position to start 
at, and the length of the string to return. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign $firstVar the return value from substr(). 
      <P>Print $firstVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = substr("0123BBB789", 4, 3);
print("firstVar  = $firstVar\n");</PRE></B>This program prints: <B><PRE>firstVar = BBB</PRE></B>The <TT>substr()</TT> function starts at the fifth 
position and returns the next three characters. The returned string can be used 
for assignment like the above example, as an array element, for string 
concatention or any of a hundred other options. 
<P>Things become more interesting when you put the <TT>substr()</TT> function on 
the left-hand side of the assignment statement. Then, you can actually assign a 
value to the string that <TT>substr()</TT> returns. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize $firstVar with a string literal. 
      <P>Replace the string returned by the substr() function with "AAA". 
      <P>Print $firstVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = "0123BBB789";
substr($firstVar, 4, 3) = "AAA";
print("firstVar  = $firstVar\n");</PRE></B>This program prints: <B><PRE>firstVar = 0123AAA789</PRE></B>
<H3><A name="Example: Searching a String">Example: Searching a 
String</A></H3>Another useful thing you can do with strings is search them to 
see if they contain a given sub-string. For example if you have a full path name 
such as <TT>"C:\\WINDOWS\\TEMP\\WSREWE.DAT"</TT>, you might need to extract the 
file name at the end of the path. You might do this by searching for the last 
backslash and then using <TT>substr()</TT> to return the sub-string. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The path name string has double-backslashes to 
      indicate to Perl that we really want a backslash in the string and not 
      some other escape sequence. You can read more about escape sequences in 
      Chapter 2, "<A href="ch02.htm">Numeric and 
      String Literals</A>." <BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign a string literal to $pathName. 
      <P>Find the location of the last backslash by starting at the end of the 
      string and working backward using the rindex() function. When the position 
      of the last backslash is found, add one to it so that $position points at 
      the first character ("W") of the filename. 
      <P>Use the substr() function to extract the filename and assign it to 
      $fileName. 
      <P>Print $fileName.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$pathName = "C:\\WINDOWS\\TEMP\\WSREWE.DAT";
$position = rindex($pathName, "\\") + 1;
$fileName = substr($pathName, $position);
print("$fileName\n");</PRE></B>This program prints: <B><PRE>WSREWE.DAT</PRE></B>If the third parameter - the length - is not supplied 
to <TT>substr()</TT>, it simply returns the sub-string that starts at the 
position specified by the second parameter and continues until the end of the 
string specified by the first parameter. 

## Array Functions

Arrays are a big part of the Perl language and it has a lot of functions to help you work with them. Some 
of the actions they perform include deleting elements, checking for the 
existence of an element, reversing all of the the elements in an array, and 
sorting the elements. Table 5.2 lists the functions you can use with arrays. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 5.2-Array Functions</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Function </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>defined(VARIABLE)</TT> </TD>
    <TD vAlign=top>returns true if <TT>VARIABLE</TT> has a real value and 
      false if the variable has not yet been assigned a value. This is not 
      limited to arrays, any data type can be checked. Also see the exists 
      function for information about associative array keys.</TD></TR>
  <TR>
    <TD vAlign=top><TT>delete(KEY)</TT> </TD>
    <TD vAlign=top>Removes the key-value pair from the given associative 
      array. If you delete a value from the <TT>%ENV</TT> array the environment 
      of the current process is changed, not that of the parent.</TD></TR>
  <TR>
    <TD vAlign=top><TT>each(ASSOC_ARRAY)</TT> </TD>
    <TD vAlign=top>Returns a two-element list that contains a key and value 
      pair from the given associative array. The function is mainly used so that 
      you can iterate over the associate array elements. A null list is returned 
      when the last element has been read.</TD></TR>
  <TR>
    <TD vAlign=top><TT>exists(KEY)</TT> </TD>
    <TD vAlign=top>Returns true if the <TT>KEY</TT> is part of the specified 
      associative array. For instance, <TT>exists($array{"Orange"})</TT> returns 
      true if the <TT>%array</TT> associative array has a key with the value of 
      "Orange."</TD></TR>
  <TR>
    <TD vAlign=top><TT>join(STRING, ARRAY)</TT> </TD>
    <TD vAlign=top>Returns a string that consists of all of the elements of 
      <TT>ARRAY</TT> joined together by <TT>STRING</TT>. For instance, 
      <TT>join("&gt;&gt;", ("AA", "BB", "CC"))</TT> returns 
      <TT>"AA&gt;&gt;BB&gt;&gt;CC"</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>keys(ASSOC_ARRAY)</TT> </TD>
    <TD vAlign=top>Returns a list that holds all of the keys in a given 
      associative array. The list is not in any particular order.</TD></TR>
  <TR>
    <TD vAlign=top><TT>map(EXPRESSION, ARRAY)</TT> </TD>
    <TD vAlign=top>Evaluates <TT>EXPRESSION</TT> for every element of 
      <TT>ARRAY</TT>. The special variable <TT>$_</TT> is assigned each element 
      of <TT>ARRAY</TT> immediately before <TT>EXPRESSION</TT> is 
  evaluated.</TD></TR>
  <TR>
    <TD vAlign=top><TT>pack(STRING, ARRAY)</TT> </TD>
    <TD vAlign=top>Creates a binary structure, using <TT>STRING</TT> as a 
      guide, of the elements of <TT>ARRAY</TT>. You can look in Chapter 8, "<A 
      href="ch08.htm">References</A>," for more 
      information.</TD></TR>
  <TR>
    <TD vAlign=top><TT>pop(ARRAY)</TT> </TD>
    <TD vAlign=top>Returns the last value of an array. It also reduces the 
      size of the array by one.</TD></TR>
  <TR>
    <TD vAlign=top><TT>push(ARRAY1, ARRAY2)</TT> </TD>
    <TD vAlign=top>Appends the contents of <TT>ARRAY2</TT> to <TT>ARRAY1</TT>. 
      This increases the size of <TT>ARRAY1</TT> as needed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>reverse(ARRAY)</TT> </TD>
    <TD vAlign=top>Reverses the elements of a given array when used in an 
      array context. When used in a scalar context, the array is converted to a 
      string, and the string is reversed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>scalar(ARRAY)</TT> </TD>
    <TD vAlign=top>Evaluates the array in a scalar context and returns the 
      number of elements in the array.</TD></TR>
  <TR>
    <TD vAlign=top><TT>shift(ARRAY)</TT> </TD>
    <TD vAlign=top>Returns the first value of an array. It also reduces the 
      size of the array by one.</TD></TR>
  <TR>
    <TD vAlign=top><TT>sort(ARRAY)</TT> </TD>
    <TD vAlign=top>Returns a list containing the elements of <TT>ARRAY</TT> in 
      sorted order. See Chapter 8, "<A 
      href="ch08.htm">References</A>," for more 
      information.</TD></TR>
  <TR>
    <TD vAlign=top><TT>splice(ARRAY1, OFFSET, LENGTH, ARRAY2)</TT> </TD>
    <TD vAlign=top>Replaces elements of <TT>ARRAY1</TT> with elements in 
      <TT>ARRAY2</TT>. It returns a list holding any elements that were removed. 
      Remember that the <TT>$[</TT> variable may change the base array subscript 
      when determining the <TT>OFFSET</TT> value.</TD></TR>
  <TR>
    <TD vAlign=top><TT>split(PATTERN, STRING, LIMIT)</TT> </TD>
    <TD vAlign=top>Breaks up a string based on some delimiter. In an array 
      context, it returns a list of the things that were found. In a scalar 
      context, it returns the number of things found.</TD></TR>
  <TR>
    <TD vAlign=top><TT>undef(VARIABLE)</TT> </TD>
    <TD vAlign=top>Slways returns the undefined value. In addition, it 
      undefines <TT>VARIABLE</TT> which must be a scalar, an entire array or a 
      subroutine name.</TD></TR>
  <TR>
    <TD vAlign=top><TT>unpack(STRING, ARRAY)</TT> </TD>
    <TD vAlign=top>Does the opposite of <TT>pack()</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>unshift(ARRAY1, ARRAY2)</TT> </TD>
    <TD vAlign=top>Adds the elements of <TT>ARRAY2</TT> to the front of 
      <TT>ARRAY1</TT>. Note that the added elements retain their original order. 
      The size of the new <TT>ARRAY1</TT> is returned.</TD></TR>
  <TR>
    <TD vAlign=top><TT>values(ASSOC_ARRAY)</TT> </TD>
    <TD vAlign=top>Returns a list that holds all of the values in a given 
      associative array. The list is not in any particular 
order.</TD></TR></TBODY></TABLE>
<P>As I did with the string functions, only a few of these functions will be 
explored. Once you see the examples, you'll be able to handle the rest with no 
trouble. 
<H3><A name="Example: Printing an Associative Array">Example: Printing an 
Associative Array</A></H3>The <TT>each()</TT> function returns key, value pairs 
of an associative array one-by-one in a list. This is called <I>iterating</I> 
over the elements of the array. Iteration is a synonym for looping. So you could 
also say that the <TT>each()</TT> function starts at the beginning of an array 
and loops through each element until the end of the array is reached. This 
ability lets you work with key, value pairs in a quick easy manner. 
<P>The <TT>each()</TT> function does not loop by itself. It needs a little help 
from some Perl control statements. For this example, we'll use the <I>while</I> 
loop to print an associative array. The <TT>while (CONDITION) {}</TT> control 
statement continues to execute any program code surrounded by the curly braces 
until the <TT>CONDITION</TT> turns false. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an associative with number, color pairs. 
      <P>Using a while loop, iterate over the array elements. 
      <P>Print the key, value pair.</TT></P></TD></TR></TBODY></TABLE><B><PRE>%array = ( "100", "Green", "200", "Orange");

while (($key, $value) = each(%array)) {
    print("$key = $value\n");
}</PRE></B>This program prints: <B><PRE>100 = Green
200 = Orange</PRE></B>The <TT>each()</TT> function returns false when the end of 
the array is reached. Therefore, you can use it as the basis of the 
<TT>while</TT>'s condition. When the end of the array is reached, the program 
continues execution after the closing curly brace. In this example, the program 
simply ends. 
<H3><A name="Example: Checking the Existence of an Element">Example: Checking 
the Existence of an Element</A></H3>You can use the <TT>defined()</TT> function 
to check if an array element exists before you assign a value to it. This 
ability is very handy if you are reading values from a disk file and don't want 
to overlay values already in memory. For instance, suppose you have a disk file 
of customers' addresses and you'd like to know if any of them are duplicates. 
You check for duplicates by reading the information one address at a time and 
assigning the address to an associative array using the customer name as the key 
value. If the customer name already exists as a key value, then that address 
should be flagged for follow-up. 
<P>Since we haven't talked about disk files yet, we'll need to emulate a disk 
file with an associative array. And instead of using customer's address, we'll 
use customer number, customer name pairs. First, we see what happens when an 
associative array is created and two values have the same keys. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the createPair() function three times to create three key, value 
      pairs in the %array associative array. 
      <P>Loop through %array, printing each key, value pair. 
      <P>Define the createPair() function. 
      <P>Create local variables to hold the key, value pair passed as 
      parameters. 
      <P>Create an array element to hold the key, value 
  pair.</TT></P></TD></TR></TBODY></TABLE><B><PRE>createPair("100",  "Kathy Jones");
createPair("200",  "Grace Kelly");
createPair("100", "George Orwell");

while (($key, $value) = each %array) {
    print("$key, $value\n");
};

sub createPair{
    my($key, $value) = @_;

    $array{$key} = $value;
};</PRE></B>This program prints <B><PRE>100, George Orwell
200, Grace Kelly</PRE></B>This example takes advantages of the global nature of 
variables. Even though the <TT>%array</TT> element is set in the 
<TT>createPair()</TT> function, the array is still accessible by the main 
program. Notice that the first key, value pair (100 and Kathy Jones) are 
overwritten when the third key, value pair is encountered. You can see that it 
is a good idea to be able to determine when an associative array element is 
already defined so that duplicate entries can be handled. The next program does 
this. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the createPair() function three times to create three key, value 
      pairs in the %array associative array. 
      <P>Loop through %array, printing each key, value pair. 
      <P>Define the createPair() function. 
      <P>Create local variables to hold the key, value pair passed as 
      parameters. 
      <P>If the key, value pair already exists in %array then increment the 
      customer number by one. Check to see if the new key, value pair exists. If 
      so, keep incrementing until a non-existent key, value pair is found. 
      <P>Create an array element to hold the key, value 
  pair.</TT></P></TD></TR></TBODY></TABLE><B><PRE>createPair("100",  "Kathy Jones");
createPair("200",  "Grace Kelly");
createPair("100", "George Orwell");

while (($key, $value) = each %array) {
    print("$key, $value\n");
};

sub createPair{
    my($key, $value) = @_;

    while (defined($array{$key})) {
        $key++;
    }

    $array{$key} = $value;
};</PRE></B>This program prints: <B><PRE>100, Kathy Jones
101, George Orwell
200, Grace Kelly</PRE></B>You can see the customer number for George Orwell has 
been changed to 101. If the array had already had an entry for 101, the George 
Orwell' new customer number would be 102. 

## Summary

In this chapter you've learned about 
functions - what they are and how to call them. You saw that you can create your 
own function or use one of Perl's many built-in functions. Each function can 
accept any number of parameters which get delivered to the function in the form 
of the <TT>@_</TT> array. This array, like any other array in Perl, can be 
accessed using the array element to access individual element (For instance, 
<TT>$_[0]</TT> accesses the first element in the <TT>@_</TT> array.). Because 
Perl parameters are passed by reference, changing the <TT>@_</TT> array changes 
the values in the main program as well as the function. 
<P>You learned about the scope of variables and how all variables are global by 
default. Then, you saw how to create variable with local scope using 
<TT>local()</TT> and <TT>my()</TT>. <TT>My()</TT> is the better choice in almost 
all situations because it enforces local scope and limits side effects from 
function to inside the functions. 
<P>Then you saw that it was possible to nest function calls which means that one 
function can call another which in turn can call another. You might also call 
this a chain of function calls. Private functions were introduced next. A 
private function is one that can only be used inside the function that defines 
it. 
<P>A list of string functions was then presented. These included functions to 
remove the last character, encrypt a string, find a sub-string, convert array 
elements into a string, change the case of a string characters, and find the 
length of a string. Examples were shown about how to change a string's 
characters and how to search a string. 
<P>The section on array functions showed that Perl has a large number of 
functions that deal specifically with arrays. The list of functions included the 
ability to delete elements, return key and value pairs from associative arrays, 
reverse an array's elements, and sort an array. Examples were shown for printing 
an associative array and checking for the existence of an element. 
<P>The next chapter, "<A 
href="ch06.htm">Statements</A>," goes into detail 
about what statements are and how you create them. The information that you 
learned about variables and functions will come into play. You'll see how to 
link variables and functions together to form expressions and statements. 

## Review Questions

<OL>
  <LI>What is a parameter? 
  <P></P>
  <LI>What two functions are used to create variables with local scope? 
  <P></P>
  <LI>What does parameter passing by reference mean? 
  <P></P>
  <LI>What is the <TT>@_</TT> array used for? 
  <P></P>
  <LI>Do Perl variables have global or local scope by default? 
  <P></P>
  <LI>Why is it hard to pass two arrays to a function? 
  <P></P>
  <LI>What is the difference between variables created with <TT>local()</TT> and 
  variables created with <TT>my()</TT>? 
  <P></P>
  <LI>What does the <TT>map()</TT> function do?</LI></OL>

## Review Exercises

<OL>
  <LI>Create a function that prints its own parameter list. 
  <P></P>
  <LI>Create a program that uses three functions to demonstrate function call 
  nesting. 
  <P></P>
  <LI>Use the <TT>chop()</TT> function in a program. Print both the returned 
  character and the string that was passed as a parameter. 
  <P></P>
  <LI>Run the following program to see how many levels of recursion your system 
  configuration supports. <B><PRE>firstSub();

sub firstSub{
    print("$count\n");
    $count++;
    firstSub();
}</PRE></B>
  <LI>Write a function that uses the <TT>substr()</TT> and <TT>uc()</TT> 
  functions to change the tenth through twenthieth characters to uppercase. 
  <P></P>
  <LI>Write a function that uses the <TT>keys()</TT> function to print out the 
  values of an associative array. 
  <P></P>
  <LI>Create a program that uses a private function to subtract two numbers and 
  multiply the result by four. 
  <P></P>
  <LI>Write a program that shows what the <TT>shift()</TT> and 
  <TT>unshift()</TT> functions do. 
  <P></P>
  <LI>Write a program that shows what the <TT>push()</TT> and <TT>pop()</TT> 
  functions do.</LI></OL>
