# Variables

<P>In the last chapter, you learned about <I>literals</I> - values that don't 
change while your program runs because you represent them in your source code 
<I>exactly</I> as they should be used. Most of the time, however, you will need 
to change the values that your program uses. To do this, you need to set aside 
pieces of computer memory to hold the changeable values. And you need to keep 
track of where all these little areas of memory are so that you can refer to 
them while your program runs. 
<P>Perl, like all other computer languages, uses variables to keep track of the 
usage of computer memory. Every time you need to store a new piece of 
information, you assign it to a variable. 
<P>You've already seen how Perl uses numbers, strings, and arrays. Now, you'll 
see how to use variables to hold this information. Perl has three types of 
variables: 
<P>
<TABLE cellPadding=10 border=1>
  <TBODY>
  <TR>
    <TH align=left>Variable Type </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>Scalars </TD>
    <TD vAlign=top>Holds one number or string value at a time. Scalar variable 
      names always begin with a $.</TD></TR>
  <TR>
    <TD vAlign=top>Arrays </TD>
    <TD vAlign=top>Holds a list of values. The values can be numbers, strings, 
      or even another array. Array variable names always begin with a @.</TD></TR>
  <TR>
    <TD vAlign=top>Associative Arrays </TD>
    <TD vAlign=top>Uses any value as an index into an array. Associative array 
      variable names always begin with a %.</TD></TR></TBODY></TABLE>
<P>The different beginning characters help you understand how a variable is used 
when you look at someone else's Perl code. If you see a variable called @Value, 
you automatically know that it is an array variable. 
<P>They also provide a different <I>namespace</I> for each variable type. 
Namespaces separate one set of names from another. Thus, Perl can keep track of 
scalar variables in one table of names (or namespace) and array variables in 
another. This lets you use $name, @name, and %name to refer to different values. 

<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>I recommend against using identical variable names 
      for different data types unless you have a very good reason to do so. And 
      if you do need to use the same name, try using the plural of it for the 
      array variable. For example, use $name for the scalar variable name and 
      @names for the array variable name. This might avoid some confusion about 
      what your code does in the future.<BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Variable names in Perl are case-sensitive. This 
      means that $varname, $VarName, $varName, and $VARNAME all refer to 
      different variables.<BR></TD></TR></TBODY></TABLE>
<P>Each variable type will be discussed in its own section. You'll see how to 
name variables, set their values, and some of the uses to which they can be put. 

## Scalar Variables

Scalar variables are used to track single pieces of information. You'd use them to hold the title of 
a book, or the number of rooms in a house. You can use just about any name 
imaginable for a scalar variable as long as it begins with a $. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>If you have programmed in Visual Basic, you need to 
      be especially careful when naming variables. Just remember that <I>all</I> 
      scalars begin with a $, not just strings, and that the $ starts the name; 
      it doesn't end it.<BR></TD></TR></TBODY></TABLE>
<P>Let's jump right in a look at some variable names. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>This scalar variable will hold the number of rooms. 
      <P>This scalar variabe will hold the title of a book. 
      <P>This scalar variable conflicts with a Perl special variable that you'll 
      learn about in [](./special-variables.md).</TT></P></TD></TR></TBODY></TABLE>
<P><B><PRE></TT>$numberOfRooms
$bookTitle
$0</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>It is generally a good idea to stay away from short 
      variable names. Longer variable names are more descriptive and aid in 
      understanding programs. 
      <P>Let me say a quick word about variable names. I always start my 
      variable names with a lower case letter and then make the first letter of 
      each "word" in the name upper case. Some programmers like to separate each 
      word with an underscore. For example, $numberOfRooms would look like 
      $number_of_rooms. Choose a method that you feel comfortable with and then 
      stick with it. Being consistent will make your program more 
      understandable.<BR></P></TD></TR></TBODY></TABLE>
<P>Most programmers try to use descriptive names for their variables. There is 
no practical limit to the length of a Perl variable name, but I like to keep 
them under 15 characters. Anything longer than that means that it will take a 
while to type them and increases the chances of spelling errors. 

### Example: Assigning Values to Scalar Variables

Now that you know what scalar variable names 
look like, we'll look at how you can assign a value to them. Assigning values to 
a variable is done with the equals (=) sign. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Assign a value of 23 to a variable called $numberOfRooms.</TT> 
      <P><TT>Assign a value of Perl by Example to a variable called 
      $bookTitle.</TT></P></TT></TD></TR></TBODY></TABLE>
<P><B><PRE></TT>$numberOfRooms = 23;
$bookTitle = "Perl by Example";</PRE></B>Notice that you are assigning literal 
values to the variables. After assigning the values you can then change them. 

### Changing Values in Scalar Variables

The next example will make a variable assignment and then 
change that variable's value using a second assignment. The second assignment 
will increment the value by five. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Assign a value of 23 to a variable called $numberOfRooms.</TT> 
      <P><TT>Add 5 to the $numberOfRooms 
variable.</TT></P></TT></TD></TR></TBODY></TABLE>
<P><B><PRE></TT>$numberOfRooms = 23;
$numberOfRooms = $numberOfRooms + 5;</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>In Perl, you never have to declare, define, or 
      allocate simple data types (for example: scalars, arrays, or associative 
      arrays). When you use the variable for the first time, Perl either assigns 
      it a zero if you need a number, or an empty list if you need an array. 
      Using a variable name is equivalent to defining 
it.<BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Letting Perl automatically initialize variables is 
      fine for small programs. However, if you write professional programs that 
      need to be maintained, you'll want to explicitly declare variables using 
      the my() function. Explicitly declaring functions will reduce errors and 
      improve the internal documentation of your programs. The my() function is 
      discussed in [](./functions.md).
  <BR></TD></TR></TBODY></TABLE>

## Array Variables

You had a short introduction to arrays last chapter when you printed out entire arrays (with no 
spaces, remember?) using Perl's print statement. Now, you'll learn about arrays 
in more detail. Array variable names always begin with a @ character. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>I remember that the @ sign starts array variables 
      because "at" and "array" start with the same letter. Simple...but it works 
      for me.<BR></TD></TR></TBODY></TABLE>
<P>The rules for naming array variables are the same as those for scalar 
variables. There are no rules. Well, none that you need to worry about. In fact, 
let's skip looking at variable names and get right to assigning arrays to 
variables, instead. 

### Example: Assigning Values to Array Variables

You use the equals (=) sign to assign values 
to array variables just like scalar values. 
<P>We'll use one of the examples from [](./literals.md) - 
reworked a little - here so that you'll already be familiar with part of the 
example. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato SIZE-4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>The printing of the newline character is separated from 
      the printing of the array for a reason. It has to do with how Perl 
      interprets variables in different contexts. If you tried to use print 
      @numberArray . "\n"; Perl thinks that you want to use @numberArray in a 
      scalar context and won't print the elements of the array. It will print 
      the number of elements instead. See the section called "Example: Determine 
      the Number of Elements in an Array" later in this 
  chapter.<BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Assign values to array variables.</TT> 
      <P><TT>Print the array variables.</TT></P></TT></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 3.1 - 03LST01.PL - 
      Assigning Values to Array Variables. </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
@emptyArray = ();
@numberArray = (12, 014, 0x0c, 34.34, 23.3E-3);
@stringArray = ("This", "is", 'an', "array", 'of', "strings");
@mixedArray = ("This", 30, "is", 'a', "mixed array", 'of', 0x08, "items");
print "Here is an empty array:" . @emptyArray . "<-- Nothing there!\n";
print @numberArray;  print "\n";
print @stringArray;  print "\n";
print @mixedArray;   print "\n";
</PRE></B></TD></TR></TBODY></TABLE>
<P>This program will display 
<P><B><PRE>Here is an empty array:0<-- Nothing there!
12121234.340.0233
Thisisanarrayofstrings
This30isamixed arrayof8items</PRE></B>

<P>In this example, we assign literal values to array variables and then display 
them using the print command. This is very similar to what we did in [](./getting-your-feet-wet.md)
except that we are temporarily storing the array values into variables before printing them. 

<P>Suppose that you want to create one array from two smaller ones. You can do 
this by using the sub-arrays inside the assignment statement. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Create two small arrays using the range operator.</TT> 
      <P><TT>Create an array that consists of the two small arrays.</TT> 
      <P><TT>Print the array.</TT></P></TT></TD></TR></TBODY></TABLE>
<P><B><PRE>@smallArrayOne = (5..10);
@smallArrayTwo = (1..5);
@largeArray = (@smallArrayOne, @smallArrayTwo);
print @largeArray;</PRE></B>When run, this program prints the array (5, 6, 7, 8, 
9, 10, 1, 2, 3, 4, 5). Notice that the 5 is duplicated in the new array and that 
the elements are still in the same order as the sub-arrays. When you concatenate 
arrays in this manner, Perl does not sort them or modify their contents in any 
way. 

### Example: Using Array Elements

Individual elements of an array are accessed by prefixing the 
array name with a $ and using an index that indicates to Perl which element you 
want to use. 
<P>Listing 3.2 creates an array of five elements and then prints each individual 
element. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Create an array with five elements.</TT> 
      <P><TT>Print the array.</TT> 
      <P><TT>Print each element of the array.</TT></P></TT></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 3.2 - 03LIST02.PL 
      - Accessing Array Elements </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
@array = (1..5);
print @array;     print "\n";
print $array[0];  print "\n";
print $array[1];  print "\n";
print $array[2];  print "\n";
print $array[3];  print "\n";
print $array[4];  print "\n";</PRE></B></TD></TR></TBODY></TABLE>
<P>Listing 3.2 will print the following: 
<P><B><PRE>12345
1
2
3
4
5</PRE></B>Perl array indexes start at 0 - well, they actually start at $[ - but 
for the moment zero is good enough. Almost every Perl program uses zero as the 
base array subscript. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The special variable, $[, is used to hold the base 
      array subscript; usually it is zero. However, it can be changed to any 
      integer you want. Even negative ones. Using a negative base array 
      subscript will probably make your programs hard to understand and I 
      recommend against it. Other special variables are mentioned in [](./special-variables.md).
      <BR></TD></TR></TBODY></TABLE>
<P>You can replace the numeric literal indexes in the above example with scalar 
variables. You can say: 
<P><B><PRE>$index = 2;
@array = (1..5);
print $array[$index];  print "\n";</PRE></B>which would print 3. 

### Example: Using Negative Subscripts

Perl is definitely a language that will surprise you at 
times. In other languages, subscripts must be positive integers. However, Perl 
lets you use negative subscripts to access array elements in reverse order. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Using a negative subscript may come in handy if you 
      need a fast way to get the value of the last element in an 
  array.<BR></TD></TR></TBODY></TABLE>
<P>The program in Listing 3.3 assigns a five element array to @array. Then, it 
uses print statement and negative subscripts to print each array element in 
reverse order. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 3.3 - 03LIST03.PL 
      - Accessing Array Elements Using Negative Subscripts </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
@array = (1..5);
print @array;      print "\n";
print $array[-1];  print "\n";
print $array[-2];  print "\n";
print $array[-3];  print "\n";
print $array[-4];  print "\n";
print $array[-5];  print "\n";</PRE></B></TD></TR></TBODY></TABLE>
<P>Listing 3.3 will print the following: 
<P><B><PRE>12345
5
4
3
2
1</PRE></B>

### Example: Determining the Number of Elements in an Array

If you need to determine the number of elements that an array contains you can assign the array to a 
scalar variable. 
<P>In fact, any time that an array is used when a scalar is needed, the value 
used will be the number of array elements. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Create an array with five elements</TT> 
      <P><TT>Assign the array size to the $numberOfElements scalar 
      variable.</TT> 
      <P><TT>Multiply the array size by 2 and assign that value to 
      $doubleTheSize.</TT> 
      <P><TT>Print the scalar variables. </TT></P></TT></TD></TR></TBODY></TABLE>
<P><B><PRE>@array = (1..5);
$numberOfElements = @array;
$doubleTheSize = 2 * @array;
print "The number of array elements is: " . $numberOfElements . "\n";
print "Double the number of array elements is: " . $doubleTheSize . "\n";</PRE></B>When 
this program runs, it will assign a value of 5 to $numberOfElements and 10 to 
$doubleTheSize. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Perl has the powerful ability to return the number 
      of array elements when the array variable is used in a scalar context. 
      However, this ability can be confusing while looking at someone else's 
      program if you don't remember that there is a difference between scalar 
      contexts and array contexts.<BR></TD></TR></TBODY></TABLE>

### Example: How to Grab a Slice (or Part) of An Array

At times you will need to use some elements of an array and not others. You might want to assign array elements to 
scalars or to another array. Using only part of an array is done with an array 
slice. An array <I>slice</I> uses an @ character and the square brackets ([]) to 
create a sub-array consisting of selected individual elements. For example, 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>Create a four element array and assign it to 
      @array.<BR>Use an array slice to assign the first and third elements to 
      $first and $third.<BR>Use an array slice to assign the second half of the 
      array to @half.<BR>Print @array, $first, $third and @half to verify their 
      values.<BR>Tranpose the first and last elements in @array.<BR>Print @array 
      to verify that the elements have been switched.</TD></TR></TBODY></TABLE>
<P><B><PRE>@array           = ("One", "Two", "Three", "Four");
($first, $third) = @array[0, 2];
@half            = @array[2, 3];

print("\@array=@array\n");
print("\$first=$first  \$third=$third\n");
print("\@half=@half\n");

@array[0, 3]     = @array[3, 0];
print("\@array=@array\n");</PRE></B>This program will display 
<P><B><PRE>@array=One Two Three Four
$first=One  $third=Three
@half=Three Four
@array=Four Two Three One</PRE></B>The array elements are displayed separated by 
spaces because the array variable was enclosed in double quotes. The section, <A 
href="ch03.htm#Example: Variable Interpolation">Example: 
Variable Interpolation</A> discusses this issue in more detail. You won't really 
understand the power of array slices until you learn about functions in [](./functions.md). At that point, you'll see that functions (sub programs that you invoke using 
a function name) can return a value. And that the return value might be an 
array. When calling a function that returns the time and date in an array, a 
slice can be used to "grab" just those elements that you are interested in. For 
example, just the year or just the hour. 

## Associative Array Variables

Now it's time to look at associative arrays. These are 
definitely the most complicated of the three data types. And yet, they are just 
another type of array. You've already seen that array elements can be accessed 
with both positive and negative integer indexes. Well, with associative arrays 
you can use <I>any</I> scalar data type as an index. Associative array names 
start with the % character. 
<P>You will see associative arrays called <I>hashes </I>at times. The term 
"Hash" refers to how associative array elements are stored in memory. "Hash" is 
also much shorter than "associative array" and therefore much easier to type and 
talk about. 

### Example: Assigning Values to Associative Array Variables

Before we discuss associative arrays further, let's see how to assign values to them. When 
defining a whole array, you can use the same representation that was used for 
arrays - just remember that you need two items for every element in the 
associative array. You can also assign values to individual elements of an 
associative array by using curly braces ({}) around the index key. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Create an associative array with three elements. Each element 
      consists of two values: the lookup key and its associated value.</TT> 
      <P><TT>Add a single element to the associative array. 
  </TT></P></TT></TD></TR></TBODY></TABLE>
<P><B><PRE>%associativeArray = ("Jack A.", "Dec 2", "Joe B.",
    "June 2", "Jane C.", "Feb 13");
$associativeArray{"Jennifer S."} = "Mar 20";

print "Joe's birthday is: " . $associativeArray{"Joe B."} . "\n";
print "Jennifer's birthday is: " . $associativeArray{"Jennifer S."} . "\n";</PRE></B>This 
program will print the following: 
<P><B><PRE>Joe's birthday is: June 2
Jennifer's birthday is: Mar 20</PRE></B>Perl will extend the associative array 
as needed when you assign values to keys. An internal table is used to keep 
track of which keys are defined. If you try to access an undefined key, Perl 
will return a null or blank string. 
<P>You can do a lot with associative arrays, but first you need more background 
in operators, functions, and statements. We'll handle these topics in future 
chapters. In the next section, we look at string literals and how they interact 
with variables. 

## Double Quoted Strings Revisited

Perl strings have some additional functionality that was not 
mentioned in [](./getting-your-feet-wet.md) because you needed to know a little about variables 
beforehand. Now that you are familiar with how Perl handles basic variables, 
let's look a little deeper at double quoted strings. 

### Example: Variable Interpolation

<I>Interpolation</I> is a big word for a simple concept - 
replacement of a variable name with its value.You already know that variable 
names are a "stand-in" for a value. If $var is equal to 10, the $var + 20 is 
really 10 + 20. In Perl, this concept is also used inside strings. You can 
combine variables and strings in a very natural way using Perl. Simply place the 
variable directly inside a double quoted string, and its value will be 
automatically be interpolated as needed. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Until this time, each time you printed an array all 
      of the elements were mashed together (concatenated). Having the array 
      element printed without delimiting spaces made determining the individual 
      items very difficult. If, when printing, you enclose the array in quotes 
      Perl will automatically separate the array elements with a 
  space.<BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Create a five element array.</TT> 
      <P><TT>Print the element with spaces between the elements. 
    </TT></P></TT></TD></TR></TBODY></TABLE>
<P><B><PRE></TT>@array = (1..5);
print "@array\n";</PRE></B>This program will print: 
<P><B><PRE>1 2 3 4 5</PRE></B>Perl runs into a problem when you want to use a variable 
and then append some letters to the end. Let's illustrate this with scalar 
variables. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Assign the value large to a scalar variable.</TT> 
      <P><TT>Print a string with an embedded variable. 
  </TT></P></TT></TD></TR></TBODY></TABLE>
<P><B><PRE>$word = "large";
print "He was a $wordr fellow.";</PRE></B>This program will print: 
<P><B><PRE>He was a fellow.</PRE></B>In this example, Perl looks for the variable 
$wordr - obviously not what I intended to do. I meant for the string "He was a 
larger fellow" to print. This problem can be corrected by doing the following: 
<P><B><PRE>$word = "large";
print "He was a " . $word . "r fellow.";</PRE></B>Because the variable is 
separate, Perl sees the correct variable name. Then the string concatenation 
operator joins the three strings together. This method of programming makes it 
very easy to see where the variable is. 
<P>Remember when I said that Perl enables you to do something in many different 
ways? You could also do the following: 
<P><B><PRE>print "He was a ${word}r fellow.";</PRE></B>The curly braces around the 
variable name tell Perl where the name starts and ends. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>If you're ever on IRC and see <B>longhair_</B> or 
      Kirby Hughes (<B>khughes@netcom.com</B>) tell him I said "thanks." He 
      remembered that curly braces can be used in this 
manner.<BR></TD></TR></TBODY></TABLE>

### Example: Using the $" Special Variable

Perl has a number of special variables. These 
variables each have a predefined meaning. [](./special-variables.md) 
introduces you to quite a few Perl special variables. However, since we were 
just looking at strings and array we should also spend a moment and talk about 
the $" special variable. 
<P>At times, you may need to print array elements separated by commas or another 
character. The $" variable controls which separator Perl uses when printing your 
array. The variable is normally set equal to the space character. However, you 
may set it to any characters you'd like. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Set the $" special variable to the comma character.</TT> 
      <P><TT>Create a five element array.</TT> 
      <P><TT>Print the element with commas between the elements. 
    </TT></P></TT></TD></TR></TBODY></TABLE>
<P><B><PRE>$" = ",";
@array = (1..5);
print "@array\n";</PRE></B>This program will print: 
<P><B><PRE>1,2,3,4,5</PRE></B>Of course, since $" is a scalar variable you could also 
assign a longer string to it. For instance, you could use $" = ", " to add both 
a comma and a space between the array elements. 

## Summary

This chapter introduced you to the concept of variables - places in computer memory that are used to hold values as your 
program runs. They are called variables because you can assign different values 
to them as needed. 
<P>You read about three types of variables: Scalars, arrays, and associative 
arrays. Each variable type has its own unique character that is used to begin a 
variable names. Scalars use a $. Arrays use an @. And associative arrays use a 
%. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>When I first started to learn Perl, I found it 
      difficult to remember which character begins which variable type. Then, I 
      saw this chart on the Internet and things became clearer: 
      <P>$ = "the" (singular) 
      <P>@ = "those" (plural) 
      <P>% = "relationship"<BR></P></TD></TR></TBODY></TABLE></B>
<P>Each variable type must start with a different character that uses a separate 
namespace. This means that $varName and @varName are different variables. 
Remember too that variable names in Perl are case-sensitive. 
<P>A lot of this chapter looked at assigning values to variables using the equal 
(=) sign. We also reviewed how to use positive and negative subscripts (such as 
$array[1]) to access array elements. Associative array elements are accessed a 
little differently, curly braces are used instead of square brackets (for 
example, $associativeArray{"Jack B."}). 
<P>And finally, we took another look at double quoted strings to see how 
variable interpolation works. You saw that Perl automatically replaces variables 
inside double quoted strings. When arrays are printed inside strings their 
elements are separated by the value of $" - which is usually a space. 

## Review Questions

<OL>
  <LI>What are the three basic data types that Perl uses? 
  <P></P>
  <LI>How can you determine the number of elements in an array? 
  <P></P>
  <LI>What is a namespace? 
  <P></P>
  <LI>What is the special variable $[ used for? 
  <P></P>
  <LI>What is the special variable $" used for? 
  <P></P>
  <LI>What is the value of a variable when it is first used? 
  <P></P>
  <LI>What is an associative array? 
  <P></P>
  <LI>How can you access associative array elements?</LI></OL>

## Review Exercises
<OL>
  <LI>Create a array called @months. It should have 12 elements in it with the 
  names of the month represented as strings. 
  <P></P>
  <LI>Create a string that interpolates that value of the variable 
  $numberOfBooks. 
  <P></P>
  <LI>Using the range operator (..) create an array with the following elements: 
  1, 5, 6, 7, 10, 11, 12. 
  <P></P>
  <LI>Using the array created in the last exercise, create a print command to 
  display the last element. 
  <P></P>
  <LI>Create an associative array that holds a list of five music artists and a 
  rating for them. Use "good," "bad," and "indifferent" as the ratings. 
  <P></P>
  <LI>Using the array created in the last exercise, create a print command to 
  display the last element.</LI></OL>
