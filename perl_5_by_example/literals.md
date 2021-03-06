# Numeric and String Literals

In this chapter, we'll take a look at some of the ways that Perl handles 
data. All computer programs use data in some way. Some use it to personalize the 
program. For example, a mail program might need to remember your name so that it 
can greet you upon starting. Another program - say one that searches your hard 
disk for files - might remember your last search parameters in case you want to 
perform the same search twice. 

A <I>literal</I> is a value that is represented "as is" or hard-coded in your 
source code. When you see the four characters 45.5 in programs it really refers 
to a value of forty-five and a half. Perl uses four types of literals. Here is a 
quick glimpse at them: 

<UL>
  <LI>Numbers - This is the most basic data type. 

  <LI>Strings - A string is a series of characters that are handled as one unit. 

  <LI>Arrays - An array is a series of numbers and strings handled as a unit. 
  You can also think of an array as a list. 

  <LI>Associative Arrays - This is the most complicated data type. Think of it 
  as a list in which every value has an associated lookup item.</LI></UL>

Associative arrays will be discussed in [](./variables.md). Numbers, strings, 
and regular arrays will be discussed in the sections below. 

## Numeric Literals

Numeric literals are frequently used. They represent a number that your program will need to work 
with. Most of the time you will use numbers in base ten - the base that everyone 
uses. However, Perl will also let you use base 8 (octal) or base 16 
(hexadecimal). 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>For those of you who are not familiar with 
      non-decimal numbering systems, here is a short explanation. 
      
      In decimal notation - or base ten - when you see the value 15 it 
      signifies (1 * 10) + 5 or 15<FONT size=1><SUB>10</SUB></FONT>. The 
      subscript indicates which base is being used. 
      
      In octal notation - or base eight - when you see the value 15 it 
      signifies (1 * 8) + 5 or 13<FONT size=1><SUB>10</SUB></FONT>. 
      
      In hexadecimal notation - or base 16 - when you see the value 15 it 
      signifies (1 * 16) + 5 or 21<FONT size=1><SUB>10</SUB></FONT>. Base 16 
      needs an 6 characters in addition to 0 to 9 so that each position can have 
      a total of 16 values. The letters A-F are used to represent 10-15. So the 
      value BD<FONT size=1><SUB>16</SUB></FONT> is equal to (B<FONT 
      size=1><SUB>16</SUB></FONT> * 16) + D<FONT size=1><SUB>16</SUB></FONT> or 
      (11<FONT size=1><SUB>10</SUB></FONT> * 16) + 13<FONT 
      size=1><SUB>10</SUB></FONT> which is 189<FONT 
      size=1><SUB>10</SUB></FONT>.</TD></TR></TBODY></TABLE>

</TT>If you will be using very large or very small numbers, you might also 
find scientific notation to be of use. <A name="Andy Poulsen"></A>

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>If you're like me, you probably forgot most of the 
      math you learned in high school. However, scientific notation has always 
      stuck with me. Perhaps because I liked moving decimal points around. 
      Scientific notation looks like 10.23E+4, which is equivalent to 102,300. 
      You can also represent small numbers if you use a negative sign. For 
      example, 10.23E-4 is .001023. Simply move the decimal point to the right 
      if the exponent is positive and to the left if the exponent is negative. 
    </TD></TR></TBODY></TABLE>

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
  Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The printed version of this book indicated that 
      10.23E+4 was equivalent to 1,023,000 which was incorrect. The correct 
      number is 102,300. This problem was spotted by Andy 
Poulsen.</TD></TR></TBODY></TABLE>

### Example: Numbers

Let's take a look at some different types of numbers that you can use in your program code. 

First, here are some integers. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>An integer. Integers are numbers with no 
      decimal components. 
      
      An integer in octal format. This number is 35, or (4 * 8) + 3, in base 
      10. 
      
      An integer in hexadecimal format. This number is also 35, or (2 * 16) + 
      3 in base 10. </TT></TD></TR></TBODY></TABLE><PRE><B>123
043
0x23</B></PRE>Now, some numbers and fractions - also <I>called floating point 
values</I>. You will frequently see these values referred to as a <I>float 
value</I> for simplicity's sake. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>A float with a value in the tenths place. 
      You can also say 100 and 5/10. 

      A float with a fraction value out to the thousandths place. You can 
      also say 54 and 534/1000. </TT></TD></TR></TBODY></TABLE><PRE><B>100.5
54.534</B></PRE>Here's a very small number. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>A very small float value. You can represent 
      this value in scientific notation as 3.4E-5. </TT></TD></TR></TBODY></TABLE><PRE><B>.000034</B></PRE>

## String Literals

<I>String Literals</I> are groups of characters surrounded by quotes so that they can be used as a single 
datum. They are frequently used in programs to identify filenames, display 
messages, and prompt for input. In Perl you can use single quotes ('), double 
quotes("), and back quotes (`). 

### Example: Single-quoted Strings

The following examples show you how to use string literals. 
String literals are widely used to identify file names or when messages are 
displayed to users. First, we'll look at single-quoted strings, then 
double-quoted strings. 

<TABLE border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The real value of single-quoted strings won't become 
      apparent until you read about variable interpolation in the section "<A 
      href="ch03.htm#Example: Variable Interpolation">Example: 
      Variable Interpolation</A>" in [](./variables.md).</TD></TR></TBODY></TABLE>

<TABLE border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=beige><TT>A literal that describes one of my favorite 
      role-playing characters. 
      
      A literal that describes the blessed cleric that frequently helps 
      WasWaldo stay alive. </TT></TD></TR></TBODY></TABLE><PRE><B>'WasWaldo the Illusionist'
'Morganna the Fair'</B></PRE>Strings are pretty simple, huh? But what if you 
wanted to use a single quote inside the literal? If you did this, Perl would 
think you wanted to end the string early and a compiler error would result. Perl 
uses the backslash (\) character to indicate that the normal function of the 
single quote - ending a literal - should be ignored for a moment. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>The backslash character is also called <I>an escape 
      character</I> - perhaps because it lets the next character escape from its 
      normal interpretation. </TD></TR></TBODY></TABLE>

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>A literal that comments on WasWaldo's 
      fighting ability. Notice how the single quote is used. 
      
      Another comment from the peanut gallery. Notice that double quotes can 
      be used directly inside single-quoted strings. 
</TT></TD></TR></TBODY></TABLE><PRE><B>'WasWaldo can\'t hit the broad side of a barn.'
'Morganna said, "WasWaldo can\'t hit anything."'</B></PRE>The single-quotes are 
used here specifically so that the double-quotes can be used to surround the 
spoken words. Later in the section on double-quoted literals, you'll see that 
the single-quotes can be replaced by double-quotes if you'd like. 

You must know only one more thing about single-quoted strings. You can add a 
line break to a single-quoted string simply by adding line breaks to your source 
code - as demonstrated by Listing 2.1. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>Tell Perl to begin printing. 
      
      More Lines for Perl to display 
      
      The single quote ends the string literal. </TT></TD></TR></TBODY></TABLE>

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 2.1 - 02LST01.PL - 
      Using Embedded Line Breaks to Skip to a New Line </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
print 'Bill of Goods
Bread:    $34.45
Fruit:    $45.00
          ======
          $79.45';</B></PRE></TD></TR></TBODY></TABLE>

Figure 2.1 shows a bill of goods displayed on one long, single-quoted 
literal. 

<I>Fig. 02.1 - A bill of goods displayed one long single-quoted literal.</I> 

You can see that with single-quoted literals, even the line breaks in your 
source code are part of the string. 

### Example: Double-Quoted Strings

Double-quoted strings start out simple, then become a bit more involved than single-quoted strings. With double-quoted strings, you can use the backslash to add some special characters to your string. [](./variables.md) will talk about how double-quoted strings and variables interact. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Variables</I> - which are described in [](./variables.md) - are simply 
      locations in the computer's memory where Perl holds the various data 
      types. They're called variables because the content of the memory can 
      change as needed. </TD></TR></TBODY></TABLE>

The basic double-quoted string is a series of characters surrounded by double 
quotes. If you need to use the double quote inside the string, you can use the 
backslash character. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>This literal is similar to one you've 
      already seen. Just the quotes are different. 
      
      Another literal that uses double quotes inside a double-quoted string. 
      </TT></TD></TR></TBODY></TABLE><PRE><B>"WasWaldo the Illusionist"
"Morganna said, \"WasWaldo can't hit anything.\""</B></PRE>Notice how the 
backslash in the second line is used to escape the double quote characters. And 
the single quote can be used without a backslash. 

One major difference between double- and single-quoted strings is that 
double-quoted strings have some special <I>escape sequences</I> that can be 
used. Escape sequences represent characters that are not easily entered using 
the keyboard or that are difficult to see inside an editor window. Table 2.1 
shows all of the escape sequences that Perl understands. The examples following 
the table will illustrate some of them. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=honeydew size=4><B>Table 2.1 - Escape 
      Sequences</B></FONT></TD></TR>
  <TR>
    <TD bgColor=honeydew>
      <TABLE cellSpacing=0 cellPadding=5 border=0>
        <TBODY>
        <TR>
          <TH align=left>Escape Sequences</TH>
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
          <TD vAlign=top>At sign (@)</TD></TR>
        <TR>
          <TD vAlign=top>\% </TD>
          <TD vAlign=top>Percent Sign 
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
                  Note</B></FONT></TD></TR>
              <TR>
                <TD bgColor=lightcyan>The \% is not a valid escape sequence 
                  for Perl. It was included erroneously. Please ignore this 
                  entry. If you need to use the % character in double-quoted 
                  strings, go ahead and use it. Later in the book, you'll read 
                  about the printf() function. If you want to actually use the % 
                  character in the printf() format string, use the %% sequence. 
                  - Randal Schwartz was kind enough to identify this 
              error.</TD></TR></TBODY></TABLE></TD></TR>
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
          <TD vAlign=top>Change the following characters to lowercase until a 
            \E sequence is encountered. Note that you need to use an uppercase E 
            here, lowercase will not work.</TD></TR>
        <TR>
          <TD vAlign=top>\Q </TD>
          <TD vAlign=top>Quote meta-characters as literals. See [](./regular-expressions.md) for more information on meta-characters.</TD></TR>
        <TR>
          <TD vAlign=top>\U </TD>
          <TD vAlign=top>Change the following characters to uppercase until a 
            \E sequence is encountered. Note that you need to use an uppercase E 
            here, lowercase will not work.</TD></TR>
        <TR>
          <TD vAlign=top>\E </TD>
          <TD vAlign=top>Terminate the \L, \Q, or \U sequence. Note that you 
            need to use an uppercase E here, lowercase will not work.</TD></TR>
        <TR>
          <TD vAlign=top>\\ </TD>
          <TD vAlign=top>Backslash</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=white size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>In [](./variables.md) you'll see why you might need to use a backslash when using the $ and @ characters. 
    </TD></TR></TBODY></TABLE>

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>This literal represents the following: 
      WasWaldo is 34 years old. The \u is used twice in the first word to 
      capitalize the w characters. And the hexadecimal notation is used to 
      represent the age using the ASCII codes for 3 and 4. 
      
      This literal represents the following: The kettle was HOT!. The \U 
      capitalizes all characters until a \E sequence is seen. 
  </TT></TD></TR></TBODY></TABLE><PRE><B>"\uwas\uwaldo is \x33\x34 years old."
"The kettle was \Uhot\E!"</B></PRE>Actually, this example isn't too difficult, 
but it does involve looking at more than one literal at once and it's been a few 
pages since our last advanced example. Let's look at the \t and \n escape 
sequences. Listing 2.2 - a program displaying a bill with several items - will 
produce the output shown in Figure 2.2. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>Display a literal as the first line, second 
      and third of the output. 
      
      Display literals that show what was purchased 
      
      Display a separator line. 
      
      Display the total. </TT></TD></TR></TBODY></TABLE>

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 2.2 - 02LST02.PL - 
      Using Tabs and Newline Characters to Print </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
print "Bill of Goods
Bread:\t\$34.45\n";
print "Fruit:\t";
print "\$45.00\n";
print "\t======\n";
print "\t\$79.45\n";</PRE></B></TD></TR></TBODY></TABLE><A 
name="Khong Wye Keen"></A>

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
  Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The printed version of this book was missing a 
      semi-colon in the third line of the above listing.</TD></TR></TBODY></TABLE>

<I>Fig. 02.2 - A bill of goods displayed using newline and tab 
characters.</I> 


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=white size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Notice that Figures 2.1 and 2.2 look identical. This 
      illustrates a cardinal rule of Perl - there's <I>always</I> more than one 
      way to do something.</TD></TR></TBODY></TABLE>

This program uses two methods to cause a line break. 


<UL>
  <LI>The first is simply to include the line break in the source code. 
  
  
  <LI>The second is to use the \n or newline character.</LI></UL>

I recommend using the \n character so that when looking at your code in the 
future, you can be assured that you meant to cause a line break and did not 
simply press the ENTER key by mistake. 


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>If you are a C/C++ programmer, this material is not new 
      to you. However, Perl strings are <I>not identical</I> to C/C++ strings 
      because they have no ending NULL character. If you are thinking of 
      converting C/C++ programs to Perl, take care to modify any code that 
      relies on the NULL character to end a string. </TD></TR></TBODY></TABLE>

### Example: Back-Quoted Strings

It might be argued that back-quoted strings are not really a 
data type. That's because Perl uses back-quoted strings to execute system 
commands. When Perl sees a back-quoted string, it passes the contents to 
Windows, UNIX, or whatever operating system you are using. 

Let's see how to use the back-quoted string to display a directory listing of 
all text files in the perl5 directory. Figure 2.3 shows what the output of such 
a program might look like. 


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>Print the directory listing. 
  </TT></TD></TR></TBODY></TABLE><PRE><B>print `dir *.txt`;</B></PRE><I>Fig. 02.3 - Using a back-quoted string to 
display a directory.</I> 

All of the escape sequences used with double-quoted strings can be used with 
back-quoted strings. 

## Array Literals

Perl uses <I>arrays</I> - or lists - to store a series of items. You could use an array to hold all of the 
lines in a file, to help sort a list of addresses, or to store a variety of 
items. We'll look at some simple arrays in this section. In the next chapter, 
"<A href="ch03.htm">Variables</A>" , you'll see 
more examples of how useful arrays can be. 

### Example: Printing an Array

In this section, we'll look at printing an array and see how arrays are represented 
in Perl source code. 

This example shows an empty array, an array of numbers and an array of 
strings. Figure 2.4 shows the output of Listing 2.3. 


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>Print the contents of an empty array. 
      
      Print the contents of an array of numbers. 
      
      Print the contents of an array of strings. 
      
      Print the contents of a array with different data types. 
  </TT></TD></TR></TBODY></TABLE>


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 2.3 - 02LST03.PL - 
      Printing Some Array Literals </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
print "Here is an empty array:" . () . "<-- Nothing there!\n";
print (12, 014, 0x0c, 34.34, 23.3E-3);
print "\n";
print ("This", "is", 'an', "array", 'of', "strings");
print "\n";
print ("This", 30, "is", 'a', "mixed array", 'of', 0x08, "items");</PRE></B></TD></TR></TBODY></TABLE>

<I>Fig. 02.4 - The output from Listing 2.3, showing different array 
literals.</I> 

The fourth line of this listing shows that you can mix single- and 
double-quoted strings in the same array. You can also mix numbers and strings 
interchangeably, as shown in the last line. 


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Listing 2.3 uses the period, or 
      <I>concatenation</I>, operator to join a string representation of the 
      empty array with the string <TT>"Here is an empty array:"</TT> and the 
      string <TT>"<-- Nothing there!\n"</TT>. You can read more about 
      operators in [](./operators.md). 
      
      In this and other examples in this chapters, the elements of an array 
      will be printed with no spaces between them. You will see how to print 
      with spaces in the section "Strings Revisited" in [](./variables.md). 
  </TD></TR></TBODY></TABLE>

### Example: Nesting Arrays

Many times a simple list is not enough. If you're a painter, you might have one array that 
holds the names of orange hues and one that holds the names of yellow hues. To 
print them, you can use Perl's ability to specify a sub-array inside your main 
array definition. 

While this example is not very "real-world," it gives you the idea behind 
specifying an array by using sub-arrays. 


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>Print an array that consists of two 
      sub-arrays. 
      
      Print an array that consists of an array, a string, and another array. 
      </TT></TD></TR></TBODY></TABLE><PRE><B>print (("Bright Orange", "Burnt"), ("Canary Yellow", "Sunbeam"));
print (("Bright Orange", "Burnt"), " Middle ", ("Canary Yellow", "Sunbeam"));</B></PRE>So 
far, we haven't talked about the internal representations of data types. That's 
because you almost never have to worry about such things with Perl. However, it 
is important to know that, internally, the sub-arrays are merged into the main 
array. In other words, the <TT>array:</TT> 

(("Bright Orange", "Burnt"), ("Canary Yellow", "Sunbeam")) 

is exactly equivalent to 

("Bright Orange", "Burnt", "Canary Yellow", "Sunbeam") 

### Example: Using a Range of Values

At times you might need an array that consists of sequential 
numbers or letters. Instead of making you list out the entire array, Perl has a 
shorthand notation that you can use. 

Perl uses two periods (..) to replace a consecutive series of values. Not 
only is this method quicker to type - and less prone to error - it is easier to 
understand. Only the end points of the series are specified; you don't need to 
manually verify that every value is represented. If the .. is used, then 
automatically you know that a range of values will be used. 


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>Print an array consisting of the numbers 
      from 1 to 15. 
      
      Print an array consisting of the numbers from 1 to 15 using the 
      shorthand method. </TT></TD></TR></TBODY></TABLE><PRE><B>print (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
print "\n";
print (1..15);</B></PRE>The two arrays used in the previous example are 
identical, but they were specified differently. 


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The double periods in the array specification are 
      called the <I>range </I>operator. The range operator is also discussed in 
      Chapter 4, "<A 
    href="ch04.htm">Operators</A>,"</TD></TR></TBODY></TABLE>

You can also use the shorthand method to specify values in the middle of an 
array. 


<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>Print an array consisting of the numbers 1, 
      2, 7, 8, 9, 10, 14, and 15. 
      
      Print an array consisting of the letters A, B, F, G, H, Y, Z 
    </TT></TD></TR></TBODY></TABLE><PRE><B>print (1, 2, 7..10, 14, 15);
print "\n";
print ("A", "B", "F".."H", "Y", "Z");</B></PRE>The range operator works by 
taking the lefthand value, adding one to it, then appending that new value to 
the array. Perl continues to do this until the new value reaches the righthand 
value. You can use letters with the range operator because the ASCII table uses 
consecutive values to represent consecutive letters. 


## Summary

This chapter introduced you to both numeric 
and string literals. You learned that literals are values that are placed 
directly into your source code and never changed by the program. They are 
sometimes referred to as hard-coded values. 

You read about numbers and the three different bases that can be used to 
represent them - decimal, octal, and hexadecimal. Very large or small numbers 
can also be described using scientific notation. 

Strings were perhaps a bit more involved. Single-, double-, and back-quoted 
strings are used to hold strings of characters. Back-quoted strings have an 
additional purpose. They tell Perl to send the string to the operating system 
for execution. 

Escape sequences are used to represent characters that are difficult to enter 
through the keyboard or that have more than one purpose. For example, using a 
double quote inside a double-quoted string would end the string before you 
really intended. The backslash character was introduced to escape the double 
quote and change its meaning. 

The next chapter, "<A 
href="ch03.htm">Variables</A>," will show you how 
Perl uses your computer memory to store data types and also will show you ways 
that you can manipulate data. 

## Review Questions

<OL>
  <LI>What are the four types of literals? 
  <LI>What is a numeric literal? 
  <LI>How many types of string literals are there? 
  <LI>What is the major difference between single- and double-quoted strings? 
  <LI>What are three escape sequences and what do they mean? 
  <LI>What would the following one-line program display? <PRE><B>print `dir /*.log`;</B></PRE>
  <LI>What is scientific notation? 
  <LI>How can you represent the number 64 in hexadecimal inside a double-quoted string? 
  <LI>What is the easiest way to represent an array that includes the numbers 56 to 87?
</OL>

## Review Exercises

<OL>
  <LI>Write a program that prints the decimal number 32. However, in the print command, specify the value of 32 using hexadecimal notation. 
  
  <LI>Create program that uses the tab character in three literals to align text. 
  
  <LI>Write a program that prints using embedded new lines in a single-quoted literal. 
  
  <LI>Convert the number 56,500,000 into scientific notation. 
  
  <LI>Write a program that prints an array that uses the range operator. The Left value should be AA and the right value should be BB. What happens and why? 
  
  <LI>Write a program that prints its own source code using a back-quoted 
  string.
</OL>
