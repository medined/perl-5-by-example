# Debugging Perl

<P>This chapter is about errors: how to find them and how to fix them. No 
programmer I've ever known of is able to consistently create perfect programs. 
So don't feel bad if you also have some problems you need to solve. I've spent 
many hours looking for a missing closing bracket or a misspelled variable name. 
<P>There are two different types of errors: syntax errors and logic errors. 
<I>Syntax</I> errors are made as you type your script into an editor. For 
example, you might not add a closing quote or might misspell a filename. 
<I>Logic</I> errors are more insidious and difficult to find. For example, you 
might place an assignment statement inside an <TT>if</TT> statement block that 
belongs outside the block. Or you might have a loop that runs from 0 to 100 when 
it should run from 10 to 100. Accidentally deleting the 1 or not entering it in 
the first place is very easy. 
<P>Syntax errors are usually easy to fix. The section "<A 
href="ch16.htm#Common Syntax Errors">Common Syntax 
Errors</A>" discusses some common syntax errors. You'll see how to decipher some 
of Perl's error messages. 
<P>Logic errors can be very hard to fix. They are discussed in the section "<A 
href="ch16.htm#Logic Errors">Logic Errors</A>." 
While there is no magic wand to wave over a program that will identify logic 
errors, there are some tools that can help - like the debugger. A 
<I>debugger</I> is an environment that lets you execute your program line by 
line. This is also called <I>single-stepping</I> through your program. You can 
also display or modify the value of variables. The debugger is discussed in the 
section "<A 
href="ch16.htm#Stepping Through Your Script">Stepping 
Through Your Script</A>." 

## Syntax Errors

Perl is generally considered an interpreted language. However, this is not truly accurate. Before being 
executed, your script is compiled into an internal format - just like Java's 
byte-codes or Pascal's p-code. While Perl is compiling your program, it also 
checks for syntax errors. This is why syntax errors are also called 
<I>compile-time</I> errors. 
<P>Fixing syntax errors is a matter of reading the error message displayed by 
the compiler and then trying to understand which line of code generated the 
message and why. The next section, "<A 
href="ch16.htm#Common Syntax Errors">Common Syntax 
Errors</A>," might help. If you are uncertain which line of code really 
generated the error, try commenting out the likely culprits. Then, re-execute 
your program and look at the error messages that are produced to see if they 
have changed. 

## Common Syntax Errors

One very common error is to use <TT>elseif</TT> instead of the correct <TT>elsif</TT> keyword. 
As you program, you'll find that you consistently make certain kinds of errors. 
This is okay. Everyone has his or her own little quirks. Mine is that I keep 
using the assignment operator instead of the equality operator. Just remember 
what your particular blind spot is. When errors occur, check for your personal 
common errors first. 
<P>This section shows some common syntax errors and the error messages that are 
generated as a result. First, the error message is shown and then the script 
that generated it. After the script, I'll cast some light as to why that 
particular message was generated. </P>
<P><B><PRE>Scalar found where operator expected at test.pl line 2, near "$bar"
        (Missing semicolon on previous line?)
$foo = { }    # this line is missing a semi-colon.
$bar = 5;</PRE></B>Perl sees the anonymous hash on the first line and is 
expecting either an operator or the semicolon to follow it. The scalar variable 
that it finds, <TT>$bar</TT>, does not fit the syntax of an expression because 
two variables can't be right after each other. In this case, even though the 
error message indicates line 2, the problem is in line 1. 
<P><B><PRE>Bare word found where operator expected at
    test.pl line 2, near "print("This"
  (Might be a runaway multi-line "" string starting on line 1)
syntax error at test.pl line 2, near "print("This is "
String found where operator expected at test.pl line 3, near "print(""
  (Might be a runaway multi-line "" string starting on line 2)
        (Missing semicolon on previous line?)
Bare word found where operator expected at
    test.pl line 3, near "print("This"
String found where operator expected at test.pl line 3, at end of line
        (Missing operator before ");
?)
Can't find string terminator '"' anywhere before EOF at test.pl line 3.</PRE></B><B><PRE>print("This is a test.\n);    # this line is missing a ending quote.
print("This is a test.\n");
print("This is a test.\n");</PRE></B>In this example, a missing end quote has 
generated 12 lines of error messages! You really need to look only at the last 
one in order to find out that the problem is a missing string terminator. While 
the last error message describes the problem, it does not tell you where the 
problem is. For that piece of information, you need to look at the first line 
where it tells you to look at line two. Of course, by this time you already know 
that if the error message says line 2, the error is probably in line 1. 
<P><B><PRE>Can't call method "a" in empty package "test" at test.pl line 1.</PRE></B><B><PRE>print(This is a test.\n);    # this line is missing a beginning quote.</PRE></B>The 
error being generated here is very cryptic and has little to do with the actual 
problem. In order to understand why the message mentions methods and packages, 
you need to understand the different, arcane ways you can invoke methods when 
programming with objects. You probably need to add a beginning quote if you ever 
see this error message. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>As long as you follow the object calling guidelines 
      used in [](./objects.md), you will never have to worry about the more advanced 
      ways to call object methods.<BR></TD></TR></TBODY></TABLE>
<P>This list of syntax errors could go on for quite a while, but you probably 
understand the basic concepts: 
<P>
<UL>
  <LI>Errors are not always located on the line mentioned in the error message. 
  <P></P>
  <LI>Errors frequently have nothing to do with the error message 
displayed.</LI></UL>

## Logic Errors

These are the programming 
problems - sometimes called bugs - that you can stare at for hours without 
having a clue about why your script doesn't work. If you find yourself in this 
position, take a walk or eat some chocolate. In other words, take a break from 
staring at the computer screen. You can also find another programmer to walk 
through the code with you. Quite often while explaining the code to someone 
else, the problem becomes obvious. 
<P>Besides these two options, you can do the following: 
<P>
<UL>
  <LI><B>Use the <TT>-w</TT> Command-line Option</B> - This option will produce 
  warning messages about questionable code. 
  <P></P>
  <LI><B>Use the <TT>strict</TT> pragma</B> - This pragma will force you to 
  declare all variables before using them. 
  <P></P>
  <LI><B>Use the built-in debugger</B> - The built-in debugger will let you 
  single-step through your script, examining or changing variable values as 
  needed.</LI></UL>
<P>Each of these options is discussed in separate sections later. 
<P>As a general rule, when debugging logic errors it helps to break complex 
expressions and statements into simpler ones: the simpler, the better. Use 
temporary variables if you need to. If you use the <TT>++</TT> or <TT>-</TT> 
operators inside function calls or complex expressions, don't. Move the 
decrement or increment operation to a separate line. After the program is 
debugged, you can always recombine the simple statements into complex ones. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>One of the most common logic problem is using the 
      assignment operator (<TT>=</TT>) when you should use the equality operator 
      (<TT>==</TT>). If you are creating a conditional expression, you'll almost 
      always use the equality operator (<TT>==</TT>).<BR></TD></TR></TBODY></TABLE>

### Using the -w Command-line Option

<P>One of the most important features to combat logic errors is the <TT>-w</TT> 
command-line option, which causes warning messages to be displayed indicating 
questionable Perl code. Questionable code includes identifiers that are 
mentioned only once, scalar variables that are used before being set, redefined 
subroutines, references to undefined filehandles, and filehandles opened read 
only that you are attempting to write to. </P>
<P>For example, can you find anything wrong with the following lines of code? 
<P><B><PRE>$foo = { };
$bar = 5;

print("$foa\n");
print("$bar\n");</PRE></B>You probably can't see anything wrong at first glance. 
In fact, this program compiles and runs without complaint. However, running this 
program with the <TT>-w</TT> option (<TT>perl -w test.pl</TT>) results in these 
error messages: 
<P><B><PRE>Identifier "main::foa" used only once: possible typo at test.pl line 4.
Identifier "main::foo" used only once: possible typo at test.pl line 1.
Use of uninitialized value at test.pl line 4.</PRE></B>With these error 
messages, the problem becomes obvious. Either the variable name <TT>$foo</TT> is 
misspelled in the assignment statement or the variable name <TT>$foa</TT> was 
misspelled in the print statement. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Always use the <TT>-w</TT> command-line option! Let 
      me repeat this: Always use the <TT>-w</TT> command-line option! Okay? It 
      will save you lots of headaches tracking down bugs that Perl can catch 
      automatically.<BR></TD></TR></TBODY></TABLE>
<P>The <TT>-w</TT> option is so useful that you should <I>always</I> use it. If 
you know that a specific line of code is going to generate an error message and 
you want to ignore it, use the <TT>$^W</TT> special variable. For example, 
<P><B><PRE>$foo = { };
$bar = 5;

$^W = 0;
print("$foa\n");
print("$bar\n");
$^W = 1;</PRE></B>eliminates the display of the <TT>Use of uninitialized value 
at test.pl line 4.</TT> error message. Unfortunately, this technique will not 
stop all messages, and the placement of the <TT>$^W = 0;</TT> statement seems to 
affect whether the message will be suppressed. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>This feature did not seem to be too stable in my 
      version of Perl. If you can't get it to work in your version, don't spend 
      too much time trying to find the problem. It simply may not work properly 
      in your version of Perl, either.<BR></TD></TR></TBODY></TABLE>

### Being Strict with Your Variables

In [](./modules.md) the use of modules to implement pragmas was discussed. One very useful pragma to aid in 
debugging is <TT>use strict;</TT>. This statement does two things: 
<P>
<UL>
  <LI>Forces you to use the <TT>my()</TT> function to declare all variables. 
  When all variables have a local scope, you avoid problems associated with 
  unintentionally changing the value of a variable in a function. 
  <P></P>
  <LI>Ensures that you can't use accidental symbolic dereferencing. This topic 
  was not covered in [](./references.md), because it is 
  relatively advanced. If you use the dereferencing techniques shown, you won't need to worry about this requirement.</LI></UL>

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
  Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The CD-ROM that comes with the first printing of 
      Perl 5 by Example does not contain the strict directory. You can find the 
      files at <A 
      href="strict.htm">strict.htm</A>.</TD></TR></TBODY></TABLE>
<P>When the <TT>strict</TT> pragma is used, your script will not compile if the 
preceding two rules are violated. For example, if you tried to run the following 
lines of code, 
<P><B><PRE>use strict;

$foo = { };
$bar = 5;

print("$foo\n");
print("$bar\n");</PRE></B>you would receive these error messages: 
<P><B><PRE>Global symbol "foo" requires explicit package name at test.pl line 3.
Global symbol "bar" requires explicit package name at test.pl line 4.
Global symbol "foo" requires explicit package name at test.pl line 6.
Global symbol "bar" requires explicit package name at test.pl line 7.
Execution of test.pl aborted due to compilation errors.</PRE></B>In order to 
eliminate the messages, you need to declare <TT>$foo</TT> and <TT>$bar</TT> as 
local variables, like this: 
<P><B><PRE>use strict;

my($foo) = { };
my($bar) = 5;

print("$foo\n");
print("$bar\n");</PRE></B>I bet you already have guessed that the <TT>my()</TT> 
function makes the variables local to the <TT>main</TT> package. 
<P>In the next section, you see how to use the debugger to step through your 
programs. 

### Stepping Through Your Script

So far, you've read about how to limit the possibility of errors 
appearing in your programs. If, after using the <TT>-w</TT> and the 
<TT>strict</TT> pragma, you still have a problem, it's time to use the 
<I>debugger</I>. 
<P>What is the debugger? Quite simply, it is an interactive environment that 
allows you to execute your script's statements one at a time. If necessary, you 
can display the lines of your script, view or alter variables, and even execute 
entirely new statements. 
<P>You start the debugger by using the <TT>-d</TT> command-line option. The 
following line 
<P><B><PRE>perl -w -d 08lst08.pl</PRE></B>starts the debugger and loads the script 
called 08lst08.pl. If you want to invoke the debugger with no script, you need 
to perform a small bit of magic, like this 
<P><B><PRE>perl -d -e "1;"</PRE></B>to start debugger without any program. I say that 
this is a bit of magic because you haven't read about all the different 
command-line options available for the Perl interpreter. You see them all in [](./cli.md). The <TT>-e</TT> option tells Perl to execute a single Perl 
statement. In this case the statement is <TT>1;</TT>, which basically means do 
nothing. It does, however, stop the interpreter from looking for the name of a 
script file on the command line. 
<P>When the debugger starts, your screen will look something like this: 
<P><B><PRE>Loading DB routines from $RCSfile: perl5db.pl,v $$Revision: 4.1
$$Date: 92/08/07 18:24:07 $
Emacs support available.

Enter h for help.

main::(08lst08.pl:3):   my($codeRef);
  DB<1></PRE></B>This message tells you that the debugger (<TT>DB</TT>) 
routines have been loaded. The <TT>DB<1></TT> is a prompt that indicates 
that the debugger is waiting for input. The line number inside the angle 
brackets is the current execution line<I>.</I> The <I>current execution line</I> 
is that line that the debugger waits to execute. 
<P>One of the features of the debugger is the capability to insert breakpoints 
into your script. A <I>breakpoint</I> is an instruction that tells the debugger 
to stop, to display a prompt, and to wait for input. When the debugger first 
starts, there are no breakpoints defined for your program. See the section "<A 
href="ch16.htm#Examples: Using Breakpoints">Examples: 
Using Breakpoints</A>" later in the chapter for more information. 
<P>You can use any of the commands listed in Table 16.1 while using the 
debugger. While some of the commands are demonstrated in the sections that 
follow the table, you can't hurt anything by experimenting with any or all of 
the commands on your own. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 16.1-The Debugger Commands</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Command </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD colSpan=2><I>Commands That control Actions</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>a ACTION</TT> </TD>
    <TD vAlign=top>This command tells the debugger to perform <TT>ACTION</TT> 
      just before the current execution line is executed. Optionally, you can 
      specify a line number. For example, <TT>a 10 print("$numFiles");</TT> 
      executes the <TT>print</TT> statement before line 10 is executed. If line 
      10 is inside a loop, the action is performed each time through the 
  loop.</TD></TR>
  <TR>
    <TD vAlign=top><TT>A</TT> </TD>
    <TD vAlign=top>Deletes all actions.</TD></TR>
  <TR>
    <TD vAlign=top><TT>L</TT> </TD>
    <TD vAlign=top>Lists all breakpoints and actions.</TD></TR>
  <TR>
    <TD vAlign=top><TT>< ACTION</TT> </TD>
    <TD vAlign=top>Forces the debugger to execute <TT>ACTION</TT> each time 
      the debugger prompt is displayed. This command is great if you need to 
      print the value of certain values each time you are prompted by the 
      debugger.</TD></TR>
  <TR>
    <TD vAlign=top><TT>> ACTION</TT> </TD>
    <TD vAlign=top>Forces the debugger to execute <TT>ACTION</TT> after every 
      debugger command you issue.</TD></TR>
  <TR>
    <TD colSpan=2><I>Commands That Involve Breakpoints</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>b</TT> </TD>
    <TD vAlign=top>Sets a breakpoint at the current execution line. You can 
      specify a line where the breakpoint should be set. For example, <TT>b 
      35</TT> sets a breakpoint at line 35. You can also create a conditional 
      breakpoint. For example, <TT>b 35 $numLines == 0</TT> causes the debugger 
      to stop at line 35 only if <TT>$numLines</TT> is equal to zero. Watch 
      conditions can also be attached to functions; just use the function name 
      instead of a line number.</TD></TR>
  <TR>
    <TD vAlign=top><TT>d</TT> </TD>
    <TD vAlign=top>Deletes the breakpoint from the current execution line. If 
      you specify a line number, the breakpoint is deleted from that line.</TD></TR>
  <TR>
    <TD vAlign=top><TT>D</TT> </TD>
    <TD vAlign=top>Deletes all breakpoints.</TD></TR>
  <TR>
    <TD vAlign=top><TT>L</TT> </TD>
    <TD vAlign=top>Lists all breakpoints and actions.</TD></TR>
  <TR>
    <TD colSpan=2><I>Commands That Display Information</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>l</TT> </TD>
    <TD vAlign=top>Lets you print out parts of your script. There are several 
      flavors of this command that you can use: 
      <P>
      <UL>
        <LI>Using a plain <TT>l</TT> displays about 10 lines of your script. 
        <P></P>
        <LI>Using <TT>l 5+4</TT> displays 4 lines of your script starting with 
        line 5. 
        <P></P>
        <LI>Using <TT>l 4-7</TT> displays lines 4 through 7 of your script. 
        <P></P>
        <LI>Using <TT>l 34</TT> displays line 34 of your script. 
        <P></P>
        <LI>Using <TT>l foo</TT> displays roughly the first 10 lines of the 
        <TT>foo()</TT> function.</LI></UL></TD></TR>
  <TR>
    <TD vAlign=top><TT>L</TT> </TD>
    <TD vAlign=top>Lists all breakpoints and actions.</TD></TR>
  <TR>
    <TD vAlign=top><TT>p EXPR</TT> </TD>
    <TD vAlign=top>Prints the result of evaluating <TT>EXPR</TT> to the 
      display. It is a shorthand way of saying <TT>print DB::OUT 
  (EXPR)</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>S</TT> </TD>
    <TD vAlign=top>Lists all function names that are defined. The list will 
      include any function defined in modules as well as those in your 
  script.</TD></TR>
  <TR>
    <TD vAlign=top><TT>T</TT> </TD>
    <TD vAlign=top>Prints a stack trace. A stack trace displays a list of 
      function calls and the line number where the calls were made.</TD></TR>
  <TR>
    <TD vAlign=top><TT>V</TT> </TD>
    <TD vAlign=top>Lists all variables that are currently defined from all 
      packages and modules that are loaded. A better form of this command is 
      <TT>V PACKAGE</TT> or <TT>V PACKAGE VARLIST</TT> where <TT>PACKAGE</TT> is 
      the name of a loaded package or module, and <TT>VARLIST</TT> is a 
      currently defined variable in <TT>PACKAGE</TT>. When specifying variable 
      names, don't use the <TT>$</TT>, <TT>@</TT>, or <TT>%</TT> type 
    specifiers.</TD></TR>
  <TR>
    <TD vAlign=top><TT>w LINE</TT> </TD>
    <TD vAlign=top>Displays about 10 lines centered around <TT>LINE</TT>. For 
      example, if you use <TT>w 10</TT>, lines 7 to 16 might display.</TD></TR>
  <TR>
    <TD vAlign=top><TT>X</TT> </TD>
    <TD vAlign=top>Lists all variables in the current package. If you have 
      stepped into a function that is in package <TT>foo</TT>, the variables in 
      package <TT>foo</TT> are displayed, not those in <TT>main</TT>. You can 
      also specify exactly which variables to display if needed. When specifying 
      variable names, don't use the <TT>$</TT>, <TT>@</TT>, or <TT>%</TT> type 
      specifiers.</TD></TR>
  <TR>
    <TD vAlign=top><TT>-</TT> </TD>
    <TD vAlign=top>Displays about 10 lines of your script that are before the 
      current line. For example, if the current display line is 30, this command 
      might display lines 19 to 29.</TD></TR>
  <TR>
    <TD colSpan=2><I>Commands That Control Execution</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>s</TT> </TD>
    <TD vAlign=top>Steps through the lines in your script one at a time. It 
      steps into any user-defined function that is called. While single-stepping 
      is slow, you see exactly how your code is being executed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>n</TT> </TD>
    <TD vAlign=top>Executes the next statement in your script. Although all 
      function calls are executed, it does not follow the execution path inside 
      a function. This command enables you to move quicker through the execution 
      of your script than simply using the <TT>s</TT> command. An example of 
      this is shown in the "<A 
      href="ch16.htm#Examples: Using the n Command">Examples: 
      Using the n Command</A>" section later in this chapter.</TD></TR>
  <TR>
    <TD vAlign=top><TT>r</TT> </TD>
    <TD vAlign=top>Executes the rest of the statements in the current 
      function. The debugger pauses for input on the line following the line 
      that made the function call.</TD></TR>
  <TR>
    <TD vAlign=top><TT>c LINE</TT> </TD>
    <TD vAlign=top>Executes the rest of the statements in your script unless a 
      breakpoint is found before the script ends. You can optionally use this 
      command to create a temporary break by specifying a line number after the 
      <TT>c</TT>. I think of this command as <TT>c</TT>ontinue until 
      <TT>LINE</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>No Command</TT> </TD>
    <TD vAlign=top>Pressing the Enter key without specifying a command will 
      make the debugger repeat the last <TT>n</TT> or <TT>s</TT> command that 
      was used. This feature makes it a little easier to single-step through 
      your script.</TD></TR>
  <TR>
    <TD colSpan=2><I>Commands That Work with the Debugger Command 
    History</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>!</TT> </TD>
    <TD vAlign=top>Redoes the previous command. You can also specify the 
      number of the previous command to execute. Use the <TT>H</TT> command to 
      get a list of the previous commands. If you specify a negative number, 
      like <TT>! -2</TT>, the debugger counts backwards from the last executed 
      command.</TD></TR>
  <TR>
    <TD vAlign=top><TT>H</TT> </TD>
    <TD vAlign=top>Lists all the debugger commands you have issued. Only 
      commands that cause action are saved in the command history. This means 
      that the <TT>l</TT> and <TT>T</TT> commands are not saved. You can limit 
      the history viewed by specifying a negative number. For example, <TT>H 
      -5</TT> displays the last five commands you have issued.</TD></TR>
  <TR>
    <TD colSpan=2><I>Miscellaneous Commands</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>f FILENAME</TT> </TD>
    <TD vAlign=top>Causes the debugger to switch to <TT>FILENAME</TT>. The 
      file specified must have already been loaded via the <TT>use</TT> or 
      <TT>require</TT> statements. Please note that some of the documentation 
      that accompanies the Perl interpreter may indicate that <TT>f</TT> is the 
      <TT>finish</TT> command. It used to be; however, the finish functionality 
      is now accomplished by the <TT>r</TT> command.</TD></TR>
  <TR>
    <TD vAlign=top><TT>q</TT> </TD>
    <TD vAlign=top>Quits the debugger. You can also use the Ctrl+D key 
      sequence under UNIX and the Ctrl+Z key sequence under DOS and 
  Windows.</TD></TR>
  <TR>
    <TD vAlign=top><TT>t</TT> </TD>
    <TD vAlign=top>Toggles trace mode on and off. Trace mode, when on, 
      displays each script line as it is being executed. I don't recommend this 
      option except for very short programs because the lines are displayed so 
      quickly that you won't be able to read them.</TD></TR>
  <TR>
    <TD vAlign=top><TT>/pattern/</TT> </TD>
    <TD vAlign=top>Searches for <TT>pattern</TT> in the currently loaded file. 
      If <TT>pattern</TT> is found, the current display line is changed to the 
      line where <TT>pattern</TT> was found.</TD></TR>
  <TR>
    <TD vAlign=top><TT>?pattern?</TT> </TD>
    <TD vAlign=top>Searches backward for <TT>pattern</TT> in the currently 
      loaded file. If <TT>pattern</TT> is found, the current display line is 
      changed to the line where <TT>pattern</TT> was found.</TD></TR>
  <TR>
    <TD vAlign=top><TT>=</TT> </TD>
    <TD vAlign=top>Displays any aliases that are currently defined. You can 
      also use it to create aliases. See the section "<A 
      href="ch16.htm#Examples: Creating Command Aliases">Examples: 
      Creating Command Aliases</A>" later in this chapter for more information 
      about aliases and the <TT>=</TT> command.</TD></TR>
  <TR>
    <TD vAlign=top><TT>COMMAND</TT> </TD>
    <TD vAlign=top>Any text that is not recognized as an alias or a debugger 
      command is executed as a Perl statement. See the section "<A 
      href="ch16.htm#Examples: Using the Debugger as an Interactive Interpreter">Examples: 
      Using the Debugger as an Interactive Interpreter</A>" later in this 
      chapter for more information about executing Perl statements inside the 
      debugger.</TD></TR></TBODY></TABLE>
<P>As you can see, the debugger has quite a few commands to choose from, and it 
is very powerful. Most programmers will not need all of the functionality that 
the debugger has. If you learn to display script lines, to use breakpoints, and 
to display variables, you'll be well on your way to solving any logic problem 
that may arise. 

### Examples: Displaying Information

The debugger uses the concept of a current display line. The 
<I>current display line</I> is simply the last line that has been displayed by 
the <TT>l</TT> command. When the debugger first starts, the current display line 
is the first executable line. See Listing 16.1 for some examples. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 16.1-16LST01.PL - Using the Debugger List 
      Commands</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>01: package Inventory_item;
02:    sub new {
03:    }
04:
05: package Pen;
06:     @ISA = (Inventory_item);
07:
08:     sub new {
09:     }
10:
11: package Color;
12:     print("Executing Color statements\n");
13:     $colors{"blue"}  = "Die Lot 13";
14:     $colors{"red"}   = "Die Lot 5";
15:
16:     sub new {
17:     }
18:
19: package main;
20:     print("Executing main statements\n");</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>This listing is identical to Listing 14.5 except 
      that the guts of the functions have been removed. This was done simply to 
      shorten the listing.<BR></TD></TR></TBODY></TABLE>
<P>If you load this script into the debugger (<TT>perl -d 16lst01.pl</TT>), you 
will see that the first displayed line is line 6. The lines before line 6 are 
<TT>package</TT> and <TT>function</TT> statements. Line 6 will also be the 
current execution line. 
<P>If you issue the <TT>l</TT> debugger command, lines 6 to 15 are displayed: 
<P><B><PRE>6:          @ISA = (Inventory_item);
7:
8:          sub new {
9:          }
10:
11:     package Color;
12:         print("Executing Color statements\n");
13:         $colors{"blue"}  = "Die Lot 13";
14:         $colors{"red"}   = "Die Lot 5";
15:</PRE></B>After this display, the current display line is changed to 15, but 
the current execution line is still line 6. If you issue the <TT>l</TT> debugger 
command again, lines 16 to 20 are displayed. 
<P>You can display the first line of your script by using the <TT>l 1</TT> 
debugger command. This command displays the first line of the script and changes 
the current display line: 
<P><B><PRE>1:      package Inventory_item;</PRE></B>Because this script uses package 
names to change the namespace in which the functions are defined, simply issuing 
<TT>l new</TT> does not display a <TT>new()</TT> function. Instead, you need to 
use the double-colon (<TT>::</TT>) notation to specify which namespace to use. 
For example, <TT>l Color::new</TT> displays 
<P><B><PRE>16:         sub new {
17:         }</PRE></B>While inside the debugger, you can use the <TT>X </TT>and 
<TT>V</TT> commands to view variables. These commands are very good for simple 
variables, but I have not found them to be useful for complex data structures. 
For example, Listing 16.2 shows a small program that creates an array within an 
array data structure. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 16.2-16LST02.PL - Using the X Command to View 
      Arrays</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>sub prtArray {
    my(@array)      = @_;
    my($index)      = 0;

    foreach (@array) {
        if (ref($_) eq 'ARRAY') {
            my($innerIndex) = 0;

            foreach (@{$array[3]}) {
                print("\t$innerIndex\t'$_'\n");
                $innerIndex++;
            }
        }
        else {
            print("$index\t'$array[$index]'\n");
        }
        $index++;
    }
}

@array = (1, 2, 3, [1, 2, 3], 4);    # an array inside an array.
1;</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Note that this listing is for illustrative purposes 
      only. The crude method used to print the data structure is not recommended 
      for practical use. I suggest that you invest time creating a general-use 
      routine that can print more than one type of complex structure. You might 
      also look at the dumpvars module that comes with most, if not all, Perl 
      distributions.<BR></TD></TR></TBODY></TABLE>
<P>Load this script into the debugger (<TT>perl -d 16lst01.pl</TT>), use the 
<TT>s</TT> command to execute the array assignment, and then display 
<TT>@array</TT> with the <TT>X array</TT> command. Your display should look like 
this: 
<P><B><PRE>@array = (
  0     '1'
  1     '2'
  2     '3'
  3     'ARRAY(0x7c693c)'
  4     '4'
)</PRE></B>You can see that the displayed values are not as informative as you 
might hope for because of the array reference in element 3. However, because the 
<TT>prtArray()</TT> function is designed to print this type of data structure, 
call it from the debugger using the <TT>prtArray(@array);</TT> command. This 
should result in a display like this: 
<P><B><PRE>0       '1'
1       '2'
2       '3'
        0       '1'
        1       '2'
        2       '3'
4       '4'</PRE></B>The <TT>1;</TT> line of code is used to let you execute the 
array assignment without the debugger ending. Just ignore it. 

### Examples: Using the n Command

The <TT>n</TT> command lets you step over function calls in your 
scripts. This command saves you time because you won't need to single-step 
through every line of every function. The program in Listing 16.3 has three 
functions defined and three function calls and is used to demonstrate the 
<TT>n</TT> command. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 16.3-16LST03.PL - Using the <TT>n</TT> Command to Step Over 
      Function Calls</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>1:      sub a {
2:          print("This is function a\n");
3:      }
4:
5:      sub b {
6:          print("This is function b\n");
7:      }
8:
9:      sub c {
10:         print("This is function c\n");
11:     }
12:
13:     a();
14:     b();
15:     c();</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>First, let's see the regular path of execution that takes place using the 
<TT>s</TT> command: 
<P><B><PRE>13:     a();
2:          print("This is function a\n");
This is function a
14:     b();
6:          print("This is function b\n");
This is function b
15:     c();
10:         print("This is function c\n");
This is function c</PRE></B>If the <TT>n</TT> command is used instead of the 
<TT>s</TT> command, the path of execution stays the same. However, you are 
prompted after each function call. The lines inside the function are still 
executed, however. 
<P><B><PRE>13:     a();
This is function a
14:     b();
This is function b
15:     c();
This is function c</PRE></B>By switching between the <TT>s</TT> and <TT>n</TT> 
commands, you can decide which functions to step into and which to step over. 

### Examples: Using Breakpoints

Breakpoints are used to tell the debugger where to stop 
execution of your script. After the execution is stopped, the debugger prompts 
you to enter a debugger command. For example, you might want to set a breakpoint 
on a line that assigns a complicated expression to a variable. This allows you 
to check any variables used in the expression before it is executed. 
<P>Listing 16.4 demonstrates the different breakpoint commands you can use. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 16.4-16LST05.PL - Sample Program to Test 
      Breakpoints</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>1:      sub a {
2:          my($foo) = @_;
3:
4:          print("This is function a. Foo is $foo.\n");
5:      }
6:
7:      a(10);
8:      a(5);</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>When the script is first loaded into the debugger, the current execution line 
is 7. Using the <TT>c</TT> command causes the entire program to be executed. A 
transcript of the debugging session might look like this: 
<P><B><PRE>main::(16lst04.pl:7):   a(10);
  DB<1> <B>c</B>
This is function a. Foo is 10.
This is function a. Foo is 5.</PRE></B>You can force the debugger to stop each 
time that <TT>a()</TT> is invoked by using the <TT>b a</TT> command. This lets 
you examine the <TT>@_</TT> parameter array before the function is started. For 
example: 
<P><B><PRE>main::(16lst04.pl:7):   a(10);
  DB<1> <B>b a</B>
  DB<2> <B>c</B>
main::a(16lst04.pl:2):      my($foo) = @_;
  DB<3> <B>p @_</B>
10
  DB<4> <B>c</B>
This is function a. Foo is 10.
main::a(16lst04.pl:2):      my($foo) = @_;
  DB<4> <B>p @_</B>
5
  DB<5> <B>c</B>
This is function a. Foo is 5.</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>The <TT>p</TT> command, used in this example, is 
      shorthand for the statement <TT>print("@_\n");</TT>. You can use the 
      <TT>p</TT> command to print any variable.<BR></TD></TR></TBODY></TABLE>
<P>You can also create conditional breakpoints. For example, you could tell the 
debugger to stop inside <TT>a()</TT> only if <TT>$foo</TT> is equal to 
<TT>5</TT> using the command <TT>b 4 $foo == 5</TT>. In this instance, you can't 
use <TT>b a $foo == 5</TT> because <TT>$foo</TT> is a local variable. When the 
debugger stops just before executing a function, the parameter array is 
initialized but not any of the local variables. A debugging session using 
conditional breakpoints might look like this: 
<P><B><PRE>main::(16lst04.pl:7):   a(10);
  DB<1> b 4 $foo == 5
  DB<2> <B>L</B>
4:          print("This is function a. Foo is $foo.\n");
  break if ($foo == 5)
  DB<2> <B>c</B>
This is function a. Foo is 10.
main::a(16lst04.pl:4):      print("This is function a. Foo is $foo.\n");
  DB<2> <B>c</B>
This is function a. Foo is 5.</PRE></B>The debugger did not stop during the 
first call to <TT>a()</TT> because <TT>$foo</TT> was equal to <TT>10</TT>. On 
the second call, <TT>$foo</TT> is set to <TT>5</TT> which causes the debugger to 
stop. 
<P>The <TT>L</TT> debugger command is used to display all breakpoints and their 
conditions. If you don't specify any conditions, a default condition of 1 is 
supplied. Because 1 is always true, this creates an unconditional breakpoint. If 
you had created an unconditional breakpoint on line 7, the <TT>L</TT> command 
would display the following: 
<P><B><PRE>4:          print("This is function a. Foo is $foo.\n");
  break if ($foo == 10)
7:      a(10);
  break if (1)</PRE></B>The <TT>d</TT> command is used to delete or remove 
breakpoints. Issuing the commands <TT>d 4</TT> and then <TT>L</TT> would result 
in this display: 
<P><B><PRE>7:      a(10);
  break if (1)</PRE></B>If you want to delete <I>all</I> the breakpoints at 
once, use the <TT>D</TT> command. 

### Examples: Creating Command Aliases

The <TT>=</TT> command is used to create command aliases. If you 
find yourself issuing the same long command over and over again, you can create 
an alias for that command. For example, the debugger command 
<P><B><PRE>= pFoo print("foo=$foo\n");</PRE></B>creates an alias called <TT>pFoo</TT>. 
After this command is issued, typing <TT>pFoo</TT> at the debugger prompt 
produces the same results as typing <TT>print("foo=$foo\n");</TT>. 
<P>You use the <TT>=</TT> command without any arguments when you want a list of 
the current aliases. 
<P>If you want to set up some aliases that will always be defined, create a file 
called <TT>.perldb</TT> and fill it with your alias definitions. Use the 
following line as a template: 
<P><B><PRE>$DB::alias{'pFoo'} = 'print("foo=$foo\n");';</PRE></B>After you create this 
file and its alias definitions, the aliases will be available in every debugging 
session. 

### Examples: Using the Debugger as an Interactive Interpreter

In [](./errors.md), you learned how to create an interactive Perl interpreter that could replace 
shell and batch files. The program was shown in Listing 13.3. You can also use 
the debugger as an interactive interpreter. In fact, it does an even better job 
in some cases. 
<P>If you create a script with functions that perform individual system tasks, 
you can run that script inside the debugger. Then you can call the functions 
from the debugger command lines as needed. Listing 16.5 shows what one possible 
script might look like. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 16.5-16LST05.PL - A Script with Some System Maintenance 
      Functions</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>sub printUserReport {
    # read list of users
    # determine usage statistics
    # display report
}

sub backupUsers {
    # remove backup file.
    #`delete /user/*.bak`

    # backup user files to tape.
    #`\backup /user/*`;
}

sub help {
    print("\n");
    print("backupUsers will perform the nightly backup.\n");
    print("printUserReport will display user usage statistics.\n");
    print("\n");
}

1;</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>This script is really nothing but a skeleton. You 
      should be able to flesh it out with functions that are useful to 
    you.<BR></TD></TR></TBODY></TABLE>
<P>You load this script into the debugger with the command p<TT>erl -d 
16lst05.pl</TT>. After the script loads, you can run any of the functions by 
typing their name at the debugger prompt. Here is a sample debugger session: 
<P><B><PRE>main::(16lst05.pl:22):  1;
  DB<1> help

backupUsers will perform the nightly backup.
printUserReport will display user usage statistics.


  DB<2> backupUsers

  DB<3> q</PRE></B>

## Summary

I think there is a certain art to debugging 
that only experience can teach. There are so many different places where things 
can go wrong that it's impossible to remember which bug is most likely to appear 
in a given scenario. If you have lived through the frustration of tracking a bug 
for hours only to have someone look at your program for three minutes and say, 
"Look, that minus sign should be a multiplication sign!" you are much more 
likely to find the bug the next time. There is no substitute for real-life 
debugging. 
<P>Let's recap what you <I>did</I> learn in this chapter. You started out by 
reading about syntax or compile-time errors. This class of error involved a 
misplaced parenthesis, a missing quote, or some other slip of the fingers while 
entering your program into an editor. Syntax errors are found when Perl compiles 
your program into an internal format prior to actually executing it. The only 
way to track down a syntax error is to read the error messages and look at your 
program. 
<P>Logic errors, on the other hand, can be harder to find. They involve some 
logical flaw in your program. Using the index into an array or specifying the 
wrong variable as a parameter to a function both qualify as logic errors. 
<P>The first step to combating logic errors is to use the <TT>-w</TT> 
command-line option. The <TT>-w</TT> command tells Perl to display warning 
messages for various dangerous coding practices. 
<P>The next step is to use the <TT>strict</TT> pragma in your programs. This 
requires that you declare every variable you use. Creating only local variables 
minimizes the possibility of inadvertently changing the wrong variable or 
causing side effects in your program. 
<P>If you still have logic errors after these two options have been used, you 
might use the debugger. The debugger lets you single-step through your program 
and print or modify variables. You can also set breakpoints or actions, and you 
can interactively call any function directly from the debugger command line. 
<P>The next chapter discusses all the Perl command-line options. You'll also 
read more about the <TT>-e</TT> option mentioned earlier. 

## Review Questions

<OL>
  <LI>What is a logic error? 
  <P></P>
  <LI>What is a compile-time error? 
  <P></P>
  <LI>What will the <TT>D</TT> debugger command do? 
  <P></P>
  <LI>What is a conditional breakpoint? 
  <P></P>
  <LI>What is an action? 
  <P></P>
  <LI>What will the <TT>c</TT> debugger command do? 
  <P></P>
  <LI>Can you invoke any function directly from the debugger command line? 
  <P></P>
  <LI>What is an alias? 
  <P></P>
  <LI>What is a common error associated with conditional expressions?</LI></OL>

## Review Exercises

<OL>
  <LI>Name three common syntax errors. 
  <P></P>
  <LI>Use the <TT>s</TT> debugger command to determine the execution path for 
  the program in Listing 16.1. 
  <P></P>
  <LI>Set a breakpoint on line 14 of Listing 16.1. If you use the <TT>c</TT> 
  command to execute the program, how many times will the debugger stop and 
  display a prompt? 
  <P></P>
  <LI>Modify the program in Listing 16.1 to use the <TT>strict</TT> pragma. 
  <P></P>
  <LI>Create a useful system maintenance function and modify Listing 16.5 to 
  support it.</LI></OL>
