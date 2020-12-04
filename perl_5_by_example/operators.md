# Operators

<P>The <I>operators </I>in a computer language tell the computer what actions to 
perform. Perl has more operators than most languages. You've already seen some 
operators - like the equals or assignment operator(=) - in this book. As you 
read about the other operators, you'll undoubtedly realize that you are familiar 
with some of them. Trust your intuition; the definitions that you already know 
will probably still be true. 
<P>Operators are instructions you give to the computer so that it can perform 
some task or operation. All operators cause actions to be performed on 
<I>operands</I>. An operand can be anything that you perform an operation on. In 
practical terms, any particular operand will be a literal, a variable, or an 
expression. You've already been introduced to literals and variables. A good 
working definition of expression is some combination of operators and operands 
that are evaluated as a unit. Chapter 6, "<A 
href="ch06.htm">Statements</A>," has more 
information about expressions. 
<P>Operands are also <I>recursive</I> in nature. In Perl, the expression 3 + 5 
(two operands and a plus operator) can be considered as one operand with a value 
of 8. For instance, (3 + 5) - 12 is an expression that consists of two operands 
subtracted from each other. The first operand is (3 + 5) and the second operand 
is 12. 
<P>This chapter will discuss most of the operators available to you in Perl . 
You'll find out about many operator types and how to determine their order of 
precedence. And, of course, you'll see many examples. 
<P>Precedence is very important in every computer language and Perl is no 
exception. The <I>order of precedence</I> indicates which operator should be 
evaluated first. 
<P>I like to think about operators in the same way I would give instructions to 
the driver of a car. I might say "turn left" or "turn right." These commands 
could be considered directional operators in the same way that + and 
mathematical operators that say "add this" or "subtract this." If I yell "stop" 
while the car is moving, on the other hand, it should supersede the other 
commands. This means that "stop" has precedence over "turn left" and "turn 
right." The "<A 
href="ch04.htm#Order of Precedence">Order of 
Precedence</A>" section later in this chapter will discuss precedence in more 
detail. 

## Operator Types

Perl supports many types of operators. Table 4.1 shows all of the operator types in the Perl language. This 
chapter discusses the more commonly used types in detail. You can learn about 
any type not discussed in this chapter by looking in the chapter referenced in 
that type's description in Table 4.1. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.1-The Perl Operator Types</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Operator Types Number</TH>
    <TH align=left>Page or Chapter </TH>
    <TH align=left>Description </TH></TR>
  <TR>
    <TD vAlign=top>Arithmetic </TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>These operators mirror those you learned in grade school. 
      Addition, Subtraction, and multiplication are the bread and butter of most 
      mathematical statements.</TD></TR>
  <TR>
    <TD vAlign=top>Assignment </TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>These operators are used to assign a value to a variable. 
      Algebra uses assignment operators. For example, in the statement X = 6, 
      the equal sign is the assignment operator.</TD></TR>
  <TR>
    <TD vAlign=top>Binding </TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>These operators are used during string comparisons and are 
      explained in Chapter 10, "<A 
      href="ch10.htm">Regular Expressions</A>." 
  </TD></TR>
  <TR>
    <TD vAlign=top>Bitwise </TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>These operators affect the individual bits that make up a 
      value. For example, the value 3 is also 11 in binary notation or ((1 * 2) 
      + 1). Each character in binary notation represents a bit which is smallest 
      piece of a computer's memory that you can modify.</TD></TR>
  <TR>
    <TD vAlign=top>Comma </TD>
    <TD vAlign=top>Chapter 6 </TD>
    <TD vAlign=top>The comma operator has two functions. It serves to separate 
      array or list elements (see Chapter 2, "<A 
      href="ch02.htm">Numeric and String 
      Literals</A>") and it serves to separate expressions (see Chapter 6, "<A 
      href="ch06.htm">Statements</A>").</TD></TR>
  <TR>
    <TD vAlign=top>File Test </TD>
    <TD vAlign=top>Chapter 9 </TD>
    <TD vAlign=top>These operators are used to test for various conditions 
      associated with files. You can test for file existence, file type, and 
      file access rights among other things. See Chapter 9, "<A 
      href="ch09.htm">Using Files</A>," for more 
      information.</TD></TR>
  <TR>
    <TD vAlign=top>List </TD>
    <TD vAlign=top>Chapter 5 </TD>
    <TD vAlign=top>List operators are funny things in Perl. They resemble 
      function calls in other languages. List operators are discussed in Chapter 
      5, "<A href="ch05.htm">Functions</A>." </TD></TR>
  <TR>
    <TD vAlign=top>Logical </TD>
    <TD vAlign=top>Chapter 13 </TD>
    <TD vAlign=top>These operators implement Boolean or true/false logic. In 
      the sentence "If John has a fever AND John has clogged sinuses OR an 
      earache AND John is NOT over 60 years old, then John has a cold," the AND, 
      OR and NOT are acting as logical operators. The low precedence logical 
      operators will be discussed separately in Chapter 13, "<A 
      href="ch13.htm">Handling Errors and 
      Signals</A>," on.</TD></TR>
  <TR>
    <TD vAlign=top>Numeric Relational </TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>These operators allow you to test the relationship of one 
      numeric variable to another. For example, is 5 GREATER THAN 12?</TD></TR>
  <TR>
    <TD vAlign=top>Postfix </TD>
    <TD vAlign=top>Chapter 5 </TD>
    <TD vAlign=top>A member of this group of operators - (), [], {} - appears 
      at the end of the affected objects. You've already seen them used in 
      Chapter 3, "<A href="ch03.htm">Variables</A>" 
      for arrays and associative arrays. The parentheses operators are also used 
      for list operators as discussed in Chapter 5, "<A 
      href="ch05.htm">Functions</A>." </TD></TR>
  <TR>
    <TD vAlign=top>Range </TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>The range operator is used to create a range of elements in 
      arrays. It can also be used in a scalar context.</TD></TR>
  <TR>
    <TD vAlign=top>Reference </TD>
    <TD vAlign=top>Chapter 8 </TD>
    <TD vAlign=top>The reference operators are used to manipulate variables. 
      For more information, see Chapter 8, "<A 
      href="ch08.htm">References</A>." </TD></TR>
  <TR>
    <TD vAlign=top>String </TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>The string concatenation operator is used to join two 
      strings together. The string repetition operator is used to repeat a 
      string.</TD></TR>
  <TR>
    <TD vAlign=top>String Relational </TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>These operators allow you to test the relationship of one 
      string variable to another. For example, is "abc" GREATER THAN 
"ABC"?</TD></TR>
  <TR>
    <TD vAlign=top>Ternary </TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>The ternary operator is used to choose between two choices 
      based on a given condition. For instance: If the park is within one mile, 
      John can walk, otherwise he must drive.</TD></TR></TBODY></TABLE>

## The Binary Arithmetic Operators

There are six <I>binary arithmetic operators</I>: addition, 
subtraction, multiplication, exponentiation, division, and modulus. While you 
may be unfamiliar with the modulus operator, the rest act exactly as you would 
expect them to. Table 4.2 lists the arithmetic operators that act on two 
operands - the binary arithmetic operators. In other words, the addition (+) 
operator can be used to add two numbers together like this: 4 + 5. The other 
binary operators act in a similar fashion. <A name="Patrick Hanly"></A>
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.2-The Binary Arithmetic Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Operator </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>op1 + op2</TT> </TD>
    <TD vAlign=top>Addition</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 - op2</TT> </TD>
    <TD vAlign=top>Subtraction</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 * op2</TT> </TD>
    <TD vAlign=top>Multiplication</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 ** op2</TT> </TD>
    <TD vAlign=top>Exponentiation</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 / op2</TT> </TD>
    <TD vAlign=top>Division</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 % op2</TT></TD>
    <TD vAlign=top>Modulus</TD></TR></TBODY></TABLE>
<H3><A name="Example: The Exponentiation Operator">Example: The Exponentiation 
Operator</A></H3>
<P>The <I>exponentiation</I> operator is used to raise a number to a power. For 
instance, 2 ** 4 is equivalent to 2 * 2 * 2 * 2 which equals 16. You'll 
occasionally see a reference to exponentiation when the discussion turns to how 
efficient a given algorithm is but I've never needed it for my everyday 
programming tasks. In any case, here's a quick look at how it works. </P>
<P>This example shows how to raise the number 4 to the 3<SUP>rd</SUP> power 
which is equivalent to 4 * 4 * 4 or 64. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign <TT>$firstVar</TT> the value of 4. 
      <P>Raise 4 to the 3<SUP>rd</SUP> power using the exponentiation operator 
      and assign the new value to <TT>$secondVar</TT>. 
      <P>Print $secondVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = 4;
$secondVar = $firstVar ** 3;
print("$secondVar\n");</PRE></B>This program produces the following output: <B><PRE>64</PRE></B>
<H3><A name="Example: The Modulus Operator">Example: The Modulus 
Operator</A></H3>The <I>modulus </I>operator is used to find the remainder of 
the division between two integer operands. For instance, 10 % 7 equals 3 because 
10 / 7 equals 1 with 3 left over. 
<P>I've found the modulus operator to be useful when my programs need to run 
down a list and do something every few items. This example shows you how to do 
something every 10 items. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a loop that begins with <TT>$index</TT> equal to zero. 
      <P>If the value of <TT>$index % 10</TT> is equal to zero then the 
      <TT>print</TT> statement will be executed. 
      <P>Print the value of <TT>$index</TT> followed by space. 
      <P>The program will increase the value of <TT>$index</TT> by one and then 
      loop back to the start of the <TT>if</TT> 
statement.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 4.1-04LST01.PL - How to Display a Message Every Ten 
      Items</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>for ($index = 0; $index &lt;= 100; $index++) {
    if ($index % 10 == 0) {
        print("$index ");
    }
}
</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>When this program is run, the output should look like the following: <B><PRE>0 10 20 30 40 50 60 70 80 90 100</PRE></B>Notice that every 10th item is 
printed. By changing the value on the right side of the modulus operator you can 
affect how many items are processed before the message is printed. Changing the 
value to 15 means that a message will be printed every 15 items. Chapter 7, "<A 
href="ch07.htm">Control Statements</A>," describes 
the <TT>if</TT> and <TT>for</TT> statement in detail. 

## The Unary Arithmetic Operators

The unary arithmetic operators act on a single operand. They 
are used to change the sign of a value; to increment a value or to decrement a 
value. <I>Incrementing</I> a value means to add one to its value. 
<I>Decrementing</I> a value means to subtract one from its value. Table 4.3 
lists Perl's unary operators. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.3-The Unary Arithmetic Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Operator</TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD colSpan=2><I>Changing the sign of <TT>op1</TT></I></TD></TR>
  <TR>
    <TD vAlign=top><TT>+op1</TT> </TD>
    <TD vAlign=top>Positive operand</TD></TR>
  <TR>
    <TD vAlign=top><TT>-op1</TT> </TD>
    <TD vAlign=top>Negative operand</TD></TR>
  <TR>
    <TD colSpan=2><I>Changing the value of <TT>op1</TT> before usage</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>++op1</TT> </TD>
    <TD vAlign=top>Pre-increment operand by one</TD></TR>
  <TR>
    <TD vAlign=top><TT>--op1</TT> </TD>
    <TD vAlign=top>Pre-decrement operand by one</TD></TR>
  <TR>
    <TD colSpan=2><I>Changing the value of <TT>op1</TT> after usage</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>op1++</TT></TD>
    <TD vAlign=top>Post-increment operand by one</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1--</TT></TD>
    <TD vAlign=top>Post-decrement operand by one</TD></TR></TBODY></TABLE>
<P>Arithmetic operators start to get complicated when unary operators are 
introduced. Just between you and me, I didn't get the hang of negative numbers 
until someone said: "If you have five pieces of chocolate, and add negative two 
pieces..." 
<P>You might think that adding negative numbers is strange. Not so. I know that 
you will never write a mathematics statement like the following: <TT>345 + 
-23</TT>. However, you might use <TT>354 + $gasBill</TT>, where 
<TT>$gasBill</TT> represents a 23-dollar debit - in other words, a negative 
number. 
<P>Using the unary plus operator does nothing, and Perl ignores it. The unary 
negative operator, however, changes the meaning of a value from positive to 
negative or vice versa. For instance, if you had a variable called 
<TT>$firstVar</TT> equal to 34. Then printing <TT>-$firstVar</TT> would display 
-34. 
<P>The <TT>++</TT> and <TT>--</TT> operators are examples of the Perl shorthand 
notation. If the <TT>++</TT> or <TT>--</TT> operators appear in front of the 
operand, the operand is incremented or decremented before its value is used. If 
the <TT>++</TT> or <TT>--</TT> operators appear after the operand, then the 
value of the operand is used and then the operand is incremented or decremented 
as required. 
<H3>Example: The Pre-increment Operator</H3>This example shows how to use the 
pre-increment operator (<TT>++</TT>). 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><B>Original Way</B> 
      <P>The <TT>$numPages</TT> variable is assigned a value of 5. 
      <P>The <TT>$numPages</TT> variable is incremented by 1. 
      <P>The <TT>$numPages</TT> variable is printed. 
      <P><B>New Way</B> 
      <P>The <TT>$numPages</TT> variable is assigned a value of 5. 
      <P>The <TT>$numPages</TT> variables is incremented using the pre-increment 
      operator and then printed.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR><TD bgColor=black><FONT color=#fffaa0 size=4><B><P>Listing 4.2-04LST02.PL - Using Pre-increment Operator</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><PRE>
# Original Way
$numPages = 5;
$numPages = $numPages + 1;
print($numPages, "\n");
# New Way
$numPages = 5;
print(++$numPages, "\n");
</PRE>
</TD></TR></TBODY></TABLE>
<P>This program produces the following output: <B><PRE>6
6</PRE></B>You can see that the new way of coding is shorter than the original 
way. The statement <TT>print(++$numPages, "\n");</TT> will first increment the 
<TT>$numPages</TT> variable and then allow the print command to use it. 
<H3><A name="Example: The Pre-Decrement Operator">Example: The Pre-Decrement 
Operator</A></H3>This example shows how to use the pre-decrement operator 
(<TT>--</TT>). 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><B>Original Way</B> 
      <P>The <TT>$numPages</TT> variable is assigned a value of 5. 
      <P>The <TT>$numPages</TT> variable is decremented by 1. 
      <P>The <TT>$totalPages</TT> variable is assigned the value of 
      <TT>$numPages + 5</TT>. 
      <P>The <TT>$numPages</TT> and <TT>$totalPages</TT> variables are printed. 
      <P><B>New Way</B> 
      <P>The <TT>$numPages</TT> variable is assigned a value of 5. 
      <P>The <TT>$numPages</TT> variable is decremented and then <TT>$numPages + 
      5</TT> is assigned to <TT>$totalPages</TT>. 
      <P>The <TT>$numPages</TT> and <TT>$totalPages</TT> variables are 
      printed.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 4.3-04LST03.PL - Using Pre-decrement 
  Operator</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P># Original Way
$numPages = 5;
$numPages = $numPages - 1;
$totalPages = $numPages + 5;
print("$numPages $totalPages \n");
# New Way
$numPages = 5;
$totalPages =  --$numPages + 5;
print("$numPages $totalPages \n");
</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program produces the following output: <B><PRE>4 9
4 9</PRE></B>The statement <TT>$totalPages = --$numPages + 5;</TT> will first 
decrement the <TT>$numPages</TT> variable and then allow the plus operator to 
use it. 
<H3><A name="Example: The Post-increment Operator">Example: The Post-increment 
Operator</A></H3>This example shows how to use the <TT>++</TT> and <TT>--</TT> 
post-increment operators. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><B>Original Way</B> 
      <P>The <TT>$numPages</TT> variable is assigned a value of 5. 
      <P>The <TT>$totalPages</TT> variable is assigned the value of 
      <TT>$numPages</TT>. 
      <P>The <TT>$numPages</TT> variable is incremented by one. 
      <P>The <TT>$numPages</TT> and <TT>$totalPages</TT> variables are printed. 
      <P><B>New Way</B> 
      <P>The <TT>$numPages</TT> variable is assigned a value of 5. 
      <P>The <TT>$totalPages</TT> variable is assigned the value of 
      <TT>$numPages</TT> and then the <TT>$numPages</TT> variable is 
      incremented. 
      <P>The <TT>$numPages</TT> and <TT>$totalPages</TT> variables are 
      printed.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 4.4-04LST04.PL - Using Post-increment 
  Operator</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR><P>
# Original Way
$numPages = 5;
$totalPages = $numPages;
$numPages = $numPages + 1;
print("$numPages $totalPages \n");
# New Way
$numPages = 5;
$totalPages = $numPages++;
print("$numPages $totalPages \n");
</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>The program produces the following output: <B><PRE>6 5
6 5</PRE></B>The statement <TT>$totalPages = $numPages++;</TT> will first assign 
the value of <TT>$numPages</TT> to <TT>$totalPages</TT> and then increment the 
<TT>$numPages</TT> variable. It may help to know that post-increment and 
post-decrement operators do not affect the value of the variable on the left 
side of the assignment operator. If you see post-increment or post-decrement 
operators, evaluate the statement by ignoring them. Then, when done, apply the 
post-increment and post-decrement operators as needed. 
<P><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>The Perl programming language has many ways of 
      achieving the same objective. You will become a more efficient programmer 
      if you decide on one approach to incrementing/decrementing and use it 
      consistently.<BR></TD></TR></TBODY></TABLE></B>

## The Logical Operators

<I>Logical operators </I>are mainly used to control program flow. Usually you will find 
them as part of an <TT>if</TT>, a <TT>while</TT> or some other control 
statement. Control statements are discussed in Chapter 7, "<A 
href="ch07.htm">Control Statements</A>." 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.4-The Logical Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Operator </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>op1 &amp;&amp; op2</TT> </TD>
    <TD vAlign=top>Performs a logical AND of the two operands</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 || op2</TT> </TD>
    <TD vAlign=top>Performs a logical OR of the two operands.</TD></TR>
  <TR>
    <TD vAlign=top><TT>!op1</TT> </TD>
    <TD vAlign=top>Performs a logical NOT of the operand.</TD></TR></TBODY></TABLE>
<P>The concept of logical operators is simple. They allow a program make a 
decision based on multiple conditions. Each operand is considered a condition 
that can be evaluated to a true or false value. Then the value of the conditions 
are used to determine the overall value of the <TT>op1 operator op2</TT> or 
<TT>!op1</TT> grouping. The following examples demonstrate different ways that 
logical conditions can be used. 
<H3><A name="Example: The " (&#38;&#38;)? Operator AND?>Example: The "AND" 
Operator (<I>&amp;&amp;</I>)</A></H3>The <TT>&amp;&amp;</TT> operator is used to 
determine if both operands or conditions are true. Table 4.5 shows the results 
of using the <TT>&amp;&amp;</TT> operator on the four sets of true/false values. 

<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.5-The &amp;&amp; Result Table</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Op1 </TH>
    <TH align=left>Op2 </TH>
    <TH align=left>Op1 &amp;&amp; Op2</TH></TR>
  <TR>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>0</TD></TR>
  <TR>
    <TD vAlign=top>1 </TD>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>0</TD></TR>
  <TR>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>1 </TD>
    <TD vAlign=top>0</TD></TR>
  <TR>
    <TD vAlign=top>1 </TD>
    <TD vAlign=top>1 </TD>
    <TD vAlign=top>1</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=#b00e00><TT>
      <P>If the value of <TT>$firstVar</TT> is 10 AND the value of 
      <TT>$secondVar</TT> is 9 then print the error message. 
  </TT></P></TD></TR></TBODY></TABLE><B><PRE>if ($firstVar == 10 &amp;&amp; $secondVar == 9) {
    print("Error!");
};</PRE></B>If either of the two conditions is false or incorrect then the print 
command is bypassed. 
<H3><A name="Example: The " Operator (||)? OR?>Example: The "OR" Operator 
(<I>||</I>)</A></H3>The <TT>||</TT> operator is used to determine if either of 
the conditions is true. Table 4.6 shows the results of using the <TT>||</TT> 
operator on the four sets of true/false values. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.6-The || Result Table</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Op1 </TH>
    <TH align=left>Op2 </TH>
    <TH align=left>Op1 || Op2</TH></TR>
  <TR>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>0</TD></TR>
  <TR>
    <TD vAlign=top>1 </TD>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>1</TD></TR>
  <TR>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>1 </TD>
    <TD vAlign=top>1</TD></TR>
  <TR>
    <TD vAlign=top>1 </TD>
    <TD vAlign=top>1 </TD>
    <TD vAlign=top>1</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>If the value of <TT>$firstVar</TT> is 9 OR the value of 
      <TT>$firstVar</TT> is 10 then print the error 
  message.</TT></P></TD></TR></TBODY></TABLE><B><PRE>if ($firstVar == 9 || $firstVar == 10) {    print("Error!");
};</PRE></B>If either of the two conditions is true then the print command is 
run. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato SIZE-4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>If the first operand of the <TT>||</TT> operator 
      evaluates to true, the second operand will not be evaluated. This could be 
      a source of bugs if you are not careful. For instance, in the following 
      code fragment <PRE>if ($firstVar++ || $secondVar++) { print("\n"); }</PRE>variable 
      <TT>$secondVar</TT> will not be incremented if <TT>$firstVar++</TT> 
      evaluates to true.<BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>You might be tempted to try the following 
      <P><PRE>if ($firstVar == (9 || 10)) {
    print("Error!");
};</PRE>to determine <TT>if $firstVar</TT> is equal to either 9 or 10. 
      Don't do it. Perl doesn't work this way. First, the expression (<TT>9 || 
      10</TT>) will be evaluated to be equal to 9. And then, Perl will evaluate 
      <TT>$firstVar == 9</TT>. The correct method for testing <TT>$firstVar</TT> 
      is to explicitly state each sub-condition that needs to be met in order 
      for the entire condition to return true. The correct way is:<BR><PRE>if ($firstVar == 9 || $firstVar == 10) {
    print("Error!");
};</PRE></TD></TR></TBODY></TABLE>
<H3><A name="Example: The " Operator (!)? NOT?>Example: The "NOT" Operator 
(!)</A></H3>The <TT>!</TT> operator is used to convert true values to false and 
false values to true. In other words, it inverts a value. Perl considers any 
non-zero value to be true - even string values. Table 4.7 shows the results of 
using the <TT>!</TT> operator on true and false values. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.7-The ! Result Table</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Op1 </TH>
    <TH align=left>!Op1</TH></TR>
  <TR>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>1</TD></TR>
  <TR>
    <TD vAlign=top>1 </TD>
    <TD vAlign=top>0</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign a value of 10 to <TT>$firstVar</TT>. 
      <P>Negate <TT>$firstVar - !10</TT> is equal to <TT>0 - </TT>and assign the 
      new value to <TT>$secondVar</TT>. 
      <P>If the <TT>$secondVar</TT> variable is equal to zero then print the 
      string "zero."</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = 10;
$secondVar = !$firstVar;
if ($secondVar == 0) {
   print("zero\n");
};</PRE></B>The program produces the following output: <B><PRE>zero</PRE></B>You could replace the 10 in the first line with "ten", 'ten', 
or any non-zero, non-null value. 

## The Bitwise Operators

The <I>bitwise </I>operators, listed in Table 4.8, are similar to the logical operators, except 
that they work on a smaller scale. <A name="Daniel R Selig"></A>
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.8-The Bitwise Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Operator </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>op1 &amp; op2</TT> </TD>
    <TD vAlign=top>The AND operator compares two bits and generates a result 
      of 1 if both bits are 1; otherwise it returns 0.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 | op2</TT> </TD>
    <TD vAlign=top>The OR operator compares two bits and generates a result of 
      1 if either or both bits are 1; otherwise it returns 0.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 ^ op2</TT> </TD>
    <TD vAlign=top>The EXCLUSIVE-OR operator compares two bits and generates a 
      result of 1 if the bits are complementary; otherwise it returns 0.</TD></TR>
  <TR>
    <TD vAlign=top><TT>~op1</TT> </TD>
    <TD vAlign=top>The COMPLEMENT operator is used to invert all of the bits 
      of the operand. I've never found this useful, so we'll skip looking at an 
      example of it.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 &gt;&gt; op2</TT> </TD>
    <TD vAlign=top>The SHIFT RIGHT operator moves the bits to the right, 
      discards the far right bit, and assigns the left-most bit a value of 0. 
      Each move to right effectively divides <TT>op1</TT> in half.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 &lt;&lt; op2</TT> </TD>
    <TD vAlign=top>The SHIFT LEFT operator moves the bits to the left, 
      discards the far left bit, and assigns the rightmost bit a value of 0. 
      Each move to the left effectively multiplies <TT>op1</TT> by 
  2.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Both operands associated with the bitwise operator 
      must be integers.<BR></TD></TR></TBODY></TABLE>
<P>Bitwise operators are used to change individual bits in an operand. A single 
byte of computer memory - when viewed as a 8 bits - can signify the true/false 
status of 8 flags because each bit can be used as a boolean variable that can 
hold one of two values: true or false. A <I>flag</I> variable is typically use 
to indicate the status of something. For instance, computer files can be marked 
as read-only. So you might have a <TT>$fReadOnly</TT> variable who job would be 
to hold the read-only status of a file. This variable is called a flag variable 
because when <TT>$fReadOnly</TT> has a true value it's equivalent to a football 
umpire throwing a flag. The variable says, "Whoa!, don't modify this file." 
<P>When you have more than one flag variable, if might be more efficient to use 
a single variable to indicate the value of more than one flag. The next example 
shows you how to do this. 
<H3><A name="Example: Using the &amp;, |, and ^ Operators">Example: Using the 
<I>&amp;</I>, <I>|</I>, and <I>^</I> Operators</A></H3>The first step to using 
bitwise operators to indicate more than one flag in a single variable is to 
define the meaning of the bits that you'd like to use. Figure 4.1 shows an 
example of 8 bits that could be used to control the attributes of text on a 
display. 
<P><I>Fig. 04.1 - The bit definition of a text attribute control variable.</I> 
<P>If you assume that <TT>$textAttr</TT> is used control the text attributes, 
then you could set the italic attribute by setting <TT>$textAttr </TT>equal to 
128 like this. <B><PRE>$textAttr = 128;</PRE></B>because the bit pattern of 128 is 10000000. The 
bit that is turned on corresponds to the italic position in <TT>$textAttr</TT>. 
<P>Now let's set both the italic and underline attributes on at the same time. 
The underline value is 16, which has a bit pattern of 00010000. You already know 
the value for italic is 128. So we call on the <TT>OR</TT> operator to combine 
the two values. <B><PRE>$textAttr = 128 | 16;</PRE></B>or using the bit patterns (this is just an 
example - you can't do this in Perl) <B><PRE>$textAttr = 10000000 | 00010000;</PRE></B>If you look back at Table 4.8 and 
evaluate each bit, you will see that <TT>$textAttr</TT> gets assigned a value of 
144 (or 10010000 as a bit pattern). This will set both italic and underline 
attributes on. 
<P>The next step might be to turn the italic attribute off. This is done with 
the EXLUSIVE-OR operator, like so: <B><PRE>$textAttr = $textAttr ^ 128;</PRE></B>
<H3><A name="Example: Using the >> and << Operators">Example: Using the 
<I>&gt;&gt;</I> and <I>&lt;&lt;</I> Operators</A></H3>The <I>bitwise shift 
</I>operators are used to move all of the bits in the operand left or right a 
given number of times. They come in quite handy when you need to divide or 
multiply integer values. 
<P>This example will divide by 4 using the <TT>&gt;&gt;</TT> operator. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign a value of 128 to the <TT>$firstVar</TT> variable. 
      <P>Shift the bits inside <TT>$firstVar</TT> two places to the right and 
      assign the new value to <TT>$secondVar</TT>. 
      <P>Print the <TT>$secondVar</TT> variable.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = 128;
$secondVar = $firstVar &gt;&gt; 2;
print("$secondVar\n");</PRE></B>The program produces the following output: <B><PRE>32</PRE></B>Let's look at the bit patterns of the variables before and 
after the shift operation. First, <TT>$firstVar</TT> is assigned 128 or 1000000. 
Then the value in <TT>$firstVar</TT> is shifted left by 2 places. So the new 
value is 00100000 or 32 which is assigned to <TT>$secondVar</TT>. 
<P>The right-most bit of a value is lost when the bits are shifted right. You 
can see this in the next example. 
<P>This example will divide by 8 using the <TT>&gt;&gt;</TT> operator. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign a value of 129 - a bit pattern of 10000001 - to 
      <TT>$firstVar</TT>. Every odd value has the right-most bit set. 
      <P>Shift the bits inside <TT>$firstVar</TT> three places to the right and 
      assign the new value to <TT>$secondVar</TT>. 
      <P>Print the <TT>$secondVar</TT> variable.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = 129;
$secondVar = $firstVar &gt;&gt; 3;
print("$secondVar\n");</PRE></B>The program produces the following output: <B><PRE>16</PRE></B>Since the bit value of 16 is 00010000, you can tell that the 
right-most bit has disappeared. 
<P>Here's a quick example using the <TT>&lt;&lt;</TT> operator. We'll multiply 
128 by 8. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign a value of 128 to the <TT>$firstVar</TT> variable. 
      <P>Shift the bits inside <TT>$firstVar</TT> three places to the left and 
      assign the new value to <TT>$secondVar</TT>. 
      <P>Print the <TT>$secondVar</TT> variable.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = 128;
$secondVar = $firstVar &lt;&lt; 3;
print $secondVar;</PRE></B>The program produces the following output: <B><PRE>1024</PRE></B>The value of 1024 is beyond the bounds of the 8 bits that the 
other examples used. This was done to show you that the number of bits available 
for your use is not limited to one byte. You are really limited by however many 
bytes Perl uses for one scalar variable - probably 4. You'll need to read the 
Perl documentation that came with the interpreter to determine how many bytes 
your scalar variables use. 

## The Numeric Relational Operators

The <I>numeric relational </I>operators, listed in Table 4.9, 
are used to test the relationship between two operands. You can see if one 
operand is equal to another, if one operand is greater than another, or if one 
operator is less than another. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>It is important to realize that the equality 
      operator is a pair of equals sign and not just one. Quite a few bugs are 
      introduced into programs because people forget this rule and use a single 
      equals sign when testing conditions.<BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.9-The Numeric Relational Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Operator </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD colSpan=2><I>The Equality Operators</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 == op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is equal to 
      <TT>op2</TT>. For example, 6 == 6 is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 != op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is not equal to 
      <TT>op2</TT>. For example, 6 != 7 is true.</TD></TR>
  <TR>
    <TD colSpan=2><I>The Comparison Operators</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 &lt; op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is less than 
      <TT>op2</TT>. For example, 6 &lt; 7 is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 &lt;= op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is less than or 
      equal to <TT>op2</TT>. For example, 7 &lt;= 7 is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 &gt; op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is greater than 
      <TT>op2</TT>. For example, 6 &gt; 5 is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 &gt;= op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is greater than 
      or equal to <TT>op2</TT>. For example, 7 &gt;= 7 is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 &lt;=&gt; op2</TT> </TD>
    <TD vAlign=top>This operator returns 1 if <TT>op1</TT> is greater than 
      <TT>op2</TT>, 0 if <TT>op1</TT> equals <TT>op2</TT>, and -1 if 
      <TT>op1</TT> is less than <TT>op2</TT>.</TD></TR></TBODY></TABLE>
<P>You will see many examples of these operators when you read about controlling 
program flow in Chapter 7, "<A 
href="ch07.htm">Control Statements</A>." Therefore, 
I'll only show an example of the <TT>&lt;=&gt;</TT> comparison operator here. 
<H3><A name="Example: Using the <=> Operator">Example: Using the &lt;=&gt; 
Operator</A></H3>The <I>number comparison </I>operator is used to quickly tell 
the relationship between one operand and another. It is frequently used during 
sorting activities. 
<P><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>You may sometimes see the &lt;=&gt; operator called 
      the spaceship operator because of the way that it 
looks.<BR></TD></TR></TBODY></TABLE></B>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Set up three variables. 
      <P>Print the relationship of each variable to the variable 
      <TT>$midVar</TT>.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$lowVar =  8;
$midVar = 10;
$hiVar  = 12;

print($lowVar &lt;=&gt; $midVar, "\n");
print($midVar &lt;=&gt; $midVar, "\n");
print($hiVar  &lt;=&gt; $midVar, "\n");</PRE></B>The program produces the 
following output: <B><PRE>-1
0
1</PRE></B>The -1 indicates that $lowVar (8) is less than $midVar (10). The 0 
indicates that $midVar is equal to itself. And the 1 indicates that $hiVar (12) 
is greater than $midVar (10). 

## The String Relational Operators

The <I>string relational operators</I>, listed in Table 4.10, 
are used to test the relationship between two operands. You can see if one 
operand is equal to another, if one operand is greater than another, or if one 
operator is less than another. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.10-The String Relational Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Operator </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD colSpan=2><I>The Equality Operators</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 eq op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is equal to 
      <TT>op2</TT>. For example, "b" eq "b" is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 ne op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is not equal to 
      <TT>op2</TT>. For example, "b" ne "c" is true.</TD></TR>
  <TR>
    <TD colSpan=2><I>The Comparison Operators</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 lt op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is less than 
      <TT>op2</TT>. For example, "b" lt "c" is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 le op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is less than or 
      equal to <TT>op2</TT>. For example, "b" le "b" is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 gt op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is greater than 
      <TT>op2</TT>. For example, "b" gt "a" is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 ge op2</TT> </TD>
    <TD vAlign=top>This operator returns true if <TT>op1</TT> is greater than 
      or equal to <TT>op2</TT>. For example, "b" ge "b" is true.</TD></TR>
  <TR>
    <TD vAlign=top><TT>op1 cmp op2</TT> </TD>
    <TD vAlign=top>This operator returns 1 if <TT>op1</TT> is greater than 
      <TT>op2</TT>, 0 if <TT>op1</TT> equals <TT>op2</TT>, and -1 if 
      <TT>op1</TT> is less than <TT>op2</TT>.</TD></TR></TBODY></TABLE>
<P>String values are compared using the ASCII values of each character in the 
strings. You will see examples of these operators when you read about control 
program flow in Chapter 7, "<A 
href="ch07.htm">Control Statements</A>." So, we'll 
only show an example of the <TT>cmp</TT> comparison operator here. 
<H3><A name="Example: Using the cmp Operator">Example: Using the <I>cmp</I> 
Operator</A></H3>The string comparison operator acts exactly like the 
&lt;<I>=</I>&gt; operator except that it is designed to work with string 
operands. This example will compare the values of three different strings. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Set up three variables. 
      <P>Print the relationship of each variable to the variable 
      <TT>$midVar</TT>.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$lowVar = "AAA";
$midVar = "BBB";
$hiVar  = "CCC";

print($lowVar cmp $midVar, "\n");
print($midVar cmp $midVar, "\n");
print($hiVar  cmp $midVar, "\n");</PRE></B>The program produces the following 
output: <B><PRE>-1
0
1</PRE></B>Notice that even though strings are being compared, a numeric value 
is returned. You may be wondering what happens if the strings have spaces in 
them. Let's explore that for a moment. <B><PRE>$firstVar = "AA";
$secondVar = " A";
print($firstVar cmp $secondVar, "\n");</PRE></B>The program produces the 
following output <B><PRE>1</PRE></B>which means that "<TT>AA</TT>" is greater than "<TT> A</TT>" 
according to the criteria used by the <TT>cmp</TT> operator. 

## The Ternary Operator

The <I>ternary</I> is actually a sequence of operators. The operator is used like 
this: <B><PRE>CONDITION-PART ? TRUE-PART : FALSE-PART</PRE></B>which is shorthand for the 
following statement: <B><PRE>if (CONDITION-PART) {
    TRUE-PART
} else {
    FALSE-PART
}</PRE></B>You can find more information about <TT>if</TT> statements in Chapter 
7, "<A href="ch07.htm">Control Statements</A>." 
<P>The value of the entire operation depends on the evaluation of the 
CONDITION-PART section of the statement. If the CONDITION-PART evaluates to 
true, then the TRUE-PART is the value of the entire operation. If the 
CONDITION-PART evaluates to false, then the FALSE-PART is the value of the 
entire operation. 
<P><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>The ternary operator is also referred to as the 
      conditional operator by some references.<BR></TD></TR></TBODY></TABLE></B>
<H3><A name="Example: Using the Ternary Operator to Assign Values">Example: 
Using the Ternary Operator to Assign Values</A></H3>I frequently use the ternary 
operator to assign a value to a variable when it can take one of two values. 
This use of the operator is fairly straightforward. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>If <TT>$firstVar</TT> is zero, then assign <TT>$secondVar</TT> a value 
      of zero. Otherwise, assign <TT>$secondVar</TT> the value in the first 
      element in the array <TT>@array</TT>.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$secondVar = ($firstVar == 0) ? 0 : $array[0];</PRE></B>The ternary 
operator can also be used to control which code sections are performed. However, 
I recommend against this use because it makes program harder to read. I believe 
that operators should affect variables, not program flow. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>The CONDITION-PART evaluates to true so the <TT>$firstVar</TT> variable 
      is incremented.</TT></P></TD></TR></TBODY></TABLE><B><PRE>1 ? $firstVar++ : $secondVar++;</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>The CONDITION-PART evaluates to false so the <TT>$secondVar</TT> 
      variable is incremented.</TT></P></TD></TR></TBODY></TABLE><B><PRE>0 ? $firstVar++ : $secondVar++;</PRE></B>
<P>In this example, You get a chance to see how the language can be abused. When 
there are more than two actions to consider you can nest ternary operators 
inside each other. However, as you can see, the result is confusing code. </P>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign one of four values to <TT>$firstVar</TT> depending on the value 
      of <TT>$temp</TT>.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$
firstVar = $temp == 0 ?
                $numFiles++ :
                ($temp == 1 ?
                    $numRecords++ :
                    ($temp == 3 ? $numBytes++ : $numErrors++));</PRE></B><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Abusing the language in this manner will make your 
      programs difficult to understand and maintain. You can use the <TT>if</TT> 
      statement for better looking and more maintainable code. See Chapter 7, 
      "<A href="ch07.htm">Control Statements</A>," 
      for more information.<BR></TD></TR></TBODY></TABLE></B>
<P>If you'd like to see a really strange use of the ternary operator, take a 
look at this next example. It uses the ternary operator to determine which 
variable gets assigned a value. <B><PRE>$firstVar = 1;
$secondVar = 1;
$thirdVar = 1;

($thirdVar == 0 ? $firstVar : $secondVar) = 10;

print "$firstVar\n";
print "$secondVar\n";
print "$thirdVar\n";</PRE></B>The program produces the following output: <B><PRE>1
10
1</PRE></B>The line <TT>($thirdVar == 0 ? $firstVar : $secondVar) = 10;</TT> is 
equivalent to the following control statement. <B><PRE>if ($thirdVar ==0) {
    $firstVar = 10;
} else {
    $secondVar = 10;
}</PRE></B>This use of the ternary operator works because Perl lets you use the 
results of evaluations as <I>lvalues</I>. An lvalue is anything that you can 
assign a value to. It called an lvalue because it goes on the left side of an 
assignment operator. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Some programmers might think that this use of the 
      ternary operator is as bad as using it to control program flow. However, I 
      like this ability because it gives you the ability to concisely determine 
      which variable is the target of an assignment.<BR></TD></TR></TBODY></TABLE>

## The Range Operator (..)

The range operator was already introduced to you in Chapter 3, "<A 
href="ch03.htm">Variables</A>," when you read about 
arrays. I review its use here - in an array context - in a bit more detail. 
<H3><A name="Example: Using the Range Operator">Example: Using the Range 
Operator</A></H3>When used with arrays, the range operator simplifies the 
process of creating arrays with contiguous sequences of numbers and letters. 
We'll start with an array of the numbers one through ten. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with ten elements that include 1, 2, 3, 4, 5, 6, 7, 8, 
      9, and 10.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = (1..10);</PRE></B>You can also create an array of contiguous 
letters. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with ten elements that include A, B, C, D, E, F, G, H, 
      I , and J.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = ("A".."J");</PRE></B>And of course, you can have other things in 
the array definition besides the range operator. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array that includes AAA, 1, 2, 3, 4, 5, A, B, C, D, and 
      ZZZ.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = ("AAA", 1..5, "A".."D", "ZZZ");</PRE></B>You can use the range 
operator to create a list with zero filled numbers. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with ten elements that include the strings 01, 02, 03, 
      04, 05, 06, 07, 08, 09, and 10.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = ("01".."10");</PRE></B>And you can use variables as operands for 
the range operator. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign a string literal to <TT>$firstVar</TT>. 
      <P>Create an array with ten elements that include the strings 01, 02, 03, 
      04, 05, 06, 07, 08, 09, and 10.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = "10";
@array = ("01"..$firstVar);</PRE></B>If you use strings of more than one 
character as operands, the range operator will increment the rightmost character 
by one and perform the appropriate carry operation when the number 9 or letter z 
is reached. You'll probably need to see some examples before this makes sense. I 
know that I had trouble figuring it out. So here goes. 
<P>You've already seen "A".."Z" which is pretty simple to understand. Perl 
counts down the alphabet until Z is reached. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato SIZE-4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>The two ranges "A".."Z" and "a".."Z" are not identical. 
      And the second range does not contain all lower-case letters and all 
      upper-case letters. Instead, Perl creates an array that just contains the 
      lower-case letters. Apparently, when Perl reaches the end of the alphabet 
      - whether lower-case or upper-case - the incrementing 
  stops.<BR></TD></TR></TBODY></TABLE>
<P>What happens when a two-character string is used as an operand for the range 
operator? Let's find out. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array that includes the strings aa, ab, ac, ad, ae, and 
      af.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = ("aa" .. "af");</PRE></B>This behaves as you'd expect, 
incrementing along the alphabet until the f letter is reached. However, if you 
change the first character of one of the operands watch what happens. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array that includes the strings ay, az, ba, bb, bc, bd, be, 
      and bf.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = ("ay" .. "bf");</PRE></B>When the second character is incremented 
to z, then the first character is incremented to b and the second character is 
set to a. <A name="Michael Campbell_27"></A>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>If the right-hand side of the range operator is less 
      than the left-hand side, an empty array is 
created.<BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
  Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>In the printed version of this book the previous 
      note was incorrect.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan SIZE-4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Mark Pettigrew sent me a email message to let me 
      know what an empty array is only created when numbers are involved. For 
      exampl, @array = (5...1) creates an ampty array. However, @array = 
      ('bf'..'ay') actually creates an array with the elements bf, bg, bh ... 
      zz. The array creation stops when the z character is 
  reached.<BR></TD></TR></TBODY></TABLE>

## The String Operators (. and x)

Perl has two different string operators - the concatenation 
(<TT>.</TT>) operator and the repetition (<TT>x</TT>) operator. These operators 
make it easy to manipulate strings in certain ways. Let's start with the 
concatenation operator. 
<H3><A name="Example: Using the Concatenation Operator">Example: Using the 
Concatenation Operator</A></H3>The <I>concatenation</I> operator is used to join 
two strings together. If you have a numeric value as one of the two operands, 
Perl will quietly convert it to a string. 
<P>Here is an example that shows Perl converting a number into a string. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign a string value to <TT>$firstVar</TT>. The string will be three 
      values concatenated into one string.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = "This box can hold " . 55 . " items.";
print("$firstVar\n");</PRE></B>The program produces the following output: <B><PRE>This box can hold 55 items.</PRE></B>The number 55 is automatically 
converted to a string and then combined with the other strings. Notice that the 
string literals have spaces in them so that when the final string is created, 
the number will be surrounded with spaces making the sentence readable. 
<P>You can also use variables as operands with the concatenation operator. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign string values to <TT>$firstVar</TT> and <TT>$secondVar</TT>. 
      <P>Assign the concatenation of <TT>$firstVar</TT> and <TT>$secondVar</TT> 
      to <TT>$thirdVar</TT>. 
      <P>Print $thirdVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = "AAA";
$secondVar = "BBB";
$thirdVar = $firstVar . $secondVar;
print("$thirdVar\n");</PRE></B>The program produces the following output <B><PRE>AAABBB</PRE></B>Notice that Perl concatenates the strings together without 
adding any spaces or other separating characters. If you want a space between 
the string after they are concatenated, you must ensure that one of original 
strings has the space character - either at the end of the first string or the 
start of the second. 
<H3><A name="Example: Using the Repetition Operator">Example: Using the 
Repetition Operator</A></H3>The <I>repetition</I> operator is used to repeat any 
string a given number of times. Like the concatenation operator, any numbers 
will be quietly converted to strings so that they can be repeated. 
<P>Here is an example that how to repeat a string 7 times. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign <TT>$firstVar</TT> the value of "1". 
      <P>Assign <TT>$secondVar</TT> the value of <TT>$firstVar</TT> repeated 
      seven times. 
      <P>Print $secondVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = "1";
$secondVar = $firstVar x 7;
print("$secondVar\n");</PRE></B>The program produces the following output: <B><PRE>1111111</PRE></B>The string that gets repeated can be longer than one 
character. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign <TT>$firstVar</TT> the value of "11 ". 
      <P>Assign <TT>$secondVar</TT> the value of <TT>$firstVar</TT> repeated 
      seven times. 
      <P>Print $secondVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = "11 ";
$secondVar = $firstVar x 7;
print("$secondVar\n");</PRE></B>The program produces the following output: <B><PRE>11 11 11 11 11 11 11</PRE></B>You can also use the repetition operator on 
arrays or lists. However, the array gets evaluated in a scalar context so that 
the number of elements is returned. This number gets converted to a string and 
then repeated. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign the elements "A" through "G" to <TT>@array</TT>. 
      <P>Get the number of elements in <TT>@array</TT>, convert that number to a 
      string, repeat it twice and then assign the new string to 
      <TT>$firstVar</TT>. 
      <P>Print the <TT>@array</TT> and <TT>$firstVar</TT> 
  variables.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = ('A'..'G');
$firstVar = @array x 2;
print("@array\n");
print("$firstVar\n");</PRE></B>This program produces the following output: <B><PRE>A B C D E F G
77</PRE></B><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>If you want the repeat an array element, explicitly 
      say which element you want to repeat using an array 
  index.<BR></TD></TR></TBODY></TABLE></B>

## The Assignment Operators

The last type of operators that we'll look at are <I>assignment</I> operators. You've 
already used the basic assignment operator (<I>=</I>) to value variables in some 
of the examples earlier in this chapter. In addition, Perl has shortcut 
assignment operators that combine the basic assignment operator with another 
operator. For instance, instead of saying <TT>$firstVar = $firstVar + 
$secondVar</TT>; you could say <TT>$firstVar += $secondVar</TT>. The advantage 
of the using shortcut operators - besides having less to type - is that your 
intentions regarding assignment are made clear. 
<P>Table 4.11 lists all of Perl's assignment operators. After reading the other 
sections in this chapter about the various operator types, you should be 
familiar with all of the operations described in the table. 
<P><A name=table0411></A>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.11-The Assignment Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Operator </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>var = op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var += op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var + op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var -= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var - op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var *= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var * op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var /= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var / op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var %= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var % op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var .= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var . op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var **= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var ** op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var x= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var x op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var &lt;&lt;= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var &lt;&lt; 
      op1</TT> to <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var &gt;&gt;= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var &gt;&gt; 
      op1</TT> to <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var &amp;= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var &amp; op1</TT> 
      to <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var |= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var | op1</TT> to 
      <TT>var</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>var ||= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var || op1</TT> to 
      <TT>var</TT>. 
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD bgColor=black><FONT color=lightcyan 
        size=4><B>Note</B></FONT></TD></TR>
        <TR>
          <TD bgColor=lightcyan>This assignment operator was erroneously left 
            out of the printed edition of the book. Randal Schwartz was kind 
            enough to point out this problem.</TD></TR></TBODY></TABLE>
      <P></P></TD></TR>
  <TR>
    <TD vAlign=top><TT>var ^= op1;</TT> </TD>
    <TD vAlign=top>This operator assigns the value of <TT>var ^ op1</TT> to 
      <TT>var</TT>.</TD></TR></TBODY></TABLE>
<P>The examples in this section will not describe the different assignment 
operators. Their use is straightforward. However, when assigning values to 
arrays there are some special situations. The first is assigning values to array 
slices and the second is assign array elements to scalars. Let's start with 
array slices. 
<H3><A name="Example: Assignment Using Array Slices">Example: Assignment Using 
Array Slices</A></H3>If you recall from Chapter 3, "<A 
href="ch03.htm">Variables</A>," array slices let 
you directly access multiple elements of an array using either the comma or 
range operators. For instance, the variable <TT>@array[10, 12]</TT> refers to 
both the tenth and the twelfth elements of the <TT>@array</TT> array. 
<P>You can use the assignment operator in conjunction with array slices to 
assign values to multiple array elements in one statement. If you have an array 
with 10 elements and you need to change elements 4 and 7 you can do so like 
this: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with 11 elements. 
      <P>Assign values to elements 4 and 7. 
      <P>Print the array.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = (0..10);
@array[4, 7] = ("AA","BB");
print("@array\n");</PRE></B>This program produces the following output: <B><PRE>0 1 2 3 AA 5 6 BB 8 9 10</PRE></B><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>The elements that an array slice refers to do not 
      have to be in consecutive order.<BR></TD></TR></TBODY></TABLE></B>
<P>You can look at the array slice assignment in the following way. The array on 
the left is the target and the array on the right is the source. So, the target 
array gets assigned the values in the source array. 
<P>There are a number of variations on the basic idea of using array slices in 
assignment statements. You can use scalar variables in place of the literals as 
operands for the range operator. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with 11 elements. 
      <P>Assign values to elements 4 and 7. 
      <P>Print the array.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = "AA";
@array = (0..10);
@array[4, 7] = ($firstVar, $firstVar);
print("@array\n");</PRE></B>This program produces the following output: <B><PRE>0 1 2 3 AA 5 6 AA 8 9 10</PRE></B>And you can use array variables also. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with 11 elements and an array with 2 elements. 
      <P>Assign values to elements 4 and 7 of the <TT>@array1</TT> array. 
      <P>Print <TT>@array1</TT>.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array1 = (0..10);
@array2 = ("AA", "BB");
@array1[4, 7] = @array2;
print("@array1\n");</PRE></B>This program produces the following output <B><PRE>0 1 2 3 AA 5 6 BB 8 9 10</PRE></B>An array slice assignment is a quick and 
convenient way to swap two array elements from the same array. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with 11 elements. 
      <P>Swap elements 4 and 7. 
      <P>Print the array.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = (0..10);
@array[4, 7] = @array[7, 4];
print "@array\n";</PRE></B>This program produces the following output: <B><PRE>0 1 2 3 7 5 6 4 8 9 10</PRE></B>Notice that the 4<SUP>th</SUP> element and 
the 7th element have swapped places. You can also use the range operator when 
using array slice assignment. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with 11 elements. 
      <P>Assign the 23<SUP>rd</SUP>, 24<SUP>th</SUP>, and 25th elements from 
      <TT>@array2</TT> to <TT>@array1</TT> as elements 1, 2, and 3. 
      <P>Print the array.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array1 = (0..10);
@array2 = ("A".."Z");
@array1[1..3] = @array2[23..25];
print "@array1\n";</PRE></B>This program produces the following output: <B><PRE>0 X Y Z 4 5 6 7 8 9 10</PRE></B>Figure 4.2 shows a depiction of which array 
elements in <TT>@array2</TT> are being assigned to which array elements in 
<TT>@array1</TT>. 
<P><I>Fig. 04.2 - Assigning array Elements using an array slice and the range 
operator.</I> 
<P>If you only need certain elements from an array, you can use the array slice 
to select and create a new array in one step. </P>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with 10 elements. 
      <P>Assign the 2<SUP>nd</SUP>, 4<SUP>th</SUP>, and 6th elements from 
      <TT>@array2</TT> to <TT>@array1</TT> as elements 0, 1, and 2. 
      <P>Print the arrays.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array1 = ("A".."J");
@array2 = @array1[2, 4, 6];
print("@array1\n");
print("@array2\n");</PRE></B>This program produces the following output: <B><PRE>A B C D E F G H I J
C E G</PRE></B>
<H3><A name="Example: Assigning an Array to Scalar Variables">Example: Assigning 
an Array to Scalar Variables</A></H3>At times, you may want to take array 
elements and assign them to scalar variables. The ability is especially useful 
inside functions and you'll read about that usage in Chapter 5,"<A 
href="ch05.htm">Functions</A>" . 
<P>It's also useful when you want to make your code more readable. So that 
instead of referring to the 3<SUP>rd</SUP> element of an array as 
<TT>$array[3]</TT>, you can refer to the value as <TT>$town</TT> or whatever 
variable name you use. 
<P>In this next example, we'll take an array that holds an address and separate 
the elements into four scalar variables. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create an array with Tom Jones' address. 
      <P>Assign each element of the array to a separate scalar variable. 
      <P>Print the scalar variables.</TT></P></TD></TR></TBODY></TABLE><B><PRE>@array = ("Tom Jones", "123 Harley Lane", "Birmingham", "AR");
($name, $street, $town, $state) = @array;
print("$name, $street, $town, $state\n");</PRE></B>This program prints: <B><PRE>Tom Jones, 123 Harley Lane, Birmingham, AR</PRE></B>The first element of 
<TT>@array</TT> is assigned to the first scalar on the left side of the 
assignment operator. Because the scalars are surrounded by parentheses, Perl 
sees them as another list. If you couldn't do this type of multiple array 
element to multiple scalar assignment, you would have to do this: <B><PRE>@array = ("Tom Jones", "123 Harley Lane", "Birmingham", "AR");
$name   = $array[0];
$street = $array[1];
$town   = $array[2];
$state  = $array[3];
print("$name, $street, $town, $state\n");</PRE></B>I think that the first 
example is easier to understand, don't you? If the array has more elements than 
scalars, the extra elements are ignored. Conversely, if there are not enough 
elements, some of the scalar variables will have an undefined value. 
<P><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>You can also use the array slice and range operators 
      with this type of assignment also.<BR></TD></TR></TBODY></TABLE></B>

## Order of Precedence

We briefly touched on the order of precedence concept at the beginning of the chapter. Now that you 
are familiar with most of Perl's operators we can explore the subject in more 
detail. Table 4.12 is an exhaustive list of operators and how they rank in terms 
of precedence - the higher the level, the higher their precedence. Operators at 
the same level have same precedence and are evaluated from left to right. 
Otherwise, higher precedence levels are evaluated first. 
<P>Perl uses <I>associativity</I> to decide which operators and operators belong 
together. For instance, the unary minus operator has an associativity of right 
to left because it affects the operand immediately to its right. 
<P><A name=table0412></A>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 4.12-The Order of Precedence and Associativity for Perl 
  Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Level</TH>
    <TH align=left>Operator </TH>
    <TH align=left>Description </TH>
    <TH align=left>Associativity</TH></TR>
  <TR>
    <TD vAlign=top>22</TD>
    <TD vAlign=top>(), [], {} </TD>
    <TD vAlign=top>Function Calls, Parentheses, Array subscripts</TD>
    <TD vAlign=top>Left to right </TD></TR>
  <TR>
    <TD vAlign=top>21</TD>
    <TD vAlign=top>&gt;</TD>
    <TD vAlign=top>infix dereference operator </TD>
    <TD vAlign=top>Left to right</TD></TR>
  <TR>
    <TD vAlign=top>20</TD>
    <TD vAlign=top>++, --</TD>
    <TD vAlign=top>Auto increment, Auto decrement </TD>
    <TD vAlign=top>None</TD></TR>
  <TR>
    <TD vAlign=top>19</TD>
    <TD vAlign=top>** </TD>
    <TD vAlign=top>Exponentiation </TD>
    <TD vAlign=top>Right to left</TD></TR>
  <TR>
    <TD vAlign=top>18</TD>
    <TD vAlign=top>!, ~, +, -, \ </TD>
    <TD vAlign=top>Logical not, bitwise not, unary plus, unary minus, 
    reference</TD>
    <TD vAlign=top>Right to left </TD></TR>
  <TR>
    <TD vAlign=top>17</TD>
    <TD vAlign=top>=~, !~ </TD>
    <TD vAlign=top>Match, Not match - These operators are described in <A 
      href="ch10.htm">Chapter 10</A>. Briefly, they 
      tell Perl to do pattern matching, substitution or translation on a 
      specific variable instead of the <TT>$_</TT> special variable.</TD>
    <TD vAlign=top>Left to right</TD></TR>
  <TR>
    <TD vAlign=top>16</TD>
    <TD vAlign=top>*, /, % x </TD>
    <TD vAlign=top>Multiply, Divide, Modulus, Repetition</TD>
    <TD vAlign=top>Left to right </TD></TR>
  <TR>
    <TD vAlign=top>15</TD>
    <TD vAlign=top>+, -, . </TD>
    <TD vAlign=top>Add, Subtract, String concatenation</TD>
    <TD vAlign=top>Left to right </TD></TR>
  <TR>
    <TD vAlign=top>14</TD>
    <TD vAlign=top>&lt;&lt;, &gt;&gt; </TD>
    <TD vAlign=top>Bitwise left shift, Bitwise right shift</TD>
    <TD vAlign=top>Left to right </TD></TR>
  <TR>
    <TD vAlign=top>13</TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>File test operators </TD>
    <TD vAlign=top>None</TD></TR>
  <TR>
    <TD vAlign=top>12</TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>Relational Operators </TD>
    <TD vAlign=top>None</TD></TR>
  <TR>
    <TD vAlign=top>11</TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>Equality Operators </TD>
    <TD vAlign=top>None</TD></TR>
  <TR>
    <TD vAlign=top>10</TD>
    <TD vAlign=top>&amp; </TD>
    <TD vAlign=top>Bitwise and </TD>
    <TD vAlign=top>Left to right</TD></TR>
  <TR>
    <TD vAlign=top>9</TD>
    <TD vAlign=top>|, ^ </TD>
    <TD vAlign=top>Bitwise or, Bitwise xor </TD>
    <TD vAlign=top>Left to right</TD></TR>
  <TR>
    <TD vAlign=top>8</TD>
    <TD vAlign=top>&amp;&amp;</TD>
    <TD vAlign=top>Logical and </TD>
    <TD vAlign=top>Left to right</TD></TR>
  <TR>
    <TD vAlign=top>7</TD>
    <TD vAlign=top>|| </TD>
    <TD vAlign=top>Logical or </TD>
    <TD vAlign=top>Left to right</TD></TR>
  <TR>
    <TD vAlign=top>6</TD>
    <TD vAlign=top>.. </TD>
    <TD vAlign=top>Range operator </TD>
    <TD vAlign=top>None</TD></TR>
  <TR>
    <TD vAlign=top>5</TD>
    <TD vAlign=top>?: </TD>
    <TD vAlign=top>Ternary or conditional operator</TD>
    <TD vAlign=top>Right to left </TD></TR>
  <TR>
    <TD vAlign=top>4</TD>
    <TD vAlign=top><BR></TD>
    <TD vAlign=top>Assignment Operators </TD>
    <TD vAlign=top>Right to left</TD></TR>
  <TR>
    <TD vAlign=top>3</TD>
    <TD vAlign=top>, </TD>
    <TD vAlign=top>Comma operator </TD>
    <TD vAlign=top>Left to right</TD></TR>
  <TR>
    <TD vAlign=top>2</TD>
    <TD vAlign=top>not</TD>
    <TD vAlign=top>Low precedence logical operators </TD>
    <TD vAlign=top>Left to right</TD></TR>
  <TR>
    <TD vAlign=top>1</TD>
    <TD vAlign=top>and</TD>
    <TD vAlign=top>Low precedence logical operators </TD>
    <TD vAlign=top>Left to right</TD></TR>
  <TR>
    <TD vAlign=top>0</TD>
    <TD vAlign=top>or, xor</TD>
    <TD vAlign=top>Low precedence logical operators </TD>
    <TD vAlign=top>Left to right</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The printed version of this book listed the not, 
      and, or, and xor operators at the same precedence level. Randal Schwartz 
      was kind enough to point out this problem.</TD></TR></TBODY></TABLE>
<P>Operators that are not discussed in this chapter are discussed elsewhere in 
this book. Table 4.1, at the beginning of the chapter, points out where you can 
get more information on those operators. In addition, you can read about the low 
precedence logical operators in Chapter 13, "Handling Exceptions and Signals." 
<H3><A name="Example: Order of Precedence">Example: Order of 
Precedence</A></H3>While it is not possible to show examples of all the 
ramifications of operator precedence, we can look at one or two so that you can 
get a feel for the concept. 
<P>First, an example using the ternary operator and various arithmetic 
operators. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign values to $firstVar and $secondVar. 
      <P>Assign either a 1 or 0 to $thirdVar based on the evaluation of the 
      condition 34 + $firstVar-- + $secondVar ? 1 : 0. 
      <P>Print $thirdVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = 4;
$secondVar = 1;
$thirdVar = 34 + $firstVar-- + $secondVar ? 1 : 0;
print("$thirdVar\n");</PRE></B>The program produces the following output: <B><PRE>1</PRE></B>The ternary operator has a precedence level of 5, every other 
operator has a higher precedence level and will be evaluated first. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign values to $firstVar and $secondVar. 
      <P>Assign either a 1 or 0 to $thirdVar based on the evaluation of the 
      condition 34 + $firstVar-- + ($secondVar ? 1 : 0). 
      <P>Print $thirdVar.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = 4;
$secondVar = 1;
$thirdVar = 34 + $firstVar-- + ($secondVar ? 1 : 0);
print "$thirdVar\n";</PRE></B>The program produces the following output <B><PRE>39</PRE></B>This program results in a value of 39 for <TT>$thirdVar</TT> 
because the parentheses operators have a precedence level of 22. They serve to 
isolate regions of the statements and tell Perl to evaluate the stuff inside 
before evaluating the rest of the statement. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato SIZE-4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>Remember that these examples are contrived to show a 
      point. I don't program in this manner. I recommend using parentheses to 
      tell Perl exactly how you want your code to be evaluated. So I would 
      normally do the following: 
      <P><PRE>$thirdVar = 34 + $firstVar + ($secondVar ? 1 : 0);
$firstVar--;</PRE>The decrementing of <TT>$firstVar</TT> has been pulled 
      out the first line because using the post-decrement operator has no effect 
      on the first line and make it harder to 
understand.<BR></TD></TR></TBODY></TABLE>
<P>Here is a example of operator precedence using the exponentiation operator. 
This also shows you how to determine operator precedence on your own. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign an expression to <TT>$firstVar</TT>. 
      <P>Assign an expression to <TT>$secondVar</TT> using parenthesis to 
      indicate a preferred precedence order. 
      <P>Assign an expression to <TT>$thirdVar</TT> using parenthesis in a 
      different manner to indicate a preferred precedence order. 
      <P>Print the variables.</TT></P></TD></TR></TBODY></TABLE><B><PRE>$firstVar = -2 ** 4;
$secondVar = -(2 ** 4);
$thirdVar = (-2) ** 4;

print "$firstVar\n";
print "$secondVar\n";
print "$thirdVar\n";</PRE></B>The program produces the following output: <B><PRE>-16
-16
16</PRE></B>From this example, you can see the precedence level for 
exponentiation is higher than unary minus because the first and second variables 
are equal. 
<P><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink SIZE-4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>If you always use parentheses to indicate how you 
      want the operators to be evaluated, you'll never need to worry about 
      operator precedence in your code.<BR></TD></TR></TBODY></TABLE></B>

## Summary

This chapter was pretty long and you've seen 
quite a few examples of how operators can be used. Let's review. 
<P>You learned that operators are used to tell Perl what actions to perform. 
Some operators take precedence over others so that they and their operands will 
be evaluated first. An operand can be as simple as the number 10 or very complex 
- involving variables, literals, and other operators. This means that they are 
recursive in nature. 
<P>Perl has many different types of operators: arithmetic, assignment, binding, 
bitwise, comma, file test, list, logical, postfix, range, reference, relational 
(both numeric and sting), string, and ternary. Most of these operator types were 
discussed in this chapter, and the rest are scattered throughout the rest of the 
book. Table 4.1 lists the page numbers where more information can be found on 
those operators not covered in this chapter. 
<P>The bulk of the chapter talked about various types of operators. Starting 
with binary arithmetic operators, and then unary arithmetic operators. You were 
introduced to the pre- and post-increment and pre- and post-decrement operators. 
Next, came the logical operators and the bitwise operators. Sometimes, the 
bitwise shift operators are used when fast integer multiplication and division 
is needed. 
<P>Then, came numeric and string relational operators. Followed by the ternary 
operator. The ternary operator was used to show you what an lvalue is. An lvalue 
is the value on the left sign of an assignment operator. It must evaluate to 
some variable that Perl can use to hold a value. 
<P>The range operator was used to create sequential elements of an array, the 
concatenation operator was used to join two strings together, and the string 
repetition operator was used to repeat a string a given number of times. 
<P>Then you looked at the list of assignment operators, most of which were 
shortcuts to reduce typing and clarify the meaning of the assignment. </P>
<P>And finally, you saw a detailed list of Perl's operators and their order of 
precedence. Several examples were given to illustrate how precedence worked. My 
recommendation is to use parentheses to explicitly tell Perl how which order to 
evaluate operators. 
<P>The next chapter, "<A 
href="ch05.htm">Functions</A>," will look at how 
functions and list operators are the same thing. And you will be introduced to 
subroutines and parameters. 

## Review Questions

<OL>
  <LI>What are three arithmetic operators? 
  <P></P>
  <LI>What does the <TT>x</TT> operator do? 
  <P></P>
  <LI>What does it mean to pre-decrement a variable? 
  <P></P>
  <LI>What is the value of 1 <TT>^</TT> 1? 
  <P></P>
  <LI>What is the value of 1 <TT>&lt;&lt;</TT> 3? 
  <P></P>
  <LI>What is the ternary operator used for? 
  <P></P>
  <LI>Can the <TT>x</TT> operator be used with arrays? 
  <P></P>
  <LI>What is the precedence level of the <TT>range</TT> operator? 
  <P></P>
  <LI>What is the value of 2 * 5 <TT>+</TT> 10? 
  <P></P>
  <LI>What is the value of 65 <TT>&gt;&gt;</TT> 1? 
  <P></P>
  <LI>What is the <TT>spaceship</TT> operator used for? 
  <P></P>
  <LI>If an array were defined with ("<TT>fy</TT>".."<TT>gb</TT>"), what would 
  its elements be?</LI></OL>

## Review Exercises

<OL>
  <LI>Assign a value to <TT>$firstVar</TT> using both division and subtraction. 
  <P></P>
  <LI>Using the post-decrement operator, subtract one from <TT>$firstVar</TT>. 
  <P></P>
  <LI>Write a program that assigns values to <TT>$firstVar</TT> and 
  <TT>$secondVar</TT> and uses the <TT>&gt;=</TT> operator to test their 
  relationship to each other. Print the resulting value. 
  <P></P>
  <LI>Use the <TT>**=</TT> assignment operator to assign a value to 
  <TT>$firstVar</TT>. 
  <P></P>
  <LI>Use the ternary operator to decide between to different value. 
  <P></P>
  <LI>Write a program that assigns values to <TT>$firstVar</TT> and 
  <TT>$secondVar</TT> and uses the <TT>&lt;=&gt;</TT> operator to test their 
  relationship to each other. Print the resulting value. 
  <P></P>
  <LI>Use the concatenation operator to join the following values together: "A" 
  <TT>x</TT> 4 and "B" <TT>x</TT> 3. 
  <P></P>
  <LI>Use the exponentiation operator to find the value of 2 to the 5th power. 
  <P></P>
  <LI>Write an assignment statement that uses the <TT>&amp;&amp;</TT> and 
  <TT>||</TT> and <TT>!</TT> operators. 
  <P></P>
  <LI>Write a program that prints the value of the fifth bit from the right in a 
  scalar variable. 
  <P></P>
  <LI>Write a program that uses a bitwise assignment to set the fifth bit from 
  the right in a scalar variable. 
  <P></P>
  <LI>Write a program that shows the difference in operator precedence between 
  the <TT>%</TT> operator and the <TT>&amp;&amp;</TT> operator.</LI></OL>
