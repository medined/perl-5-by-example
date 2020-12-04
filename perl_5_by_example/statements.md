# Statements

<P>Statements can be very simple or very complex. The simplest statement is this 

<P><B><PRE>123;</PRE></B>which is a numeric literal followed by a semicolon. The 
semicolon is very important. It tells Perl that the statement is complete. A 
more complicated statement might be 
<P><B><PRE>$bookSize = ($numOfPages >= 1200 ? "Large" : "Normal");</PRE></B>which 
says if the number of pages is 1,200 or greater, then assign <TT>"Large"</TT> to 
<TT>$bookSize</TT>; otherwise, assign <TT>"Normal"</TT> to <TT>$bookSize</TT>. 
<A name="David Rasch"></A>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
  Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The printed version of this book showed the above 
      example as <TT>$bookSize = ($numOfPages >= 1200 : "Large" : 
      "Normal");</TT>. Please note that the first colon was a typographical 
      error and it should be a question mark. David Rasch the sharp-eyed person 
      that spotted this problem.</TD></TR></TBODY></TABLE>
<P>
<P>In Perl, every statement has a value. In the first example, the value of the 
statement is <TT>123</TT>. In the second example, the value of the statement 
could be either <TT>"Large"</TT> or <TT>"Normal"</TT> depending on the value of 
<TT>$numOfPages</TT>. The last value that is evaluated becomes the value for the 
statement. 
<P>Like human language in which you put statements together from parts of speech 
- nouns, verbs, and modifiers - you can also break down Perl statements into 
parts. The parts are the literals, variables, and functions you have already 
seen in the earlier chapters of this book. 
<P>Human language phrases - like, "walk the dog" - also have their counterparts 
in computer languages. The computer equivalent is an expression. 
<I>Expressions</I> are a sequence of literals, variables, and functions 
connected by one or more operators that evaluate to a single value - scalar or 
array. An expression can be promoted to a statement by adding a semicolon. This 
was done for the first example earlier. Simply adding a semicolon to the literal 
made it into a statement that Perl could execute. 
<P>Expressions may have side effects, also. Functions that are called can do 
things that are not immediately obvious (like setting global variables) or the 
pre- and post-increment operators can be used to change a variable's value. 
<P>Let's take a short diversion from our main discussion about statements and 
look at expressions in isolation. Then we'll return to statements to talk about 
statement blocks and statement modifiers. 

## Understanding Expressions

You can break the universe of expressions up in to into four types: 
<P>
<UL>
  <LI>Simple Expressions 
  <P></P>
  <LI>Simple Expressions with Side Effects 
  <P></P>
  <LI>Simple Expression with Operators 
  <P></P>
  <LI>Complex Expressions</LI></UL>
<P><I>Simple expressions </I>consist of a single literal or variable. Table 6.1 
shows some examples. Not much can be said about these expressions because they 
are so basic. It might be a matter for some debate whether or not an array or 
associative array variable can be considered a simple expression. My vote is 
yes, they can. The confusion might arise because of the notation used to 
describe an array or associative array. For example, an array can be specified 
as (12, 13, 14). You can see this specification as three literal values 
surrounded by parentheses or one array. I choose to see one array which fits the 
definition of a simple expression - a single variable. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 6.1-The Simplest Perl Expressions</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Simple Expression </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>123</TT> </TD>
    <TD vAlign=top>Integer literal</TD></TR>
  <TR>
    <TD vAlign=top><TT>Chocolate is great!</TT> </TD>
    <TD vAlign=top>String literal</TD></TR>
  <TR>
    <TD vAlign=top><TT>(1, 2, 3)</TT> </TD>
    <TD vAlign=top>Array literal</TD></TR>
  <TR>
    <TD vAlign=top><TT>$numPages</TT> </TD>
    <TD vAlign=top>Variable</TD></TR></TBODY></TABLE>
<P><I>Simple expressions with side effects </I>are the next type of expression 
we'll examine. A side effect is when a variable's value is changed by the 
expression. Side effects can be caused using any of the unary operators: 
<TT>+</TT>, <TT>-</TT>, <TT>++</TT>, <TT>--</TT>. These operators have the 
effect of changing the value of a variable just by the evaluation of the 
expression. No other Perl operators have this effect - other than the assignment 
operators, of course. Function calls can also have side effects - especially if 
local variables were not used and changes were made to global variables. Table 
6.2 shows examples of different side effects. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 6.2-Perl Expressions with Side Effects</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Simple Expression </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>$numPages++</TT> </TD>
    <TD vAlign=top>Increments a variable</TD></TR>
  <TR>
    <TD vAlign=top><TT>++$numPages</TT> </TD>
    <TD vAlign=top>Increments a variable</TD></TR>
  <TR>
    <TD vAlign=top><TT>chop</TT>(<TT>$firstVar</TT>) </TD>
    <TD vAlign=top>Changes the value of <TT>$firstVar</TT> - a global 
    variable</TD></TR>
  <TR>
    <TD vAlign=top><TT>sub</TT> <TT>firstsub</TT> { <TT>$firstVar = 10; 
    }</TT></TD>
    <TD vAlign=top>Also changes <TT>$firstVar</TT>. </TD></TR></TBODY></TABLE>
<P>Note that when the expressions <TT>$numPages++</TT> and <TT>++$numPages</TT> 
are evaluated, they have the same side effect even though they evaluate to 
different values. The first evaluates to <TT>$numPages</TT>, and the second 
evaluates to <TT>$numPages + 1</TT>. The side effect is to increment 
<TT>$numPages</TT> by 1. 
<P>The <TT>firstsub()</TT> function shown in Table 6.2 changes the value of the 
<TT>$firstVar</TT> variable, which has a global scope. This can also be 
considered a side effect, especially if <TT>$firstVar</TT> should have been 
declared as a local variable. 
<P><I>Simple expressions with operators</I> are expressions that include one 
operator and two operands. Any of Perl's binary operators can be used in this 
type of expression. Table 6.3 shows a few examples of this type of expression. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 6.3-Perl Expressions with Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Simple Expression </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>10 + $firstVar</TT> </TD>
    <TD vAlign=top>Adds ten to $firstVar</TD></TR>
  <TR>
    <TD vAlign=top><TT>$firstVar . "AAA" </TT></TD>
    <TD vAlign=top>Concatenates $firstVar and "AAA"</TD></TR>
  <TR>
    <TD vAlign=top><TT>"ABC" x 5</TT> </TD>
    <TD vAlign=top>Repeats <TT>"ABC"</TT> five times</TD></TR></TBODY></TABLE>
<P>Another way of viewing <TT>10 +</TT> <TT>$firstVar</TT> is as <I>simple 
expression plus simple expression</I>. Thus, you can say that a simple 
expression with an operator is defined as two simple expressions connected by an 
operator. When computer programmers define something in terms of itself, we call 
it <I>recursion</I>. Each time a recursion is done, the expression is broken 
down into simpler and simpler pieces until the computer can evaluate the pieces 
properly. 
<P>A <I>complex expression</I> can use any number of literals, variables, 
operators, and functions in any sequence. Table 6.4 shows some complex 
expressions. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 6.4-Complex Perl Expressions</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Complex Expression</TH></TR>
  <TR>
    <TD vAlign=top><TT>(10 + 2) + 20 / (5 ** 2) </TT></TD></TR>
  <TR>
    <TD vAlign=top><TT>20 - (($numPages - 1) * 2) </TT></TD></TR>
  <TR>
    <TD vAlign=top><TT>(($numPages++ / numChapters) * (1.5 / log(10)) + 
    6)</TT></TD></TR></TBODY></TABLE>
<P>There is an infinite number of expressions you can form with the Perl 
operator set. You can get extremely complicated in your use of operators and 
functions if you are not careful. I prefer to keep the expressions short, easy 
to document, and easy to maintain. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Sometimes it is difficult to tell whether you have 
      enough closing parentheses for all of your opening parentheses. Starting 
      at the left, count each open parenthesis, and when you find a closing 
      parenthesis, subtract one from the total. If you reach zero at the end of 
      the expression, the parentheses are balanced.<BR></TD></TR></TBODY></TABLE>
<P>Now we'll go back to looking at statements. 

## Statement Blocks

A <I>statement block</I>is a group of statements surrounded by curly braces. Perl views a statement 
block as one statement. The last statement executed becomes the value of the 
statement block. This means that any place you can use a single statement - like 
the <TT>map</TT> function - you can use a statement block. You can also create 
variables that are local to a statement block. So, without going to the trouble 
of creating a function, you can still isolate one bit of code from another. 
<P>Here is how I frequently use a statement block: 
<P><B><PRE>$firstVar = 10;
{
    $secondVar >>= 2;
    $secondVar++;
}
$thirdVar = 20;</PRE></B>The statement block serves to emphasize that the inner 
code is set apart from the rest of the program. In this case, the initialization 
of <TT>$secondVar</TT> is a bit more complex than the other variables. Using a 
statement block does not change the program execution in any way; it simply is a 
visual device to mark sections of code and a way to create local variables. 

## Statement Blocks and Local Variables

Normally, it's a good idea to place all of your variable 
initialization at the top of a program or function. However, if you are 
maintaining some existing code, you may want to use a statement block and local 
variables to minimize the impact of your changes on the rest of the code - 
especially if you have just been handed responsibility for a program that 
someone else has written. 
<P>You can use the <TT>my()</TT> function to create variables whose scope is 
limited to the statement block. This technique is very useful for temporary 
variables that won't be needed elsewhere in your program. For example, you might 
have a complex statement that you'd like to break into smaller ones so that it's 
more understandable. Or you might want to insert some <TT>print</TT> statements 
to help debug a piece of code and need some temporary variables to accommodate 
the print statement. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign ten to <TT>$firstVar</TT>. 
      <P>Start the statement block. 
      <P>Create a local version of <TT>$firstVar</TT> with a value of 
      <TT>A</TT>. 
      <P>Print <TT>$firstVar</TT> repeated five times. 
      <P>End the statement block. 
      <P>Print the global <TT>$firstVar</TT>.</TT> 
      <P></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
{
   my($firstVar) = "A";
   print $firstVar x 5 . "\n";

}
print("firstVar = $firstVar\n");</PRE></B>This program displays 
<P><B><PRE>AAAAA
firstVar = 10</PRE></B>You can see that the value of <TT>$firstVar</TT> has been 
unchanged by the statement block even though a variable called 
<TT>$firstVar</TT> is used inside it. This shows that the variable used inside 
the statement block does indeed have a local scope. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Statement blocks are also good to use when you 
      temporarily need to send debugging output to a file. Then, when all the 
      bugs have been found and the need for debugging is over, you can remove 
      the statement block quickly and easily because all the code is in one 
      spot.<BR></TD></TR></TBODY></TABLE>

## Statement Types

Just as there were several types of expressions, there are also several types of statements. Table 6.5 
lists seven different types of statements. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 6.5-Perl Statement Types</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Statement Type </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>No-action statements </TD>
    <TD vAlign=top>These statements evaluate a value but perform no 
  actions.</TD></TR>
  <TR>
    <TD vAlign=top>Action statements </TD>
    <TD vAlign=top>These statements perform some action.</TD></TR>
  <TR>
    <TD vAlign=top>Assignment statements </TD>
    <TD vAlign=top>These statements assign a value to one or more variables. 
      They are discussed, along with the assignment operator, in [](./operators.md).</TD></TR>
  <TR>
    <TD vAlign=top>Decision statements </TD>
    <TD vAlign=top>These statements allow you to test a condition and choose 
      among one or more actions. Decision statements are discussed in [](./control-statements.md). 
    </TD></TR>
  <TR>
    <TD vAlign=top>Jump statements </TD>
    <TD vAlign=top>These statements let you unconditionally change the program 
      flow to another point in your code. For instance, you could use the 
      <TT>redo</TT> keyword to send your program flow back to the beginning of a 
      statement block. Jump statements are discussed in [](./control-statements.md).
  </TD></TR>
  <TR>
    <TD vAlign=top>Loop statements </TD>
    <TD vAlign=top>These statements let you perform a series of statements 
      repeatedly while some condition is true or until some condition is true. 
      Loop statements are discussed in [](./control-statements.md).
  </TD></TR>
  <TR>
    <TD vAlign=top>Modified Statements </TD>
    <TD vAlign=top>These statements let you use the <TT>if</TT>, 
      <TT>unless</TT>, <TT>until</TT>, and <TT>while</TT> keywords to change the 
      behavior of a statement.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>A <I>keyword</I> is a word that is reserved for use 
      by Perl. These words (<TT>if</TT>, <TT>elsif</TT>, <TT>else</TT>, 
      <TT>while</TT>, <TT>unless</TT>, <TT>until</TT>, <TT>for</TT>, 
      <TT>foreach</TT>, <TT>last</TT>, <TT>next</TT>, <TT>redo</TT>, and 
      <TT>continue</TT>) are integral to the language and provide you with the 
      ability to control program flow.<BR></TD></TR></TBODY></TABLE>
<P><I>No-action statements</I> are evaluated by Perl and have a value but 
perform no actions. For instance, the Perl statement <TT>10 + 20;</TT> has a 
value of 30, but because no variables were changed, no work was done. The value 
of 20 is not stored anywhere, and it is quickly forgotten when the next 
statement is seen. 
<P>What good is a no-action statement if no work is done? A lot of Perl 
programmers use these simple statements as return values in functions. For 
instance: 
<P><B><PRE>sub firstSub {
    doSomething();
    condition == true ? "Success" : "Failure";
}</PRE></B>Because Perl returns the value of the last evaluated statement when 
leaving a function, you can use no-action statements to let Perl know what value 
should be returned to the main program. Notice that even though the ternary 
operator was used, because there are no function calls or unary operators, no 
work can be done. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>I still like to use the <TT>return()</TT> function 
      to explicitly identify the return values. The previous example looks like 
      this when using the <TT>return()</TT> function: 
      <P><PRE>sub firstSub {
    doSomething();
    return(condition == true ? "Success" : "Failure");
}</PRE></TD></TR></TBODY></TABLE><I>Action statements</I> use expressions to 
perform some task. They can increment or decrement a variable and call a 
function. 
<P><I>Modified statements</I> use expressions in conjunction with a modifying 
keyword to perform some action. There are four modifying keywords: <TT>if</TT>, 
<TT>unless</TT>, <TT>until</TT>, and <TT>while</TT>. The basic syntax of a 
modified statement is 
<P><B><PRE>EXPRESSION modifier (CONDITION);</PRE></B>Let's look at some examples of 
modified statements. 

### Example: Using the if Modifier

The <TT>if</TT> modifier tells Perl that the expression should 
be evaluated only if a given condition is true. The basic syntax of a modified 
statement with the if modifier is 
<P><B><PRE>EXPRESSION if (CONDITION);</PRE></B>This is a compact way of saying 
<P>if (CONDITION) { EXPRESSION; }Let's prove that the <TT>if</TT> modifier 
works. Here's an example showing that the <TT>if</TT> modifier can prevent the 
evaluation of an expression. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize the <TT>$firstVar</TT> and <TT>$secondVar</TT> variables to 
      20. 
      <P>Increment <TT>$firstVar</TT> if and only if <TT>$secondVar</TT> is 
      equal to 10. 
      <P>Print the values of <TT>$firstVar</TT> and <TT>$secondVar</TT>.</TT> 
      <P></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar  = 20;
$secondVar = 20;

$firstVar++ if ($secondVar == 10);

print("firstVar  = $firstVar\n");
print("secondVar = $secondVar\n");</PRE></B>This program prints 
<P><B><PRE>firstVar  = 20
secondVar = 20</PRE></B>The program doesn't increment <TT>$firstVar</TT> because 
the value of <TT>$secondVar</TT> is 20 at the time the condition is evaluated. 
If you changed the 10 to a 20 in the condition, Perl would increment 
<TT>$firstVar</TT>. 
<P>You can find out about the <TT>if</TT> statement - as opposed to the 
<TT>if</TT> modifier - in [](./control-statements.md)." 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The condition expression can be as complex as you'd 
      like. However, I believe that one of the goals of statement modifiers is 
      to make programs easier to read and understand. Therefore, I use modifiers 
      only with simple conditions. If complex conditions need to be met before 
      an expression should be evaluated, using the <TT>if</TT> statement is 
      probably a better idea.<BR></TD></TR></TBODY></TABLE>
<P>The <TT>unless</TT> modifier is the opposite of the <TT>if</TT> modifier. 
This modifier evaluates an expression unless a condition is true. The basic 
syntax of a modified statement with the <TT>unless</TT> modifier is 
<P><B><PRE>EXPRESSION unless (CONDITION);</PRE></B>This is a compact way of saying 
<P><B><PRE>if (! CONDITION) {
    EXPRESSION;
}</PRE></B>This modifier helps to keep program code clearly understandable 
because you don't have to use the logical <TT>not</TT> operator to change the 
value of a condition so you can evaluate an expression. Let's look back at the 
example from a moment ago. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize the <TT>$firstVar</TT> and <TT>$secondVar</TT> variables to 
      20. 
      <P>Increment <TT>$firstVar</TT> unless <TT>$secondVar</TT> is equal to 10. 

      <P>Print the values of <TT>$firstVar</TT> and <TT>$secondVar</TT>.</TT> 
      <P></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar  = 20;
$secondVar = 20;

$firstVar++ unless ($secondVar == 10);

print("firstVar  = $firstVar\n");
print("secondVar = $secondVar\n");</PRE></B>This program prints: 
<P><B><PRE>firstVar  = 21
secondVar = 20</PRE></B>If you were limited to using only the <TT>if</TT> 
modifier, the modified statement would read 
<P><B><PRE>$firstVar++ if ($secondVar != 10);</PRE></B>I feel that the <TT>unless</TT> 
modifier is more direct. All things being equal, the concept of 
<TT>$secondVar</TT> being equal to 10 is easier to grasp than the concept of 
<TT>$secondVar</TT> not being equal to 10. Of course, this is a trivial example. 
Let's look at something more substantial before we move on. 
<P>One of the drawbacks of associative arrays is that they quietly redefine the 
value of any key when that key is assigned a new value, thereby losing the old 
value. If you are reading from a list of key-valuepairs, this might not be the 
behavior you need. The <TT>unless</TT> modifier can be used to prevent element 
assignment if the key has already been used. Listing 6.1 shows the 
<TT>unless</TT> modifier used in a program. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the <TT>assignElement()</TT> function to create two elements in 
      the <TT>@array</TT> associative array. 
      <P>Call the <TT>printArray()</TT> function. 
      <P>Try to redefine the value associated with the "A" key by calling 
      <TT>assignElement()</TT>. 
      <P>Print the array again to verify that no elements have changed.</TT> 
      <P></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 6.1-06LST01.PL - Using the <TT>unless</TT> Modifier to Control 
      Array Element Assignment</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>assignElement("A", "AAAA");
assignElement("B", "BBBB");
printArray();

assignElement("A", "ZZZZ");
printArray();


sub assignElement {
    my($key, $value) = @_;

    $array{$key} = $value unless defined($array{$key});
}

sub printArray {
    while (($key, $value) = each(%array)) {
        print("$key = $value\n");
    }
    print("\n");
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays 
<P><B><PRE>A = AAAA
B = BBBB

A = AAAA
B = BBBB</PRE></B>These lines of code should look a little familiar to you. The 
<TT>while</TT> loop in the <TT>printArray()</TT> function was used in a Chapter 
5 example. The <TT>assignElement()</TT> function will make an assignment unless 
a key-value pair with the same key already exists. In that case, the assignment 
statement is bypassed. 

### Example: Using the until Modifier

The <TT>until</TT> modifier is a little more complex than the 
<TT>if</TT> or <TT>unless</TT> modifiers. It repeatedly evaluates the expression 
until the condition becomes true. The basic syntax of a modified statement with 
the <TT>until</TT> modifier is 
<P><B><PRE>EXPRESSION until (CONDITION);</PRE></B>This is a compact way of saying 
<P><B><PRE>until (CONDITION) {
    EXPRESSION;
}</PRE></B>The expression is evaluated only while the condition is false. If the 
condition is true when the statement is encountered, the expression will never 
be evaluated. The following example proves this: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize <TT>$firstVar</TT> to 10. 
      <P>Repeatedly evaluate <TT>$firstVar++</TT> until the condition 
      <TT>$firstVar > 2</TT> is true. 
      <P>Print the value of <TT>$firstVar</TT>.</TT> 
      <P></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
$firstVar++ until ($firstVar > 2);

print("firstVar = $firstVar\n");</PRE></B>This program displays 
<P><B><PRE>firstVar = 10</PRE></B>This shows that the expression <TT>$firstVar++</TT> 
was never executed because the condition was true the first time it was 
evaluated. If it had been executed, the value of <TT>$firstVar</TT> would have 
been 11 when printed. In this case, the <TT>until</TT> modifier worked exactly 
like the <TT>unless</TT> modifier. 
<P>However, when the condition is false for the first evaluation, Perl executes 
the expression repeatedly until the condition is true. Here is an example: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize <TT>$firstVar</TT> to 10. 
      <P>Repeatedly evaluate <TT>$firstVar++</TT> until the condition 
      <TT>$firstVar > 20</TT> is true. 
      <P>Print the value of <TT>$firstVar</TT>.</TT> 
      <P></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
$firstVar++ until ($firstVar > 20);

print("firstVar = $firstVar\n");</PRE></B>This program displays 
<P><B><PRE>firstVar = 21</PRE></B>In this case, the <TT>$firstVar++</TT> expression is 
executed 11 times. Each execution of the expression increments the value of 
<TT>$firstVar</TT>. When <TT>$firstVar</TT> is equal to 21, the statement ends 
because 21 is greater than 20, which means that the condition is true. 
<P>You can find out about the <TT>until</TT> statement - as opposed to the 
<TT>until</TT> modifier - [](./control-statements.md).

### Example: Using the while Modifier

The <TT>while</TT> modifier is the opposite of the 
<TT>until</TT> modifier. It repeatedly evaluates the expression while the 
condition is true. When the condition becomes false, the statement ends. The 
basic syntax of a modified statement with the <TT>while</TT> modifier is 
<P><B><PRE>EXPRESSION while (CONDITION);</PRE></B>This is a compact way of saying 
<P><B><PRE>while (CONDITION) {
    EXPRESSION;
}</PRE></B>The expression is evaluated only while the condition is true. If the 
condition is false when the statement is encountered, the expression will never 
be evaluated. Here is an example using the <TT>while</TT> modifier. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize <TT>$firstVar</TT> to 10. 
      <P>Repeatedly evaluate <TT>$firstVar++</TT> while the condition 
      <TT>$firstVar < 20</TT> is true. 
      <P>Print the value of <TT>$firstVar</TT>.</TT> 
      <P></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
$firstVar++ while ($firstVar < 20);

print("firstVar = $firstVar\n");</PRE></B>This program displays <PRE><B>firstVar = 20</B></PRE>
<P>You can compare this example directly to the last example given for the 
<TT>until</TT> modifier. Because the <TT>until</TT> modifier is the opposite of 
the <TT>while</TT> modifier, the operators in the conditions are also opposite 
in nature. </P>
<P>You can find out about the <TT>while</TT> statement - as opposed to the 
<TT>while</TT> modifier - in [](./control-statements.md).

## Summary

This chapter discussed Perl statements and 
how they are built from expressions. You read about four types of expressions: 
simple, simple with side effects, simple with operators, and complex. 
<P>Next, you read about statement blocks. These program constructs are good to 
logically isolate one block of statements from the main program flow. You can 
also use statement blocks and the <TT>my()</TT> function to create local 
variables. This is mainly done for debugging reasons or to make small program 
changes that are guaranteed not to affect other portions of the program. 
<P>Then, seven types of statements were mentioned: no-action, action, 
assignment, decision, jump, loop, and modified. This chapter described 
no-action, action, and modified statements. Assignment statements were mentioned 
in [](./variables.md) and again in [](./operators.md). Decision, jump, 
and loop statements are covered in [](./control-statements.md). 
<P>Modified statements use the <TT>if</TT>, <TT>unless</TT>, <TT>until</TT>, and 
<TT>while</TT> keywords to affect the evaluation of an expression. The 
<TT>if</TT> keyword evaluates an expression if a given condition is true. The 
<TT>unless</TT> keyword does the opposite: the expression is evaluated if a 
given condition is false. The <TT>until</TT> keyword repeatedly evaluates an 
expression until the condition is true. The <TT>while</TT> keyword is the 
opposite of until so that it repeatedly evaluates an expression until the 
condition is false. 

[](./control-statements.md) explores the <TT>decision</TT>, <TT>jump</TT>, and 
<TT>loop</TT> statement in detail. 

## Review Questions

<OL>
  <LI>What is an expression? 
  <P></P>
  <LI>What is a statement? 
  <P></P>
  <LI>What are the four statement modifiers? 
  <P></P>
  <LI>What are two uses for statement blocks? 
  <P></P>
  <LI>What can non-action statements be used for? 
  <P></P>
  <LI>How is the <TT>if</TT> modifier different from the <TT>unless</TT> 
  modifier? 
  <P></P>
  <LI>What will the following code display? 
  <P><B><PRE>$firstVar = 10;
$secondVar = 20;

$firstVar += $secondVar++ if ($firstVar > 10);

print("firstVar = $firstVar\n");
print("secondVar = $secondVar\n");</PRE></B></LI></OL>

## Review Exercises

<OL>
  <LI>Write a simple expression that uses the exponentiation operator. 
  <P></P>
  <LI>Write a complex expression that uses three operators and one function. 
  <P></P>
  <LI>Write a Perl program that uses a statement block inside a function call. 
  <P></P>
  <LI>Use the statement block from the previous exercise to create local 
  variables. 
  <P></P>
  <LI>Write a Perl program that shows if the expression clause of a 
  <TT>while</TT> modified statement will be evaluated when the condition is 
  false.</LI></OL>
