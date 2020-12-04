# Creating Reports

<P>Perl has a few special features that let you create simple reports. The 
reports can have a header area where you can place a title, page number, and 
other information that stays the same from one page to the next. Perl will track 
how many lines have been used in the report and automatically generate new pages 
as needed. 
<P>Compared to learning about regular expressions, learning how to create 
reports will be a breeze. There are only a few tricky parts, which I'll be sure 
to point out. 
<P>This chapter starts out by using the <TT>print()</TT> function to display a 
CD collection and then gradually moves from displaying the data to a fully 
formatted report. The data file shown in Listing 11.1 is used for all of the 
examples in this chapter. The format is pretty simple: the CD album's title, the 
artist's name, and the album's price. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.1-FORMAT.DAT - The Data File</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>The Lion King!
Tumbleweed Connection!Elton John!123.32
Photographs &amp; Memories!Jim Croce!4.95
Heads &amp; Tales!Harry Chapin!12.50</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>You'll find that Perl is very handy for small text-based data files like 
this. You can create them in any editor and use any field delimiter you like. In 
this file, I used an exclamation point to delimit the field. However, I could 
just as easily have used a caret, a tilde, or any other character. 
<P>Now that we have some data, let's look at Listing 11.2, which is a program 
that reads the data file and displays the information. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Open the <TT>FORMAT.DAT</TT> file. 
      <P>Read all the file's lines and place them in the <TT>@lines</TT> array. 
      Each line becomes a different element in the array. 
      <P>Close the file. 
      <P>Iterate over the <TT>@lines</TT> array. <TT>$_</TT> is set to a 
      different array element each time through the loop. 
      <P>Remove the linefeed character from the end of the string. 
      <P>Split the string into three fields using the exclamation point as the 
      delimiter. Place each field into the <TT>$album</TT>, <TT>$artist</TT>, 
      and <TT>$price</TT> variables. 
      <P>Print the variables.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.2-11LIST02.PL - A Program to Read and Display the Data 
      File</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>open(FILE, "<format.dat");
@lines = <FILE>;
close(FILE);

foreach (@lines) {
    chop;
    ($album, $artist, $price) = (split(/!/));
    print("Album=$album   Artist=$artist   Price=$price\n");
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>Use of uninitialized value at 11lst02.pl line 8.
Album=The Lion King   Artist=   Price=
Album=Tumbleweed Connection   Artist=Elton John   Price=123.32
Album=Photographs &amp; Memories   Artist=Jim Croce   Price=4.95
Album=Heads &amp; Tales   Artist=Harry Chapin   Price=12.50</PRE></B>Why is an 
error being displayed on the first line of the output? If you said that the 
<TT>split()</TT> function was returning the undefined value when there was no 
matching field in the input file, you were correct. The first input line was the 
following: 
<P><B><PRE>The Lion King!</PRE></B>There are no entries for the Artist or Price 
fields. Therefore, the <TT>$artist</TT> and <TT>$price</TT> variables were 
assigned the undefined value, which resulted in Perl complaining about 
uninitialized values. You can avoid this problem by assigning the empty string 
to any variable that has the undefined value. Listing 11.3 shows a program that 
does this. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Open the <TT>FORMAT.DAT</TT> file, read all the lines into 
      <TT>@lines</TT>, and then close the file. 
      <P>Iterate over the <TT>@lines</TT> array. 
      <P>Remove the linefeed character. 
      <P>Split the string into three fields. 
      <P>If any of the three fields are not present in the line, provide a 
      default value of an empty string. 
      <P>Print the variables.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.3-11LST03.PL - How to Avoid the Uninitialized Error When 
      Using the <I>Split()</I> Function</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>open(FILE, "<format.dat");
@lines = <FILE>;
close(FILE);

foreach (@lines) {
    chop;
    ($album, $artist, $price) = (split(/!/));
    $album  = "" if !defined($album);
    $artist = "" if !defined($artist);
    $price  = "" if !defined($price);
    print("Album=$album   Artist=$artist   Price=$price\n");
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P><A name="Paul Lussier 1"></A>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Clarification 
      Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The following code lines are responsible for 
      assigning a null string value to the three variables if no information was 
      present in the record: <B><PRE>$album  = "" if !defined($album);
$artist = "" if !defined($artist);
$price  = "" if !defined($price);</PRE></B>
      <P>The defined() function is used to see if each variable is defined. If a 
      variable has no value, then the "" string is assigned to 
  it.</P></TD></TR></TBODY></TABLE>
<P><A name="Paul Lussier 2"></A>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
  Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The printed version of this book showed the split 
      call to be: <B><TT>($album, $artist, $price) = (split(/::/));</TT></B> 
      which was incorrect. </TD></TR></TBODY></TABLE>
<P>The first four lines this program displays are the following: <B><PRE>Album=The Lion King   Artist=   Price=
Album=Tumbleweed Connection   Artist=Elton John   Price=123.32
Album=Photographs &amp; Memories   Artist=Jim Croce   Price=4.95
Album=Heads &amp; Tales   Artist=Harry Chapin   Price=12.50</PRE></B>The error 
has been eliminated, but it is still very hard to read the output because the 
columns are not aligned. The rest of this chapter is devoted to turning this 
jumbled output into a report. 
<P>Perl reports have both <I>heading</I> and <I>detail lines</I>. A heading is 
used to identify the report title, the page number, the date, and any other 
information that needs to appear at the top of each page. Detail lines are used 
to show information about each record in the report. In the data file being used 
for the examples in this chapter (see Listing 11.1), each CD has its own detail 
line. 
<P>Headings and detail lines are defined by using format statements, which are 
discussed in the next section. 
<P>

## What's a Format Statement?

Perl uses <I>formats</I> as guidelines when writing report information. A format is 
used to tell Perl what static text is needed and where variable information 
should be placed. Formats are defined by using the <TT>format</TT> statement. 
The syntax for the <TT>format</TT> statement is 
<P><B><PRE>format FORMATNAME =
    FIELD_LINE
    VALUE_LINE
.</PRE></B>The <TT>FORMATNAME</TT> is usually the same name as the file handle 
that is used to accept the report output. The section "<A 
href="ch11.htm#Example: Changing Formats">Example: 
Changing Formats</A>," later in this chapter, talks about using the 
<TT>format</TT> statement where the <TT>FORMATNAME</TT> is different from the 
file handle. If you don't specify a <TT>FORMATNAME</TT>, Perl uses 
<TT>STDOUT</TT>. The <TT>FIELD_LINE</TT> part of the format statement consists 
of text and field holders. A <I>field holder</I> represents a given line width 
that Perl will fill with the value of a variable. The <TT>VALUE_LINE</TT> line 
consists of a comma-delimited list of expressions used to fill the field holders 
in <TT>FIELD_LINE</TT>. 
<P>Report headings, which appear at the top of each page, have the following 
format: 
<P><B><PRE>format FORMATNAME_TOP =
    FIELD_LINE
    VALUE_LINE
.</PRE></B>Yes, the only difference between a detail line and a heading is that 
<TT>_TOP</TT> is appended to the <TT>FORMATNAME</TT>. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The location of <TT>format</TT> statements is 
      unimportant because they define only a format and are never executed. I 
      feel that they should appear either at the beginning of a program or the 
      end of a program, rarely in the middle. Placing <TT>format</TT> statements 
      in the middle of your program might make them hard to find when they need 
      to be changed. Of course, you should be consistent where you place 
  them.</TD></TR></TBODY></TABLE>
<P>A typical format statement might look like this: 
<P><B><PRE>format =
    The total amount is $@###.##
                         $total
.</PRE></B>The at character <TT>@</TT> is used to start a field holder. In this 
example, the field holder is seven characters long (the at sign and decimal 
point count, as well as the pound signs <TT>#</TT>). The next section, "<A 
href="ch11.htm#Example: Using Field Lines">Example: 
Using Field Lines</A>," goes into more detail about field lines and field 
holders. 
<P>Format statements are used only when invoked by the <TT>write()</TT> 
function. The <TT>write()</TT> function takes only one parameter: a file handle 
to send output to. Like many things in Perl, if no parameter is specified, a 
default is provided. In this case, <TT>STDOUT</TT> will be used when no 
<TT>FORMATNAME</TT> is specified. In order to use the preceding format, you 
simply assign a value to <TT>$total</TT> and then call the <TT>write()</TT> 
function. For example: 
<P><B><PRE>$total = 243.45;
write();
$total = 50.00;
write();</PRE></B>These lines will display: 
<P><B><PRE>    The total amount is $  243.45
    The total amount is $   50.50</PRE></B>The output will be sent to 
<TT>STDOUT</TT>. Notice that the decimal points are automatically lined up when 
the lines are displayed. 
<P>

### Example: Using Field Lines

The field lines of a format statement control what is displayed and how. The 
simplest field line contains only static text. You can use <I>static</I> or 
unchanging text as labels for variable information, dollar signs in front of 
amounts, a separator character such as a comma between first and last name, or 
whatever else is needed. However, you'll rarely use just static text in your 
format statement. Most likely, you'll use a mix of static text and field 
holders. 
<P>You saw a field holder in action in the last section in which I demonstrated 
sending the report to <TT>STDOUT</TT>. I'll repeat the <TT>format</TT> statement 
here so you can look at it in more detail: 
<P><B><PRE>format =
    The total amount is $@###.##
                         $total
.</PRE></B>The character sequence <TT>The total amount is $</TT> is static text. 
It will not change no matter how many times the report is printed. The character 
sequence <TT>@###.##</TT>, however, is a field holder. It reserves seven spaces 
in the line for a number to be inserted. The third line is the value line; it 
tells Perl which variable to use with the field holder. Table 11.11 contains a 
list of the different format characters you can use in field lines. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 11.1 - Field Holder Formats</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Format Character </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>@</TT> </TD>
    <TD vAlign=top>This character represents the start of a field 
holder.</TD></TR>
  <TR>
    <TD vAlign=top><TT><</TT> </TD>
    <TD vAlign=top>This character indicates that the field should be 
      left-justified.</TD></TR>
  <TR>
    <TD vAlign=top><TT>></TT> </TD>
    <TD vAlign=top>This character indicates that the field should be 
      right-justified.</TD></TR>
  <TR>
    <TD vAlign=top><TT>|</TT> </TD>
    <TD vAlign=top>This character indicates that the field should be 
    centered.</TD></TR>
  <TR>
    <TD vAlign=top><TT>#</TT> </TD>
    <TD vAlign=top>This character indicates that the field will be numeric. If 
      used as the first character in the line, it indicates that the entire line 
      is a comment.</TD></TR>
  <TR>
    <TD vAlign=top><TT>.</TT> </TD>
    <TD vAlign=top>This character indicates that a decimal point should be 
      used with numeric fields.</TD></TR>
  <TR>
    <TD vAlign=top><TT>^</TT> </TD>
    <TD vAlign=top>This character also represents the start of a field holder. 
      Moreover, it tells Perl to turn on word-wrap mode. See the section "<A 
      href="ch11.htm#Example: Using Long Pieces of Text in Reports">Example: 
      Using Long Pieces of Text in Reports</A>" later in this chapter for more 
      information about word-wrapping.</TD></TR>
  <TR>
    <TD vAlign=top><TT>~</TT> </TD>
    <TD vAlign=top>This character indicates that the line should not be 
      written if it is blank.</TD></TR>
  <TR>
    <TD vAlign=top><TT>~~</TT> </TD>
    <TD vAlign=top>This sequence indicates that lines should be written as 
      needed until the value of a variable is completely written to the output 
      file.</TD></TR>
  <TR>
    <TD vAlign=top><TT>@*</TT> </TD>
    <TD vAlign=top>This sequence indicates that a multi-line field will be 
      used.</TD></TR></TBODY></TABLE>
<P>Let's start using some of these formatting characters by formatting a report 
to display information about the <TT>FORMAT.DAT</TT> file we used earlier. The 
program in Listing 11.4 displays the information in nice, neat columns. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare a format for the <TT>STDOUT</TT> file handle. 
      <P>Open the <TT>FORMAT.DAT</TT> file, read all the lines into 
      <TT>@lines</TT>, and then close the file. 
      <P>Iterate over the <TT>@lines</TT> array. 
      <P>Remove the linefeed character. 
      <P>Split the string into three fields. 
      <P>If any of the three fields are not present in the line, provide a 
      default value of an empty string. Notice that a numeric value must be 
      given to <TT>$price</TT> instead of the empty string. 
      <P>Invoke the format statement by using the <TT>write()</TT> 
      function.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.4-11LST04.PL - Using a Format with 
      <I>STDOUT</B></FONT></I></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
format =
  Album=@<<<<<<<<<<<<<  Artist=@>>>>>>>>>>>>  Price=$@##.##
        $album,                $artist,              $price
.

open(FILE, "<format.dat");
@lines = <FILE>;
close(FILE);

foreach (@lines) {
    chop;
    ($album, $artist, $price) = (split(/!/));
    $album  = "" if !defined($album);
    $artist = "" if !defined($artist);
    $price  = 0 if !defined($price);
    write();
}</B></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays the following: 
<P><B><PRE>  Album=The Lion King   Artist=               Price=$  0.00
  Album=Tumbleweed Con  Artist=   Elton John  Price=$123.32
  Album=Photographs &amp;   Artist=    Jim Croce  Price=$  4.95
  Album=Heads &amp; Tales   Artist= Harry Chapin  Price=$ 12.50</PRE></B>You can 
see that the columns are now neatly aligned. This was done with the 
<TT>format</TT> statement and the <TT>write()</TT> function. The <TT>format</TT> 
statement used in this example used three field holders. The first field holder, 
<TT>@<<<<<<<<<<<<<</TT>, created a 
left-justified spot for a 14-character-wide field filled by the value in 
<TT>$album</TT>. The second field holder, 
<TT>@>>>>>>>>>>>></TT>, created a 
right-justified spot for a 12-character-wide field filled by the value in 
<TT>$artist</TT>. The last field holder, <TT>@##.##</TT>, created a 
6-character-wide field filled by the numeric value in <TT>$price</TT>. 
<P>You might think it's wasteful to have the field labels repeated on each line, 
and I would agree with that. Instead of placing field labels on the line, you 
can put them in the report heading. The next section discusses how to do this. 
<P>

### Example: Report Headings

Format statements for a report heading use the same format as the detail line 
<TT>format</TT> statement, except that <TT>_TOP</TT> is appended to the file 
handle. In the case of <TT>STDOUT</TT>, you must specify <TT>STDOUT_TOP</TT>. 
Simply using <TT>_TOP</TT> will not work. 
<P>To add a heading to the report about the CD collection, you might use the 
following <TT>format</TT> statement: 
<P><B><PRE>format STDOUT_TOP =
  @||||||||||||||||||||||||||||||||||||  Pg @<
  "CD Collection of David Medinets",        $%

  Album              Artist            Price
  -----------------  ----------------  -------
.</PRE></B>Adding this <TT>format</TT> statement to Listing 11.4 produces this 
output: 
<P><B><PRE>      CD Collection of David Medinets     Pg 1

  Album              Artist            Price
  -----------------  ----------------  -------
  Album=The Lion King   Artist=               Price=$  0.00
  Album=Tumbleweed Con  Artist=   Elton John  Price=$123.32
  Album=Photographs &amp;   Artist=    Jim Croce  Price=$  4.95
  Album=Heads &amp; Tales   Artist= Harry Chapin  Price=$ 12.50</PRE></B>Whenever 
a new page is generated, the heading format is automatically invoked. Normally, 
a page is 60 lines long. However, you can change this by setting the <TT>$=</TT> 
special variable. 
<P>Another special variable, <TT>$%,</TT> holds the current page number. It will 
be initialized to zero when your program starts. Then, just before invoking the 
heading format, it is incremented so its value is one. You can change 
<TT>$%</TT> if you need to change the page number for some reason. 
<P>You might notice that the <TT>|</TT> formatting character was used to center 
the report title over the columns. You might also notice that placing the field 
labels into the heading allows the columns to be expanded in width. 
<P>Unfortunately, Perl does not truly have any facility for adding footer detail 
lines. However, you can try a bit of "magic" in order to fool Perl into creating 
footers with static text. The <TT>$^L</TT> variable holds the string that Perl 
writes before every report page except for the first, and the <TT>$=</TT> 
variable holds the number of lines per page. By changing <TT>$^L</TT> to hold 
your footer and by reducing the value in <TT>$=</TT> by the number of lines your 
footer will need, you can create primitive footers. Listing 11.5 displays the CD 
collection report on two pages by using this technique. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare a format for the <TT>STDOUT</TT> file handle. 
      <P>Declare a heading format for the <TT>STDOUT</TT> file handle. 
      <P>Open the <TT>FORMAT.DAT</TT> file, read all the lines into 
      <TT>@lines</TT>, and then close the file. 
      <P>Assign a value of <TT>6</TT> to <TT>$=</TT>. Normally, it has a value 
      of <TT>60</TT>. Changing the value to <TT>6</TT> will create very short 
      pages - ideal for small example programs. 
      <P>Assign a string to <TT>$^L</TT>, which usually is equal to the 
      form-feed character. The form-feed character causes printers to eject a 
      page. 
      <P>Iterate over the <TT>@lines</TT> array. 
      <P>Remove the linefeed character. 
      <P>Split the string into three fields. 
      <P>If any of the three fields are not present in the line, provide a 
      default value of an empty string. Notice that a numeric value must be 
      given to <TT>$price</TT> instead of the empty string. 
      <P>Invoke the <TT>format</TT> statement using the <TT>write()</TT> 
      function. 
      <P>Print the footer on the last page. You need to explicitly do this 
      because the last page of the report will probably not be a full 
      page.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.5-11LST05.PL - Tricking Perl into Creating Primitive 
      Footers</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>format =
  Album=@<<<<<<<<<<<<<  Artist=@>>>>>>>>>>>>  Price=$@##.##
        $album,                $artist,              $price
.

format STDOUT_TOP =
  @||||||||||||||||||||||||||||||||||||  Pg @<
  "CD Collection of David Medinets",        $%

  Album              Artist            Price
  -----------------  ----------------  -------
.

open(FILE, "<format.dat");
@lines = <FILE>;
close(FILE);

$= = 6;

$^L = '-' x 60 . "\n" .
      "Copyright, 1996, Eclectic Consulting\n" .
      "\n\n";

foreach (@lines) {
    chop();
    ($album, $artist, $price) = (split(/!/));
    $album  = "" if !defined($album);
    $artist = "" if !defined($artist);
    $price  = 0 if !defined($price);
    write();
}

print("$^L");</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays the following: 
<P><B><PRE>     CD Collection of David Medinets     Pg 1

  Album              Artist            Price
  -----------------  ----------------  -------
  Album=The Lion King   Artist=               Price=$  0.00
  Album=Tumbleweed Con  Artist=   Elton John  Price=$123.32
------------------------------------------------------------
Copyright, 1996, Eclectic Consulting


     CD Collection of David Medinets     Pg 2

  Album              Artist            Price
  -----------------  ----------------  -------
  Album=Photographs &amp;   Artist=    Jim Croce  Price=$  4.95
  Album=Heads &amp; Tales   Artist= Harry Chapin  Price=$ 12.50
------------------------------------------------------------
Copyright, 1996, Eclectic Consulting</PRE></B>Let me explain the assignment to 
<TT>$^L</TT> in more detail. The assignment is duplicated here for your 
convenience: 
<P><B><PRE>$^L = '-' x 60 . "\n" .
      "Copyright, 1996 by Eclectic Consulting\n" .
      "\n\n";</PRE></B>The first part of the assignment, <TT>'-' x 60</TT>, 
creates a line of 60 dash characters. Then a newline character is concatenated 
to the line of dashes. Next, the copyright line is appended. Finally, two more 
linefeeds are appended to separate the two pages of output. Normally, you 
wouldn't add the ending linefeeds because the form-feed character makes them 
unnecessary. Here's how the code would look when designed to be sent to a 
printer: 
<P><B><PRE>$^L = '-' x 60 . "\n" .
      "Copyright, 1996 by Eclectic Consulting" .
      "\014";</PRE></B>The <TT>"\014"</TT> string is the equivalent of a 
form-feed character because the ASCII value for a form-feed is 12, which is 14 
in octal notation. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>I feel that it's important to say that the coding 
      style in this example is not really recommended for "real" programming. I 
      concatenated each footer element separately so I could discuss what each 
      element did. The last three elements in the footer assignment should 
      probably be placed inside one string literal for 
efficiency.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>This example is somewhat incomplete. If the last 
      page of the report ends at line 20 and there are 55 lines per page, simply 
      printing the <TT>$^L</TT> variable will not place the footer at the bottom 
      of the page. Instead, the footer will appear after line 20. This is 
      probably not the behavior you'd like. Try the following statement to fix 
      this problem: 
      <P><PRE>print("\n" x $- . "$^L");</PRE>
      <P>This will concatenate enough linefeeds to the beginning of the footer 
      variable to place the footer at the bottom of the 
page.</P></TD></TR></TBODY></TABLE></B>
<P>

### Example: Using Functions in the Value Line

You've already seen the value line in action. Most of the time, its use will be very simple: create the field holder 
in the field line and then put the variable name in the value line. But there 
are some other value line capabilities you should know about. In addition to 
simple scalar variables, you can specify array variables and even functions on 
the value line. Listing 11.6 shows a program that uses a function to add 
ellipses to a string if it is too wide for a column. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare a format for the <TT>STDOUT</TT> file handle. In this example, 
      the value line calls the <TT>dotize()</TT> function. 
      <P>Declare a heading format for the <TT>STDOUT</TT> file handle. 
      <P>Declare the <TT>dotize()</TT> function. 
      <P>Initialize local variables called <TT>$width</TT> and <TT>$string</TT>. 

      <P>If the width of <TT>$string</TT> is greater than <TT>$width</TT>, 
      return a value that consists of <TT>$string</TT> shortened to 
      <TT>$width-3</TT> with <TT>...</TT> appended to the end; otherwise, return 
      <TT>$string</TT>. 
      <P>Open the <TT>FORMAT.DAT</TT> file, read all the lines into 
      <TT>@lines</TT>, and then close the file. 
      <P>Iterate over the <TT>@lines</TT> array. 
      <P>Remove the linefeed character. 
      <P>Split the string into three fields. 
      <P>If any of the three fields are not present in the line, provide a 
      default value of an empty string. Notice that a numeric value must be 
      given to <TT>$price</TT> instead of the empty string. 
      <P>Invoke the <TT>format</TT> statement by using the <TT>write()</TT> 
      function.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.6-11LIST05.PL - Using a Function with a Value 
      Line</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>format =
  @<<<<<<<<<<<<<<<<  @<<<<<<<<<<<<<<<  $@##.##
  dotize(17, $album), dotize(16, $artist), $price
.

format STDOUT_TOP =
  @||||||||||||||||||||||||||||||||||||  Pg @<
  "CD Collection of David Medinets",        $%

  Album              Artist            Price
  -----------------  ----------------  -------
.

sub dotize {
    my($width, $string) = @_;

    if (length($string) > $width) {
        return(substr($string, 0, $width - 3) . "...");
    }
    else {
        return($string);
    }
}

open(FILE, "<format.dat");
@lines = <FILE>;
close(FILE);

foreach (@lines) {
    chop();
    ($album, $artist, $price) = (split(/!/));
    $album  = "" if !defined($album);
    $artist = "" if !defined($artist);
    $price  = 0 if !defined($price);
    write();
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays the following: 
<P><B><PRE>      CD Collection of David Medinets     Pg 1

  Album              Artist            Price
  -----------------  ----------------  -------
  The Lion King                        $  0.00
  Tumbleweed Con...  Elton John        $123.32
  Photographs &amp; ...  Jim Croce         $  4.95
  Heads &amp; Tales      Harry Chapin      $ 12.50</PRE></B>The second and third 
detail lines have benefited from the <TT>dotize()</TT> function. You can use a 
similar technique to invoke any function in the value line. You can also use 
expressions directly in the value line, but it might be harder to maintain 
because the intent of the expression might not be clear. 
<P>

### Example: Changing Formats

So far, you've seen only how to use a single format statement per report. If Perl 
could handle only one format per report, it wouldn't have much utility as a 
reporting tool. Fortunately, by using the <TT>$~</TT> special variable, you can 
control which format is used for any given <TT>write()</TT> function call. 
Listing 11.7 shows a program that tracks the price of the CDs in the collection 
and displays the total using an alternate <TT>format</TT> statement. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare a format for the <TT>STDOUT</TT> file handle. 
      <P>Declare a format for the total price information. 
      <P>Declare a heading format for the <TT>STDOUT</TT> file handle. 
      <P>Declare the <TT>dotize()</TT> function. 
      <P>Initialize local variables called <TT>$width</TT> and <TT>$string</TT>. 

      <P>If the width of <TT>$string</TT> is greater than <TT>$width</TT>, 
      return a value that consists of <TT>$string</TT> shortened to 
      <TT>$width-3</TT> with <TT>...</TT> appended to the end; otherwise, return 
      <TT>$string</TT>. 
      <P>Open the <TT>FORMAT.DAT</TT> file, read all the lines into 
      <TT>@lines</TT>, and then close the file. 
      <P>Initialize the <TT>$total</TT> variable to zero.
      <P>Iterate over the <TT>@lines</TT> array. 
      <P>Remove the linefeed character. 
      <P>Split the string into three fields. 
      <P>Provide a default value for any empty variables. 
      <P>Invoke the format statement by using the <TT>write()</TT> function. 
      <P>Change the current format by assigning a value to the <TT>$~</TT> 
      special variable. 
      <P>Invoke the <TT>format</TT> statement by using the <TT>write()</TT> 
      function.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.7-11LST07.PL - Using an Alternative <I>format</I> 
      Statement</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>format =
  @<<<<<<<<<<<<<<<<  @<<<<<<<<<<<<<<<  $@###.##
  dotize(17, $album), dotize(16, $artist), $price
.

format STDOUT_TOTAL =
  ---------------------------------------------
                                       $@###.##
                                        $total
.

format STDOUT_TOP =
  @||||||||||||||||||||||||||||||||||||  Pg @<
  "CD Collection of David Medinets",        $%

  Album              Artist            Price
  -----------------  ----------------  --------
.

sub dotize {
    my($width, $string) = @_;

    if (length($string) > $width) {
        return(substr($string, 0, $width - 3) . "...");
    }
    else {
        return($string);
    }
}

open(FILE, "<format.dat");
@lines = <FILE>;
close(FILE);

$total = 0;
foreach (@lines) {
    chop();
    ($album, $artist, $price) = (split(/!/));
    $album  = "" if !defined($album);
    $artist = "" if !defined($artist);
    $price  = 0 if !defined($price);
    write();
    $total += $price;
}

$~ = "STDOUT_TOTAL";
write();</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays the following: 
<P><B><PRE>    CD Collection of David Medinets     Pg 1

  Album              Artist            Price
  -----------------  ----------------  --------
  The Lion King                        $   0.00
  Tumbleweed Con...  Elton John        $ 123.32
  Photographs &amp; ...  Jim Croce         $   4.95
  Heads &amp; Tales      Harry Chapin      $  12.50
  ---------------------------------------------
                                       $ 140.77</PRE></B>This example shows you 
how to keep a running total and how to switch to an alternative detail line 
format. If you need to switch to an alternative heading format, assign the new 
header format name to the <TT>$^</TT> special variable. 
<P>

### Example: Using Long Pieces of Text in Reports

By using the <TT>^</TT>, <TT>~,</TT> and <TT>~~</TT> formatting characters in your format statements, you can use long 
pieces of text in a report: for example, the first paragraph of a paper's 
abstract or some notes associated with a database record. Listing 11.8 shows a 
program that prints the definition of a word. The definition is too long to fit 
in one column, so the <TT>^</TT> formatting character is used to split the text 
onto multiple lines. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare a format for the <TT>STDOUT</TT> file handle. The field and 
      value lines are repeated enough times to print the entire length of the 
      expected output. 
      <P>Initialize the <TT>$word</TT> and <TT>$definition</TT> variables. The 
      <TT>$definition</TT> variable is initialized by using concatenated strings 
      to avoid line breaks caused by the book printing process. 
      <P>A line of asterisks is printed. 
      <P>The format is invoked. 
      <P>Another line of asterisks is printed.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.8-11LST08.PL - Using the <I>^</I> Formatting Character to 
      Print Long Text Values</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>format =
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  $word,    $definition
.

$word = "outlier";

$definition = "1. someone sleeping outdoors. " .
    "2. someone whose office is not at home. " .
    "3. an animal who strays from the fold. " .
    "4. something that has been separated from the main body.";

print("****************\n");
write();
print("****************\n");</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays the following: 
<P><B><PRE>****************
  outlier   1. someone sleeping outdoors. 2.
            someone whose office is not at
            home. 3. an animal who strays from
            the fold. 4. something that has
            been separated from the main body.

****************</PRE></B>The <TT>^</TT> formatting character causes Perl to do 
word-wrapping on the specified variable. <I>Word-wrapping</I> means that Perl 
will accumulate words into a temporary buffer, stopping when the next word will 
cause the length of the accumulated string to exceed the length of the field. 
The accumulated string is incorporated into the report, and the accumulated 
words are removed from the variable. Therefore, the next time Perl looks at the 
variable, it can start accumulating words that have not been used yet. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Any linefeed characters in the variable are ignored 
      when the <TT>^</TT> formatting character is used in the <TT>format</TT> 
      statement.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>Because the value of the variable used in the value 
      line changes when word-wrapping is being used, make sure to use only 
      copies of variables in the <TT>format</TT> statement. By using copies of 
      the variables, you'll still have the original value available for further 
      processing.</TD></TR></TBODY></TABLE>
<P>The asterisks in the preceding example were printed to show that a blank line 
was printed by the format. This was caused because the <TT>$definition</TT> 
variable ran out of words before the format ran out of space. Extra blank lines 
can be eliminated by placing the <TT>~</TT> character somewhere - usually at the 
beginning or end - of the field line. The <TT>format</TT> statement would then 
look like this: 
<P><B><PRE>format =
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~
  $word,    $definition
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~
  $word,    $definition
.</PRE></B>The new report would not have a blank line. 
<P><B><PRE>****************
  outlier   1. someone sleeping outdoors. 2.
            someone whose office is not at
            home. 3. an animal who strays from
            the fold. 4. something that has
            been separated from the main body.
****************</PRE></B>It is rather wasteful to have to repeat the field 
lines often enough to account for the longest possible length of 
<TT>$definition</TT>. In fact, if you are reading the definitions from a file, 
you might not know how long the definitions could be ahead of time. Perl 
provides the <TT>~~</TT> character sequence to handle situations like this. By 
placing <TT>~~</TT> on the field line, Perl will repeat the field line as often 
as needed until a blank line would be printed. Using this technique would change 
the format statement to this: 
<P><B><PRE>format =
  ^<<<<<<<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~~
  $word,    $definition
.</PRE></B>You might be wondering how Perl decides when a word ends. This 
behavior is controlled by the <TT>$:</TT> variable. The default value for 
<TT>$:</TT> is a string consisting of the space, newline, and dash characters. 
<P>

### Example: Writing to a File Instead of STDOUT

Up to this point in the chapter, we've 
only looked at writing a report to the display or <TT>STDOUT</TT>. This was done 
to simplify and shorten the examples . Writing a report to a file requires that 
you open a file for output and specify the file handle as a parameter to the 
<TT>write()</TT> function. All functionality you've seen so far can be used with 
files. 
<P>Listing 11.9 shows how easy it is to convert an existing program from using 
<TT>STDOUT</TT> to using a file. The program shown is a reworking of the program 
in Listing 11.4. Four changes needed to be made for the conversion. The format 
statement was changed to specify a format name identical to the file handle used 
in the second <TT>open()</TT> statement. A second <TT>open()</TT> statement was 
added. The <TT>write()</TT> function was changed to specify the file handle to 
use, and a second <TT>close()</TT> statement was added. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare a format for the <TT>CD_REPORT</TT> file handle. 
      <P>Open the <TT>FORMAT.DAT</TT> file, read all the lines into 
      <TT>@lines</TT>, and then close the file. 
      <P>Open the <TT>FORMAT.RPT</TT> file for output to hold the report. 
      <P>Iterate over the <TT>@lines</TT> array. 
      <P>Remove the linefeed character. 
      <P>Split the string into three fields. 
      <P>If any of the three fields are not present in the line, provide a 
      default value of an empty string. Notice that a numeric value must be 
      given to <TT>$price</TT> instead of the empty string. 
      <P>Invoke the <TT>format</TT> statement by using the <TT>write()</TT> 
      function specifying the file handle to use. 
      <P>Close the <TT>FORMAT.RPT</TT> file.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.9-11LST09.PL - Saving a Report in a 
File</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR></I>
<P>format CD_REPORT =
  Album=@<<<<<<<<<<<<<  Artist=@>>>>>>>>>>>>  Price=$@##.##
        $album,                $artist,              $price
.

open(FILE, "<format.dat");
@lines = <FILE>;
close(FILE);

open(CD_REPORT, ">format.rpt");

foreach (@lines) {
    chop;
    ($album, $artist, $price) = (split(/!/));
    $album  = "" if !defined($album);
    $artist = "" if !defined($artist);
    $price  = 0 if !defined($price);
    write(CD_REPORT);
}

close(CD_REPORT);</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program creates a file called <TT>FORMAT.RPT</TT> that contains the 
following: 
<P><B><PRE>  Album=The Lion King   Artist=               Price=$  0.00
  Album=Tumbleweed Con  Artist=   Elton John  Price=$123.32
  Album=Photographs &amp;   Artist=    Jim Croce  Price=$  4.95
  Album=Heads &amp; Tales   Artist= Harry Chapin  Price=$ 12.50</PRE></B>The 
contents of <TT>FORMAT.RPT</TT> are identical to the display created by the 
program in Listing 11.4. 
<P>Using more than one format in reports destined for files is slightly more 
complicated than it was when <TT>STDOUT</TT> was used. The process is more 
involved because you need to make the output file handle the default file handle 
before setting the <TT>$~</TT> or <TT>$^</TT> special variables. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare a format for the <TT>CD_REPORT</TT> file handle. 
      <P>Declare a format for the total price information using 
      <TT>CD_REPORT_TOTAL</TT> as the format name. 
      <P>Declare a heading format for the <TT>CD_REPORT</TT> file handle using 
      <TT>CD_REPORT_TOP</TT> as the format name. 
      <P>Declare the <TT>dotize()</TT> function. 
      <P>Initialize local variables called <TT>$width</TT> and <TT>$string</TT>. 

      <P>If the width of <TT>$string</TT> is greater than <TT>$width</TT>, 
      return a value that consists of <TT>$string</TT> shortened to 
      <TT>$width-3</TT> with <TT>...</TT> appended to the end; otherwise, return 
      <TT>$string</TT>. 
      <P>Open the <TT>FORMAT.DAT</TT> file, read all the lines into 
      <TT>@lines</TT>, and then close the file. 
      <P>Open the <TT>FORMAT.RPT</TT> file for output to hold the report. 
      <P>Initialize the <TT>$total</TT> variable to zero. 
      <P>Iterate over the <TT>@lines</TT> array. 
      <P>Remove the linefeed character. 
      <P>Split the string into three fields. 
      <P>Provide a default value for any empty variables. 
      <P>Invoke the <TT>format</TT> statement by using the <TT>write()</TT> 
      function specifying the <TT>CD_REPORT</TT> file name. 
      <P>Change the current format by assigning a value to the <TT>$~</TT> 
      special variable. This statement uses some advanced concepts and is 
      explained further after the listing. 
      <P>Invoke the <TT>format</TT> statement by using the <TT>write()</TT> 
      function. 
      <P>Close the <TT>FORMAT.RPT</TT> file.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 11.10-11LST10.PL - Using an Alternative <I>format</I> 
      Statement</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>format CD_REPORT =
  @<<<<<<<<<<<<<<<<  @<<<<<<<<<<<<<<<  $@###.##
  dotize(17, $album), dotize(16, $artist), $price
.

format CD_REPORT_TOTAL =
  ---------------------------------------------
                                       $@###.##
                                        $total
.


format CD_REPORT_TOP =
  @||||||||||||||||||||||||||||||||||||  Pg @<
  "CD Collection of David Medinets",        $%

  Album              Artist            Price
  -----------------  ----------------  --------
.

sub dotize {
    my($width, $string) = @_;

    if (length($string) > $width) {
        return(substr($string, 0, $width - 3) . "...");
    }
    else {
        return($string);
    }
}

open(FILE, "<format.dat");
@lines = <FILE>;
close(FILE);

open(CD_REPORT, ">format.rpt");

$total = 0;
foreach (@lines) {
    chop();
    ($album, $artist, $price) = (split(/!/));
    $album  = "" if !defined($album);
    $artist = "" if !defined($artist);
    $price  = 0 if !defined($price);
    write(CD_REPORT);
    $total += $price;
}

select((select(CD_REPORT), $~ = "CD_REPORT_TOTAL")[0]);
write(CD_REPORT);

close(CD_REPORT);</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program creates a file called <TT>FORMAT.RPT</TT> that contains the 
following: 
<P><B><PRE>    CD Collection of David Medinets     Pg 1

  Album              Artist            Price
  -----------------  ----------------  --------
  The Lion King                        $   0.00
  Tumbleweed Con...  Elton John        $ 123.32
  Photographs &amp; ...  Jim Croce         $   4.95
  Heads &amp; Tales      Harry Chapin      $  12.50
  ---------------------------------------------
                                       $ 140.77</PRE></B>The contents of 
<TT>FORMAT.RPT</TT> are identical to the display created by the program in 
Listing 11.7. 
<P>The statement that changes a default file handle and format name is a little 
complicated. Let's take a closer look at it. 
<P><B><PRE>select((select(CD_REPORT), $~ = "CD_REPORT_TOTAL")[0]);</PRE></B>In order 
to understand most statements, you need to look at the innermost parenthesis 
first, and this one is no different. The innermost expression to evaluate is 
<P><B><PRE>select(CD_REPORT), $~ = "CD_REPORT_TOTAL"</PRE></B>You might recall that 
the comma operator lets you place one or more statements where normally you can 
place only one. That's what is happening here. First, <TT>CD_REPORT</TT> is 
selected as the default file handle for the <TT>print</TT> and <TT>write</TT> 
statements, and then the <TT>$~</TT> variable is changed to the new format name. 
By enclosing the two statements inside parentheses, their return values are used 
in an array context. You have probably already guessed that the <TT>[0]</TT> 
notation is then used to retrieve the first element of the array: the value 
returned from the <TT>select()</TT> function. Because the <TT>select()</TT> 
function returns the value of the previous default file handle, after executing 
the second <TT>select()</TT>, the default file handle is restored to its 
previous value. 
<P>This bit of code could have been written like this: 
<P><B><PRE>$oldhandle = select(CD_REPORT);
$~ = "CD_REPORT_TOTAL";
select($oldhandle);</PRE></B>

## Summary

In this chapter, you learned how to create simple reports that incorporate headers, footers, and detail lines. Headers are 
used at the top of each page and can consist of both static text and values from 
variables. Footers are used at the bottom of each page and can consist only of 
static text. Detail lines make up the body of a report. 
<P>Header and detail lines are defined by using <TT>format</TT> statements that 
have alternating field and value lines. The field lines hold the static text and 
field holders while the value lines hold a comma-delimited list of expressions. 
<P>You can use several different format characters when creating the field 
holder to have left-justified, right-justified, or centered fields. You can also 
use word-wrapping to display long pieces of text in your reports. 
<P>Directing a report to a file instead of to <TT>STDOUT</TT> required some 
simple steps. The output file needs to be opened; the file handle needs to be 
specified as the format name in the <TT>format</TT> statement; the format name 
needs to be specified in the <TT>write</TT> statement; and the output file needs 
to be closed. 
<P>The next chapter focuses on special variables. All the different special 
variables you have seen so far - and more - are discussed along with some 
examples of how to use them . 
<P>

## Review Questions

<OL>
  <LI>What is the syntax of the <TT>format</TT> statement? 
  <P></P>
  <LI>What is a footer? 
  <P></P>
  <LI>What function is used to invoke the <TT>format</TT> statement? 
  <P></P>
  <LI>How can you change a detail format line into a header format line? 
  <P></P>
  <LI>What is the <TT>></TT> format character used for? 
  <P></P>
  <LI>What is the <TT>$^L</TT> variable used for? 
  <P></P>
  <LI>Can associative array variables be used in value lines? 
  <P></P>
  <LI>What will the following line of code do? 
  <P><B><PRE>select((select(ANNUAL_RPT), $^ = "REGIONAL_SALES")[0]);</PRE></B></LI></OL>

## Review Exercises

<OL>
  <LI>Modify the program in Listing 11.4 to display the second field as 
  left-justified instead of right-justified. 
  <P></P>
  <LI>Create a report that has both a price and a tax column. Use a tax rate of 
  7 percent. 
  <P></P>
  <LI>Modify the program in Listing 11.7 to display an average of the CD prices 
  instead of the total of the prices. 
  <P></P>
  <LI>Create a program that sends the report in the preceding exercise to a 
  file. Use the <TT>select</TT> statement to change the default file handle so 
  that a file handle does not need to be passed to the <TT>write()</TT> 
  function. 
  <P></P>
  <LI>Modify Listing 11.5 so that each pass through the loop checks the value of 
  <TT>$-</TT>. When the value of <TT>$-</TT> is one less than <TT>$=</TT>, 
  change the value of <TT>$^L</TT> to emulate a footer with variable text. 
  <P></P>
  <LI>Create a report that uses a detail line format with more than one line. 
  How would this affect the program written for Exercise 5?</LI></OL>
