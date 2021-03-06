# Review Questions

### Chapter 1

<OL>
  <LI>What is the address of Perl's home page?<BR><B><A 
  href="http://www.perl.com/">http://www.perl.com/</A>.</B> 
  <P></P>
  <LI>Who was the creator of Perl? <BR><B>Larry Wall.</B> 
  <P></P>
  <LI>How much does Perl cost? <BR><B>Free.</B> 
  <P></P>
  <LI>Why are comments important to Programming? <BR><B>Comments will enable you 
  to figure out the intent behind the mechanics of your program.</B></LI></OL>

### Chapter 2

<OL>
  <LI>What are the four types of data that can be used in 
  literals?<BR><B>Literals can be Numeric, Strings, Arrays, or Associative 
  Arrays.</B> 
  <P></P>
  <LI>What are numeric literals? <BR><B>They represent a number that your 
  program will need to work with. </B>
  <P></P>
  <LI>How many types of string literals are there? <BR><B>Three - Single-quoted, 
  double-quoted and back-quoted. </B>
  <P></P>
  <LI>What is the major difference between singe and double-quoted strings? 
  <BR><B>Double-quoted strings allow the use of variables.</B> 
  <P></P>
  <LI>What are three escape sequences and what do they mean? <BR><B>Any value in 
  this table would be correct:
  <P></B>
  <TABLE cellPadding=10 border=1>
    <CAPTION>Table A.1-Escape Sequences</CAPTION>
    <TBODY>
    <TR>
      <TH align=left>Escape Sequences </TH>
      <TH align=left>Description or Character</TH></TR>
    <TR>
      <TD vAlign=top>\a </TD>
      <TD vAlign=top>Alarm\bell</TD></TR>
    <TR>
      <TD vAlign=top>\b </TD>
      <TD vAlign=top>Backspace</TD></TR>
    <TR>
      <TD vAlign=top>\e </TD>
      <TD vAlign=top>Escape</TD></TR>
    <TR>
      <TD vAlign=top>\f </TD>
      <TD vAlign=top>Form Feed</TD></TR>
    <TR>
      <TD vAlign=top>\n </TD>
      <TD vAlign=top>Newline</TD></TR>
    <TR>
      <TD vAlign=top>\r </TD>
      <TD vAlign=top>Carriage Return</TD></TR>
    <TR>
      <TD vAlign=top>\t </TD>
      <TD vAlign=top>Tab</TD></TR>
    <TR>
      <TD vAlign=top>\v </TD>
      <TD vAlign=top>Vertical Tab</TD></TR>
    <TR>
      <TD vAlign=top>\$ </TD>
      <TD vAlign=top>Dollar Sign</TD></TR>
    <TR>
      <TD vAlign=top>\@ </TD>
      <TD vAlign=top>Ampersand</TD></TR>
    <TR>
      <TD vAlign=top>\% </TD>
      <TD vAlign=top>Percent Sign</TD></TR>
    <TR>
      <TD vAlign=top>\0nnn </TD>
      <TD vAlign=top>Any Octal byte</TD></TR>
    <TR>
      <TD vAlign=top>\xnn </TD>
      <TD vAlign=top>Any Hexadecimal byte</TD></TR>
    <TR>
      <TD vAlign=top>\cn </TD>
      <TD vAlign=top>Any Control character</TD></TR>
    <TR>
      <TD vAlign=top>\l </TD>
      <TD vAlign=top>Change the next character to lower case</TD></TR>
    <TR>
      <TD vAlign=top>\u </TD>
      <TD vAlign=top>Change the next character to upper case</TD></TR>
    <TR>
      <TD vAlign=top>\L </TD>
      <TD vAlign=top>Change the following characters to lowercase until a \E 
        sequence is encountered</TD></TR>
    <TR>
      <TD vAlign=top>\U </TD>
      <TD vAlign=top>Change the following characters to uppercase until a \E 
        sequence is encountered</TD></TR>
    <TR>
      <TD vAlign=top>\E </TD>
      <TD vAlign=top>Terminate the \L or \U sequence</TD></TR>
    <TR>
      <TD vAlign=top>\\ </TD>
      <TD vAlign=top>Backslash</TD></TR></TBODY></TABLE>
  <P></P>
  <LI>What would the following one-line program display?<BR><B><PRE>print `dir c:\*.log`;
</PRE></B><B>This would display all files with the extension of LOG on a DOS 
  system.</B> 
  <P></P>
  <LI>What is scientific notation?<BR><B>A means of displaying very large or 
  very small numbers in a base-10 notation</B> 
  <P></P>
  <LI>How can you represent the number 64 in hexadecimal inside a double-quoted 
  string?<BR><B>"0x40"</B> 
  <P></P>
  <LI>What is the easiest way to represent an array that includes the numbers 56 
  to 87?<BR><B>(56..87)</LI></OL></B>

### Chapter 3

<OL>
  <LI>What are the three basic data types that Perl uses? <BR><B>Scalar, Array 
  and associative array.</B> 
  <P></P>
  <LI>How can you determine the number of elements in an array? <BR><B>You can 
  assign the array variable to a scalar variable.</B> 
  <P></P>
  <LI>What is a namespace? <BR><B>A namespace is a way to segregate one type of 
  name from another. The scalar variables use one namespace and array variables 
  use another.</B> 
  <P></P>
  <LI>What is the special variable <TT>$[</TT> used for? <BR><B>The <TT>$[</TT> 
  variable can tell you the base array subscript. </B>
  <P></P>
  <LI>What is the special variable <TT>$"</TT> used for? <BR><B>The <TT>$"</TT> 
  variables determines what character or string is used to separate array 
  elements when they are printed using a double-quoted sting and variable 
  interpolation. </B>
  <P></P>
  <LI>What is the value of a variable when it is first used? <BR><B>In a numeric 
  context, zero. In a string context, an empty string. </B>
  <P></P>
  <LI>What is an associative array? <BR><B>An associative array is an array 
  which can use non-numbers as array subscripts. A scalar key is used as the 
  subscript to retrieve an associated value. </B>
  <P></P>
  <LI>How can you access associative array elements? <BR><B>You use curly braces 
  around the subscript and a $ to begin the variable name. </B></LI></OL>

### Chapter 4

<OL>
  <LI>What are three arithmetic operators? <BR>
  <TABLE cellPadding=10 border=0>
    <TBODY>
    <TR>
      <TD>+</TD>
      <TD>Addition</TD></TR>
    <TR>
      <TD><B>-</B></TD>
      <TD><B>Subtraction</B></TD></TR>
    <TR>
      <TD><B>*</B></TD>
      <TD><B>Multiplication</B></TD></TR>
    <TR>
      <TD><B>/</B></TD>
      <TD><B>Division</B></TD></TR></TBODY></TABLE>
  <P></P>
  <LI>What does the x operator do? <BR><B>Returns the string to the left of x 
  and repeats it the number of times listed to the right of the x.</B> 
  <P></P>
  <LI>What does it mean to pre-decrement a variable? <BR><B>To reduce the value 
  of the variable by one before it is used.</B> 
  <P></P>
  <LI>What is the value of 1 ^ 1? <BR><B>0</B> 
  <P></P>
  <LI>What is the value of 1 << 3? <BR><B>8</B> 
  <P></P>
  <LI>What is the ternary operator used for? <BR><B>The <I>ternary</I> operator 
  is actually a sequence of operators designed to choose between two options. 
  </B>
  <P></P>
  <LI>Can the x operator be used with arrays? <BR><B>Yes</B> 
  <P></P>
  <LI>What is the precedence level of the range operator? <BR><B>4</B> 
  <P></P>
  <LI>What is the value of 2 * 5 + 10? <BR><B>20</B> 
  <P></P>
  <LI>What is the value of 65 >> 1? <BR><B>32</B> 
  <P></P>
  <LI>What is the spaceship operator used for? <BR><B>Compares two values and 
  returns a -1 for less than and a +1 for greater than. </B>
  <P></P>
  <LI>If an array were defined with ("fy".."gb"), how many elements would it 
  have?<BR><B>4</B></LI></OL>

### Chapter 5

<OL>
  <LI>What is a parameter? <BR><B>A parameter is a value that gets passed to a 
  procedure.</B> 
  <P></P>
  <LI>What two functions are used to create variables with local scope? 
  <BR><B>local() and my()</B> 
  <P></P>
  <LI>What does parameter passing by reference mean? <BR><B>When parameters are 
  called by reference, changing their value in the function also changes their 
  value in the main program. </B>
  <P></P>
  <LI>What is the <TT>@_</TT> array used for? <BR><B>To store arguments used by 
  perl.</B> 
  <P></P>
  <LI>Do Perl variables have global or local scope by default? 
  <BR><B>Global.</B> 
  <P></P>
  <LI>Why is it hard to pass two arrays to a function? <BR><B>Because all 
  parameters passed to a function wind up in the <TT>@_</TT> array. Unless 
  special precautions are taken (such as using references), the two passed 
  arrays are combined into one array, the <TT>@_</TT> array.</B> 
  <P></P>
  <LI>What is the difference between variables created with <TT>local()</TT> and 
  variables created with <TT>my()</TT>?<BR><B>The <TT>my()</TT> function creates 
  variables that only the current procedure or code block can see. The 
  <TT>local()</TT> function, however, creates variables that procedures called 
  from the current procedure can see. </B>
  <P></P>
  <LI>What does the <TT>map()</TT> function do? <BR><B>This function will 
  evaluate an expression for every element of a given array. The special 
  variable <TT>$_</TT> is assigned each element of the specified array before 
  the expression is evaluated. </B>
  
  ### Chapter 6
  
    <LI>What are expressions? <BR><B>They are a sequence of literals, variables, 
  function connected by one or more operators that evaluate to a single 
  value-scalar or array. </B>
  <P></P>
  <LI>What are statements? <BR><B>Statements are a complete unit of instruction 
  for the computer to process. </B>
  <P></P>
  <LI>What are the four statement modifiers? <BR><B>if, unless, until, and 
  while</B> 
  <P></P>
  <LI>What are two uses for statement blocks? <BR><B>As a visual device to mark 
  sections of code and a way to create local variables and when you temporarily 
  need to send debugging output to a file. </B>
  <P></P>
  <LI>What can non-action statement be used for? <BR><B>These statements 
  evaluate a value, but perform no actions. Therefore they have little use 
  except to return values from a procedure.</B> 
  <P></P>
  <LI>How is the if modifier different from the unless modifier? <BR><B>The 
  <I>if</I> modifier will tell Perl that the expression should only be evaluated 
  if a given condition is true. The Unless Operator will evaluate an expression 
  unless a condition is true.</B> 
  <P></P>
  <LI>What will the following code display?<BR><B>firstVar = 10<BR>secondVar = 
  20</B> </LI></OL>

### Chapter 7

<OL>
  <LI>What are the four loop keywords? <BR><B>While, until, for and foreach</B> 
  <P></P>
  <LI>What are the four jump keywords? <BR><B>Last, next, redo, and goto</B> 
  <P></P>
  <LI>Which form of the <TT>until</TT> statement is used when the statement 
  block needs to be executed at least once? <BR><B>The <TT>do..until</TT> 
  loop.</B> 
  <P></P>
  <LI>What will be displayed when this program executes?<BR><B><PRE>$firstVar = 5;
{
    if ($firstVar > 10) {
        last;
    }
    $firstVar++;
    redo;
}
print("$firstVar\n");</PRE></B><B>This program will display: 
  <P><B><PRE>11</PRE></B></B>
  <LI>What is the default name of the local variable in the foreach loop? 
  <BR><B>$_</B> 
  <P></P>
  <LI>How is the <TT>next</TT> keyword different from the <TT>redo</TT> keyword? 
  <BR><B>The <TT>next</TT> keyword is used to skip the rest of the statement 
  block and continue to the next iteration of the loop. The <TT>redo</TT> 
  keyword is used to restart the statement block.</B> 
  <P></P>
  <LI>Why is the comma operator useful in the initialization expression of a for 
  loop? <BR><B>Because you can use the comma operator to evaluate two 
  expressions at once in the initialization and the increment/decrement 
  expressions. </B>
  <P></P>
  <LI>What is the shift() function used for? <BR><B>To value a local variable 
  <I>and </I>remove the first element of the parameter array from the array at 
  the same time. If you use <TT>shift()</TT> all by itself, the value of the 
  first element is lost. </B></LI></OL>

### Chapter 8

<OL>
  <LI>What is a reference? <BR><B>A <I>reference</I> is a scalar value that 
  points to a memory location that holds some type of data. </B>
  <P></P>
  <LI>How many types of references are there? <BR><B>Five.</B> 
  <P></P>
  <LI>What does the ref() function return if passed a non-reference as a 
  parameter? <BR><B>The <TT>ref()</TT> function returns either a defined or 
  undefined null string depending on which platform you are using - I think.</B> 

  <P></P>
  <LI>What notation is used to dereference a reference value? <BR><B>Curly 
  braces.</B> 
  <P></P>
  <LI>What is an anonymous array? <BR><B>Anonymous arrays are arrays that are 
  not being assigned directly to a variable. They are only accessible using 
  references.</B> 
  <P></P>
  <LI>What is a nested data structure? <BR><B>A nested data structure is a data 
  structure that contains another data structure. Frequently, an object needs to 
  contain another object-just like a bag can contain groceries. </B>
  <P></P>
  <LI>What will the following line of code display?<BR><B><PRE>print("${\ref(\(1..5))}");</PRE></B><B>This code will display: 
  <P><B><PRE>	ARRAY</PRE></B></B></LI></OL>

### Chapter 9

<OL>
  <LI>What is a file handle? <BR><B>File handles are variables used to 
  manipulate files. </B>
  <P></P>
  <LI>What is binary mode? <BR><B>In binary mode on DOS systems, line endings 
  are read as two characters-the line feed and the carriage return. On both DOS 
  and UNIX systems, binary mode lets you read the end of file character as 
  regular characters with no special meaning. </B>
  <P></P>
  <LI>What is a fully qualified file name? <BR><B>The fully qualified file name 
  includes the name of the disk, the directory, and the file name. </B>
  <P></P>
  <LI>Are variables in the computer's memory considered persistent storage? 
  <BR><B>No</B>. 
  <P></P>
  <LI>What is the <TT><></TT> operator used for? <BR><B>The 
  <TT><></TT> characters, when used together, are called the 
  <I>diamond</I> operator. They tell Perl to read a line of input from the file 
  handle inside the operators. </B>
  <P></P>
  <LI>What is the default file handle for the <TT>printf()</TT> function? 
  <BR><B>The default file handle is <TT>STDOUT</TT>.</B> 
  <P></P>
  <LI>What is the difference between the following two open statements?<BR><B><PRE>     open(FILE_ONE, ">FILE_ONE.DAT");
     open(FILE_TWO, ">>FILE_TWO.DAT");</PRE></B><B>The > character 
  causes the file to be opened for writing and causes any existing data in the 
  file to be lost. Whereas the >> character sequence will open the file 
  for appending-preserving the existing data. </B>
  <P></P>
  <LI>What value will the following expression return?<BR><B><PRE>     (stat("09lst01.pl"))[7];</PRE></B><B>This expression will return the 
  size of the file. </B>
  <P></P>
  <LI>What is globbing? <BR><B>Using wildcard characters to find filenames. </B>
  <P></P>
  <LI>What will the following statement display? <BR><B><PRE>printf("%x", 16); </PRE></B><B>The statement displays: 
  <P><B><PRE>10</PRE></B></B></LI></OL>

### Chapter 10

<OL>
  <LI>Can you use variable interpolation with the translation operator? 
  <BR><B>No</B> 
  <P></P>
  <LI>What happens if the pattern is empty? <BR><B>The last pattern is used.</B> 

  <P></P>
  <LI>What variable does the substitution operator use as its default? 
  <BR><B>All regular expression operators use <TT>$_</TT> as the default search 
  space.</B> 
  <P></P>
  <LI>Will the following line of code work?<BR><B><PRE>m{.*];</PRE></B><B>When using curly braces as alternative delimiters, the 
  end delimiter must be <TT>}</TT>.</B> 
  <P></P>
  <LI>What is the <TT>/g</TT> option of the substitution operator used for? 
  <BR><B>The <TT>/g</TT> option forces all instances of the pattern to be 
  substituted, not just the first. </B>
  <P></P>
  <LI>What does the <TT>\d</TT> meta-character sequence mean? <BR><B>The 
  <TT>\d</TT> sequence is a symbolic character class that matches digits. </B>
  <P></P>
  <LI>What is the meaning of the dollar sign in the following pattern?<BR><B><PRE>/AA[.<]$]ER/</PRE></B><B>The <TT>$</TT> is the beginning character of 
  the special variable <TT>$]</TT>.</B> 
  <P></P>
  <LI>What is a word boundary? <BR><B>A word boundary is that imaginary point 
  between the end of a word and the next character-which is usually a space 
  character or a punctuation mark. </B>
  <P></P>
  <LI>What will be displayed by the following program? <BR><B><PRE>$_ = 'AB AB AC';
print m/c$/i;</PRE></B><B>This program displays:<BR><B><PRE>1</PRE></B></B></LI></OL>

### Chapter 11

<OL>
  <LI>What is the syntax of the format statement?<BR><B>The syntax is:<BR><B><PRE>format FORMATNAME =
    FIELD_LINE
    VALUE_LINE
.</PRE></B></B>
  <LI>What is a footer? <BR><B>Footers are use at the bottom of each page and 
  can only consist of static text. </B>
  <P></P>
  <LI>What function is used to invoke the format statement? <BR><B>The write() 
  function</B> 
  <P></P>
  <LI>How can you change a detail format line into a header format line? 
  <BR><B>By changing the field lines and value lines.</B> 
  <P></P>
  <LI>What is the <TT>></TT> format character used for? <BR><B>This character 
  indicates that the field should be right-justified. </B>
  <P></P>
  <LI>What is the <TT>$^L</TT> variable used for? <BR><B>The <TT>$^L</TT> 
  variable holds the string that Perl writes before every report page except for 
  the first. </B>
  <P></P>
  <LI>Can associative array variables be used in value lines? <BR><B>No.</B> 
  <P></P>
  <LI>What will the following line of code do? <BR><B><PRE>select((select(ANNUAL_RPT), $^ = "REGIONAL_SALES")[0]);</PRE></B><B>First 
  the <TT>ANNUAL_RPT</TT> file handle will be selected as the default file 
  handle for the print and write statements and then the <TT>$~</TT> variable 
  will be changed to the new format name. By enclosing the two statements inside 
  parentheses their return values will be used in an array context. Since the 
  select function returns the value of the previous default file handle, after 
  executing the second <TT>select()</TT> the default file handle will be 
  restored to its previous value.</B></LI></OL>

### Chapter 12

<OL>
  <LI>What is the <TT>$/</TT> variable used for? <BR><B>This variable holds the 
  input record separator. </B>
  <P></P>
  <LI>What file handle is used to avoid a second system call when doing two or 
  more file tests?<BR><B>The underscore.</B> 
  <P></P>
  <LI>What will the following program display?<BR><B><PRE>$_ = "The big red shoe";
m/[rs].*\b/;
print("$`\n");</PRE></B></B><B>This program displays:<BR><B><PRE>The Big</PRE></B></B>
  <LI>What variable holds the value of the last matched string? 
  <BR><B>$&amp;</B> 
  <P></P>
  <LI>What will the following program display?<BR><B><PRE>@array = (1..5);
$" = "+";
print("@array\n");</PRE></B></B><B>This program displays:<BR><B><PRE>1+2+3+4+5</PRE></B></B>
  <LI>What does the following program display? <BR><B><PRE>@array = ('A'..'E');

foreach (@array) {
    print();
}

$\ = "\n";
foreach (@array) {
    print();
}</PRE></B><B>This program displays:<BR><B><PRE>ABCDEA
B
C
D
E</PRE></B></B></LI></OL>

### Chapter 13

<OL>
  <LI>Why is it important to check for errors? <BR><B>There is only one way to 
  check for errors in any programming language. You need to test the return 
  values of the functions that you call. Most functions return zero or false 
  when something goes wrong. So when using a critical function like 
  <TT>open()</TT> or <TT>sysread()</TT>, checking the return value helps to 
  ensure that your program will work properly. </B>
  <P></P>
  <LI>How is the <TT>die()</TT> function different from the <TT>warn()</TT> 
  function? <BR><B>The <TT>die()</TT> function is used to quit your script and 
  display a message for the user to read. The <TT>warn()</TT> function has the 
  same functionality that <TT>die()</TT> does except the script is not exited. 
  This function is better suited for non-fatal messages like low memory or disk 
  space conditions. </B>
  <P></P>
  <LI>What is the meaning of the <TT>$!</TT> special variable? <BR><B>It helps 
  to find out what happened after an error has occurred. The $! variable can be 
  used in either a numeric or a string context. In a numeric context it holds 
  the current value of <TT>errno</TT>. If used in a string context, it will hold 
  the error string associated with <TT>errno</TT></B>. 
  <P></P>
  <LI>What does the <TT>eval()</TT> function do? <BR><B>The <TT>eval()</TT> 
  function executes its arguments as semi-isolated Perl code. First the Perl 
  code in <TT>$code</TT> is executed and then, if an error arises, the Perl code 
  in <TT>$code</TT> is displayed as text by the <TT>die()</TT> function. </B>
  <P></P>
  <LI>What is a signal? <BR><B><I>Signals</I> are messages sent to the process 
  running your Perl script by the operating system. </B>
  <P></P>
  <LI>What will the statement <TT>$SIG{'ABRT'} = 'IGNORE'</TT> do? <BR><B>You 
  can cause Perl to ignore the Ctrl+c key sequence by placing this line of code 
  near the beginning of your program. </B>
  <P></P>
  <LI>Which signal is used to trap floating point exceptions? 
<BR><B>FPE</B></LI></OL></B>

### Chapter 14

<OL>
  <LI>What is an object? <BR><B>The book you are reading is an object. The knife 
  and fork that you eat with are objects. In short, your life is filled with 
  them. </B>
  <P></P>
  <LI>What is a class? <BR><B>All object oriented techniques use classes to do 
  the real work. A <I>class</I> is a combination of variables and functions 
  designed to emulate an object. However, when referring to variables in a 
  class, object-oriented folks use the term <I>properties</I>. And when 
  referring to functions in a class, the term <I>method</I> is used. </B>
  <P></P>
  <LI>What is a property? <BR><B>Variables in a class.</B> 
  <P></P>
  <LI>What does the term polymorphism mean? <BR><B>A child class can redefine a 
  method already defined in the parent class. </B>
  <P></P>
  <LI>Is the <TT>bless()</TT> function used to create classes? <BR><B>No. The 
  <TT>bless()</TT> function is used to change the data type of the anonymous 
  hash to <TT>$class</TT> or <TT>Inventory_item</TT>.</B> 
  <P></P>
  <LI>What does the <TT>package</TT> keyword do? <BR><B>The <TT>package</TT> 
  keyword is used to introduce new classes and namespaces. </B>
  <P></P>
  <LI>What can a static variable be used for? <BR><B>Static variables can be 
  used to emulate <I>constants</I>-values that don't change. </B>
  <P></P>
  <LI>Why is it good to use anonymous hashes to represent objects instead of 
  regular arrays? <BR><B>Child classes, in Perl, will not automatically inherit 
  properties from its parents. However, using anonymous hashes totally avoids 
  this issue because the parent constructor can be explicitly called to create 
  the object. Then, the child can simply add entries to the anonymous hash. </B>
  <P></P>
  <LI>How can you create a function that is available to all classes in your 
  script? <BR><B>Start a definition of the <TT>UNIVERSAL</TT> class.</B></LI></OL>

### Chapter 15

<OL>
  <LI>What is a module? <BR><B>A <I>module</I> is a namespace defined in a file. 
  For example, the <TT>English</TT> module is defined in the <TT>English.pm</TT> 
  file and the <TT>Find</TT> module is defined in the <TT>Find.pm</TT> file. 
</B>
  <P></P>
  <LI>What is the correct file extension for a module? <BR><B>.pm</B> 
  <P></P>
  <LI>What is a pragma? <BR><B>It turns other compiler directives on and off. 
  </B>
  <P></P>
  <LI>What is the most important pragma and why? <BR><B>The most important 
  pragma is <TT>strict</TT>. This pragma generates compiler errors if unsafe 
  programming is detected. </B>
  <P></P>
  <LI>What does the <TT>END</TT> block do? <BR><B><TT>END</TT> blocks write a 
  message to a log file about end times for the program. </B>
  <P></P>
  <LI>What is a symbol table and how are they named? <BR><B>A <I>symbol 
  table</I>, in Perl, is a hash that holds all of the names defined in a 
  namespace. All of the variable and function names can be found there. The hash 
  for each namespace is named after the namespace with two colons. </B>
  <P></P>
  <LI>How can you create a variable that is local to a package? <BR><B>Fully 
  qualify your variable name in the declaration or initialization statement. 
  </B></LI></OL>

### Chapter 16

<OL>
  <LI>What is a logic error? <BR><B><I>Logic</I> errors are insidious and 
  difficult to find. For example, you might place an assignment statement inside 
  an <TT>if</TT> statement block that belongs outside the block. Or you might 
  have a loop that runs from 0 to 100 when it should run from 10 to 100. 
  Accidentally deleting the 1 or not entering it in the first place is very 
  easy.</B> 
  <P></P>
  <LI>What is a compile-time error? <BR><B>Compile-time errors, also known as 
  syntax errors, are made as you type your script into an editor. </B>
  <P></P>
  <LI>What will the <TT>D</TT> debugger command do? <BR><B>Deletes all 
  breakpoints.</B> 
  <P></P>
  <LI>What is a conditional breakpoint? <BR><B>A breakpoint that occurs only 
  when certain criteria are met. </B>
  <P></P>
  <LI>What will the <TT>c</TT> debugger command do? <BR><B>Executes the rest of 
  the statements in your script unless a breakpoint is found before the script 
  ends. You can optionally use this command to create a temporary break by 
  specifying a line number after the <TT>c</TT>.</B> 
  <P></P>
  <LI>Can you invoke any function directly from the debugger command line? 
  <BR><B>Yes.</B> 
  <P></P>
  <LI>What is an alias? <BR><B>An alias is a way of assigning a name to a long 
  command used over and over again. </B>
  <P></P>
  <LI>What is a common error associated with conditional expressions? <BR><B>One 
  of the most common logic problem is using the assignment operator (<TT>=</TT>) 
  when you should use the equality operator (<TT>==</TT>). If you are creating a 
  conditional expression, you'll almost always use the equality operator 
  (<TT>==</TT>).</B></LI></OL>

### Chapter 17

<OL>
  <LI>What is a command line option?<BR><B>Command-line options (also called 
  switches) turn on and off different behaviors of the Perl interpreter.</B> 
  <P></P>
  <LI>What are the two places that the switches can be specified?<BR><B>Switches 
  can be placed either on the command line that invokes Perl or in the first 
  line of the program. </B>
  <P></P>
  <LI>What switch should always be used?<BR><B>You should always use the 
  <TT>-w</TT> switch to turn on the extended warning option. </B>
  <P></P>
  <LI>Which switch lets you read records that end with the <TT>~</TT> character 
  instead of the newline?<BR><B>The <TT>-O</TT> switch lets you specify the 
  record delimiter character. </B>
  <P></P>
  <LI>What two options can be used with the <TT>-n</TT> option?<BR><B>The 
  <TT>-a</TT> and <TT>-F</TT> options can be used the -n. </B>
  <P></P>
  <LI>How can you execute a script that someone sent you via E-mail?<BR><B>The 
  <TT>-x</TT> option can be used to execute a script from the middle of a file. 
  </B>
  <P></P>
  <LI>What happens if you specify both the <TT>-v</TT> and the <TT>-c</TT> 
  options?<BR><B>The <TT>-v</TT> option displays the Perl version number and 
  then the <TT>-c</TT> option checks the syntax of any Perl script specified on 
  the command line. </B>
  <P></P></LI></OL>

### Chapter 18

<OL>
  <LI>What is a protocol? <BR><B>A protocol is a set of commands and responses. 
  </B>
  <P></P>
  <LI>What is a socket? <BR><B><I>Sockets</I> are the low-level links that 
  enable Internet conversations. </B>
  <P></P>
  <LI>What is the POP? <BR><B>Post Office Protocol - incoming mail</B> 
  <P></P>
  <LI>Will client programs use the <TT>bind()</TT> function? <BR><B>No</B> 
  <P></P>
  <LI>Do newly created sockets have an address? <BR><B>No</B> 
  <P></P>
  <LI>What is a port? <BR><B>A <I>Port</I> is an imaginary place where incoming 
  packets of information can arrive (just like a ship arrives at a sea port). 
  </B>
  <P></P>
  <LI>When sending the body or text of an email message, will the server 
  response after each line? <BR><B>Yes</B> 
  <P></P>
  <LI>Why shouldn't the echo service be used by Windows operating systems? 
  <BR><B>Windows 95 (and perhaps other operating systems) can't use the SIGALRM 
  interrupt signal. This may cause problems if you use this script on those 
  systems because the program will wait forever when a server does not respond. 
  </B>
  <P></P>
  <LI>What is the largest NNTP reponse in terms of bytes? 
  <BR><B>Unlimited.</B></LI></OL>

### Chapter 19

<OL>
  <LI>Is CGI a programming language? <BR><B>No.</B> 
  <P></P>
  <LI>Are CGI and Java the same type of protocol? <BR><B>No.</B> 
  <P></P>
  <LI>Do CGI program files need to have the write right turned on? 
  <BR><B>No.</B> 
  <P></P>
  <LI>What is the first line of output for CGI programs? <BR><B>An HTTP 
  header.</B> 
  <P></P>
  <LI>What information does the HTTP_USER_AGENT contain? <BR><B>It provides the 
  type and version of the user's web browser. </B>
  <P></P>
  <LI>Why is CGItap a useful program? <BR><B>It is a CGI debugging aid that can 
  help pinpoint the problem in a troubling CGI application. </B></LI></OL>

### Chapter 20

<OL>
  <LI>What does the acronym HTML stand for? <BR><B>HyperText Markup Language. 
  </B>
  <P></P>
  <LI>What are the <H1>..</H1> set of tags used for? <BR><B>It 
  formats text as a first level heading.</B> 
  <P></P>
  <LI>What is the down side of using SSI directives? <BR><B>They are very 
  processor intensive.</B> 
  <P></P>
  <LI>Can an HTML form have two submit buttons? <BR><B>No.</B> 
  <P></P>
  <LI>Why should all angle brackets be replaced in form information? <BR><B>So 
  that the web browser doesn't think that a new HTML tag is starting.</B> 
  <P></P>
  <LI>How much text can be entered into a <TEXTAREA> input field? 
  <BR><B>Unlimited.</B> 
  <P></P>
  <LI>Can you debug a CGI script? <BR><B>Yes. </B></LI></OL>

### Chapter 21

<OL>
  <LI>What is the access log used for? <BR><B>It records who and what accesses a 
  specific HTML page or graphic. </B>
  <P></P>
  <LI>Does the <TT>fullName</TT> field in the log file correspond to the user's 
  mail address? <BR><B>No.</B> 
  <P></P>
  <LI>Why is the status code of the log file entry important? <BR><B>To 
  determine if unauthorized people are trying to access secured documents</B> 
  <P></P>
  <LI>Can you find log file analysis programs on the Internet? <BR><B>Yes</B> 
  <P></P>
  <LI>What good is a customized log file? <BR><B>To keep track of who executes 
  your CGI scripts. </B>
  <P></P>
  <LI>What are two popular features of web sites? <BR><B>The "What's New" page 
  and the Feedback Form.</B> 
  <P></P>
  <LI>What does recursion mean? <BR><B>A recursive function calls itself in 
  order to get work done. </B></LI></OL>
