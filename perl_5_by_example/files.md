# Using Files

<P>If you've read the previous chapters and have executed some of the programs, 
then you already know that a file is a series of bytes stored on a disk instead 
of inside the computer's memory. A <I>file</I> is good for long-term storage of 
information. Information in the computer's memory is lost when the computer is 
turned off. Information on a disk, however, is persistent. It will be there when 
the computer is turned back on. 
<P>Back in Chapter 1, "<A href="ch01.htm">Getting 
Your Feet Wet</A>," you saw how to create a file using the edit program that 
comes with Windows 95 and Windows NT. In this chapter you'll see how to 
manipulate files with Perl. 
<P>There are four basic operations that you can do with files. You can open 
them, read from them, write to them, and close them. Opening a file creates a 
connection between your program and the location on the disk where the file is 
stored. Closing a file shuts down that connection. 
<P>Every file has a unique <I>fully qualified </I>name so that it can't be 
confused with other files. The fully qualified name includes the name of the 
disk, the directory, and the file name. Files in different directories can have 
the same name because the operating system considers the directory name to be a 
part of the file name. Here are some fully qualified file names: 
<P><B><PRE>c:/windows/win95.txt
c:/windows/command/scandisk.ini
c:/a_long_directory_name/a_long_subdirectory_name/a_long_file_name.doc</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>You may be curious to know if spaces can be used inside 
      filenames. Yes, they can. But, if you use spaces you need to surround the 
      file name with quotes when referring to it from a DOS or UNIX command 
      line.<BR></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>It is very important that you check for errors when 
      dealing with files. To simplify the examples in this chapter, little error 
      checking will be used in the example. Instead, error checking information 
      will be discussed in Chapter 13, "Handling Exceptions and 
  Signals."<BR></TD></TR></TBODY></TABLE>

## Some Files Are Standard

In an effort to make programs more uniform, there are three connections that always 
exist when your program starts. These are <TT>STDIN</TT>, <TT>STDOUT</TT>, and 
<TT>STDERR</TT>. Actually, these names are <I>file handles</I>. File handles are 
variables used to manipulate files. Just like you need to grab the handle of a 
hot pot before you can pick it up, you need a file handle before you can use a 
file. Table 9.1 describes the three file handles. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 9.1 - The Standard File Handles </CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Name </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>STDIN</TT> </TD>
    <TD vAlign=top>Reads program input. Typically this is the computer's 
      keyboard.</TD></TR>
  <TR>
    <TD vAlign=top><TT>STDOUT</TT> </TD>
    <TD vAlign=top>Displays program output. This is usually the computer's 
      monitor.</TD></TR>
  <TR>
    <TD vAlign=top><TT>STDERR</TT> </TD>
    <TD vAlign=top>Displays program errors. Most of the time, it is equivalent 
      to <TT>STDOUT</TT>, which means the error messages will be displayed on 
      the computer's monitor.</TD></TR></TBODY></TABLE>
<P>You've been using the <TT>STDOUT</TT> file handle without knowing it for 
every <TT>print()</TT> statement in this book. The <TT>print()</TT> function 
uses <TT>STDOUT</TT> as the default if no other file handle is specified. Later 
in this chapter, in the "Examples: Printing Revisited" section, you will see how 
to send output to a file instead of to the monitor. 
<H3><A name="Example: Using STDIN">Example: Using <I>STDIN</I></A></H3>Reading a 
line of input from the standard input, <TT>STDIN</TT>, is one of the easiest 
things that you can do in Perl. This following three line program will read a 
line from the keyboard and then display it. This will continue until you press 
<TT>Ctrl+Z</TT> on DOS systems or <TT>Ctrl-D</TT> on UNIX systems. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.1-09LST01.PL - 
      Read from Standard Input Until an End-of-file Character Is Found 
      </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
while (&lt;STDIN&gt;) {
    print();
}</PRE></B></TD></TR></TBODY></TABLE>
<P>The <TT>&lt;&gt;</TT> characters, when used together, are called the 
<I>diamond</I> operator. They tell Perl to read a line of input from the file 
handle inside the operators. In this case, <TT>STDIN</TT>. Later, you'll use the 
diamond operators to read from other file handles. 
<P>In this example, the diamond operator assigned the value of the input string 
to <TT>$_</TT>. Then, the <TT>print()</TT> function was called with no 
parameters, which tells <TT>print()</TT> to use <TT>$_</TT> as the default 
parameter. Using the <TT>$_</TT> variable can save a lot of typing but I'll let 
you decide which is more readable. Here is the same program without using 
<TT>$_</TT>. 
<P><B><PRE>while ($inputLine = &lt;STDIN&gt;) {
    print($inputLine);
}</PRE></B>When you pressed <TT>Ctrl+Z</TT> or <TT>Ctrl+D</TT>, you told Perl 
that the input file was finished. This caused the diamond operator to return the 
undefined value which Perl equates to false and caused the <TT>while</TT> loop 
to end. In DOS (and therefore in all of the flavors of Windows), 26 - the value 
of <TT>Ctrl+Z</TT> - is considered to be the end-of-file indicator. As DOS reads 
or writes a file, it monitors the data stream and when a value of 26 is 
encountered the file is closed. UNIX does the same thing when a value of 4 - the 
value of <TT>Ctrl+D</TT> - is read. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>When a file is read using the diamond operator, the 
      newline character that ends the line is kept as part of the input string. 
      Frequently ,you'll see the <TT>chop()</TT> function used to remove the 
      newline. For instance, <TT>chop($inputLine = &lt;INPUT_FILE&gt;);</TT>. 
      This statement reads a line from the input file, assigns its value to 
      <TT>$inputLine</TT> and then removes that last character from 
      <TT>$inputLine</TT> - which is almost guaranteed to be a newline 
      character. If you fear that the last character is not a newline, use the 
      <TT>chomp()</TT> function instead.<BR></TD></TR></TBODY></TABLE>
<H3><A name="Example: Using Redirection to Change STDIN and STDOUT">Example: 
Using Redirection to Change <I>STDIN</I> and <I>STDOUT</I></A></H3>DOS and UNIX 
let you change the standard input from being the keyboard to being a file by 
changing the command line that you use to execute Perl programs. Until now, you 
probably used a command line similar to: 
<P><B><PRE>perl -w 09lst01.pl</PRE></B>In the previous example, Perl read the keyboard 
to get the standard input. But, if there was a way to tell Perl to use the file 
<TT>09LST01.PL</TT> as the standard input you could have the program print 
itself. Pretty neat, huh? Well, it turns out that you can change the standard 
input. It's done this way: 
<P><B><PRE>perl -w 09lst01.pl &lt; 09lst01.pl</PRE></B>The <TT>&lt;</TT> character is 
used to <I>redirect</I> the standard input to the <TT>09LST01.PL</TT> file. You 
now have a program that duplicates the functionality of the DOS type command. 
And it only took three lines of Perl code! 
<P>You can redirect standard output to a file using the <TT>&gt;</TT> character. 
So if you wanted a copy of <TT>09LST01.PL</TT> to be sent to <TT>OUTPUT.LOG</TT> 
you could use this command line: 
<P><B><PRE>perl -w 09lst01.pl &lt;09lst01.pl &gt;output.log</PRE></B>Keep this use of 
the <TT>&lt;</TT> and <TT>&gt;</TT> characters in mind. You'll be using them 
again shortly when we talk about the <TT>open()</TT> function. The <TT>&lt;</TT> 
character will signify that files should be opened for input and the 
<TT>&gt;</TT> will be used to signify an output file. But first, let's continue 
talking about accessing files listed on the command line. 
<H3><A name="Example: Using the Diamond Operator (<>)">Example: Using the 
Diamond Operator (<I>&lt;&gt;</I>)</A></H3>If no file handle is used with the 
diamond operator, Perl will examine the <TT>@ARGV</TT> special variable. If 
<TT>@ARGV</TT> has no elements, then the diamond operator will read from 
<TT>STDIN</TT> - either from the keyboard or from a redirected file. So, if you 
wanted to display the contents of more than one file, you could use the program 
shown in Listing 9.2. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.2-09LST02.PL - 
      Read from Multiple Files or from STDIN </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
while (&lt;&gt;) {
    print();
}</PRE></B></TD></TR></TBODY></TABLE>
<P>The command line to run the program might look like this: 
<P><B><PRE>perl -w 09lst02.pl 09lst01.pl 09lst02.pl</PRE></B>And the output would be: 
<P><B><PRE>while (&lt;STDIN&gt;) {
    print();
}
while (&lt;&gt;) {
    print();
}</PRE></B>Perl will create the <TT>@ARGV</TT> array from the command line. Each 
file name on the command line - after the program name - will be added to the 
<TT>@ARGV</TT> array as an element. When the program runs the diamond operator 
starts reading from the filename in the first element of the array. When that 
entire file has been read, the next file is read from, and so on, until all of 
the elements have been used. When the last file has be finished, the 
<TT>while</TT> loop will end. 
<P>Using the diamond operator to iterate over a list of filenames is very handy. 
You can use it in the middle of your program by explicitly assigning a list of 
filenames to the <TT>@ARGV</TT> array. Listing 9.3 shows what this might look 
like in a program. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.3-09LST03.PL - 
      Read from Multiple Files Using the <TT>@ARGV</TT> Array </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
@ARGV = ("09lst01.pl", "09lst02.pl");
while (&lt;&gt;) {
    print();
}</PRE></B></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>while (&lt;STDIN&gt;) {
    print();
}
while (&lt;&gt;) {
    print();
}</PRE></B>Next, we will take a look at the ways that Perl lets you test files, 
and following that, the functions that can be used with files. 

## File Test Operators

Perl has many operators that you can use to test different aspects of a file. For example, you 
can use the <TT>-e</TT> operator to ensure that a file exists before deleting 
it. Or you can check that a file can be written to before appending to it. By 
checking the feasibility of the impending file operation, you can reduce the 
number of errors that you program will encounter. Table 9.2 shows a complete 
list of the operators used to test files. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 9.2 - Perl's File Test Operators</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Operator </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>-A <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Returns the access age of <TT>OPERAND</TT> when the program 
      started.</TD></TR>
  <TR>
    <TD vAlign=top>-b <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is a block device.</TD></TR>
  <TR>
    <TD vAlign=top>-B <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is a binary file. If 
      <TT>OPERAND</TT> is a file handle, then the current buffer is examined, 
      instead of the file itself.</TD></TR>
  <TR>
    <TD vAlign=top>-c <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is a character device.</TD></TR>
  <TR>
    <TD vAlign=top>-C <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Returns the inode change age of <TT>OPERAND</TT> when the 
      program started.</TD></TR>
  <TR>
    <TD vAlign=top>-d <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is a directory.</TD></TR>
  <TR>
    <TD vAlign=top>-e <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> exists.</TD></TR>
  <TR>
    <TD vAlign=top>-f <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is a regular file as opposed to a 
      directory, symbolic link or other type of file</TD></TR>
  <TR>
    <TD vAlign=top>-g <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> has the setgid bit set.</TD></TR>
  <TR>
    <TD vAlign=top>-k <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> has the sticky bit set.</TD></TR>
  <TR>
    <TD vAlign=top>-l <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is a symbolic link. Under DOS, 
      this operator will always return false.</TD></TR>
  <TR>
    <TD vAlign=top>-M <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Returns the age of <TT>OPERAND</TT> in days when the 
      program started.</TD></TR>
  <TR>
    <TD vAlign=top>-o <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is owned by the effective uid. 
      Under DOS, it always returns true.</TD></TR>
  <TR>
    <TD vAlign=top>-O <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is owned by the read uid/gid. 
      Under DOS, it always returns true.</TD></TR>
  <TR>
    <TD vAlign=top>-p <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is a named pipe.</TD></TR>
  <TR>
    <TD vAlign=top>-r <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> can be read from.</TD></TR>
  <TR>
    <TD vAlign=top>-R <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> can be read from by the real 
      uid/gid. Under DOS, it is identical to -r.</TD></TR>
  <TR>
    <TD vAlign=top>-s <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Returns the size of <TT>OPERAND</TT> in bytes. Therefore, 
      it returns true if <TT>OPERAND</TT> is non-zero.</TD></TR>
  <TR>
    <TD vAlign=top>-S <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is a socket.</TD></TR>
  <TR>
    <TD vAlign=top>-t <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is opened to a tty.</TD></TR>
  <TR>
    <TD vAlign=top>-T <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> is a text file. If 
      <TT>OPERAND</TT> is a file handle, then the current buffer is examined, 
      instead of the file itself.</TD></TR>
  <TR>
    <TD vAlign=top>-u <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> has the setuid bit set.</TD></TR>
  <TR>
    <TD vAlign=top>-w <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> can be written to.</TD></TR>
  <TR>
    <TD vAlign=top>-W <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> can be written to by the real 
      uid/gid. Under DOS, it is identical to -w.</TD></TR>
  <TR>
    <TD vAlign=top>-x <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> can be executed.</TD></TR>
  <TR>
    <TD vAlign=top>-X <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> can be executed by the real 
      uid/gid. Under DOS, it is identical to -x.</TD></TR>
  <TR>
    <TD vAlign=top>-z <TT>OPERAND</TT> </TD>
    <TD vAlign=top>Tests if <TT>OPERAND</TT> size is zero.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>If the <TT>OPERAND</TT> is not specified in the file 
      test, the <TT>$_</TT> variable will be used 
instead.<BR></TD></TR></TBODY></TABLE>
<P>The operand used by the file tests can be either a file handle or a file 
name. The file tests work by internally calling the operating system to 
determine information about the file in question. The operators will evaluate to 
true if the test succeeds and false if it does not. 
<P>If you need to perform two or more tests on the same file, you use the 
special underscore (<TT>_</TT>) file handle. This tells Perl to use the file 
information for the last system query and saves time. However, the underscore 
file handle does have some caveats. It does not work with the <TT>-t</TT> 
operator. In addition, the <TT>lstat()</TT> function and <TT>-l</TT> test will 
leave the system buffer filled with information about a symbolic link, not a 
real file. 
<P>The <TT>-T</TT> and <TT>-B</TT> file tests will examine the first block or so 
of the file. If the more than 10% of the bytes are non-characters or if a null 
byte is encountered then the file is considered a binary file. <I>Binary</I> 
files are normally data files, as opposed to text or human-readable files. If 
you need to work with binary files, be sure to use the <TT>binmode()</TT> file 
function which is described in the section called "<A 
href="ch09.htm#Example: Binary Files">Example: 
Binary Files</A>" later in this chapter. 
<H3><A name="Example: Using File Tests">Example: Using File Tests</A></H3>For 
our first example with file tests, let's examine a list of files from the 
command line and determine if each is a regular file or a special file. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a <TT>foreach</TT> loop that looks at the command line array. 
      Each element in the array is assigned to the default loop variable 
      <TT>$_</TT>. 
      <P>Print the file name contained in <TT>$_</TT>. 
      <P>Print a message indicating the type of file by checking the evaluation 
      of the <TT>-f</TT> operator.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.4-09LST04.PL - 
      Using the <TT>-f</TT> Operator to Find Regular Files Inside a 
      <TT>foreach</TT> Loop </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
foreach (@ARGV) {
    print;
    print((-f) ? " -REGULAR\n" : " -SPECIAL\n")
}</PRE></B></TD></TR></TBODY></TABLE>
<P>When this program is run using the following command line: 
<P><B><PRE>perl -w 09lst04.pl 09lst01.pl \perl5 perl.exe \windows</PRE></B>The 
following is displayed: 
<P><B><PRE>09lst01.pl -REGULAR
\perl5 -SPECIAL
perl.exe -REGULAR
\windows -SPECIAL</PRE></B>Each of the directories listed on the command line 
were recognized as special files. If you want to ignore all special files in the 
command line you do so like this: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a <TT>foreach</TT> loop that looks at the command line array. 
      <P>If the current file is special, then skip it and go on to the next 
      iteration of the <TT>foreach</TT> loop. 
      <P>Print the current file name that is contained in <TT>$_</TT>. 
      <P>Print a message indicating the type of 
file.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 9.5-09LST05.PL - Using the <TT>-f</TT> Operator to Ignore 
      Special Files Inside a <TT>foreach</TT> Loop</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>foreach (@ARGV) {
    next unless -f;    # ignore all non-normal files.
    print("$_ is a Regular file.\n");
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>When this program is run using the following command line: 
<P><B><PRE>perl -w 09lst05.pl 09lst01.pl \perl perl.exe \windows</PRE></B>The 
following is displayed: 
<P><B><PRE>09lst01.pl is a Regular file.
perl.exe is a Regular file.</PRE></B>Notice that only the regular file names are 
displayed. The two directories on the command line were ignored. 
<P>As mentioned above, you can use the underscore file handle to make two tests 
in a row on the same file so that you program can execute faster and use less 
system resources. This could be important if your application is time critical 
or makes many repeated tests on a large number of files. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a <TT>foreach</TT> loop that looks at the command line array. 
      <P>If the current file is special, then skip it and go on to the next 
      iteration of the <TT>foreach</TT> loop. 
      <P>Determine the number of bytes in the file using the <TT>-s</TT> 
      operator using the underscore file handle so that a second operating 
      system call is not needed. 
      <P>Print a message indicating the name and size of the 
  file.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.6-09LST06.PL - 
      Finding the Size in Bytes of Regular Files Listed on the Command Line 
      </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
foreach (@ARGV) {
    next unless -f;
    $fileSize = -s _;
    print("$_ is $fileSize bytes long.\n");
}</PRE></B></TD></TR></TBODY></TABLE>
<P>When this program is run using the following command line: 
<P><B><PRE>perl -w 09lst06.pl \perl5 09lst01.pl \windows perl.exe</PRE></B>The 
following is displayed: 
<P><B><PRE>09lst01.pl is 36 bytes long.
perl.exe is 61952 bytes long.</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Don't get the underscore file handle confused with 
      the <TT>$_</TT> special variable. The underscore file handle tells Perl to 
      use the file information from the last system call and the <TT>$_</TT> 
      variable is used as the default parameter for a variety of 
    functions.<BR></TD></TR></TBODY></TABLE>

## File Functions

<TABLE cellPadding=10 border=1>
  <CAPTION>Table 9.3-Perl's File Functions</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Function </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>binmode</TT>(<TT>FILE_HANDLE</TT>) </TD>
    <TD vAlign=top>This DOS-based function puts FILE_HANDLE into a binary 
      mode. For more information, see the section "<A 
      href="ch09.htm#Example: Binary Files">Example: 
      Binary Files</A>" later in this chapter.</TD></TR>
  <TR>
    <TD vAlign=top><TT>chdir</TT>(<TT>DIR_NAME</TT>) </TD>
    <TD vAlign=top>Causes your program to use DIR_NAME as the current 
      directory. It will return true if the change was successful, false if 
    not.</TD></TR>
  <TR>
    <TD vAlign=top><TT>chmod</TT>(<TT>MODE</TT>, <TT>FILE_LIST</TT>) </TD>
    <TD vAlign=top>This UNIX-based function changes the permissions for a list 
      of files. A count of the number of files whose permissions were changed is 
      returned. There is no DOS equivalent for this function.</TD></TR>
  <TR>
    <TD vAlign=top><TT>chown</TT>(<TT>UID</TT>, <TT>GID</TT>, 
      <TT>FILE_LIST</TT>) </TD>
    <TD vAlign=top>This UNIX-based function changes the owner and group for a 
      list of files. A count of the number of files whose ownership were changed 
      is returned. There is no DOS equivalent for this function.</TD></TR>
  <TR>
    <TD vAlign=top><TT>close</TT>(<TT>FILE_HANDLE</TT>) </TD>
    <TD vAlign=top>Closes the connection between your program and the file 
      opened with <TT>FILE_HANDLE</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>closedir</TT>(<TT>DIR_HANDLE</TT>) </TD>
    <TD vAlign=top>Closes the connection between your program and the 
      directory opened with <TT>DIR_HANDLE</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>eof</TT>(<TT>FILE_HANDLE</TT>) </TD>
    <TD vAlign=top>Returns true if the next read on <TT>FILE_HANDLE</TT> will 
      result in hitting the end of the file or if the file is not open. If 
      <TT>FILE_HANDLE</TT> is not specified the status of the last file read is 
      returned. All input functions return the undefined value when the end of 
      file is reached, so you'll almost never need to use eof().</TD></TR>
  <TR>
    <TD vAlign=top><TT>fcntl</TT>(<TT>FILE_HANDLE</TT>, <TT>FUNCTION</TT>, 
      <TT>SCALAR</TT>) </TD>
    <TD vAlign=top>Implements the <TT>fcntl()</TT> function which lets you 
      perform various file control operations. Its use is beyond the scope of 
      this book.</TD></TR>
  <TR>
    <TD vAlign=top><TT>fileno</TT>(<TT>FILE_HANDLE</TT>) </TD>
    <TD vAlign=top>Returns the file descriptor for the specified 
      <TT>FILE_HANDLE</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>flock</TT>(<TT>FILEHANDLE</TT>, <TT>OPERATION</TT>) </TD>
    <TD vAlign=top>This UNIX-based function will place a lock on a file so 
      that multiple users or programs can't simultaneously use it. There is no 
      DOS equivalent for this function. The <TT>flock()</TT> function is beyond 
      the scope of this book.</TD></TR>
  <TR>
    <TD vAlign=top><TT>getc</TT>(<TT>FILE_HANDLE</TT>) </TD>
    <TD vAlign=top>Reads the next character from <TT>FILE_HANDLE</TT>. If 
      <TT>FILE_HANDLE</TT> is not specified, a character will be read from 
      <TT>STDIN</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>glob</TT>(<TT>EXPRESSION</TT>) </TD>
    <TD vAlign=top>Returns a list of files that match the specification of 
      <TT>EXPRESSION</TT>, which can contain wildcards. For instance, 
      <TT>glob</TT>(<TT>"*.pl"</TT>) will return a list of all Perl program 
      files in the current directory.</TD></TR>
  <TR>
    <TD vAlign=top><TT>ioctl</TT>(<TT>FILE_HANDLE</TT>, <TT>FUNCTION</TT>, 
      <TT>SCALAR</TT>) </TD>
    <TD vAlign=top>Implements the <TT>ioctl()</TT> function which lets you 
      perform various file control operations. Its use is beyond the scope of 
      this book. For more in-depth discussion of this function see Que's Special 
      Edition Using Perl for Web Programming.</TD></TR>
  <TR>
    <TD vAlign=top><TT>link</TT>(<TT>OLD_FILE_NAME</TT>, 
      <TT>NEW_FILE_NAME</TT>) </TD>
    <TD vAlign=top>This UNIX-based function creates a new filename that is 
      linked to the old filename. It returns true for success and false for 
      failure. There is no DOS equivalent for this function.</TD></TR>
  <TR>
    <TD vAlign=top><TT>lstat</TT>(<TT>FILE_HANDLE_OR_FILE_NAME</TT>) </TD>
    <TD vAlign=top>Returns file statistics in a 13-element array. 
      <TT>lstat()</TT> is identical to <TT>stat()</TT> except that it can also 
      return information about symbolic links. See the section "<A 
      href="ch09.htm#Example: Getting File Statistics">Example: 
      Getting File Statistics</A>" for more information.</TD></TR>
  <TR>
    <TD vAlign=top><TT>mkdir</TT>(<TT>DIR_NAME</TT>, <TT>MODE</TT>) </TD>
    <TD vAlign=top>Creates a directory named <TT>DIR_NAME</TT>. If you try to 
      create a sub-directory, the parent must already exist. This function 
      returns false if the directory can't be created. The special variable 
      <TT>$!</TT> is assigned the error message.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, <TT>EXPRESSION</TT>) 
</TD>
    <TD vAlign=top>Creates a link between <TT>FILE_HANDLE</TT> and a file 
      specified by <TT>EXPRESSION</TT>. See the section "<A 
      href="ch09.htm#Example: Opening Files">Example: 
      Opening Files</A>" for more information.</TD></TR>
  <TR>
    <TD vAlign=top><TT>opendir</TT>(<TT>DIR_HANDLE</TT>, <TT>DIR_NAME</TT>) 
</TD>
    <TD vAlign=top>Creates a link between <TT>DIR_HANDLE</TT> and the 
      directory specified by <TT>DIR_NAME</TT>. <TT>opendir()</TT> returns true 
      if successful, false otherwise.</TD></TR>
  <TR>
    <TD vAlign=top><TT>pipe</TT>(<TT>READ_HANDLE</TT>, <TT>WRITE_HANDLE</TT>) 
    </TD>
    <TD vAlign=top>Opens a pair of connected pipes like the corresponding 
      system call. Its use is beyond the scope of this book. For more on this 
      function see Que's Special Edition Using Perl for Web Programming.</TD></TR>
  <TR>
    <TD vAlign=top><TT>print FILE_HANDLE</TT> (<TT>LIST</TT>) </TD>
    <TD vAlign=top>Sends a list of strings to <TT>FILE_HANDLE</TT>. If 
      <TT>FILE_HANDLE</TT> is not specified, then <TT>STDOUT</TT> is used. See 
      the section "<A 
      href="ch09.htm#Example: Printing Revisited">Example: 
      Printing Revisited</A>" for more information.</TD></TR>
  <TR>
    <TD vAlign=top><TT>printf FILE_HANDLE</TT> (<TT>FORMAT</TT>, 
      <TT>LIST</TT>) </TD>
    <TD vAlign=top>Sends a list of strings in a format specified by 
      <TT>FORMAT</TT> to <TT>FILE_HANDLE</TT>. If <TT>FILE_HANDLE</TT> is not 
      specified, then <TT>STDOUT</TT> is used. See the section "<A 
      href="ch09.htm#Example: Printing Revisited">Example: 
      Printing Revisited</A>" for more information.</TD></TR>
  <TR>
    <TD vAlign=top><TT>read(FILE_HANDLE, BUFFER, LENGTH, OFFSET)</TT></TD>
    <TD vAlign=top>Reads up to <TT>LENGTH</TT> bytes from <TT>FILE_HANDLE</TT> 
      starting at <TT>OFFSET</TT> position in the file into the scalar variable 
      called <TT>BUFFER</TT>. It returns the number of bytes read or the 
      undefined value.</TD></TR>
  <TR>
    <TD vAlign=top><TT>readdir</TT>(<TT>DIR_HANDLE</TT>) </TD>
    <TD vAlign=top>Returns the next directory entry from <TT>DIR_HANDLE</TT> 
      when used in a scalar context. If used in an array context, all of the 
      file entries in <TT>DIR_HANDLE</TT> will be returned in a list. If there 
      are no more entries to return, the undefined value or a null list will be 
      returned depending on the context.</TD></TR>
  <TR>
    <TD vAlign=top><TT>readlink</TT>(<TT>EXPRESSION</TT>) </TD>
    <TD vAlign=top>This UNIX-based function returns that value of a symbolic 
      link. If an error occurs, the undefined value is returned and the special 
      variable <TT>$!</TT> is assigned the error message. The <TT>$_</TT> 
      special variable is used if <TT>EXPRESSION</TT> is not specified.</TD></TR>
  <TR>
    <TD vAlign=top><TT>rename</TT>(<TT>OLD_FILE_NAME</TT>, 
      <TT>NEW_FILE_NAME</TT>) </TD>
    <TD vAlign=top>Changes the name of a file. You can use this function to 
      change the directory where a file resides but not the disk drive or 
    volume.</TD></TR>
  <TR>
    <TD vAlign=top><TT>rewinddir</TT>(<TT>DIR_HANDLE</TT>) </TD>
    <TD vAlign=top>Resets <TT>DIR_HANDLE</TT> so that the next 
      <TT>readdir()</TT> starts at the beginning of the directory.</TD></TR>
  <TR>
    <TD vAlign=top><TT>rmdir</TT>(<TT>DIR_NAME</TT>) </TD>
    <TD vAlign=top>Deletes an empty directory. If the directory can be deleted 
      it returns false and <TT>$!</TT> is assigned the error message. The 
      <TT>$_</TT> special variable is used if <TT>DIR_NAME</TT> is not 
    specified.</TD></TR>
  <TR>
    <TD vAlign=top><TT>seek</TT>(<TT>FILE_HANDLE</TT>, <TT>POSITION</TT>, 
      <TT>WHENCE</TT>) </TD>
    <TD vAlign=top>Moves to <TT>POSITION</TT> in the file connected to 
      <TT>FILE_HANDLE</TT>. The <TT>WHENCE</TT> parameter determines if 
      <TT>POSITION</TT> is an offset from the beginning of the file 
      (<TT>WHENCE=0</TT>), the current position in the file (<TT>WHENCE=1</TT>), 
      or the end of the file (<TT>WHENCE=2</TT>).</TD></TR>
  <TR>
    <TD vAlign=top><TT>seekdir</TT>(<TT>DIR_HANDLE</TT>, <TT>POSITION</TT>) 
</TD>
    <TD vAlign=top>Sets the current position for <TT>readdir()</TT>. 
      <TT>POSITION</TT> must be a value returned by the <TT>telldir()</TT> 
      function.</TD></TR>
  <TR>
    <TD vAlign=top><TT>select</TT>(<TT>FILE_HANDLE</TT>) </TD>
    <TD vAlign=top>Sets the default <TT>FILE_HANDLE</TT> for the 
      <TT>write()</TT> and <TT>print()</TT> functions. It returns the currently 
      selected file handle so that you may restore it if needed. You can see the 
      section "<A 
      href="ch09.htm#Example: Printing Revisited">Example: 
      Printing Revisited</A>" to see this function in action.</TD></TR>
  <TR>
    <TD vAlign=top><TT>sprintf</TT>(<TT>FORMAT</TT>, <TT>LIST</TT>) </TD>
    <TD vAlign=top>Returns a string whose format is specified by 
      <TT>FORMAT</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>stat</TT>(<TT>FILE_HANDLE_OR_FILE_NAME</TT>) </TD>
    <TD vAlign=top>Returns file statistics in a 13-element array. See the 
      section "<A 
      href="ch09.htm#Example: Getting File Statistics">Example: 
      Getting File Statistics</A>" for more information.</TD></TR>
  <TR>
    <TD vAlign=top><TT>symlink</TT>(<TT>OLD_FILE_NAME</TT>, 
      <TT>NEW_FILE_NAME</TT>) </TD>
    <TD vAlign=top>This UNIX-based function creates a new filename 
      symbolically linked to the old filename. It returns false if the 
      <TT>NEW_FILE_NAME</TT> could not be created.</TD></TR>
  <TR>
    <TD vAlign=top><TT>sysread</TT>(<TT>FILE_HANDLE</TT>, <TT>BUFFER</TT>, 
      <TT>LENGTH</TT>, <TT>OFFSET</TT>) </TD>
    <TD vAlign=top>Reads <TT>LENGTH</TT> bytes from <TT>FILE_HANDLE</TT> 
      starting at <TT>OFFSET</TT> position in the file into the scalar variable 
      called <TT>BUFFER</TT>. It returns the number of bytes read or the 
      undefined value.</TD></TR>
  <TR>
    <TD vAlign=top><TT>syswrite</TT>(<TT>FILE_HANDLE</TT>, <TT>BUFFER</TT>, 
      <TT>LENGTH</TT>, <TT>OFFSET</TT>) </TD>
    <TD vAlign=top>Writes <TT>LENGTH</TT> bytes from <TT>FILE_HANDLE</TT> 
      starting at <TT>OFFSET</TT> position in the file into the scalar variable 
      called <TT>BUFFER</TT>. It returns the number of bytes written or the 
      undefined value.</TD></TR>
  <TR>
    <TD vAlign=top><TT>tell</TT>(<TT>FILE_HANDLE</TT>) </TD>
    <TD vAlign=top>Returns the current file position for <TT>FILE_HANDLE</TT>. 
      If <TT>FILE_HANDLE</TT> is not specified, the file position for the last 
      file read is returned.</TD></TR>
  <TR>
    <TD vAlign=top><TT>telldir</TT>(<TT>DIR_HANDLE</TT>) </TD>
    <TD vAlign=top>Returns the current position for <TT>DIR_HANDLE</TT>. The 
      return value may be passed to <TT>seekdir()</TT> to access a particular 
      location in a directory.</TD></TR>
  <TR>
    <TD vAlign=top><TT>truncate</TT>(<TT>FILE_HANDLE</TT>, <TT>LENGTH</TT>) 
</TD>
    <TD vAlign=top>Truncates the file opened on <TT>FILE_HANDLE</TT> to be 
      <TT>LENGTH</TT> bytes long.</TD></TR>
  <TR>
    <TD vAlign=top><TT>unlink</TT>(<TT>FILE_LIST</TT>) </TD>
    <TD vAlign=top>Deletes a list of files. If <TT>FILE_LIST</TT> is not 
      specified, then <TT>$_</TT> will be used. It returns the number of files 
      successfully deleted. Therefore, it returns false or 0 if no files were 
      deleted.</TD></TR>
  <TR>
    <TD vAlign=top><TT>utime</TT>(<TT>FILE_LIST</TT>) </TD>
    <TD vAlign=top>This UNIX-based function changes the access and 
      modification times on each file in <TT>FILE_LIST</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>write</TT>(<TT>FILE_HANDLE</TT>) </TD>
    <TD vAlign=top>Writes a formatted record to <TT>FILE_HANDLE</TT>. See 
      chapter 11, "<A href="ch11.htm">Creating 
      Reports</A>," for more information.</TD></TR></TBODY></TABLE>
<H3><A name="Example: Opening Files">Example: Opening Files</A></H3>The 
<TT>open()</TT> function is used to open a file and create a connection to it 
called a file handle. The basic <TT>open()</TT> function call looks like this: 
<P><B><PRE>open(FILE_HANDLE);</PRE></B>The <TT>FILE_HANDLE</TT> parameter in this 
version of <TT>open()</TT>is the name for the new file handle. It is also the 
name of the scalar variable that holds the file name that you'd like to open for 
input. For example: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign the file name, <TT>FIXED.DAT</TT>, to the <TT>$INPUT_FILE</TT> 
      variable. All capital letters are used for the variable name to indicate 
      that it is also the name of the file handle. 
      <P>Open the file for reading. 
      <P>Read the entire file into <TT>@array</TT>. Each line of the file 
      becomes a single element of the array. 
      <P>Close the file. 
      <P>Use a <TT>foreach</TT> loop to look at each element of <TT>@array</TT>. 

      <P>Print <TT>$_</TT>, the loop variable, which contains one of the 
      elements of <TT>@array</TT>.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.7-09LST07.PL - 
      How to Open a File for Input </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
$INPUT_FILE = "fixed.dat";

open(INPUT_FILE);
@array = &lt;INPUT_FILE&gt;;
close(INPUT_FILE);

foreach (@array) {
    print();
}</PRE></B></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>1212Jan       Jaspree             Painter
3453Kelly     Horton              Jockey</PRE></B>It is considered good 
programming practice to close any connections that are made with the 
<TT>open()</TT> function as soon as possible. While not strictly needed, it does 
ensure that all temporary buffers and caches are written to the hard disk in 
case of a power failure or other catastrophic failure. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>DOS - and by extension, Windows - limits the number 
      of files that you can have open at any given time. Typically, you can have 
      from 20 to 50 files open. Normally this is plenty. If you need to open 
      more files, please see your DOS documentation.<BR></TD></TR></TBODY></TABLE>
<P>The <TT>open()</TT> function has many variations to let you access files in 
different ways. Table 9.4 shows all of the different method used to open a file. 

<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 9.4-The Different Ways to Open a File</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Open Statement </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>); </TD>
    <TD vAlign=top>Opens the file named in <TT>$FILE_HANDLE</TT> and connect 
      to it using <TT>FILE_HANDLE</TT> as the file handle. The file will be 
      opened for input only.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, <TT>FILENAME.EXT</TT>); 
    </TD>
    <TD vAlign=top>Opens the file called <TT>FILENAME.EXT</TT> for input using 
      <TT>FILE_HANDLE</TT> as the file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open(FILE_HANDLE, &lt;FILENAME.EXT);</TT></TD>
    <TD vAlign=top>Opens FILENAME.EXT for input using FILE_HANDLE as the file 
      handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, 
      <TT>&gt;FILENAME.EXT</TT>); </TD>
    <TD vAlign=top>Opens <TT>FILENAME.EXT</TT> for output using 
      <TT>FILE_HANDLE</TT> as the file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, <TT>-</TT>); </TD>
    <TD vAlign=top>Opens standard input.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, <TT>&gt;-</TT>); </TD>
    <TD vAlign=top>Opens standard output.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, 
      <TT>&gt;&gt;FILENAME.EXT</TT>); </TD>
    <TD vAlign=top>Opens <TT>FILENAME.EXT</TT> for appending using 
      <TT>FILE_HANDLE</TT> as the file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, 
      <TT>+&lt;FILENAME.EXT</TT>); </TD>
    <TD vAlign=top>Opens <TT>FILENAME.EXT</TT> for both input and output using 
      <TT>FILE_HANDLE</TT> as the file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, 
      <TT>+&gt;FILENAME.EXT</TT>); </TD>
    <TD vAlign=top>Opens <TT>FILENAME.EXT</TT> for both input and output using 
      <TT>FILE_HANDLE</TT> as the file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, 
      <TT>+&gt;&gt;FILENAME.EXT</TT>); </TD>
    <TD vAlign=top>Opens <TT>FILENAME.EXT</TT> for both input and output using 
      <TT>FILE_HANDLE</TT> as the file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, <TT>| PROGRAM</TT>) </TD>
    <TD vAlign=top>Sends the output printed to <TT>FILE_HANDLE</TT> to another 
      program.</TD></TR>
  <TR>
    <TD vAlign=top><TT>open</TT>(<TT>FILE_HANDLE</TT>, <TT>PROGRAM |</TT>) </TD>
    <TD vAlign=top>Reads the output from another program using 
      <TT>FILE_HANDLE</TT>.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0><TBODY>
<TR><TD bgColor=black><FONT color=lightcyan size=4><B>Note by Matthew Kleiman</B></FONT></TD></TR>
<TR><TD bgColor=lightcyan>

The +&lt; prefix will open the file only if it
exists and it will maintain the original data.  This is the equivalent of
using the &lt; prefix, with the added bonus that the file can be written to as
well.  The +&gt; command will open the file regardless of whether it exists or
not.  If it does exist, the file will be truncated (all data will be lost
and a new file will be created) but the new file will be open for
input/output instead of just output.  I do not know what the +&gt;&gt; does for
certain (it is not in the documentation as far as i can tell) but i deduce
that it is similar to +&lt; but starts at the end of the file just as the
normal append prefix does.

</TD></TR>
</TBODY></TABLE>
<P>By prefixing the file name with a <TT>&gt;</TT> character you open the file 
for output. This next example opens a file that will hold a log of messages. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the <TT>open()</TT> function to open the <TT>MESSAGE.LOG</TT> file 
      for writing with <TT>LOGFILE</TT> as the file handle. If the open was 
      successful a true value will be returned and the statement block will be 
      executed. 
      <P>Send the first message to the <TT>MESSAGE.LOG</TT> file using the 
      <TT>print()</TT> function. Notice that an alternate method is being used 
      to call <TT>print()</TT>. 
      <P>Send the second message to the <TT>MESSAGE.LOG</TT> file. 
      <P>Close the file.</TT></P></TD></TR></TBODY></TABLE>
<P><B><PRE>if (open(LOGFILE, "&gt;message.log")) {
    print LOGFILE ("This is message number 1.\n");
    print LOGFILE ("This is message number 2.\n");
    close(LOGFILE);
}</PRE></B>This program displays nothing. Instead, the output from the 
<TT>print()</TT> function is sent directly to the <TT>MESSAGE.LOG</TT> file 
using the connection established by the <TT>open()</TT> function. 
<P>In this example, the <TT>print()</TT> function uses the first parameter as a 
file handle and the second parameter as a list of things to print. You can find 
more information about printing in the section "<A 
href="ch09.htm#Example: Printing Revisited">Example: 
Printing Revisited</A>" later in this chapter. 
<P>If you needed to add something to the end of the <TT>MESSAGE.LOG</TT> file, 
you use <TT>&gt;&gt;</TT> as the file name prefix when opening the file. For 
example: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Call the <TT>open()</TT> function to open the <TT>MESSAGE.LOG</TT> file 
      for appending with <TT>LOGFILE</TT> as the file handle. If the file does 
      not exist it will be created, otherwise anything printed to 
      <TT>LOGFILE</TT> will be added to the end of the file. 
      <P>Send a message to the <TT>MESSAGE.LOG</TT> file. 
      <P>Send a message to the <TT>MESSAGE.LOG</TT> file. 
      <P>Close the file.</TT></P></TD></TR></TBODY></TABLE>
<P><B><PRE>if (open(LOGFILE, "&gt;&gt;message.log")) {
    print LOGFILE ("This is message number 3.\n");
    print LOGFILE ("This is message number 4.\n");
    close(LOGFILE);
}</PRE></B>Now, when <TT>MESSAGE.LOG</TT> is viewed, it contains the following 
lines: 
<P><B><PRE>This is message number 1.
This is message number 2.
This is message number 3.
This is message number 4.</PRE></B>
<H3><A name="Example: Binary Files">Example: Binary Files</A></H3>When you need 
to work with data files, you will need to know what binary mode is. There are 
two major differences between binary mode and text mode: 
<P>
<UL>
  <LI>In DOS and Windows, line endings are indicated by two characters - the 
  newline and carriage return characters. When in text mode, these characters 
  are input as a single character, the newline character. In binary mode, both 
  characters can be read by your program. UNIX systems only use one character, 
  the newline, to indicate line endings. 
  <P></P>
  <LI>In DOS and Windows, the end of file character is 26. When a byte with this 
  value is read in text mode, the file is considered ended and your program 
  cannot read any more information from the file. UNIX considers the end of file 
  character to be 4. For both operating systems, binary mode will let the end of 
  file character be treated as a regular character.</LI></UL>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The examples in this section relate to the DOS 
      operating system.<BR></TD></TR></TBODY></TABLE>
<P>In order to demonstrate these differences, we'll use a data file called 
<TT>BINARY.DAT</TT> with the following contents: 
<P><B><PRE>01
02
03</PRE></B>First, we'll read the file in the default text mode. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize a buffer variable. Both <TT>read()</TT> and 
      <TT>sysread()</TT> need their buffer variables to be initialized before 
      the function call is executed. 
      <P>Open the <TT>BINARY.DAT</TT> file for reading. 
      <P>Read the first 20 characters of the file using the <TT>read()</TT> 
      function. 
      <P>Close the file. 
      <P>Create an array out of the characters in the <TT>$buffer</TT> variable 
      and iterate over that array using a <TT>foreach</TT> loop. 
      <P>Print the value of the current array element in hexadecimal format. 
      <P>Print a newline character the current array element is a newline 
      character.</TT></P></TD></TR></TBODY></TABLE><A name="Micheal Campbell_28"></A>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.8-09LST08.PL - 
      Reading a File to Show Text Mode Line Endings </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
$buffer = "";

open(FILE, "&lt;binary.dat");
read(FILE, $buffer, 20, 0);
close(FILE);

foreach (split(//, $buffer)) {
    printf("%02x ", ord($_));
    print "\n" if $_ eq "\n";
}</PRE></B></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>30 31 0a
30 32 0a
30 33 0a</PRE></B>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <P>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The <TT>%02x</TT> notation used in this program has 
      nothing to do with Perl. The % character tells the printf function to 
      interpret the following character as a format specification. And the x 
      character tells printf to display a value in hexadecimal 
mode.</TD></TR></P></TABLE></P>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
  Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The printed version used a &gt; character to open 
      the <TT>binary.dat</TT> file instead of the &lt; 
character.</TD></TR></TBODY></TABLE>
<P>This example does a couple of things that haven't been seen yet in this book. 
The <TT>read()</TT> function is used as an alternative to the line-by-line input 
done with the diamond operator. It will read a specified number of bytes from 
the input file and assign them to a buffer variable. The fourth parameter 
specifies an offset at which to start reading. In this example, we started at 
the beginning of the file. 
<P>The <TT>split()</TT> function in the <TT>foreach</TT> loop breaks a string 
into pieces and places those pieces into an array. The double slashes indicate 
that each character in the string should be an element of the new array. 
<P>Once the array of characters has been created, the <TT>foreach</TT> loop 
iterates over the array. The <TT>printf()</TT> statement converts the ordinal 
value of the character into hexadecimal before displaying it. The <I>ordinal</I> 
value of a character is the value of the ASCII representation of the character. 
For example, the ordinal value of '0' is 0x30 or 48. 
<P>The next line, the print statement, forces the output onto a new line if the 
current character is a newline character. This was done simply to make the 
output display look a little like the input file. 
<P>Now, let's read the file in binary mode and see how the output is changed. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize a buffer variable. 
      <P>Open the <TT>BINARY.DAT</TT> file for reading. 
      <P>Change the mode to binary. 
      <P>Read the first 20 characters of the file using the <TT>read()</TT> 
      function. 
      <P>Close the file. 
      <P>Create an array out of the characters in the <TT>$buffer</TT> variable 
      and iterate over that array using a <TT>foreach</TT> loop. 
      <P>Print the value of the current array element in hexadecimal format. 
      <P>Print a newline character the current array element is a newline 
      character.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.9-09LST09.PL - 
      Reading a File to Show Binary Mode Line Endings </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
$buffer = "";

open(FILE, "&lt;binary.dat");
binmode(FILE);
read(FILE, $buffer, 20, 0);
close(FILE);

foreach (split(//, $buffer)) {
    printf("%02x ", ord($_));
    print "\n" if $_ eq "\n";
}</PRE></B></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>30 31 0d 0a
30 32 0d 0a
30 33 0d 0a</PRE></B>
<P><TR><TD BGCOLOR="black"><FONT color=lightcyan 
size=4><B>Note</B></FONT></TD></TR><TR><TD BGCOLOR="lightcyan">The <TT>%02x</TT> 
notation used in this program has nothing to do with Perl. The % character tells 
the printf function to interpret the following character as a format 
specification. And the x character tells printf to display a value in 
hexadecimal mode.</TD></TR></TABLE></P>When the file is read in binary mode, you 
can see that there are really two characters at the end of every line - the 
linefeed and newline characters. 
<P>Our next example will look at the end of file character in both text and 
binary modes. We'll use a data file called <TT>EOF.DAT</TT> with the following 
contents: 
<P><B><PRE>01
02
&lt;end of file character&gt;03</PRE></B>Since the end of file character is a 
non-printing character, it can't be shown directly. In the spot <TT>&lt;end of 
file character&gt;</TT> above is really the value 26. 
<P>Here is the program that yousaw previously read the <TT>BINARY.DAT</TT> file 
only this time it will read <TT>EOF.DAT</TT>. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize a buffer variable. 
      <P>Open the <TT>BINARY.DAT</TT> file for reading. 
      <P>Read the first 20 characters of the file using the <TT>read()</TT> 
      function. 
      <P>Close the file. 
      <P>Create an array of out of the characters in the <TT>$buffer</TT> 
      variable and iterate over that array using a <TT>foreach</TT> loop. 
      <P>Print the value of the current array element in hexadecimal format. 
      <P>Print a newline character the current array element is a newline 
      character.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.10-09LST10.PL - 
      Reading a File to Show the Text Mode End-of-File Character 
  </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
$buffer = "";

open(FILE, "&lt;eof.dat");
read(FILE, $buffer, 20, 0);
close(FILE);

foreach (split(//, $buffer)) {
    printf("%02x ", ord($_));
    print "\n" if $_ eq "\n";
}</PRE></B></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>30 31 0d 0a
30 32 0d 0a</PRE></B>
<P><TR><TD BGCOLOR="black"><FONT color=lightcyan 
size=4><B>Note</B></FONT></TD></TR><TR><TD BGCOLOR="lightcyan">The <TT>%02x</TT> 
notation used in this program has nothing to do with Perl. The % character tells 
the printf function to interpret the following character as a format 
specification. And the x character tells printf to display a value in 
hexadecimal mode.</TD></TR></TABLE></P>The end of file character prevents the 
<TT>read()</TT> function from reading the third line. If the file is placed into 
binary mode to whole file can be read. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Initialize a buffer variable. 
      <P>Open the <TT>BINARY.DAT</TT> file for reading. 
      <P>Change the mode to binary. 
      <P>Read the first 20 characters of the file using the <TT>read()</TT> 
      function. 
      <P>Close the file. 
      <P>Create an array of out of the characters in the <TT>$buffer</TT> 
      variable and iterate over that array using a <TT>foreach</TT> loop. 
      <P>Print the value of the current array element in hexadecimal format. 
      <P>Print a newline character the current array element is a newline 
      character.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.11-09LST11.PL - 
      Reading a File to Show that Binary Mode Does Not Recognize the End-of-File 
      Character </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
$buffer = "";

open(FILE, "&lt;eof.dat");
binmode(FILE);
read(FILE, $buffer, 20, 0);
close(FILE);

foreach (split(//, $buffer)) {
    printf("%02x ", ord($_));
    print "\n" if $_ eq "\n";
}</PRE></B></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>30 31 0d 0a
30 32 0d 0a
1a 30 33 0d 0a</PRE></B>
<P><TR><TD BGCOLOR="black"><FONT color=lightcyan 
size=4><B>Note</B></FONT></TD></TR><TR><TD BGCOLOR="lightcyan">The <TT>%02x</TT> 
notation used in this program has nothing to do with Perl. The % character tells 
the printf function to interpret the following character as a format 
specification. And the x character tells printf to display a value in 
hexadecimal mode.</TD></TR></TABLE></P>With binary mode on, bytes with a value 
of 26 have no special meaning and the third line can be read. You see that the 
value 26 - 1A in hexadecimal - was printed along with the rest of the 
characters. 
<H3><A name="Example: Reading into a Hash">Example: Reading into a Hash</A></H3>
<P>You've already seen that you can read a file directly into a regular array 
using this syntax: 
<P><B><PRE>@array = &lt;FILE_HANDLE&gt;;</PRE></B>Unfortunately, there is no similar 
way to read an entire file into a hash. But it's still pretty easy to do. The 
following example will use the line number as the hash key for each line of a 
file. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Open the <TT>FIXED.DAT</TT> file for reading. 
      <P>For each line of <TT>FIXED.DAT</TT> 
      <P>Create a hash element using the record number special variable 
      (<TT>$.</TT>) as the key and the line of input (<TT>$_</TT>) as the value. 

      <P>Close the file. 
      <P>Iterate over the keys of the hash. 
      <P>Print each key, value pair.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.12-09LST12.PL - 
      Reading a Fixed Length Record with Fixed Length Fields into a Hash 
      </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
open(FILE, "&lt;fixed.dat");
while (&lt;FILE&gt;) {
    $hash{$.} = $_;
}
close(FILE);

foreach (keys %hash) {
    print("$_: $hash{$_}");
}</PRE></B></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>1: 1212Jan       Jaspree             Painter
2: 3453Kelly     Horton              Jockey</PRE></B>
<H3><A name="Example: Getting File Statistics">Example: Getting File 
Statistics</A></H3>The file test operators can tell you a lot about a file but 
sometimes you need more. In those cases, you use the <TT>stat()</TT> or 
<TT>lstat()</TT> function. The <TT>stat()</TT> returns file information in a 13 
element array. You can pass either a file handle or a file name as the 
parameter. If the file can't be found or another error occurs, the null list is 
returned. Listing 9.13 shows how to use the <TT>stat()</TT> function to find out 
information about the <TT>EOF.DAT</TT> file used earlier in the chapter. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign the return list from the <TT>stat()</TT> function to 13 scalar 
      variables. 
      <P>Print the scalar values.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.13-09LST13.PL - 
      Using the <TT>stat()</TT> Function </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size,
    $atime, $mtime, $ctime, $blksize, $blocks) = stat("eof.dat");

print("dev     = $dev\n");
print("ino     = $ino\n");
print("mode    = $mode\n");
print("nlink   = $nlink\n");
print("uid     = $uid\n");
print("gid     = $gid\n");
print("rdev    = $rdev\n");
print("size    = $size\n");
print("atime   = $atime\n");
print("mtime   = $mtime\n");
print("ctime   = $ctime\n");
print("blksize = $blksize\n");
print("blocks  = $blocks\n");</PRE></B></TD></TR></TBODY></TABLE>
<P>In the DOS environment, this program displays: 
<P><B><PRE>dev     = 2
ino     = 0
mode    = 33206
nlink   = 1
uid     = 0
gid     = 0
rdev    = 2
size    = 13
atime   = 833137200
mtime   = 833195316
ctime   = 833194411
blksize =
blocks  =</PRE></B>Some of this information is specific to the UNIX environment 
and is beyond the scope of this book. For more information on this topic see 
Que's 1994 Edition of <I>Using Unix</I>. One interesting piece of information is 
the <TT>$mtime</TT> value - the date and time of the last modification made to 
the file. You can interpret this value by using the following line of code: 
<P><B><PRE> ($sec, $min, $hr, $day, $month, $year, $day_Of_Week,
    $julianDate, $dst) = localtime($mtime);</PRE></B>If you are only interested 
in the modification date, you can use the array slice notation to just grab that 
value from the 13 element array returned by <TT>stat()</TT>. For example: 
<P><B><PRE>$mtime = (stat("eof.dat"))[9];</PRE></B>Notice that the <TT>stat()</TT> 
function is surrounded by parentheses so that the return value is evaluated in 
an array context. Then the ninth element is assigned to <TT>$mtime</TT>. You can 
use this technique whenever a function returns a list. 
<H3><A name="Example: Using the Directory Functions">Example: Using the 
Directory Functions</A></H3>Perl has several functions that let you work with 
directories. You can make a directory with the <TT>mkdir()</TT> function. You 
can delete a directory with the <TT>rmdir()</TT> function. Switching from the 
current directory to another is done using the <TT>chdir()</TT> function. 
<P>Finding out which files are in a directory is done with the 
<TT>opendir()</TT>, <TT>readdir()</TT>, and <TT>closedir()</TT> functions. The 
next example will show you how to create a list of all Perl programs in the 
current directory - well, at least those files that end with the <TT>pl</TT> 
extension. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Open the current directory using <TT>DIR</TT> as the directory handle. 
      <P>Read a list of file names using the <TT>readdir()</TT> function; 
      extract only those that end in <TT>pl</TT>; and the sort the list. The 
      sorted list is assigned to the <TT>@files</TT> array variable. 
      <P>Close the directory. 
      <P>Print the file names from the <TT>@files</TT> array unless the file is 
      a directory.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.14-09LST14.PL - 
      Print All Files in the Current Directory Whose Name Ends in PL 
    </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
opendir(DIR, ".");
@files = sort(grep(/pl$/, readdir(DIR)));
closedir(DIR);

foreach (@files) {
    print("$_\n") unless -d;
}</PRE></B></TD></TR></TBODY></TABLE>
<P><TR><TD BGCOLOR="black"><FONT color=lightcyan 
size=4><B>Note</B></FONT></TD></TR><TR><TD BGCOLOR="lightcyan">If you are a DOS 
or Windows user, you may be unfamiliar with the grep function. Please see the 
function list in <A href="xp0c.htm">Appendix 
C</A>.</TD></TR></TABLE></P>
<P>This program will display each file name that ends in <TT>pl</TT> on a 
separate line. If you need to know the number of Perl programs, evaluate the 
<TT>@files</TT> array in a scalar context. For example: 
<P><B><PRE>$num_Perl_Programs = @files;</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>For this example, I modified the naming convention 
      used for the variables. I feel that <TT>$num_Perl_Programs</TT> is easier 
      to read than <TT>$numPerlPrograms</TT>. No naming convention should be 
      inflexible. Use it as a guideline and break the rules when it seems 
      wise.<BR></TD></TR></TBODY></TABLE>
<H3><A name="Example: Printing Revisited">Example: Printing 
Revisited</A></H3>We've been using the <TT>print()</TT> function throughout this 
book without really looking at how it works. Let's remedy that now. 
<P>The <TT>print()</TT> function is used to send output to a file handle. Most 
of the time, we've been using <TT>STDOUT</TT> as the file handle. Since 
<TT>STDOUT</TT> is the default, we did not need to specify it. The syntax for 
the <TT>print()</TT> function is: 
<P><B><PRE>print FILE_HANDLE (LIST)</PRE></B>You can see from the syntax that 
<TT>print()</TT> is a list operator because it's looking for a list of values to 
print. If you don't specify a list, then <TT>$_</TT> will be used. You can 
change the default file handle by using the <TT>select()</TT> function. Let's 
take a look at this: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Open <TT>TESTFILE.DAT</TT> for output. 
      <P>Change the default file handle for write and print statements. Notice 
      that the old default handle is returned and saved in the 
      <TT>$oldHandle</TT> variable. 
      <P>This line prints to the default handle which now the 
      <TT>TESTFILE.DAT</TT> file. 
      <P>Change the default file handle back to <TT>STDOUT</TT>. 
      <P>This line prints to <TT>STDOUT</TT>.</TT></P></TD></TR></TBODY></TABLE>
<P><B><PRE>open(OUTPUT_FILE, "&gt;testfile.dat");
$oldHandle = select(OUTPUT_FILE);
print("This is line 1.\n");
select($oldHandle);
print("This is line 2.\n");</PRE></B>This program displays: 
<P><B><PRE>This is line 2.</PRE></B>And creates the <TT>TESTFILE.DAT</TT> file with a 
single line in it: 
<P><B><PRE>This is line 1.</PRE></B>Perl also has the <TT>printf()</TT> function which 
lets you be more precise in how things are printed out. The syntax for 
<TT>printf()</TT> looks like this: 
<P><B><PRE>printf FILE_HANDLE (FORMAT_STRING, LIST)</PRE></B>Like <TT>print()</TT>, 
the default file handle is <TT>STDOUT</TT>. The <TT>FORMAT_STRING</TT> parameter 
controls what is printed and how it looks. For simple cases, the formatting 
parameter looks identical to the list that is passed to <TT>printf()</TT>. For 
example: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create two variables to hold costs for January and February. 
      <P>Print the cost variables using variable interpolation. Notice that the 
      dollar sign needs to be preceded by the backslash to avoid interpolation 
      that you don't want.</TT></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$januaryCost = 123.34;
$februaryCost = 23345.45;

printf("January  = \$$januaryCost\n");
printf("February = \$$februaryCost\n");</PRE></B>This program displays: 
<P><B><PRE>January  = $123.34
February = $23345.45</PRE></B>In this example, only one parameter is passed to 
the <TT>printf()</TT> function - the formatting string. Since the formatting 
string is enclosed in double quotes, variable interpolation will take place just 
like for the <TT>print()</TT> function. 
<P>This display is not good enough for a report because the decimal points of 
the numbers do not line up. You can use the formatting specifiers shown in Table 
9.5 together with the modifiers shown in Table 9.6 to solve this problem. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 9.5- Format Specifiers for the <TT>printf()</TT> 
  Function</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Specifier </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>c </TD>
    <TD vAlign=top>Indicates that a single character should be printed.</TD></TR>
  <TR>
    <TD vAlign=top>s </TD>
    <TD vAlign=top>Indicates that a string should be printed.</TD></TR>
  <TR>
    <TD vAlign=top>d </TD>
    <TD vAlign=top>Indicates that a decimal number should be printed.</TD></TR>
  <TR>
    <TD vAlign=top>u </TD>
    <TD vAlign=top>Indicates that a unsigned decimal number should be 
    printed.</TD></TR>
  <TR>
    <TD vAlign=top>x </TD>
    <TD vAlign=top>Indicates that a hexadecimal number should be 
printed.</TD></TR>
  <TR>
    <TD vAlign=top>o </TD>
    <TD vAlign=top>Indicates that an octal number should be printed.</TD></TR>
  <TR>
    <TD vAlign=top>e </TD>
    <TD vAlign=top>Indicates that a floating point number should be printed in 
      scientific notation.</TD></TR>
  <TR>
    <TD vAlign=top>f </TD>
    <TD vAlign=top>Indicates that a floating point number should be 
  printed.</TD></TR>
  <TR>
    <TD vAlign=top>g </TD>
    <TD vAlign=top>Indicates that a floating point number should be printed 
      using the most space-spacing format, either e or f.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 9.6-Format Modifiers for the <TT>printf()</TT> 
  Function</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Modifier </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>- </TD>
    <TD vAlign=top>Indicates that the value should be printed 
    left-justified.</TD></TR>
  <TR>
    <TD vAlign=top># </TD>
    <TD vAlign=top>Forces octal numbers to be printed with a leading zero. 
      Hexadecimal numbers will be printed with a leading 0x.</TD></TR>
  <TR>
    <TD vAlign=top>+ </TD>
    <TD vAlign=top>Forces signed numbers to be printed with a leading + or - 
      sign.</TD></TR>
  <TR>
    <TD vAlign=top>0 </TD>
    <TD vAlign=top>Pads the displayed number with zeros instead of 
  spaces.</TD></TR>
  <TR>
    <TD vAlign=top>. </TD>
    <TD vAlign=top>Forces the value to be at least a certain width. For 
      example, %10.3f means that the value will be at least 10 positions wide. 
      And since f is used for floating point, at most 3 positions to the right 
      of the decimal point will be displayed. %.10s will print a string at most 
      10 characters long.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create two variables to hold costs for January and February. 
      <P>Print the cost variables using format 
specifiers.</TT></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$januaryCost = 123.34;
$februaryCost = 23345.45;

printf("January  = \$%8.2f\n", $januaryCost);
printf("February = \$%8.2f\n", $februaryCost);</PRE></B>This program displays: 
<P><B><PRE>January  = $  123.34
February = $23345.45</PRE></B>This example uses the <TT>f</TT> format specifier 
to print a floating point number. The numbers are printed right next to the 
dollar sign because <TT>$februaryCost</TT> is 8 positions width. 
<P>If you did not know the width of the numbers that you need to print in 
advance, you could use the following technique. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Create two variables to hold costs for January and February. 
      <P>Find the length of the largest number. 
      <P>Print the cost variables using variable interpolation to determine the 
      width of the numbers to print. 
      <P>Define the <TT>max()</TT> function. You can look in the "<A 
      href="ch07.htm#Example: Foreach Loops">Example: 
      Foreach Loops</A>" of Chapter 7, "<A 
      href="ch07.htm">Control Statements</A>," for 
      more information about the <TT>max()</TT> 
function.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.15-09LST15.PL - 
      Using Variable Interpolation to Align Numbers When Printing 
  </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
$januaryCost = 123.34;
$februaryCost = 23345.45;

$maxLength = length(max($januaryCost, $februaryCost));

printf("January  = \$%$maxLength.2f\n", $januaryCost);
printf("February = \$%$maxLength.2f\n", $februaryCost);

sub max {
    my($max) = shift(@_);

    foreach $temp (@_) {
        $max = $temp if $temp &gt; $max;
    }
    return($max);
}</PRE></B></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>January  = $  123.34
February = $23345.45</PRE></B>While taking the time to find the longest number 
is more work. I think you'll agree that the result is worth it. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>In the next chapter, "<A 
      href="ch10.htm">Regular Expressions</A>," you 
      see how to add commas when printing numbers for even more readability when 
      printing numbers.<BR></TD></TR></TBODY></TABLE>
<P>So far, we've only looked at printing numbers. You can also use 
<TT>printf()</TT> to control printing strings. Like the printing of numbers 
above, <TT>printf()</TT> is best used for controlling the alignment and length 
of strings. Here is an example: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign "John O'Mally" to $name. 
      <P>Print using format specifiers to make the value 10 characters wide but 
      only print the first 4 characters from the 
string.</TT></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$name = "John O'Mally";
printf("The name is %10.4s.\n", $name);</PRE></B>This program displays: 
<P><B><PRE>The name is      John.</PRE></B>The left side of the period modifier 
controls the width of the printed value also called the <I>print field</I>. If 
the length of the string to be printed is less than the width of the print 
field, then the string is right justified and padded with spaces. 
<P>You can left-justify the string by using the dash modifier. For example: 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Assign "John O'Mally" to $name. 
      <P>Print using format specifiers to left-justify the 
  value.</TT></P></TD></TR></TBODY></TABLE>
<P><B><PRE>$name = "John O'Mally";
printf("The name is %-10.5s.\n", $name);</PRE></B>This program displays: 
<P><B><PRE>The name is John     .</PRE></B>The period way off to the right shows that 
the string was left-justified and padded with spaces until it was 10 positions 
wide. 

## Globbing

Perl supports a feature called 
<I>globbing</I> which lets you use wildcard characters to find filenames. A 
<I>wildcard</I> character is like the wild card in poker. It can have more than 
one meaning. Let's look at some of the simpler examples. 
<H3><A name="Example: Assigning a glob to an Array">Example: Assigning a 
<I>glob</I> to an Array</A></H3>One common chore for computer administrators is 
the removal of backup files. You can use the globbing technique with the 
<TT>unlink()</TT> function to perform this chore. 
<P><B><PRE>unlink(&lt;*.bak&gt;);</PRE></B>The file specification, <TT>*.bak</TT>, is 
placed between the diamond operator and when evaluated returns a list of files 
that match the specification. An asterisk means zero or more of any character 
will be matched. So this <TT>unlink()</TT> call will delete all files with a 
<TT>BAK</TT> extension. 
<P>You can use the following: 
<P><B><PRE>@array = &lt;f*.*&gt;;</PRE></B>To get a list of all files that start with 
the letter f. The next chapter, "<A 
href="ch10.htm">Regular Expressions</A>," will show 
you more ways to specify file names. Most of the meta-characters used in Chapter 
10 can be used inside globs. 

## Using Data Structures With Files

In the last chapter, you saw how to create complex data 
structures. Creating a program to read and write those structures is beyond the 
scope of this book. However, the following examples will show you how to use 
simpler data structures. The same techniques can be applied to the more 
complicated data structures as well. 
<H3><A name="Example: Splitting a Record into Fields">Example: Splitting a 
Record into Fields</A></H3>This example will show you how to read a file 
line-by-line and break the input records into fields based on a separator 
string. The file, <TT>FIELDS.DAT</TT>, will be used with the following contents: 

<P><B><PRE>1212:Jan:Jaspree:Painter
3453:Kelly:Horton:Jockey</PRE></B>The individual fields or values are separated 
from each other by the colon (<TT>:</TT>) character. The <TT>split()</TT> 
function will be used to create an array of fields. And then a <TT>foreach</TT> 
loop will print the fields. Listing 9.16 shows how to input lines from a file 
and split them into fields. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Use the <TT>qw()</TT> notation to create an array of words. 
      <P>Open the <TT>FIELDS.DAT</TT> file for input. 
      <P>Loop while there are lines to read in the file. 
      <P>Use the split function to create an array of fields, using the colon as 
      the field separator. The scalar value of <TT>@fieldList</TT> is passed to 
      split to indicate how many fields to expect. Each element in the new array 
      is then added to the <TT>%data</TT> hash with a key of the field name. 
      <P>Loop through <TT>@fieldList</TT> array. 
      <P>Print each element and its value in the <TT>%data</TT> 
  hash.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 9.16-09LST16.PL - 
      Reading Records from Standard Input </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
@fieldList = qw(fName lName job age);

open(FILE, "&lt;fields.dat");

while(&lt;FILE&gt;) {
    @data{@fieldList} = split(/:/, $_, scalar @fieldList);

    foreach (@fieldList) {
        printf("%10.10s = %s\n", $_, $data{$_});
    }
}

close(FILE);</PRE></B></TD></TR></TBODY></TABLE>
<P>This program will display: 
<P><B><PRE>     fName = 1212
     lName = Jan
       job = Jaspree
       age = Painter

     fName = 3453
     lName = Kelly
       job = Horton
       age = Jockey</PRE></B>The first line of this program uses the 
<TT>qw()</TT> notation to create an array of words. It is identical to 
<TT>@fieldList = ("fName", "lName", "job", "age");</TT> but without the 
distracting quotes and commas. 
<P>The split statement might require a little explanation. It is duplicated here 
so that you can focus on it. 
<P><B><PRE>@data{@fieldList} = split(/:/, $_, scalar @fieldList);</PRE></B>Let's use 
the first line of the input file as an example. The first line looks like this: 
<P><B><PRE>1212:Jan:Jaspree:Painter</PRE></B>The first thing that happens is that 
split creates an array using the colon as the separator, this creates an array 
that looks like this: 
<P><B><PRE>("1212", "Jan", "Jaspree", "Painter")</PRE></B>You can substitute this list 
in place of the <TT>split()</TT> function in the statement. 
<P><B><PRE>@data{@fieldList} = ("1212", "Jan", "Jaspree", "Painter");</PRE></B>And you 
already know that <TT>@fieldList</TT> is a list of field name. So the statement 
can be further simplified to: 
<P><B><PRE>@data{"fName", "lName", "job", "age"} =
    ("1212", "Jan", "Jaspree", "Painter");</PRE></B>This assignment statement 
shows that each array element on the right is paired with a key value on the 
left so that four separate hash assignments are taking place in this statement. 

## Summary

This was a rather long chapter, and we've 
really only talked about the basics of using files. You have enough information 
now to explore the rest of the file functions. You could also create functions 
to read more complicated data structures with what you've learned so far. 
<P>Let's review what you know about files. You read that files are a series of 
bytes stored somewhere outside the computer's memory. Most of the time, a file 
will be on a hard disk in a directory. But the file could also be on a floppy 
disk or on a networked computer. The physical location is not important as long 
as you know the fully qualified file name. This name will include any computer 
name, drive name, and directory name that is needed to uniquely identify the 
file. 
<P>There are three files - actually file handles - that are always opened before 
your program starts. These are <TT>STDIN</TT>, <TT>STDOUT</TT>, and 
<TT>STDERR</TT>. The <TT>STDIN</TT> file handle is used to connect to the 
standard input, usually the keyboard. You can use the <TT>&lt;</TT> character to 
override the standard input on the command line so that input comes from a file 
instead of the keyboard. The <TT>STDOUT</TT> file handle is used to connect to 
the standard output, usually the monitor. The <TT>&gt;</TT> character is used to 
override the standard output. And finally, the <TT>STDERR</TT> file handle is 
used when you want to output error messages. <TT>STDERR</TT> usually points to 
the computer's monitor. 
<P>The diamond operator (<TT>&lt;&gt;</TT>) is used to read an entire line of 
text from a file. It stops reading when the end of line character - the newline 
- character is read. The returned string always includes the newline character. 
If no file handle is used with the diamond operator, it will attempt to read 
from files listed in the <TT>@ARGV</TT> array. If that array is empty, it will 
read from <TT>STDIN</TT>. 
<P>Next, you read about Perl's file test operators. There are way too many to 
recap here, but some of the more useful ones are the -d used to test for a 
directory name, -e used to see if a file exists, and -w to see if a file can be 
written to. The special file handle, _, can be used to prevent Perl from making 
a second system call if you need to make two tests on the same file one right 
after another. 
<P>A table of file functions (refer to Table 9.3) was shown which shows many 
functions that deal with opening files, reading and writing information, and 
closing files. Some functions were specific to UNIX, although not many. 
<P>You learned how to open a file and that files can be opened for input, for 
output, or for appending. When you read a file, you can use text mode (the 
default) or binary mode. In binary mode on DOS systems, line endings are read as 
two characters - the line feed and the carriage return. On both DOS and UNIX 
systems, binary mode lets you read the end of file character as regular 
characters with no special meaning. 
<P>Reading file information directly from the directory was shown to be very 
easy by using the <TT>opendir()</TT>, <TT>readdir()</TT>, and 
<TT>closedir()</TT> functions. An example was given that showed how to find all 
files with an extension of PL by using the <TT>grep()</TT> function in 
conjunction with <TT>readdir()</TT>. 
<P>Then, we looked closely at the <TT>print()</TT> and <TT>printf()</TT> 
functions. Both can be used to send output to a file handle. The 
<TT>select()</TT> function was used to change the default handle from 
<TT>STDOUT</TT> to another file. In addition, some examples were given of the 
formatting options available with the <TT>printf()</TT> function. 
<P>The topic of Globbing was briefly touched on. Globs let you specify a file 
name using wildcards. A list of file names is returned that can be processed 
like any other array. 
<P>And finally, you read about how to split a record into fields based on a 
separator character. 
<P>This chapter covered a lot of ground. And some of the examples did not relate 
to each other. Instead, I tried to give you a feel for the many ways that files 
can be used. A entire book can be written on the different ways to use files. 
But, you now know enough to create any kind of file that you might need. 
<P>Chapter 10, "<A href="ch10.htm">Regular 
Expressions</A>," covers the most difficult topics related to Perl. In fact, 
Perl's regular expressions are one of the main reasons to learn the language. 
Few other languages will give you equivalent functionality. 

## Review Questions

<OL>
  <LI>What is a file handle? 
  <P></P>
  <LI>What is binary mode? 
  <P></P>
  <LI>What is a fully qualified file name? 
  <P></P>
  <LI>Are variables in the computer's memory considered persistent storage? 
  <P></P>
  <LI>What is the <TT>&lt;&gt;</TT> operator used for? 
  <P></P>
  <LI>What is the default file handle for the <TT>printf()</TT> function? 
  <P></P>
  <LI>What is the difference between the following two open statements? 
  <P><B><PRE>     open(FILE_ONE, "&gt;FILE_ONE.DAT");
     open(FILE_TWO, "&gt;&gt;FILE_TWO.DAT");</PRE></B>
  <LI>What value will the following expression return? 
  <P><B><PRE>     (stat("09lst01.pl"))[7];</PRE></B>
  <LI>What is globbing? 
  <P></P>
  <LI>What will the following statement display?</LI></OL>
<P><B><PRE>     printf("%x", 16);</PRE></B>

## Review Exercises

<OL>
  <LI>Write a program to open a file and display each line along with its line 
  number. 
  <P></P>
  <LI>Write a program that prints to four files at once. 
  <P></P>
  <LI>Write a program that gets the file statistics for <TT>PERL.EXE</TT> and 
  displays its size in bytes. 
  <P></P>
  <LI>Write a program that uses the <TT>sysread()</TT> function. The program 
  should first test the file for existence and determine the file size. Then the 
  file size should be passed to the <TT>sysread()</TT> function as one of its 
  parameters. 
  <P></P>
  <LI>Write a program that reads from the file handle in the following line of 
  code. Read all of the input into an array and then sort and print the array. 
  <P><B><PRE>     open(FILE, "dir *.pl |");</PRE></B>
  <LI>Using the binary mode, write a program that reads the <TT>PERL.EXE</TT> 
  and print any characters that are greater than or equal to "A" and less than 
  or equal to "Z". 
  <P></P>
  <LI>Write a program that reads a file with two fields. The first field is a 
  customer ID and the second field is the customer name. Use the ! character as 
  a separator between the fields. Store the information into a hash with the 
  customer id as the key and the customer name as the value. 
  <P></P>
  <LI>Write a program that reads a file into a array, then displays 20 lines at 
  time.</LI></OL>
