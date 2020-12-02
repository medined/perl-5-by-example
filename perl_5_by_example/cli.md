# Command-line Options

Perl has a wide range of command-line options or switches that you can use. The options are also called *switches* because they can turn on or turn off different behaviors. A thorough knowledge of the command line switches will enable you to create short one-time programs to perform odd little tasks. For example, the *-e* option lets you specify a line of code directly on the command-line instead of creating a script file. You use the *-l* option to change the line endings in a text file. 

## How Are the Options Specified?

The most frequent way to specify a command-line options is on the command line. All of Perl's options are specified using a dash and then a single character followed by arguments, if needed. For example, 

```bash
perl -I/usr/~john/include script.pl
```

You can combine options with no arguments with the following switch. The following two command lines are 
equivalent. 

```bash
perl -cI/usr/~john/include script.pl
perl -c -I/usr/~john/include script.pl
```

You can also specify command-line options inside your script file using the #! line. Just place them following the directory and/or executable name. If you are working on a UNIX system, you are probably familiar with using the #! notation to tell the system where to find the Perl executable. The various UNIX systems and Windows can interpret the #! line in different ways. Therefore, Perl starts parsing the #! switches immediately after the first instance of "perl" on the line. For example, if you started your script with this line: 

```perl
#!/bin/perl -w
```

Then Perl will run with the *-w* option in effect. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
<TBODY>
<TR>
  <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
<TR>
  <TD bgColor=tomato>Some UNIX systems will only read the first 32 
    characters of the #! line. So try to have your options either end before 
    the 32<SUP>nd</SUP> position or start after the 32<SUP>nd</SUP> position. 
    Placing the options after the 32<SUP>nd</SUP> position will help to make 
    your scripts more portable because you will be bypassing one of the 
    inconsistencies of UNIX.<BR></TD></TR>
</TBODY></TABLE>

## What Are the Options?

Table 17.1 provides a short description of each command-line option used with Perl. After 
the table, examples of several options will be shown.

> Table 17.1-Perl's Command Line Options

* -0: Lets you specify the record separator (*$/*) as an octal number. For example, - 0055 will cause records to end on a dash. If no number is specified, records will end on null characters. The special value of 00 will place Perl into paragraph mode. And 0777 will force Perl to read the whole file in one shot because 0777 is not a legal character value. See [](using-the-0-option) for more information.

* -a: This option must be used in conjunction with either the *-n* or *-p* option. Using the *-a* option will automatically feed input lines to the *split* function. The results of the split are placed into the *@F* variable. See [](using-the-n-and-p-options) for more information.

* -c: This option lets you check the syntax of your script 
      without fully executing it. The *BEGIN* blocks, and *use 
      *statements are still executed because they are needed by the 
      compilation process.</TD></TR>

* -d: This option lets you start the Perl debugger. See [](./debugging.md) for more information.

* -D: This option lets you turn on different behaviors related to the debugging process. The following table shows you the sub-options that can be used. Please note, however, that not all releases of Perl can use this feature. I know that the hip port of Perl for Win32 can't. If your version of Perl does not have this option, you will see the message *Recompile perl with -DDEBUGGING to use -D switch* when you try it. If you want to watch your script as it executes, use -D14. Following is a list of the other values that you can use. You can add the numbers together to specify more than one behavior (such as 8+4+2 = 14) or you can use the letters. 
      
<TABLE cellPadding=10 border=0>
  <TBODY>
  <TR>
    <TD>1</TD>
    <TD>p</TD>
    <TD>Tokenizing and Parsing</TD></TR>
  <TR>
    <TD>2</TD>
    <TD>s</TD>
    <TD>Stack Snapshots</TD></TR>
  <TR>
    <TD>4</TD>
    <TD>l</TD>
    <TD>Label Stack Processing</TD></TR>
  <TR>
    <TD>8</TD>
    <TD>t</TD>
    <TD>Trace Execution</TD></TR>
  <TR>
    <TD>16</TD>
    <TD>o</TD>
    <TD>Operator Node Construction</TD></TR>
  <TR>
    <TD>32</TD>
    <TD>c</TD>
    <TD>String/Numeric Conversions</TD></TR>
  <TR>
    <TD>64</TD>
    <TD>P</TD>
    <TD>Print Preprocessor Command for -P</TD></TR>
  <TR>
    <TD>128</TD>
    <TD>m</TD>
    <TD>Memory Allocation</TD></TR>
  <TR>
    <TD>256</TD>
    <TD>f</TD>
    <TD>Format Processing</TD></TR>
  <TR>
    <TD>512</TD>
    <TD>r</TD>
    <TD>Regular Expression Parsing</TD></TR>
  <TR>
    <TD>1024</TD>
    <TD>x</TD>
    <TD>Syntax Tree Dump</TD></TR>
  <TR>
    <TD>2048</TD>
    <TD>u</TD>
    <TD>Tainting Checks</TD></TR>
  <TR>
    <TD>4096</TD>
    <TD>L</TD>
    <TD>Memory Leaks (not supported anymore)</TD></TR>
  <TR>
    <TD>8192</TD>
    <TD>H</TD>
    <TD>Hash Dump -- usurps values()</TD></TR>
  <TR>
    <TD>16384</TD>
    <TD>X</TD>
    <TD>Scratchpad Allocation</TD></TR>
  <TR>
    <TD>32768</TD>
    <TD>D</TD>
    <TD>Cleaning Up</TD></TR>
</TBODY></TABLE>
          
* -e: This option lets you specify a single line of code on the command line. This line of code will be executed in lieu of a script file. You can use multiple *-e* options to create a multiple line program - although given the probability of a typing mistake, I'd create a script file instead. Semi-colons must be used to end Perl statements just like a normal script.

* -F: This option modifies the behavior of the *-a* 
option. It lets you change the regular expression that is used to split the input lines. For example, *-F /:+/* will split the input line whenever one or more colons are found. The slashes are optional; they simply delimit the pattern if they are there. I use them for their aesthetic value.

* -i: This option lets you edit files in-place. It is used in conjunction with the *-n* or *-p* option. See [](using-the-i-option) for more information.

* -I: This option is used in conjunction with the *-P* option. It tells the C preprocessor where to look for include files. The default search directories include */usr/include* and */usr/lib/Perl*.

* -l: This option turns on line-ending processing. It can be used to set the output line terminator variable (*$/*) by specifying an octal value. See [](using-the-0-option) for an example of using octal numbers. If no octal number is specified, the output line terminator is set equal to the input line terminator (such as *$\ = $/;*).
      
* -n: This option places a loop around your script. It will automatically read a line from the diamond operator and then execute the script. It is most often used with the *-e *option. See [](using-the-n-and-p-options) for more information.

*-p: This option places a loop around your script. It will automatically read a line from the diamond operator, execute the script, and then print *$_*. It is most often used with the *-e* option. See [](using-the-n-and-p-options) for more information.

* -P: This option will invoke the C preprocessor before compiling your script. This might be useful if you have some C programming experience and would like to use the #include and #define facility. The C preprocessor can also be used for conditional compilation. Use the *-I* option to tell Perl where to find include files.

* -s: This option lets you define custom switches for your script. See "Examples: Using the *-s* option" for more information.

* -S: This option makes Perl search for the script file using the PATH environment variable. It's mostly used with UNIX systems that don't support the #! line. The docs/perlrun.htm documentation file that comes with your Perl distribution has more information about this option.

* -T: This UNIX-based option turns on taint checking. Normally, these checks are only done when running *setuid* or *setgid*. The docs/perlsec.htm documentation file that comes with your Perl distribution has more information about this option.

* -u: This UNIX-based option will cause Perl to dump core after compiling your script. See the Perl documentation that came with your Perl distribution for more information.

* -U: This UNIX-based option will let Perl do unsafe operations. Its use is beyond the scope of this book.

* -v: This option will display the version and patchlevel of your Perl executable.

* -w: This option prints warnings about unsafe programming 
practices. See [](./debugging.md) for more information.

* -x: This option will let you extract a Perl script from the middle of a file. This feature comes in handy when someone has sent you a script via e-mail. Perl will scan the input file looking for a #! line that contains the word "perl". When it is found, it will execute the script until the __*END*__ token is found. If a directory name is specified after the *-x* option, Perl will switch to that directory before executing the script.

As you can see, Perl has quite a few command-line options. Most of them are designed so that you can do useful things without needing to create a text file to hold the script. If you are a system administrator then these options will make you more productive. You'll be able to manipulate files and data quickly and accurately. If you're looking to create applications or more complicated programs, you won't need these options - except for *-w* and *-d*. 

The rest of the chapter is devoted to demonstrating the *-0*, *-n*, *-p*, *-i*, and *-s* options. 

(using-the-0-option)=
### Example: Using the -0 Option

The -0 option will let you change the record separator. This is useful if your records are separated by something other than a newline. Let's use the example of input records separated by a dash instead of a newline. First, you need to find out the octal value of the dash character. The easy way to do this is covert from the decimal value which will be displayed if you run the following command line. 

```bash
perl -e "print ord('-');"
```

This program will display *45*. Converting 4510 into octal results in 558. 

Next, you'll need an input file to practice with. Listing 17.1 shows a sample input file. 

> Listing 17.1-17LST01.DAT - Test Input File for the -0 Option

```
Veterinarian-Orthopedist-Dentist-
```

Listing 17.2 holds a program that reads the above data file using the diamond operators. The program will use the dash character as an end-of-line indicator. 

> Set the record separator to be a dash using the #! switch setting method. 
> Open a file for input. 
> Read all of the records into the *@lines* array. One element in *@lines* will be one record. 
> Close the file. 
> Iterate over the *@lines* array and print each element.*

> Listing 17.2-17LST02.PL - Using the -0 Option to Change the Record Separator

```perl
#!perl -0055

open(FILE, "<17LST01.DAT");
@lines = <FILE>;
close(FILE);

foreach (@lines) {
    print("$_\n");
}
```

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Instead of using the command-line option, you could 
      also say *$/ = "-";*. Using the command-line is a better option if 
      the line ending changes from input file to input 
file.<BR></TD></TR></TBODY></TABLE>

This program will display: 

```
Veterinarian-Orthopedist-Dentist-
```

Notice that the end-of-line indicator is left as part of the record. This behavior also happens when the newline is used as the end-of-line indicator. You can use *chop()* or *chomp()* to remove the dash, if needed. 

(using-the-n-and-p-options)=
### Example: Using the *-n* and *-p* Options

The *-n* and *-p* options wrap your script inside loops. Before looking at specific examples, let's see what the loops look like and how they are changed by the *-a* 
and *-F* options.

The *-n* option causes Perl to execute your script inside the following loop: 

```perl
while (<>) {
    # your script
}
```

The *-p* option uses the same loop, but adds a *continue* block so that *$_* will be printed every time through the loop. If both *-n* and *-p* are specified on the command line, the *-p* option will take precedence. The loop looks like this: 

```perl
while (<>) {
    # your script
} continue {
    print;
}
```

The *-a* option adds a *split()* function call to the 
beginning of each iteration of the loop. So that the loop looks like this: 

```perl
while (<>) {
    @F = split(/ /);
    # your script
}
```

The *-F* option lets you split on something besides the pace character. If you used *-F/|+/* on the command line, the loop would look like this: 

```perl
while (<>) {
    @F = split(/|+/);
    # your script
}
```

You can use *BEGIN* and *END* blocks if you need to specify some initialization or cleanup code. The initialization section might be used to create objects or to open log files. The cleanup section can be used to display statistics or close files. For example, 

```
BEGIN {
    # initialization section
    $count = 0;
}

while (<>) {
    # your script
}

END {
    # cleanup section
    print("The count was $count.\n");
}
```

Next, you'll see some examples of these options in action. Let's start with a command-line that simply displays each line of the input file - like the "type" command in DOS and UNIX. 

The following examples use a data file called data.dat with the following lines:

```
David Veterinarian
John Orthopedist
Jeff Dentist
```

```bash
perl -p -e "1;" data.dat
```

This command line is equivalent to: 

```perl
while (<>) {
    1;
} continue {
    print;
}
```

```{note}
The *1;* statement was used to give Perl something to process. Otherwise, Perl would not have had any statements to execute.
```

And will display: 

```
David Veterinarian
John Orthopedist
Jeff Dentist
```

How about just printing the first word of each line? You 
could use this command line: 

```bash
perl -p -e "s/\s*(\w+).*/$1/;" test.dat
```

which is equivalent to: 

```perl
while (<>) {
    s/\s*(\w+).*/$1/;
} continue {
    print;
}
```

And will display: 

```
David
John
Jeff
```

If you have data files that store information in columns, you can pull out the second column of information like this: 

```bash
perl -p -e "s/\s*.+\s(.+)\s*/$1\n/;" test.dat
```

which will display: 

```
Veterinarian
Orthopedist
Dentist
```

You can use the *-a* option to get access to information stored in columns. For example, you could also display the second column like this: 

```bash
perl -p -a -e "$_ = \"$F[1]\n\";" test.dat
```

which is equivalent to 

```perl
while (<>) {
    @F = split(/ /);
    $_ = "$F[1]\n";
} continue {
    print;
}
```

Notice you need to escape the double-quotes in the above command-line. If you don't do this you get an error message. 

(using-the-i-option)=
### Example: Using the -i Option

The *-i* option lets you modify files in-place. This means that Perl will automatically rename the input file and open the output file using the original name. You can force Perl to create a backup file by specifying a file extension for the backup file immediately after the *-i*. For example, *-i.bak*. If no extension is specified, no backup file will be kept. 

One of the more popular uses for the *-i* option is to change sequences of characters. This kind of change normally requires 10 or more lines of code. However, using command line options you can do it like this: 

```bash
perl -p -i.bak -e "s/harry/tom/g;" test.dat
```

This command line will change all occurrences of "harry" to "tom" in the test.dat file. 

### Examples: Using the -s Option

The *-s* option lets you create your own custom switches. Custom switches are placed after the script name but before any filename arguments. Any custom switches are removed from the *@ARGV* array. Then a scalar variable named after the switch is created and initialized to 1. For example, let's say that you want to use a switch called -useTR in a script like the one in Listing 17.3. 

> Listing 17.3-17LST03.PL - Checking for the useTR     Switch

```perl
if ($useTR) {
    # do TR processing.
    print "useTR=$useTR\n";
}
```

You might execute this program using this following command line: 

```bash
perl -s -w 17lst03.pl -useTR
```

and it would display: 

```text
useTR=1
```

## Summary

This chapter covered the different command-line options that you can use with Perl. The options can also be referred to as switches because they turn different behaviors on and off. 

The switches can be specified on the command line or using the #! line inside your script. If you use the #! line, try to place the options after the 32<SUP>nd</SUP> position to avoid inconsistent handling by different versions of UNIX. 

The *-n* option is used to place your script inside of an input loop. The *-p* option uses the same loop, but also prints the *$_* variable after each pass through the loop. The *-a* and *-F* options are used when you want the input lines to be split into the *@F* array. 

Another very useful option is *-i*, which lets you edit files in-place. This option is good when you are doing a lot of text file manipulation. 

The next chapter, [](./internet-protocols.md) introduces you to some of the different standards used on the Internet. These standards let you perform activities like read mail, send mail, and transfer files. 

Review Questions 

* What is a command line option? 
* What are the two places that the switches can be specified? 
* What switch should always be used? 
* Which switch lets you read records that end with the ~ character instead of the newline? 
* What two options can be used with the *-n* option? 
* How can you execute a script that someone sent you via E-mail? 
* What happens if you specify both the *-v* and the *-c* options?

Review Exercises 

* Use the *-v* option to see the patchlevel of your version of Perl. 
* Use the chomp or chop function to remove the dash from the end of the records printed by the program listing 17.2. 
* Write a program that uses the *-p* option to display the third column. 
* Modify the program written in exercise 3 to use a BEGIN block to ask the user which column to display? 
* Create a sample E-mail message that contains a Perl script. Use the *-x* option to execute it. 
* Modify the E-mail message written for exercise 5 to display any text that appears after the __END__ token. Hint: Use the DATA file handle.
