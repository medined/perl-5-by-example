# Perl Modules

<P>In the last chapter, you were introduced to object-oriented programming. 
Along the way, you learned some aspects of programming with Modules although you 
may not have realized it. I believe the shortest definition of a <I>module</I> 
is a namespace defined in a file. For example, the <TT>English</TT> module is 
defined in the <TT>English.pm</TT> file and the <TT>Find</TT> module is defined 
in the <TT>Find.pm</TT> file. 
<P>Of course, modules are more than simply a namespace in a file. But, don't be 
concerned - there's not much more. 
<P>Perl 4, the last version of Perl, depended on libraries to group functions in 
units. There were 31 libraries shipped with Perl 4.036. These have been replaced 
with a standard set of modules. However, the old libraries are still available 
in case you run across some old Perl scripts that need them. 
<P>Libraries - and modules - are generally placed in a subdirectory called Lib. 
On my machine, the library directory is <TT>c:\perl5\lib</TT>. If you don't know 
what your library directory is, ask your system administrator. Some modules are 
placed in subdirectories like <TT>Lib/Net</TT> or <TT>Lib/File</TT>. The modules 
in these sibdirectories are loaded using the subdirectory name, two colons, and 
the module name. For example, <TT>Net::Ping</TT> or <TT>File::Basename</TT>. 
<P>Libraries are made available to your script by using the <TT>require</TT> 
compiler directive. Directives may seem like functions, but they aren't. The 
difference is that compiler directives are carried out when the script is 
compiled and functions are executed while the script is running. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>You might think the distinction between compiler 
      directives and functions is minor. And you might be right. I like to be as 
      precise as possible when using computer terminology. After all, the 
      computer is precise; why shouldn't we be, too? 
      <P>Unfortunately, Perl doesn't make it easy to create simple definitions 
      and place every feature into a nice orderly category. So don't get hung up 
      on attaching a label to everything. If you know what something does, the 
      names won't matter a whole lot.</P></TD></TR></TBODY></TABLE>
<P>Some modules are just collections of functions - like the libraries - with 
some "module" stuff added. Modules should follow these guidelines: 
<P>
<UL>
  <LI>The file name should be the same as the package name. 
  <P></P>
  <LI>The package name should start with a capital letter. 
  <P></P>
  <LI>The file name should have a file extension of <TT>pm</TT>. 
  <P></P>
  <LI>The package should be derived from the <TT>Exporter</TT> class if 
  object-oriented techniques are not being used. 
  <P></P>
  <LI>The module should export functions and variables to the main namespace 
  using the <TT>@EXPORT</TT> and <TT>@EXPORT_OK</TT> arrays if object-oriented 
  techniques are not being used.</LI></UL>
<P>Modules are loaded by the <TT>use</TT> directive, which is similar to 
<TT>require</TT> except it automates the importing of function and variable 
names. 
<P>Modules that are simply a collection of functions can be thought of as 
classes without constructors. Remember that the package name <I>is</I> the class 
name. Whenever you see a package name, you're also seeing a class - even if none 
of the object-oriented techniques are used. 
<P>Object-oriented modules keep all function and variable names close to the 
vest - so to speak. They are not available directly, you access them through the 
module name. Remember the <TT>Inventory_item->new()</TT> notation? 
<P>However, simple function collections don't have this object-oriented need for 
secrecy. They want your script to directly access the defined functions. This is 
done using the Exporter class, <TT>@EXPORT</TT>, and <TT>@EXPORT_OK</TT>. 
<P>The <TT>Exporter</TT> class supplies basic functionality that gives your 
script access to the functions and variables inside the module. The 
<TT>import()</TT> function, defined inside the <TT>Exporter</TT> class, is 
executed at compile-time by the <TT>use</TT> compiler directive. The 
<TT>import()</TT> function takes function and variable names from the module 
namespace and places them into the <TT>main</TT> namespace. Thus, your script 
can access them directly. 
<P>You may occasionally see a reference to what may look like a nested module. 
For example, <TT>$Outer::Inner::foo</TT>. This really refers to a module named 
<TT>Outer::Inner</TT>, so named by the statement: <TT>package 
Outer::Inner;</TT>. Module designers sometimes use this technique to simulate 
nested modules. 

## Module Constructors and Destructors

You may recall constructors and destructors from the 
discussion about objects in the last chapter. Constructors are used to 
initialize something and destructors are used to write log messages, close 
files, and do other clean-up type duties. 
<P>Perl has constructors and destructors that work at the module level as well 
as the class level. The module constructor is called the <TT>BEGIN</TT> block, 
while the module destructor is called the <TT>END</TT> block. 

### The BEGIN Block

The <TT>BEGIN</TT> block is evaluated as soon as it is defined. Therefore, it can 
include other functions using <TT>do()</TT> or <TT>require</TT> statements. 
Since the blocks are evaluated immediately after definition, multiple 
<TT>BEGIN</TT> blocks will execute in the order that they appear in the script. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Define a BEGIN block for the main package. 
      <P>Display a string indicating the begin block is executing. 
      <P>Start the Foo package. 
      <P>Define a BEGIN block for the Foo package. 
      <P>Display a string indicating the begin block is 
  executing.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 15.1-15LST01.PL - Using <TT>BEGIN</TT> Blocks 
  </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>BEGIN {
    print("main\n");
}

package Foo;
    BEGIN {
        print("Foo\n");
    }</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>main
Foo</PRE></B>

### The END Block

The <TT>END</TT> blocks are the last thing to be evaluated. They are even evaluated after 
<TT>exit()</TT> or <TT>die()</TT> functions are called. Therefore, they can be 
used to close files or write messages to log files. Multiple <TT>END</TT> blocks 
are evaluated in reverse order. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 15.2-15LST02.PL - Using <TT>END</TT> Blocks 
  </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>END {
    print("main\n");
}

package Foo;
    END {
        print("Foo\n");
    }</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>Foo
Main</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Signals that are sent to your script can bypass the 
      <TT>END</TT> blocks. So, if your script is in danger of stopping due to a 
      signal, be sure to define a signal-handler function. See [](./errors.md) for more information.</TD></TR></TBODY></TABLE>

## Symbol Tables

Each namespace - and therefore, each module, class, or package - has its own symbol table. A 
<I>symbol table</I>, in Perl, is a hash that holds all of the names defined in a 
namespace. All of the variable and function names can be found there. The hash 
for each namespace is named after the namespace with two colons. For example, 
the symbol table for the <TT>Foo</TT> namespace is called <TT>%Foo::</TT>. 
Listing 15.3 shows a program that displays all of the entries in the 
<TT>Foo::</TT> namespace. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Define the dispSymbols() function. 
      <P>Get the hash reference that should be the first parameter. 
      <P>Declare local temporary variables. 
      <P>Initialize the %symbols variable. This is done to make the code easier 
      to read. 
      <P>Initialize the @symbols variables. This variable is also used to make 
      the code easier to read. 
      <P>Iterate over the symbols array displaying the key-value pairs of the 
      symbol table. 
      <P>Call the dispSymbols() function to display the symbols for the Foo 
      package. 
      <P>Start the Foo package. 
      <P>Initialize the $bar variable. This will place an entry into the symbol 
      table. 
      <P>Define the baz() function. This will also create an entry into the 
      symbol table.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 15.3-15LST03.PL - How to Display the Entries in a Symbol Table 
      </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>sub dispSymbols {
    my($hashRef) = shift;
    my(%symbols);
    my(@symbols);

    %symbols = %{$hashRef};
    @symbols = sort(keys(%symbols));

    foreach (@symbols) {
        printf("%-10.10s| %s\n", $_, $symbols{$_});
    }
}

dispSymbols(\%Foo::);

package Foo;
    $bar = 2;

    sub baz {
        $bar++;
    }</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>bar       | *Foo::bar
baz       | *Foo::baz</PRE></B>This example shows that there are only two things 
in the <TT>%Foo::</TT> symbol table - only those things that the script placed 
there. This is not the case with the <TT>%main::</TT> symbol table. When I 
display the entries in <TT>%main::</TT> I see over 85 items. Part of the reason 
for the large number of name in the <TT>main</TT> package is that some variables 
are forced there. For example, <TT>STDIN</TT>, <TT>STDOUT</TT>, <TT>STDERR</TT>, 
<TT>@ARGV</TT>, <TT>@ARGVOUT</TT>, <TT>%ENV</TT>, <TT>@INC</TT>, and 
<TT>%SIG</TT> are forced into the <TT>main</TT> namespace regardless of when 
they are used. 

## The require Compiler Directive

The <TT>require</TT> directive is used to load Perl libraries. 
If you needed to load a library called <TT>Room.pl</TT>, you would do so like 
this: 
<P><B><PRE>require Room.pl;</PRE></B>No exporting of symbols is done by the 
<TT>require</TT> directive. So all symbols in the libraries must be explicitly 
placed into the <TT>main</TT> namespace. For example, you might see a library 
that looks like this: 
<P><B><PRE>package abbrev;

sub main'abbrev {
    # code for the function
}</PRE></B>Two things in this code snippet point out that it is Perl 4 code. The 
first is that the package name is in all lowercase. And the second is that a 
single-quote is used instead of double-colons to indicate a qualifying package 
name. Even though the <TT>abbrev()</TT> function is defined inside the 
<TT>abbrev</TT> package, it is not part of the <TT>%abbrev::</TT> namespace 
because of the <TT>main'</TT> in front of the function name. 
<P>The <TT>require</TT> directive can also indicate that your script needs a 
certain version of Perl to run. For example, if you are using references you 
should place the following statement at the top of your script: 
<P><B><PRE>require 5.000;</PRE></B>And if you are using a feature that is only 
available with Perl 5.002 - like prototypes - use the following: 
<P><B><PRE>require 5.002;</PRE></B>Perl 4 will generate a fatal error if these lines 
are seen. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Prototypes are not covered in this book. If you are 
      using Perl 5.002 or later, prototypes should be discussed in the 
      documentation that comes with the Perl distribution.</TD></TR></TBODY></TABLE>

## The use Compiler Directive

When it came time to add modules to Perl, thought was given to 
how this could be done and still support the old libraries. It was decided that 
a new directive was needed. Thus, <TT>use</TT> was born. 
<P>The <TT>use</TT> directive will automatically export function and variable 
names to the <TT>main</TT> namespace by calling the module's <TT>import()</TT> 
function. Most modules don't have their own <TT>import()</TT> function; instead 
they inherit it from the <TT>Exporter</TT> module. You have to keep in mind that 
the <TT>import()</TT> function is not applicable to object-oriented modules. 
Object-oriented modules should not export any of their functions or variables. 
<P>You can use the following lines as a template for creating your own modules: 
<P><B><PRE>package Module;
    require(Exporter);
    @ISA = qw(Exporter);
    @EXPORT = qw(funcOne $varOne @variable %variable);
    @EXPORT_OK = qw(funcTwo $varTwo);</PRE></B>The names in the <TT>@EXPORT</TT> 
array will always be moved into the <TT>main</TT> namespace. Those names in the 
<TT>@EXPORT_OK</TT> will only be moved if you request them. This small module 
can be loaded into your script using this statement: 
<P><B><PRE>use Module;</PRE></B>Since <TT>use</TT> is a compiler directive, the module 
is loaded as soon as the compiler sees the directive. This means that the 
variables and functions from the module are available to the rest of your 
script. 
<P>If you need to access some of the names in the <TT>@EXPORT_OK</TT> array, use 
a statement like this: 
<P><B><PRE>use Module qw(:DEFAULT funcTwo);     # $varTwo is not exported.</PRE></B>Once 
you add optional elements to the <TT>use</TT> directive you need to explicitly 
list all of the names that you want to use. The <TT>:DEFAULT</TT> is a short way 
of saying, "give me everything in the <TT>@EXPORT</TT> list." 

## What's a Pragma?

In a - hopefully futile - effort to confuse programmers, the <TT>use</TT> directive was given a second job 
to do. It turns other compiler directives on and off. For example, you might 
want to force Perl to use integer math instead of floating-point math to speed 
up certain sections of your program. 
<P>Remember all of the new terminology that was developed for objects? The 
computer scientists have also developed their own term for a compiler directive. 
And that term is <I>Pragma</I>. The <TT>use</TT> statement controls the other 
pragmas. Listing 15.4 shows a program that use the <TT>integer</TT> pragma. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 15.4-15LST04.PL - Using the <TT>integer</TT> Pragma 
      </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>print("Floating point math: ", 10 / 3, "\n");
use integer;
print("Integer math:        ", 10 / 3, "\n");</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>Floating point math: 3.33333333333333
Integer math:        3</PRE></B>Pragmas can be turned off using the <TT>no</TT> 
compiler directive. For example, the following statement turns off the 
<TT>integer</TT> pragma: 
<P><B><PRE>no integer;</PRE></B>Table 15.1 shows a list of the pragmas that you can 
use. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 15.1-Perl's Pragmas</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Pragma </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>integer </TD>
    <TD vAlign=top>Forces integer math instead of floating point or double 
      precision math.</TD></TR>
  <TR>
    <TD vAlign=top>less </TD>
    <TD vAlign=top>Requests less of something - like memory or cpu time - from 
      the compiler. This pragma has not been implemented yet.</TD></TR>
  <TR>
    <TD vAlign=top>sigtrap </TD>
    <TD vAlign=top>Enables stack backtracing on unexpected signals.</TD></TR>
  <TR>
    <TD vAlign=top>strict </TD>
    <TD vAlign=top>Restricts unsafe constructs. This pragma is highly 
      recommended! Every program should use it.</TD></TR>
  <TR>
    <TD vAlign=top>subs </TD>
    <TD vAlign=top>Lets you predeclare function names.</TD></TR></TBODY></TABLE>

## The strict Pragma

The most important pragma is <TT>strict</TT>. This pragma generates compiler errors if 
unsafe programming is detected. There are three specific things that are 
detected: 
<P>
<UL>
  <LI>Symbolic references 
  <P></P>
  <LI>Non-local variables (those not declared with <TT>my()</TT>)and variables 
  that aren't fully qualified. 
  <P></P>
  <LI>Non-quoted words that aren't subroutine names or file handles.</LI></UL>
<P><I>Symbolic</I> references use the name of a variable as the reference to the 
variable. They are a kind of shorthand widely used in the C programming 
language, but not available in Perl. Listing 15.5 shows a program that uses 
symbolic references. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare two variables.
      <P>Initialize $ref with a reference to $foo. 
      <P>Dereference $ref and display the result. 
      <P>Initialize $ref to $foo. 
      <P>Dereference $ref and display the result. 
      <P>Invoke the strict pragma. 
      <P>Dereference $ref and display the result.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 15.5-15LST05.PL - Detecting Symbolic References 
    </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>my($foo) = "Testing.";
my($ref);

$ref = \$foo;
print("${$ref}\n");     # Using a real reference

$ref = $foo;
print("${$ref}\n");     # Using a symbolic reference

use strict;
print("${$ref}\n");
</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>When run with the command <TT>perl 15lst05.pl</TT>, this program displays: 
<P><B><PRE>Testing.

Can't use string ("Testing.") as a SCALAR ref while "strict refs" in
    use at 15lst05.pl line 14.</PRE></B>The second print statement, even though 
obviously wrong, does not generate any errors. Imagine if you were using a 
complicated data structure like the ones described in [](./references.md). You could spend 
hours looking for a bug like this. After the <TT>strict</TT> pragma is turned 
on, however, a run-time error is generated when the same print statement is 
repeated. Perl even displays the value of the scalar that attempted to 
masquerade as the reference value. 
<P>The <TT>strict</TT> pragma ensures that all variables that are used are 
either local to the current block or they are fully qualified. Fully qualifying 
a variable name simply means to add the package name where the variable was 
defined to the variable name. For example, you would specify the 
<TT>$numTables</TT> variable in package <TT>Room</TT> by saying 
<TT>$Room::numTables</TT>. If you are not sure which package a variable is 
defined it, try using the <TT>dispSymbols()</TT> function from Listing 15.3. 
Call the <TT>dispSymbols()</TT> function once for each package that your script 
uses. 
<P>The last type of error that <TT>strict</TT> will generate an error for is the 
non-quoted word that is not used as a subroutine name or file handle. For 
example, the following line is good: 
<P><B><PRE>$SIG{'PIPE'} = 'Plumber';</PRE></B>And this line is bad: 
<P><B><PRE>$SIG{PIPE} = 'Plumber';</PRE></B>Perl 5, without the <TT>strict</TT> 
pragma, will do the correct thing in the bad situation and assume that you meant 
to create a string literal. However, this is considered bad programming 
practice. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Always use the <TT>strict</TT> pragma in your 
      scripts. It will take a little longer to declare everything, but the time 
      saved in debugging will more than make up for it.</TD></TR></TBODY></TABLE>

## The Standard Modules

Table 15.2 lists the modules that should come with all distributions of Perl. Some of these 
modules are not portable across all operating systems, however. The descriptions 
for the modules mention the incompatibility if I know about it. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 15.2-Perl's Standard Modules</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Module </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>Text::Abbrev </TD>
    <TD vAlign=top>Creates an abbreviation table from a list. The abbreviation 
      table consists of the shortest sequence of characters that can uniquely 
      identify each element of the list.</TD></TR>
  <TR>
    <TD vAlign=top>AnyDBM_File </TD>
    <TD vAlign=top>Provides a framework for accessing multiple DBMs. This is a 
      UNIX-based module.</TD></TR>
  <TR>
    <TD vAlign=top>AutoLoader </TD>
    <TD vAlign=top>Loads functions on demand. This enables your scripts to use 
      less memory.</TD></TR>
  <TR>
    <TD vAlign=top>AutoSplit </TD>
    <TD vAlign=top>Splits a package or module into its component parts for 
      autoloading.</TD></TR>
  <TR>
    <TD vAlign=top>Benchmark </TD>
    <TD vAlign=top>Tracks the running time of code. This module can be 
      modified to run under Windows but some of its functionality will be 
    lost.</TD></TR>
  <TR>
    <TD vAlign=top>Carp </TD>
    <TD vAlign=top>Provides an alternative to the <TT>warn()</TT> and 
      <TT>die()</TT> functions that report the line number of the calling 
      routine. See "<A 
      href="ch15.htm#Example: The Carp Module">Example: 
      The Carp Module</A>" later in the chapter for more information.</TD></TR>
  <TR>
    <TD vAlign=top>I18N::Collate </TD>
    <TD vAlign=top>Compares 8-bit scalar data according to the current locale. 
      This helps to give an international viewpoint to your script.</TD></TR>
  <TR>
    <TD vAlign=top>Config </TD>
    <TD vAlign=top>Accesses the Perl configuration options.</TD></TR>
  <TR>
    <TD vAlign=top>Cwd </TD>
    <TD vAlign=top>Gets the pathname of the current working direcory. This 
      module will generate a warning message when used with the -w command line 
      option under the Windows and VAX VMS operating systems. You can safely 
      ignore the warning.</TD></TR>
  <TR>
    <TD vAlign=top>Dynaloader </TD>
    <TD vAlign=top>Lets you dynamically load C libraries into Perl code.</TD></TR>
  <TR>
    <TD vAlign=top>English </TD>
    <TD vAlign=top>Lets you use english terms instead of the normal special 
      variable names.</TD></TR>
  <TR>
    <TD vAlign=top>Env </TD>
    <TD vAlign=top>Lets you access the system environment variables using 
      scalars instead of a hash. If you make heavy use of the environment 
      variables, this module might improve the speed of your script.</TD></TR>
  <TR>
    <TD vAlign=top>Exporter </TD>
    <TD vAlign=top>Controls namespace manipulations.</TD></TR>
  <TR>
    <TD vAlign=top>Fcntl </TD>
    <TD vAlign=top>Loads file control definition used by the <TT>fcntl()</TT> 
      function.</TD></TR>
  <TR>
    <TD vAlign=top>FileHandle </TD>
    <TD vAlign=top>Provides an object-oriented interface to filehandles.</TD></TR>
  <TR>
    <TD vAlign=top>File::Basename </TD>
    <TD vAlign=top>Parses a file name and path from a specification.</TD></TR>
  <TR>
    <TD vAlign=top>File::CheckTree </TD>
    <TD vAlign=top>Runs many filetest checks on a directory tree.</TD></TR>
  <TR>
    <TD vAlign=top>File::Find </TD>
    <TD vAlign=top>Traverse a file tree. This module will not work under the 
      Windows operating systems without modification.</TD></TR>
  <TR>
    <TD vAlign=top>Getopt </TD>
    <TD vAlign=top>Provides basic and extended options processing.</TD></TR>
  <TR>
    <TD vAlign=top>ExtUtils::MakeMaker </TD>
    <TD vAlign=top>Creates a Makefile for a Perl extension</TD></TR>
  <TR>
    <TD vAlign=top>Ipc::Open2 </TD>
    <TD vAlign=top>Opens a process for both reading and writing.</TD></TR>
  <TR>
    <TD vAlign=top>Ipc::Open3 </TD>
    <TD vAlign=top>Opens a process for reading, writing and error 
  handling.</TD></TR>
  <TR>
    <TD vAlign=top>POSIX </TD>
    <TD vAlign=top>Provides an interface to IEEE 1003.1 namespace.</TD></TR>
  <TR>
    <TD vAlign=top>Net::Ping </TD>
    <TD vAlign=top>Checks to see if a host is available.</TD></TR>
  <TR>
    <TD vAlign=top>Socket </TD>
    <TD vAlign=top>Loads socket definitions used by the socket 
  functions.</TD></TR></TBODY></TABLE>

## strict, my() and Modules

In order to use the <TT>strict</TT> pragma with modules you need 
to know a bit more about the <TT>my()</TT> function about how it creates lexical 
variables instead of local variables. You may be tempted to think that variables 
declared with <TT>my()</TT> are local to a package. Especially since you can 
have more than one package statement per file. However, <TT>my()</TT> does the 
exact opposite, in fact variables that are declared with <TT>my()</TT> are never 
stored inside the symbol table. 
<P>If you need to declare variables that are local to a package, fully qualify 
your variable name in the declaration or initialization statement, like this: 
<P><B><PRE>use strict;

$main::foo = '';

package Math;
    $Math::PI = 3.1415 &amp;&amp; $Math::PI;</PRE></B>This code snippet declares 
two variables: <TT>$foo</TT> in the <TT>main</TT> namespace and <TT>$PI</TT> in 
the <TT>Math</TT> namespace. The <TT>&amp;&amp; $Math::PI</TT> part of the 
second declaration is used to avoid getting error messages from the -w command 
line option. Since the variable is inside a package, there is no guarantee that 
it will be used by the calling script and the -w command line option generates a 
warning about any variable that is only used once. By adding the harmless 
logical and to the declaration, the warning messages are avoided. 

## Module Examples

This section shows you how to use the <TT>Carp</TT>, <TT>English</TT>, and <TT>Env</TT> modules. After 
looking at these examples, you should feel comfortable about trying the rest. 

### Example: The Carp Module

This useful little module lets you do a better job of analyzing 
run-time errors - like when your script can't open a file or when a unexpected 
input value is found. It defines the <TT>carp()</TT>, <TT>croak()</TT>, and 
<TT>confess()</TT> functions. These are similar to <TT>warn()</TT> and 
<TT>die()</TT>. However, instead of reported the exact script line where the 
error occurred, the functions in this module will display the line number that 
called the function that generated the error. Confused? So was I, until I did 
some experimenting. The results of that experimenting can be found in Listing 
15.6. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Load the Carp module.</TT> 
      <P><TT>Invoke the strict pragma.</TT> 
      <P><TT>Start the Foo namespace.</TT> 
      <P><TT>Define the foo() function.</TT> 
      <P><TT>Call the carp() function.</TT> 
      <P><TT>Call the croak() function.</TT> 
      <P><TT>Switch to the main namespace.</TT> 
      <P><TT>Call the foo() function.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 15.6-15LST06.PL - Using the <TT>carp()</TT> and 
      <TT>croak()</TT> from the <TT>Carp</TT> Module </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>use Carp;
use strict;

package Foo;
    sub foo {
        main::carp("carp called at line " . __LINE__ .
            ",\n    but foo() was called");

        main::croak("croak called at line " . __LINE__ .
            ",\n    but foo() was called");
}

package main;
    Foo::foo();</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>carp called at line 9,
    but foo() was called at e.pl line 18
croak called at line 10,
    but foo() was called at e.pl line 18</PRE></B>This example uses a compiler 
symbol, __LINE__, to incorporate the current line number in the string passed to 
both <TT>carp()</TT> and <TT>croak()</TT>. This technique enables you to see 
both the line number where <TT>carp()</TT> and <TT>croak()</TT> were called 
<I>and</I> the line number were <TT>foo()</TT> was called. 
<P>The <TT>Carp</TT> module also defines a <TT>confess()</TT> function which is 
similar to <TT>croak()</TT> except that a function call history will also be 
displayed. Listing 15.7 shows how this function can be used. The function 
declarations were placed after the <TT>foo()</TT> function call so that the 
program flow reads from top to bottom with no jumping around. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Load the Carp module.</TT> 
      <P><TT>Invoke the strict pragma.</TT> 
      <P><TT>Call foo().</TT> 
      <P><TT>Define foo().</TT> 
      <P><TT>Call bar().</TT> 
      <P><TT>Define bar().</TT> 
      <P><TT>Call baz().</TT> 
      <P><TT>Define baz().</TT> 
      <P><TT>Call Confess().</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 15.7-15LST07.PL - Using <TT>confess()</TT> from the 
      <TT>Carp</TT> Module </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>use Carp;
use strict;

foo();

sub foo {
    bar();
}

sub bar {
    baz();
}

sub baz {
    confess("I give up!");
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>I give up! at e.pl line 16
        main::baz called at e.pl line 12
        main::bar called at e.pl line 8
        main::foo called at e.pl line 5</PRE></B>This daisy-chain of function 
calls was done to show you how the function call history looks when displayed. 
The function call history is also called a <I>stack trace</I>. As each function 
is called, the address from which it is called gets placed on a stack. When the 
<TT>confess()</TT> function is called, the stack is unwound or read. This lets 
Perl print the function call history. 

### The English Module

The <TT>English</TT> module is designed to make your scripts more 
readable. It creates aliases for all of the special variables that were 
discussed in [](./special-variables.md). Table 15.3 lists all of the aliases that are defined. 
After the table, some examples show you how the aliases are used. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Some of the same concepts embodied by the special 
      variables are used by the UNIX-based awk program. The <TT>English</TT> 
      module also provides aliases that match what the special variables are 
      called in awk.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>I think that this module is especially useful 
      because it provides aliases for the regular expression matching special 
      variables and the formatting special variables. You'll use the other 
      special variables often enough so that their use becomes second nature. Or 
      else you won't need to use them at all.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 15.3-Aliases Provided by the English Module</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Special Variable</TH>
    <TH align=left>Alias </TH></TR>
  <TR>
    <TD colSpan=2><I>Miscellaneous</I></TD></TR>
  <TR>
    <TD vAlign=top>$_ </TD>
    <TD vAlign=top>$ARG</TD></TR>
  <TR>
    <TD vAlign=top>@_ </TD>
    <TD vAlign=top>@ARG</TD></TR>
  <TR>
    <TD vAlign=top>$" </TD>
    <TD vAlign=top>$LIST_SEPARATOR</TD></TR>
  <TR>
    <TD vAlign=top>$; </TD>
    <TD vAlign=top>$SUBSCRIPT_SEPARATOR or $SUBSEP</TD></TR>
  <TR>
    <TD colSpan=2><I>Regular Expression or Matching</I></TD></TR>
  <TR>
    <TD vAlign=top>$&amp; </TD>
    <TD vAlign=top>$MATCH</TD></TR>
  <TR>
    <TD vAlign=top>$` </TD>
    <TD vAlign=top>$PREMATCH</TD></TR>
  <TR>
    <TD vAlign=top>$' </TD>
    <TD vAlign=top>$POSTMATCH</TD></TR>
  <TR>
    <TD vAlign=top>$+ </TD>
    <TD vAlign=top>$LAST_PAREN_MATCH</TD></TR>
  <TR>
    <TD colSpan=2><I>Input</I></TD></TR>
  <TR>
    <TD vAlign=top>$. </TD>
    <TD vAlign=top>$INPUT_LINE_NUMBER or $NR</TD></TR>
  <TR>
    <TD vAlign=top>$/ </TD>
    <TD vAlign=top>$INPUT_RECORD_SEPARATOR or $RS</TD></TR>
  <TR>
    <TD colSpan=2><I>Output</I></TD></TR>
  <TR>
    <TD vAlign=top>$| </TD>
    <TD vAlign=top>$OUTPUT_AUTOFLUSH</TD></TR>
  <TR>
    <TD vAlign=top>$, </TD>
    <TD vAlign=top>$OUTPUT_FIELD_SEPARATOR or $OFS</TD></TR>
  <TR>
    <TD vAlign=top>$\ </TD>
    <TD vAlign=top>$OUTPUT_RECORD_SEPARATOR or $ORS</TD></TR>
  <TR>
    <TD colSpan=2><I>Formats</I></TD></TR>
  <TR>
    <TD vAlign=top>$% </TD>
    <TD vAlign=top>$FORMAT_PAGE_NUMBER</TD></TR>
  <TR>
    <TD vAlign=top>$= </TD>
    <TD vAlign=top>$FORMAT_LINES_PER_PAGE</TD></TR>
  <TR>
    <TD vAlign=top>$_ </TD>
    <TD vAlign=top>$FORMAT_LINES_LEFT</TD></TR>
  <TR>
    <TD vAlign=top>$~ </TD>
    <TD vAlign=top>$FORMAT_NAME</TD></TR>
  <TR>
    <TD vAlign=top>$^ </TD>
    <TD vAlign=top>$FORMAT_TOP_NAME</TD></TR>
  <TR>
    <TD vAlign=top>$: </TD>
    <TD vAlign=top>$FORMAT_LINE_BREAK_CHARACTERS</TD></TR>
  <TR>
    <TD vAlign=top>$^L </TD>
    <TD vAlign=top>$FORMAT_FORMFEED</TD></TR>
  <TR>
    <TD colSpan=2><I>Error Status</I></TD></TR>
  <TR>
    <TD vAlign=top>$? </TD>
    <TD vAlign=top>$CHILD_ERROR</TD></TR>
  <TR>
    <TD vAlign=top><TT>$!</TT> </TD>
    <TD vAlign=top><TT>$OS_ERROR</TT> or $ERRNO</TD></TR>
  <TR>
    <TD vAlign=top>$@ </TD>
    <TD vAlign=top>$EVAL_ERROR</TD></TR>
  <TR>
    <TD colSpan=2><I>Process Information</I></TD></TR>
  <TR>
    <TD vAlign=top>$$ </TD>
    <TD vAlign=top>$PROCESS_ID or $PID</TD></TR>
  <TR>
    <TD vAlign=top>$< </TD>
    <TD vAlign=top>$REAL_USER_ID or $UID</TD></TR>
  <TR>
    <TD vAlign=top>$> </TD>
    <TD vAlign=top>$EFFECTIVE_USER_ID or $EUID</TD></TR>
  <TR>
    <TD vAlign=top>$( </TD>
    <TD vAlign=top>$REAL_GROUP_ID or $GID</TD></TR>
  <TR>
    <TD vAlign=top>$) </TD>
    <TD vAlign=top>$EFFECTIVE_GROUP_ID or $EGID</TD></TR>
  <TR>
    <TD vAlign=top>$0 </TD>
    <TD vAlign=top>$PROGRAM_NAME</TD></TR>
  <TR>
    <TD colSpan=2><I>Internal Variables</I></TD></TR>
  <TR>
    <TD vAlign=top>$] </TD>
    <TD vAlign=top>$PERL_VERSION</TD></TR>
  <TR>
    <TD vAlign=top>$^A </TD>
    <TD vAlign=top>$ACCUMULATOR</TD></TR>
  <TR>
    <TD vAlign=top>$^D </TD>
    <TD vAlign=top>$DEBUGGING</TD></TR>
  <TR>
    <TD vAlign=top>$^F </TD>
    <TD vAlign=top>$SYSTEM_FD_MAX</TD></TR>
  <TR>
    <TD vAlign=top>$^I </TD>
    <TD vAlign=top>$INPLACE_EDIT</TD></TR>
  <TR>
    <TD vAlign=top>$^P </TD>
    <TD vAlign=top>$PERLDB</TD></TR>
  <TR>
    <TD vAlign=top>$^T </TD>
    <TD vAlign=top>$BASETIME</TD></TR>
  <TR>
    <TD vAlign=top>$^W </TD>
    <TD vAlign=top>$WARNING</TD></TR>
  <TR>
    <TD vAlign=top>$^X </TD>
    <TD vAlign=top>$EXECUTABLE_NAME</TD></TR></TBODY></TABLE>
<P>Listing 15.8 shows a program that uses one of the English variables to access 
information about a matched string. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Load the English module.</TT> 
      <P><TT>Invoke the strict pragma.</TT> 
      <P><TT>Initialize the search space and pattern variables.</TT> 
      <P><TT>Perform a matching operation to find the pattern </TT>
      <P><TT>in the $searchSpace variable.</TT> 
      <P><TT>Display information about the search.</TT> 
      <P><TT>Display the matching string using the English variable names.</TT> 
      <P><TT>Display the matching string using the standard Perl special 
      variables.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 15.8-15LST01.PL - Using the English Module 
</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>use English;
use strict;

my($searchSpace) = "TTTT BBBABBB DDDD";
my($pattern)     = "B+AB+";

$searchSpace =~ m/$pattern/;

print("Search space:   $searchSpace\n");
print("Pattern:        /$pattern/\n");
print("Matched String: $English::MATCH\n");  # the English variable
print("Matched String: $&amp;\n");               # the standard Perl variable</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays 
<P><B><PRE>Search space:   TTTT BBBABBB DDDD
Pattern:        /B+AB+/
Matched String: BBBABBB
Matched String: BBBABBB</PRE></B>You can see that the <TT>$&amp;</TT> and 
<TT>$MATCH</TT> variables are equivalent. This means that you can use another 
programmer's functions without renaming their variables and still use the 
English names in your own functions. 

### Example: The Env Module

If you use environment variables a lot, then you need to look at 
the <TT>Env</TT> module. It will enable you to directly access the environment 
variables as Perl scalar variables instead of through the <TT>%Env</TT> hash. 
For example, <TT>$PATH</TT> is equivalent to <TT>$ENV{'PATH'}</TT>. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Load the Env module.</TT> 
      <P><TT>Invoke the strict pragma.</TT> 
      <P><TT>Declare the @files variable.</TT> 
      <P><TT>Open the temporary directory and read all of its files.</TT> 
      <P><TT>Display the name of the temporary directory.</TT> 
      <P><TT>Display the names of all files that end in tmp.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 15.9-15LST09.PL - Displaying Temporary Files Using the 
      <TT>Env</TT> Module </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>use Env;
use strict;

my(@files);

opendir(DIR, $main::TEMP);
    @files = readdir(DIR);
closedir(DIR);

print "$main::TEMP\n";
foreach (@files) {
    print("\t$_\n") if m/\.tmp/i;
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>C:\WINDOWS\TEMP
        ~DF182.TMP
        ~DF1B3.TMP
        ~DF8073.TMP
        ~DF8074.TMP
        ~WRS0003.tmp
        ~DF6116.TMP
        ~DFC2C2.TMP
        ~DF9145.TMP</PRE></B>This program is pretty self-explanatory, except 
perhaps for the manner in which the <TT>$main::TEMP</TT> variable is specified. 
The <TT>strict</TT> pragma requires all variables to be lexically declared or to 
be fully qualified. The environment variables are declared in the <TT>Env</TT> 
package, but exported into the <TT>main</TT> namespace. Therefore, they need to 
be qualified using the <TT>main::</TT> notation. 

## Summary

In this chapter you learned about Perl 
modules. You read about several guidelines that should be followed when creating 
modules. For example, package name should have their first letter capitalized 
and use file extensions of <TT>pm</TT>. 
<P>The <TT>require</TT> compiler directive is used to load Perl libraries that 
were distributed with Perl 4. Modules, however, are loaded with the <TT>use</TT> 
directive. In addition to loading the module, <TT>use</TT> will move variable 
and function names into the <TT>main</TT> namespace where your script can easily 
access them. The name movement is done by using the <TT>@EXPORT</TT> and 
<TT>@EXPORT_OK</TT> arrays. 
<P>Next, you read about the <TT>BEGIN</TT> and <TT>END</TT> blocks which are 
like module constructors and destructors. The <TT>BEGIN</TT> block is evaluated 
as soon as it is defined. <TT>END</TT> blocks are evaluated just before your 
program ends - in reverse order. The last <TT>END</TT> block defined is the 
first to be evaluated. 
<P>Symbols tables are used to hold the function and variable names for each 
package. You learned that each symbol table is stored in a hash named after the 
package name. For example, the symbol table for the <TT>Room</TT> package is 
stored in <TT>%Room::</TT>. Listing 15.3 contained a function - 
<TT>dispSymbol</TT> - that displays all of the names in a given symbol table. 
<P>Libraries are loaded using the <TT>require</TT> compiler directive and 
modules are loaded with the <TT>use</TT> directive. Unlike the <TT>require</TT> 
directive, <TT>use</TT> will automatically call a module's <TT>import()</TT> 
function to move function and variable names from the module's namespace into 
the <TT>main</TT> namespace. The name movement is controlled using the 
<TT>@EXPORT</TT> and <TT>@EXPORT_OK</TT> array. Names in <TT>@EXPORT</TT> are 
always exported. Those in <TT>@EXPORT_OK</TT> must be explicitly mentioned in 
the <TT>use</TT> statement. 
<P>The <TT>use</TT> directive also controls other directives which are called 
pragmas. The most useful pragmas are <TT>integer</TT> and <TT>strict</TT>. Use 
the <TT>integer</TT> pragma when you need fast integer math. And use 
<TT>strict</TT> all of the time to enforce good programming habits - like using 
local variables. 
<P>Table 15.2 shows the 25 modules that are distributed with Perl. And then some 
more light was shed on how the <TT>my()</TT> function won't create variables 
that are local to a package. In order to create variables in the packages' 
namespace, you need to fully qualify them with the package name. For example, 
<TT>$Math::PI</TT> or <TT>$Room::numChairs</TT>. 
<P>The last section of the chapter looked at specific examples of how to use 
modules. The <TT>Carp</TT>, <TT>English</TT>, and <TT>Env</TT> modules were 
discussed. <TT>Carp</TT> defines three functions: <TT>carp()</TT>, 
<TT>croak()</TT>, and <TT>confess()</TT> that aid in debugging and error 
handling. <TT>English</TT> provides aliases for all of Perl's special variables 
so that Perl code is easier to understand. And <TT>Env</TT> provides aliases for 
environmental variables so that you can access them directly instead of through 
the <TT>%Env</TT> hash variable. 
<P>In the next chapter, you learn about debugging Perl code. You read about 
syntax or compile-time errors versus run-time errors. And the <TT>strict</TT> 
pragma will be discussed in more detail. 

## Review Questions

Answers to Review Questions are in Appendix A: 
<P>
<OL>
  <LI>What is a module? 
  <P></P>
  <LI>How is a module different from a library? 
  <P></P>
  <LI>What is the correct file extension for a module? 
  <P></P>
  <LI>What is a pragma? 
  <P></P>
  <LI>What is the most important pragma and why? 
  <P></P>
  <LI>What does the <TT>END</TT> block do? 
  <P></P>
  <LI>What is a symbol table?
  <P></P>
  <LI>How can you create a variable that is local to a package?</LI></OL>

## Review Exercises

<OL>
  <LI>Write a program that uses <TT>BEGIN</TT> and <TT>END</TT> blocks to write 
  a message to a log file about the start and end times for the program. 
  <P></P>
  <LI>Use the <TT>English</TT> module to display Perl's version number. 
  <P></P>
  <LI>Modify the <TT>dispSymbols()</TT> function from Listing 15.3 to only 
  display function and variable names passed as arguments. 
  <P></P>
  <LI>Execute the program in Listing 15.5 with the -w command line option. 
  Describe the results. 
  <P></P>
  <LI>Write a module to calculate the area of a rectangle. Use the 
  <TT>@EXPORT</TT> array to export the name of your function.</LI></OL>
