# Control Statements

<P>The last chapter, [](./statements.md) discussed 
no-action, action, and modified statements. This chapter discusses three more 
types of statements: decision statements, loop statements, and jump statements. 
<P>The *if* statement lets you decide on one or more courses of actions. 
Loop statements are used to repeat a series of statements until a given 
condition is either true or false. And finally, we'll wrap up the chapter by 
looking at jump statements which let you control program flow by moving directly 
to the beginning or the end of a statement block. 

## Decision Statements

<I>Decision statements </I>use the <I>if </I>keyword to execute a statement block based the 
evaluation of an expression or to choose between executing one of two statement 
blocks based the evaluation of an expression. They are used quite often. For 
example, a program might need to run one code section if a customer is female 
and another code section if the customer is male. 

### Example: The If Statement

The syntax for the *if* statement is the following: 

<P><B><PRE>if (CONDITION) {
    # Code block executed
    # if condition is true.
} else {
    # Code block executed
    # if condition is false.
}</PRE></B>

Sometimes you need to choose from multiple statement blocks, such as 
when you need to execute a different statement block for each month. You use the 
*if...elsif* statement for this type of decision. The *if...elsif* 
statement has this syntax: 

<P><B><PRE>if (CONDITION_ONE) {
    # Code block executed
    # if condition one is true.
} elsif (CONDITION_TWO) {
    # Code block executed
    # if condition two is true.
} else {
    # Code block executed
    # if all other conditions are false.
}</PRE></B>

Conditional expressions can use any of the operators discussed in [](./operators.md). Even 
assignment operators can be used because the value of an assignment expression 
is the value that is being assigned. That last sentence may be a bit confusing 
so let's look at an example. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Assign *$firstVar* a value of 10. 
      <P>Subtract five from *$firstVar* and if the resulting value is 
      true (for instance, not zero) then execute the statement 
  block.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
if ($firstVar -= 5) {
    print("firstVar = $firstVar\n");
}</PRE></B>

This program displays: 

<P><B><PRE>firstVar = 5</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>If you're a C or C++ programmer, take heed: the 
      curly braces around the statement block are <I>not</I> optional in Perl. 
      Even one-line statement blocks must be surrounded by curly 
  braces.</TD></TR></TBODY></TABLE>

<P>This example, in addition to demonstrating the use of assignment operators 
inside conditional expressions, also shows that the *else* part of the 
*if* statement is optional. If the *else* part was coded, then it 
would only be executed when *$firstVar* starts out with a value of 5. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Assign *$firstVar* a value of 5. 
      <P>Subtract five from *$firstVar* and if the resulting value is 
      true (in other words, not zero) then print *$firstVar*. If not, 
      print "firstVar is zero".*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 5;
if ($firstVar -= 5) {
    print("firstVar = $firstVar\n");
} else {
    print("firstVar is zero\n");
}</PRE></B>This program displays: 
<P><B><PRE>firstVar is zero</PRE></B>This example shows the use of the *else* 
clause of the *if* statement. Because the value of *$firstVar* 
minus 5 was zero the statements in the *else* clause were executed. 
<P>You can also use the *if* statement to select among multiple statement 
blocks. The *if...elsif* form of the statement is used for this purpose. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Initialize *$month* to 2. 
      <P>If the value of *$month* is 1 then print January. 
      <P>Or else if the value of *$month* is 2 then print February. 
      <P>Or else if the value of *$month* is 3 then print March. 
      <P>For every other value of *$month*, print a 
  message.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$month = 2;

if ($month == 1) {
    print("January\n");
}
elsif ($month == 2) {
    print("February\n");
}
elsif ($month == 3) {
    print("March\n");
}
else {
    print("Not one of the first three months\n");
}</PRE></B>This program displays: 
<P><B><PRE>February</PRE></B>The *else* clause at the end of the *elsif* 
chain serves to catch any unknown or unforeseen values and is a good place to 
put error messages. Frequently, those error messages should include the errant 
value and be written to a log file so that the errors can be evaluated. After 
evaluation, you can decide if the program needs to be modified to handle that 
unforeseen value using another *elsif* clause. 

## Loop Statements

A loop is used to repeat the execution of a statement block until a certain condition is reached. A loop 
can be used to iterate through an array looking for a value. Loops can also be 
used to count quantities. Actually, the number of uses for loops is pretty much 
unlimited. There are three types of loops: *while* loops, *until* 
loops, and *for* loops. 

## Example: While Loops

While loops are used to repeat a block of 
statements while some condition is true. There are two forms of the loop; one 
where the condition is checked after the statements are executed (the 
*do..while* loop) and one in which the condition is checked before the 
statements are executed (the *while* loop). 
<P>The *do...while* loop has this syntax: 

<P><B><PRE>do {
    STATEMENTS
} while (CONDITION);</PRE></B>The *while* loop has this syntax: 
<P><B><PRE>while (CONDITION) {
    STATEMENTS
}
continue {
    STATEMENTS
}</PRE></B>

The statements in the *continue* block of the while loop are 
executed just before the loop starts the next iteration. The *continue* 
block is rarely used. However, you can see it demonstrated in [](./cli.md:using-the-n-and-p-options).
<P>Which type you use for any particular task is entirely dependent on your 
needs at the time. The statement block of a *do...while* loop always will 
be executed at least once. This is because the condition is checked after the 
statement block is executed rather than before. Here is an example of the 
*do...while* loop. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Initialize *$firstVar* to 10. 
      <P>Start the *do...while* loop. 
      <P>Print the value of *$firstVar*. 
      <P>Increment *$firstVar*. 
      <P>Check the *while* condition, if true jump back to the start of 
      the statement block. 
      <P>Print the value of *$firstVar*.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
do {
    print("inside:  firstVar = $firstVar\n");
    $firstVar++;
} while ($firstVar < 2);

print("outside: firstVar = $firstVar\n");</PRE></B>This program displays: 
<P><B><PRE>inside:  firstVar = 10
outside: firstVar = 11</PRE></B>This example shows that the statement block is 
executed even though the condition *$firstVar < 2* is false when the 
loop starts. This ability occasionally comes in handy while counting down - such 
as when printing pages of a report. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Initialize *$numPages* to 10. 
      <P>Start the *do...while* loop. 
      <P>Print a page. 
      <P>Decrement *$numPages* and then loop if the condition is still 
      true.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$numPages = 10;
do {
    printPage();
} while (--$numPages);</PRE></B>When this loop is done, all of the pages will 
have been displayed. This type of loop would be used when you know that there 
will always be pages to process. Notice that since the predecrement operator is 
used, the *$numPages* variable is decremented before the condition 
expression is evaluated. 
<P>If you need to ensure that the statement block does not get executed then you 
need to use the *while* statement. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Initialize *$firstVar* to 10. 
      <P>Start the *while* loop and test the condition. If false, don't 
      execute the statement block. 
      <P>Print the value of *$firstVar*. 
      <P>Increment *$firstVar*. 
      <P>Jump back to the start of the statement block and test the condition 
      again. 
      <P>Print the value of *$firstVar*.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
while ($firstVar < 2) {
    print("inside:  firstVar = $firstVar\n");
    $firstVar++;
};
print("outside: firstVar = $firstVar\n");</PRE></B>This program displays: 
<P><B><PRE>outside: firstVar = 10</PRE></B>This example shows that the statement block 
is never evaluated if the condition is false when the *while* loop 
starts. Of course, it's more common to use *while* loops that actually 
execute the statement block - like the following: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Initialize *$firstVar* to 10. 
      <P>Start the *while* loop and test the condition. 
      <P>Print the value of *$firstVar*. 
      <P>Increment *$firstVar*. 
      <P>Jump back to the start of the statement block and test the condition 
      again. 
      <P>Print the value of *$firstVar*.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
while ($firstVar < 12) {
    print("inside:  firstVar = $firstVar\n");
    $firstVar++;
};
print("outside: firstVar = $firstVar\n");</PRE></B>This program displays: 
<P><B><PRE>inside:  firstVar = 10
inside:  firstVar = 11
outside: firstVar = 12</PRE></B>It's important to note that the value of 
*$firstVar* ends up as 12 and not 11 as you might expect upon casually 
looking at the code. When *$firstVar* is still 11, the condition is true, 
so the statement block is executed again, thereby incrementing 
*$firstVar* to 12. Then, the next time the condition is evaluated, it is 
false and the loop ends with *$firstVar* equal to 12. 

### Example: Until Loops

<I>*Until*</I> loops are used to repeat a block of statements while some condition is false. Like the previous *while* loop, 
there are also two forms of the *until* loop; one where the condition is 
checked before the statements are executed (the *until* loop) and one in 
which the condition is checked after the statements are executed (the 
*do..until* loop). 
<P>The *do...until* loop has this syntax: 
<P><B><PRE>do {
    STATEMENTS
} until (CONDITION);</PRE></B>The *until* loop has this syntax: 
<P><B><PRE>until (CONDITION) {
    STATEMENTS
}</PRE></B>Again, the loop type you use is dependent on your needs at the time. 
Here is an example of the *do...until* loop. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Initialize *$firstVar* to 10. 
      <P>Start the *do..until* loop. 
      <P>Print the value of *$firstVar*. 
      <P>Increment *$firstVar*. 
      <P>Check the until condition, if false jump back to the start of the 
      statement block. 
      <P>Print the value of *$firstVar*.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
do {
    print("inside:  firstVar = $firstVar\n");
    $firstVar++;
} until ($firstVar < 2);

print("outside: firstVar = $firstVar\n");</PRE></B>This program displays: 
<P><B><PRE>inside:  firstVar = 10
inside:  firstVar = 11
inside:  firstVar = 12
inside:  firstVar = 13
inside:  firstVar = 14
...</PRE></B>This loop continues forever because the condition can never be 
true. *$firstVar* starts out greater than 2 and is incremented inside the 
loop. Therefore, this is an <I>endless </I>loop. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>If you ever find it hard to understand a conditional 
      expression in a loop statement, try the following: Wrap the entire 
      condition expression inside parentheses and add == 1 to the right-hand 
      side. So the above loop becomes 
      <P><PRE></B>do {
    ...
} until (($firstVar < 2) == 1);</PRE></TD></TR></TBODY></TABLE>This example 
shows that the statement block is executed even though the condition 
*$firstVar < 2* is false when the loop starts. The next example shows 
the *until* loop in action. Notice that the statement block does not 
execute because the conditional expression is false when the loop starts. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Initialize *$firstVar* to 10. 
      <P>Start the *until* loop and test the condition. If true, don't 
      execute the statement block. 
      <P>Print the value of *$firstVar*. 
      <P>Increment *$firstVar*. 
      <P>Jump back to the start of the statement block and test the condition 
      again. 
      <P>Print the value of *$firstVar*.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
until ($firstVar < 20) {
    print("inside:  firstVar = $firstVar\n");
    $firstVar++;
};
print("outside: firstVar = $firstVar\n");</PRE></B>This program displays: 
<P><B><PRE>outside: firstVar = 10</PRE></B>This example shows that the statement block 
is never evaluated if the condition is true when the *until* loop starts. 
Here is another example of a *until* loop that shows the statement block 
getting executed. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Initialize *$firstVar* to 10. 
      <P>Start the *while* loop and test the condition. 
      <P>Print the value of *$firstVar*. 
      <P>Increment *$firstVar*. 
      <P>Jump back to the start of the statement block and test the condition 
      again. 
      <P>Print the value of *$firstVar*.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>$firstVar = 10;
until ($firstVar > 12) {
    print("inside:  firstVar = $firstVar\n");
    $firstVar++;
};
print("outside: firstVar = $firstVar\n");</PRE></B>This program displays: 
<P><B><PRE>inside:  firstVar = 10
inside:  firstVar = 11
inside:  firstVar = 12
outside: firstVar = 13</PRE></B>

### Example: For Loops

One of the most common tasks in programming is looping a specific number of times. Whether 
you need to execute a certain function for every customer in your database or 
print a page in a report, the <I>for</I> loop can be used. Its syntax is: 
<P><B><PRE>for (INITIALIZATION; CONDITION; INCREMENT/DECREMENT) {
    STATEMENTS
}</PRE></B>The <I>initialization</I> expression is executed first - before the 
looping starts. It can be used to initialize any variables that are used inside 
the loop. Of course, this could be done on the line before the *for* 
loop. However, including the initialization inside the *for* statement 
aids in identifying the loop variables. 
<P>When initializing variables, be sure not to confuse the equality operator 
(*==*) with the assignment operator (*=*). The following is an 
example of what this error could look like: 
<P><B><PRE>for ($index == 0; $index < 0; $index++)</PRE></B>One of the equal signs 
should be removed. If you think you are having a problem with programming the 
*for* loop, make sure to check out the operators. 
<P>The <I>condition</I> expression is used to determine whether the loop should 
continue or be ended. When the condition expression evaluates to false, the loop 
will end. 
<P>The <I>increment/decrement </I>expression is used to modify the loop 
variables in some way each time the code block has been executed. Here is an 
example of a basic *for* loop. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Start the for loop by initializing *$firstVar* to zero. The 
      *$firstVar* variable will be incremented each time the statement 
      block is executed. And the statement block will be executed as long as 
      *$firstVar* is less than 100. 
      <P>Print the value of *$firstVar* each time through the 
      loop.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>for ($firstVar = 0; $firstVar < 100; $firstVar++) {
    print("inside:  firstVar = $firstVar\n");
}</PRE></B>This program will display: 
<P><B><PRE>inside:  firstVar = 0
inside:  firstVar = 1
...
inside:  firstVar = 98
inside:  firstVar = 99</PRE></B>This program will display the numbers 0 through 
99. When the loop is over, *$firstVar* will be equal to 100. 
<P>*For* loops can also be used to count backwards. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Start the *for* loop by initializing *$firstVar* to 100. 
      The *$firstVar* variable will be decremented each time the 
      statement block is executed. And the statement block will be executed as 
      long as *$firstVar* is greater than 0. 
      <P>Print the value of *$firstVar* each time through the 
      loop.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>for ($firstVar = 100; $firstVar > 0; $firstVar--) {
    print("inside:  firstVar = $firstVar\n");
}</PRE></B>This program will display: 
<P><B><PRE>inside:  firstVar = 100
inside:  firstVar = 99
...
inside:  firstVar = 2
inside:  firstVar = 1</PRE></B>You can use the comma operator to evaluate two 
expressions at once in the initialization and the increment/decrement 
expressions. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Start the *for* loop by initializing *$firstVar* to 100 
      and *$secondVar* to 0. The *$firstVar* variable will be 
      decremented and *$secondVar* will be incremented each time the 
      statement block is executed. And the statement block will be executed as 
      long as *$firstVar* is greater than 0. 
      <P>Print the value of *$firstVar* and *$secondVar* each time 
      through the loop.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>for ($firstVar = 100, $secondVar = 0;
     $firstVar > 0;
     $firstVar--, $secondVar++) {

        print("inside:  firstVar = $firstVar  secondVar = $secondVar\n");

}</PRE></B>This program will display: 
<P><B><PRE>inside:  firstVar = 100  secondVar = 0
inside:  firstVar = 99  secondVar = 1
...
inside:  firstVar = 2  secondVar = 98
inside:  firstVar = 1  secondVar = 99</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The comma operator lets you use two expressions 
      where Perl would normally let you have only one. The value of the 
      statement becomes the value of the last expression 
evaluated.</TD></TR></TBODY></TABLE>
<P>A more common use of the comma operator might be to initialize some flag 
variables that you expect the loop to change. This next example will read the 
first 50 lines of a file. If the end of the file is reached before the last line 
is read, the *$endOfFile* flag variable will be set to 1. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Start the for loop by initializing the end of file flag variable to 
      zero to indicate false then set *$firstVar* to 0. The 
      *$firstVar* variable will be incremented each time the statement 
      block is executed. And the statement block will be executed as long as 
      *$firstVar* is less than 50. 
      <P>Print the value of *$firstVar* and *$secondVar* each time 
      through the loop.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>for ($endOfFile = 0, $firstVar = 0; $firstVar < 50;
    $firstVar++, $secondVar++) {
    if (readLine() == 0)
        $endOfFile = 1;
}</PRE></B>If the *$endOfFile* variable is 1 when the loop ends then you 
know the file has less than 50 lines. 

### Example: Foreach Loops

Arrays are so useful that Perl provides a special form of the *for* statement just for them. The *<I>foreach*</I> statement is 
used solely to iterate over the elements of an array. It is very handy for 
finding the largest element, printing the elements, or simply seeing if a given 
value is a member of an array. 
<P><B><PRE>foreach LOOP_VAR (ARRAY) {
    STATEMENTS
}</PRE></B>The loop variable is assigned the value of each array element, in 
turn until the end of the array is reached. Let's see how to use the 
*foreach* statement to find the largest array element. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Call the *max()* function twice with different parameters each 
      time. 
      <P>Define the *max()* function. 
      <P>Create a local variable, *$max*, then get the first element from 
      the parameter array. 
      <P>Loop through the parameter array comparing each element to 
      *$max*. If the current element is greater than *$max*. 
      <P>Return the value of *$max*.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>print max(45..121, 12..23) . "\n";
print max(23..34, 356..564) . "\n";

sub max {
    my($max) = shift(@_);

    foreach $temp (@_) {
        $max = $temp if $temp > $max;
    }
    return($max);
}</PRE></B>This program displays: 
<P><B><PRE>121
564</PRE></B>
<P>There are a couple of important things buried in this example. One is the use 
of the *shift()* function to assign a value to a local variable 
<I>and</I> remove the first element of the parameter array from the array at the 
same time. If you use *shift()* all by itself, the value of the first 
element is lost. </P>
<P>The other important thing is the use of *$temp* inside the 
*foreach* loop. Some Perl programmers dislike using temporary variables 
in this manner. When the *foreach* loop is over, the local *$temp* 
variable is destroyed. Perl has an internal variable, *$_*, that can be 
used instead. If no loop variable is specified, *$_* will be assigned the 
value of each array element as the loop iterates. </P>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Print the return value from the *max()* function. 
      <P>Define the *max()* function. 
      <P>Create a local variable, *$max*, then get the first element from 
      the parameter array. 
      <P>Loop through the parameter array comparing each element to 
      *$max*. If the current element is greater than *$max*: 
      <P>Return the value of *$max*.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>print max(45..121, 12..23) . "\n";
print max(23..34, 356..564) . "\n";

sub max {
    my($max) = shift(@_);

    foreach (@_) {
        $max = $_ if $_ > $max;
    }
    return($max);
}</PRE></B>The third item has nothing to do with the *foreach* loop, at 
least not directly. But this seems like a good time to mention it. The statement 
inside the loop could also be written in the following way: 
<P><B><PRE>$max = $_ if $max < $_;</PRE></B>with the sense of the operator 
reversed. However, notice that it will take more effort to understand what the 
statement - as a whole - is doing. The reader of your program knows that the 
function is looking for the greatest value in a list. If the less than operator 
is used, it will contradict the stated purposed of your function - at least 
until the reader figures out the program logic. Whenever possible, structure 
your program logic to agree with the main premise of the function. 
<P>Now for the fourth, and final, item regarding this small program. Notice that 
the function name and the local variable name are the same except for the 
beginning dollar sign. This shows that function names and variable names use 
different namespaces. 
<P>Remember namespaces? They were mentioned in [](./variables.md). </P>
<P>Using the *foreach* statement requires using a little bit of caution 
because the local variable (either *$_* or the one you specify) accesses 
the array elements using the call by reference scheme. When call by reference is 
used, changing the value in one place (such as inside the loop) also changes the 
value in the main program. </P>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Create an array from 1 to 10 with 5 repeated. 
      <P>Print the array. 
      <P>Loop through the array replacing any elements equal to 5 with 
      "****". 
      <P>Print the array.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>@array = (1..5, 5..10);
print("@array\n");

foreach (@array) {
    $_ = "**" if ($_ == 5);
}
print("@array\n");</PRE></B>This program displays: 
<P><B><PRE>1 2 3 4 5 5 6 7 8 9 10
1 2 3 4 ** ** 6 7 8 9 10</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>If you use the *foreach* loop to change the 
      value of the array elements, be sure to comment your code to explain the 
      situation and why this method was used.</TD></TR></TBODY></TABLE>

## Jump Keywords

Perl has four keywords that let you change the flow of your programs. Table 7.1 lists the keywords along 
with a short description. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 7.1 - Perl's Jump Keywords</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Keywords </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>*last* </TD>
    <TD vAlign=top>Jumps out of the current statement block.</TD></TR>
  <TR>
    <TD vAlign=top>*next* </TD>
    <TD vAlign=top>Skips the rest of the statement block and continues with 
      the next iteration of the loop.</TD></TR>
  <TR>
    <TD vAlign=top>*redo* </TD>
    <TD vAlign=top>Restarts the statement block.</TD></TR>
  <TR>
    <TD vAlign=top>*goto* </TD>
    <TD vAlign=top>Jumps to a specified label.</TD></TR></TBODY></TABLE>
<P>Each of these keywords is described further in its own section which follows. 

### Example: The last Keyword

The *last* keyword is used to exit from a statement block. This ability is useful if you are searching an array for a value. When 
the value is found, you can stop the loop early. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Create an array holding all 26 letters. 
      <P>Use a *for* loop to iterate over the array. The index variable 
      will start at zero and increment while it is less than the number of 
      elements in the array. 
      <P>Test the array element to see if it is equal to "T". Notice that the 
      string equality operator is used. If the array element is "T", then exit 
      the loop.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>@array = ("A".."Z");
for ($index = 0; $index < @array; $index++) {
    if ($array[$index] eq "T") {
        last;
    }
}
print("$index\n");</PRE></B>This program displays: 
<P><B><PRE>19</PRE></B>This loop is straightforward except for the way that it 
calculates the number of elements in the array. Inside the conditional 
expression, the *@array* variable is evaluated in an scalar context. The 
result is the number of elements in the array. 
<P>When the *last* keyword is executed, the conditional expression and 
the increment/decrement expression are not re-evaluated, the statement block is 
just left. Execution begins again immediately after the ending curly brace. 
<P>You can also use a label with the last keyword to indicate which loop to 
exit. A <I>label</I> is a name followed by a colon. Labels names usually use all 
capital letters, but Perl does not insist on it. When you need to exist a nested 
loop, labels are a big help. Let's look at this situation in two steps. Here is 
a basic loop. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Loop from 0 to 10 using *$index* as the loop variable. 
      <P>If *$index* is equal to 5 then exit the loop. 
      <P>Print the value of *$index* while inside the loop. 
      <P>Print the value of *$index* after the loop 
  ends.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>for ($index = 0; $index < 10; $index++) {
    if ($index == 5) {
        last;
    }
    print("loop: index = $index\n");
}
print("index = $index\n");</PRE></B>This program displays: 
<P><B><PRE>loop: index = 0
loop: index = 1
loop: index = 2
loop: index = 3
loop: index = 4
index = 5</PRE></B>So far, pretty simple. The print statement inside the loop 
lets us know that the *$index* variable is being incremented. Now, let's 
add an inner loop to complicate things. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Specify a label called *OUTER_LOOP*. 
      <P>Loop from 0 to 10 using *$index* as the loop variable. 
      <P>If *$index* is equal to 5 then exit the loop. 
      <P>Start an inner loop that repeat while *$index* is less than 10. 
      <P>If *$index* is 4 then exit out of both inner and outer loops. 
      <P>Increment *$index*. 
      <P>Print the value of *$index*.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>OUTER_LOOP:
    for ($index = 0; $index < 10; $index++) {
        if ($index == 5) {
            last;
        }
        while ($index < 10) {
            if ($index == 4) {
                last OUTER_LOOP;
            }
            print("inner: index = $index\n");
            $index++;
        }
       print("outer: index = $index\n");
}
print("index = $index\n");</PRE></B>This program displays: 
<P><B><PRE>inner: index = 0
inner: index = 1
inner: index = 2
inner: index = 3
index = 4</PRE></B>The inner *while* loop increments *$index* 
while it is less than 10. However, before it can reach 10 it must pass 4, which 
triggers the *if* statement and exits both loops. You can tell that the 
outer loop was also exited because the outer print statement is never executed. 

### Example: The next Keyword

The *next* keyword lets you skip the rest of the 
statement block and start the next iteration. One use of this behavior could be 
to select specific array elements for processing and ignoring the rest. For 
example: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Create an array of 10 elements. 
      <P>Print the array. 
      <P>Iterate over the array. 
      <P>Ignore the 3<SUP>rd</SUP> and 5th element. 
      <P>Change the current element to an asterisk. 
      <P>Print the array to verify that it has been 
  changed.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>@array = (0..9);
print("@array\n");
for ($index = 0; $index < @array; $index++) {
    if ($index == 3 || $index == 5) {
        next;
    }
    $array[$index] = "*";
}
print("@array\n");</PRE></B>This program displays: 
<P><B><PRE>0 1 2 3 4 5 6 7 8 9
* * * 3 * 5 * * * *</PRE></B>This example changes every array element, except 
the 3<SUP>rd</SUP> and 5th, to asterisks regardless of their former value. The 
*next* keyword forces Perl to skip over the assignment statement and go 
directly to the increment/decrement expression. You can also use the 
*next* keyword in nested loops. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Define a label called *OUTER_LOOP*. 
      <P>Start a for loop that iterates from 0 to 3 using *$row* as the 
      loop variable. 
      <P>Start a for loop that iterates from 0 to 3 using *$col* as the 
      loop variable. 
      <P>Display the values of *$row* and *$col* and mention that 
      the code is inside the inner loop. 
      <P>If *$col* is equal to 1, start the next iteration of loop near 
      the label *OUTER_LOOP*. 
      <P>Display the values of *$row* and *$col* and mention that 
      the code is inside the outer loop.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>OUTER_LOOP: for ($row = 0; $row < 3; $row++) {
                for ($col = 0; $col < 3; $col++) {
                    print("inner: $row,$col\n");
                    if ($col == 1) {
                        next OUTER_LOOP;
                    }
                }
                print("outer: $row,$col\n\n");
            }</PRE></B>This program displays: 
<P><B><PRE>inner: 0,0
inner: 0,1
inner: 1,0
inner: 1,1
inner: 2,0
inner: 2,1</PRE></B>You can see that the *next* statement in the inner 
loop causes Perl to skip the *print* statement in the outer loop whenever 
*$col* is equal to 1. 

### Example: The redo Keyword

The *redo* keyword causes Perl to restart the current statement block. Neither the increment/decrement expression nor the conditional 
expression is evaluated before restarting the block. This keyword is usually 
used when getting input from outside the program, either from the keyboard or 
from a file. It is essential that the conditions that caused the redo statement 
to execute can be changed so that an endless loop does not occur. 
<P>This example will demonstrate the *redo* keyword with some keyboard 
input. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Start a statement block. 
      <P>Print a prompt asking for a name. 
      <P>Read a string from the keyboard. Control is returned to the program 
      when the user of the program presses the enter key. 
      <P>Remove the newline character from the end of the string. 
      <P>If the string has zero length it means the user simply pressed the 
      enter key without entering a name, so display an error message and redo 
      the statement block. 
      <P>Print a thank you message with the name in upper-case 
      characters.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>{
    print("What is your name? ");
    $name = <STDIN>;
    chop($name);

    if (! length($name)) {
        print("Msg: Zero length input. Please try again\n");
        redo;
    }

    print("Thank you, " . uc($name) . "\n");
}</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>It's worth noting that the statement block in this 
      example acts like a single-time loop construct. You can use any of the 
      jump keywords inside the statement block.</TD></TR></TBODY></TABLE>
<P>The *redo* statement helps you to have more straightforward program 
flow. Without it, you would need to use a *do...until* loop. For example: 

<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond>*
      <P>Start a *do...until* statement. 
      <P>Print a prompt asking for a name. 
      <P>Read a string from the keyboard. Control is returned to the program 
      when the user of the program presses the enter key. 
      <P>Remove the newline character from the end of the string. 
      <P>If the string has zero length it means the user simply pressed the 
      enter key without entering a name, so display an error message. 
      <P>Evaluate the conditional expression. If true, then the user entered a 
      name and the loop can end. 
      <P>Print a thank you message with the name in upper-case 
      characters.*</P></TD></TR></TBODY></TABLE>
<P><B><PRE>do {
    print("What is your name? ");
    $name = <STDIN>;
    chomp($name);

    if (! length($name)) {
        print("Msg: Zero length input. Please try again\n");
    }

} until (length($name));


print("Thank you, " . uc($name) . "\n");</PRE></B>The *do...until* loop 
is less efficient because the length of *$name* needs to be tested twice. 
Since Perl has so many ways to do any given task, it pays to think about which 
method is more efficient before implementing your ideas. 

### Example: The goto Keyword

The *goto* statement lets your program jump directly to any label. However, because Perl also provides the loop statements and other 
jump keywords, its use is looked down on by most programmers. Using the 
*goto* in your programs frequently cause your program logic to become 
convoluted. If you write a program that you feel needs a *goto* in order 
to run, then use it - but first, try to restructure the program to avoid it. 

## Summary

This chapter was devoted to learning about 
three types of statements: decision, loop, and jump. Decision statements use the 
*if* keyword to execute statement block depending on the evaluation of 
conditional expressions. Loop statements also execute a statement block based on 
a given condition, but they will repeatedly execute the block until the 
condition is true or while the condition is true. Jump statements are used to 
restart statement blocks, skip to the next iteration in a loop, and exit loops 
prematurely. 
<P>The *if* statement can be used with an *else* clause to choose 
one of two statement blocks to execute. Or you can use the *elsif* clause 
to choose from among more than two statement blocks. 
<P>Both the *while<B> *</B>and *until* loop statements have two 
forms. One form (the *do...* form) executes a statement block and then 
tests a conditional expression and the other form tests the condition before 
executing the statement block. 
<P>The *for* loops are the most complicated type of loop because they 
involve three expressions in addition to a statement block. There is an 
initialization expression, an conditional expression, and an increment/decrement 
expression. The initialization expression is evaluated first, then the 
conditional expression. If the conditional expression is false, the statement 
block is executed. Next the increment/decrement expression is evaluated and the 
loop starts again with the conditional expression. 
<P>*Foreach* loops are used to iterate through an array. Each element in 
the array is assigned to a local variable as the loop progresses through the 
array. If you don't specify a local variable, Perl will use the *$_* 
special variable. You need to be careful when changing the value of the local 
variable because it uses the call by reference scheme. Therefore, any change to 
the local variable will be reflected in the value of the array element outside 
the *foreach* loop. 
<P>The *last* keyword is used to jump out of the current statement block. 
The *next* keyword is used to skip the rest of the statement block and 
continue to the next iteration of the loop. The *redo* keyword is used to 
restart the statement block. And finally, the *goto* keyword should not 
be used because the other jump keywords are more descriptive. All of the jump 
keywords can be used with labels so they can be used inside nested loops. 

## Review Questions

<OL>
  <LI>What are the four loop keywords? 
  <P></P>
  <LI>What are the four jump keywords? 
  <P></P>
  <LI>Which form of the *until* statement is used when the statement 
  block needs to be executed at least once? 
  <P></P>
  <LI>What will be displayed when this program executes? 
  <P><B><PRE>$firstVar = 5;
{
    if ($firstVar > 10) {
        last;
    }
    $firstVar++;
    redo;
}
print("$firstVar\n");</PRE></B>
  <LI>What is the default name of the local variable in the *foreach* 
  loop? 
  <P></P>
  <LI>How is the *next* keyword different from the *redo* keyword? 

  <P></P>
  <LI>Why is the comma operator useful in the initialization expression of a 
  *for* loop? 
  <P></P>
  <LI>What is the *shift()* function used for?</LI></OL>

## Review Exercises

<OL>
  <LI>Use the *while* loop in a program to count from 1 to 100 in steps 
  of 5. 
  <P></P>
  <LI>Use the *for* loop in a program to print each number from 55 to 1. 
  <P></P>
  <LI>Use an *until* loop, the *next* statement and the modulus 
  operator to loop from 0 to 100 and print out "AAA" every 16th iteration. 
  <P></P>
  <LI>Use the *foreach* loop to determine the smallest element in an 
  array. 
  <P></P>
  <LI>Use a *for* loop to iterate over an array and multiply each element 
  by 3. 
  <P></P>
  <P></P>
  <LI>Use a *do..until* loop and the *each()* function to iterate 
  over an associative array looking for an value equal to "AAA". When the 
  element is found, the loop should be ended.</LI></OL>
