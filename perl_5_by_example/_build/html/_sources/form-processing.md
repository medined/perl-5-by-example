# Form Processing

<P>One of the most popular uses for CGI programs is to process information from 
HTML forms. This chapter gives you an extremely brief overview of HTML and 
Forms. Next you see how the form information is sent to CGI programs. After 
being introduced to form processing, a Guest book application is developed. 
<H2><A name="A Brief Overview of HTML">A Brief Overview of HTML</A></H2>HTML, or 
<B>H</B>yper<B>t</B>ext <B>M</B>arkup <B>L</B>anguage, is used by web 
programmers to describe the contents of a web page. It is not a programming 
language. You simply use HTML to indicate what a certain chunk of text is - such 
as a paragraph, a heading or specially formatted text. All HTML directives are 
specified using matched sets of angle brackets and are usually called 
<I>tags</I>. For example &lt;B&gt; means that the following text should be 
displayed in <B>bold</B>. To stop the bold text, use the &lt;/B&gt; directive. 
Most HTML directives come in pairs and surround the affected text. 
<P>HTML documents need to have certain tags in order for them to be considered 
"correct". The &lt;HEAD&gt;..&lt;/HEAD&gt; set of tags surround the header 
information for each document. Inside the header, you can specify a document 
title with the &lt;TITLE&gt;..&lt;/TITLE&gt; tags. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>HTML tags are case-insensitive. For example, 
      &lt;TITLE&gt; is the same as &lt;title&gt;. However, using all upper case 
      letters in the HTML tags make HTML documents easier to understand because 
      you can pick out the tags more readily.</TD></TR></TBODY></TABLE>
<P>After the document header, you need to have a set of 
&lt;BODY&gt;..&lt;/BODY&gt; tags. Inside the document's body, you specify text 
headings by using a set of &lt;H1&gt;..&lt;/H1&gt; tags. Changing the number 
after the H changes the heading level. For example, &lt;H1&gt; is the first 
level. &lt;H2&gt; is the second level, and so on. 
<P>You can use the &lt;P&gt; tag to indicate paragraph endings or use the 
&lt;BR&gt; to indicate a line break. The &lt;B&gt;..&lt;/B&gt; and 
&lt;I&gt;..&lt;/I&gt; tags are used to indicate bold and italic text. 
<P>The text and tags of the entire HTML document must be surrounded by a set of 
&lt;HTML&gt;..&lt;/HTML&gt; tags. For example: 
<P><B><PRE>&lt;HTML&gt;
&lt;HEAD&gt;&lt;TITLE&gt;This is the Title&lt;/TITLE&gt;&lt;/HEAD&gt;
&lt;BODY&gt;
&lt;H1&gt;This is a level one header&lt;/H1&gt;
&lt;P&gt;This is the first paragraph.
&lt;P&gt;This is the second paragraph and it has &lt;I&gt;italic&lt;/I&gt; text.
&lt;H2&gt;This is a level two header&lt;/H2&gt;
&lt;P&gt;This is the third paragraph and it has &lt;B&gt;bold&lt;/B&gt; text.
&lt;/BODY&gt;
&lt;/HTML&gt;</PRE></B>Most of the time, you will be inserting or modifying text 
inside the &lt;BODY&gt;..&lt;/BODY&gt; tags. 
<P>That's enough about generic HTML. The next section discusses Server-Side 
Includes. Today, Server-Side Includes are replacing some basic CGI programs, so 
it is important to know about them. 
<H2><A name="Server-Side Includes">Server-Side Includes</A></H2>One of the 
newest features that has been added to web servers is that of Server-Side 
Includes or SSI. SSI is a set of functions built into web servers that give HTML 
developers the ability to insert data into HTML documents using special 
directives. This means that you can have dynamic documents without needing to 
create full CGI programs. 
<P>The inserted information can take the form of a local file or a file 
referenced by a URL. You can also include information from a limited set of 
variables - similar to environmental variables. Finally, you can execute 
programs that can insert text into the document. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The only real difference between CGI programs and 
      SSI programs is that CGI programs must output an HTTP header as their 
      first line of output. See "<A 
      href="ch19.htm#HTTP Headers">HTTP 
      Headers</A>" in Chapter 19, "What Is CGI?," for more 
  information.</TD></TR></TBODY></TABLE>
<P>Most web servers need the file extension to be changed from html to shtml in 
order for the server to know that it needs to look for Server-Side directives. 
The file extension is dependent on server configuration, but shtml is a common 
choice. 
<P>All SSI directives look like HTML comments within a document. This way, the 
SSI directives will simply be ignored on web servers that do not support them. 
<P>Table 20.1 shows a partial list of SSI directives supported by the webSite 
server from O'Reilly. Not all web servers will support all of the directives in 
the table. You need to check the documentation of your web server to determine 
what directives it will support. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Table 20.1 shows complete examples of SSI 
      directives. You need to modify the examples so that they work for your web 
      site.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 20.1 - A Partial List of SSI Directives</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Directive</TH>
    <TH align=left>Description </TH></TR>
  <TR>
    <TD vAlign=top>&lt;!--#config timefmt="%c"--&gt; </TD>
    <TD vAlign=top>Changes the format used to display dates.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#config sizefmt="%d bytes"--&gt; </TD>
    <TD vAlign=top>Changes the format used to display file sizes. You may also 
      be able to specify bytes (to display file sizes with commas) or abbrev (to 
      display the file sizes in kilobytes or megabytes).</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#config errmsg="##ERROR!##"--&gt; </TD>
    <TD vAlign=top>Changes the format used to display error messages caused by 
      wayward SSI directives. Error messages are also sent to the server's error 
      log.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#echo var=?--&gt; </TD>
    <TD vAlign=top>Displays the value of the variable specified by ?. Several 
      of the possible variables are mentioned in this table.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#echo var="DOCUMENT_NAME"--&gt; </TD>
    <TD vAlign=top>Displays the full path and filename of the current 
    document.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#echo var="DOCUMENT_URI"--&gt; </TD>
    <TD vAlign=top>Displays the virtual path and filename of the current 
      document.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#echo var="LAST_MODIFIED"--&gt; </TD>
    <TD vAlign=top>Displays the last time the file was modified. It will use 
      this format for display: 05/31/96 16:45:40.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#echo var="DATE_LOCAL"--&gt; </TD>
    <TD vAlign=top>Displays the date and time using the local time zone.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#echo var="DATE_GMT"--&gt; </TD>
    <TD vAlign=top>Displays the date and time using GMT.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#exec cgi="/cgi-bin/ssi.exe"--&gt; </TD>
    <TD vAlign=top>Executes a specified CGI program. It must be activated to 
      be used. You can also use a cmd= option to execute shell commands.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#flastmod virtual="/docs/demo/ssi.txt"--&gt; </TD>
    <TD vAlign=top>Displays the last modification date of the specified file 
      given a virtual path.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#flastmod file="ssi.txt"--&gt; </TD>
    <TD vAlign=top>Displays the last modification date of the specified file 
      given a relative path.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#fsize virtual="/docs/demo/ssi.txt"--&gt; </TD>
    <TD vAlign=top>Displays the size of the specified file given a virtual 
      path.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#fsize file="ssi.txt"--&gt; </TD>
    <TD vAlign=top>Displays the size of the specified file given a relative 
      path.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#include virtual="/docs/demo/ssi.txt"--&gt; </TD>
    <TD vAlign=top>Displays a file given a virtual path.</TD></TR>
  <TR>
    <TD vAlign=top>&lt;!--#include file="ssi.txt"--&gt; </TD>
    <TD vAlign=top>Displays a file given a relative path. The relative path 
      can't start with the ../ character sequence or the / character to avoid 
      security risks.</TD></TR></TBODY></TABLE>
<P>SSI provides a fairly rich set of features to the programmer. You might use 
SSI if you had an existing set of documents to which you wanted to add 
modification dates. You might also have a file you want to include in a number 
of your pages - perhaps to act as a header or footer. You could just use the SSI 
include command on each of those pages, instead of copying the document into 
each page manually. When available, Server-Side Includes provide a good way to 
make simple pages more interesting. 
<P>Before Server-Side Includes were available, a CGI program was needed in order 
to automatically generate the last modification date text or to add a generic 
footer to all pages. 
<P>Your particular web server might have additional directives that you can use. 
Check the documentation that came with it for more information. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>If you'd like more information about Server-Side 
      Includes, check out the following web site: 
      <P><PRE>http://www.sigma.net/tdunn/</PRE>Tim Dunn has created a nice site 
      that documents some of the more technical aspects of web 
  sites.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>I would be remiss if I didn't mention the down side of 
      Server-Side Includes. They are very processor intensive. If you don't have 
      a high-powered computer running your web server and you expect to have a 
      lot of traffic, you might want to limit the number of documents that use 
      Server-Side Includes.</TD></TR></TBODY></TABLE>
<H2><A name="HTML Forms">HTML Forms</A></H2>HTML forms are designed to let a web 
page designer interact with users by letting them fill out a form. The form can 
be composed of elements such as input boxes, buttons, checkboxes, radio buttons, 
and selection lists. All of the form elements are specified using HTML tags 
surrounded by a set of &lt;FORM&gt;..&lt;/FORM&gt; tags. You can have more than 
one form per HTML document. 
<P>There are several modifiers or options used with the &lt;FORM&gt; tag. The 
two most important are METHOD and ACTION: 
<P>
<UL>
  <LI><B>METHOD</B> - Specifies the manner in which form information is passed 
  to the CGI scripts. The normal values are either GET or POST. See "<A 
  href="ch20.htm#Handling Form Information">Handling 
  Form Information</A>" later in this chapter. 
  <P></P>
  <LI><B>ACTION</B> - Specifies the URL of the CGI script that will be invoked 
  when the submit button is clicked. You could also specify an email address by 
  using the mailto: notation. For example, sending mail would be accomplished by 
  ACTION="mailto:medined@mtolive.com" and invoking a CGI script would be 
  accomplished by ACTION="/cgi-bin/feedback.pl".</LI></UL>
<P>Most field elements are defined using the &lt;INPUT&gt; tag. Like the 
&lt;FORM&gt; tag, &lt;INPUT&gt; has several modifiers. The most important are: 
<P>
<UL>
  <LI><B>CHECKED</B> - Specifies that the checkbox or radio button being defined 
  is selected. This modifier should only be used when the element type is 
  checkbox or radio. 
  <P></P>
  <LI><B>NAME</B> - Specifies the name of a form element. Most form elements 
  need to have unique names. You'll see in the "<A 
  href="ch20.htm#Handling Form Information">Handling 
  Form Information</A>" section later in this chapter that your CGI script will 
  use the element names to access form information. 
  <P></P>
  <LI><B>MAXLENGTH</B> - Specifies the maximum number of characters that the 
  user can enter into a form element. If MAXLENGTH is larger than SIZE, the user 
  will be able to scroll to access text that is not visible. 
  <P></P>
  <LI><B>TYPE</B> - Specifies the type of input field. The most important field 
  types are checkbox, hidden, password, radio, reset, submit, and text. 
  <P></P>
  <LI><B>SIZE</B> - Specifies the size of an input field. 
  <P></P>
  <LI><B>VALUE</B> - Specifies the default value for a field. The VALUE modifier 
  is required for radio buttons.</LI></UL>
<P>Let's look at how to specify a plain text field: 
<P><B><PRE>&lt;INPUT TYPE=text NAME=lastName VALUE=WasWaldo SIZE=25 MAXLENGTH=50&gt;</PRE></B>This 
HTML line specifies an input field with a default value of WasWaldo. The input 
box will be 25 characters long although the user can enter up to 50 characters. 
<P>At times, you may want the user to be able to enter text without that text 
being readable. For example, passwords need to be protected so that people 
passing behind the user can't secretly steal them. In order to create a 
protected field, use the password type. 
<P><B><PRE>&lt;INPUT TYPE=password NAME=password SIZE=10&gt;</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>The password input option still sends the text through 
      the Internet without any encryption. In other words, the data is still 
      sent as clear text. The sole function of the password input option is to 
      ensure that the password is not visible on the screen at the time of 
    entry.</TD></TR></TBODY></TABLE>
<P>The &lt;INPUT&gt; tag is also used to define two possible buttons - the 
submit and reset buttons. The submit button sends the form data to a specified 
URL - in other words to a CGI program. The reset button restores the input 
fields on the forms to their default states. Any information that the user had 
entered is lost. Frequently, the VALUE modifier is used to change the text that 
appears on the buttons. For example: 
<P><B><PRE>&lt;INPUT TYPE=submit VALUE="Process Information"&gt;</PRE></B>Hidden 
fields are frequently used as sneaky ways to pass information into a CGI 
program. Even though the fields are hidden, the field name and value are still 
sent to the CGI program when the submit button is clicked. For example, if your 
script generated an email form, you might include a list of email addresses that 
will be carbon-copied when the message is sent. Since the form user doesn't need 
to see the list, the field can be hidden. When the submit button is clicked, the 
hidden fields are still sent to the CGI program along with the rest of the form 
information. 
<P>The last two input types are checkboxes and radio buttons. Checkboxes let the 
user indicate either of two responses. Either the box on the form is checked or 
it is not. The meaning behind the checkbox depends entirely on the text that you 
place adjacent to it. Checkboxes are used when users can check off as many items 
as they'd like. For example: 
<P><B><PRE>&lt;INPUT TYPE=checkbox NAME=orange CHECKED&gt;Do you like the color Orange?
&lt;INPUT TYPE=checkbox NAME=blue   CHECKED&gt;Do you like the color Blue?</PRE></B>Radio 
buttons force the user to select only one of a list of options. Using radio 
buttons for a large number of items (say, over five) is not recommended because 
they take up too much room on a web page. The &lt;SELECT&gt; tag should be used 
instead. Each grouping of radio buttons must have the same name but different 
values. For example, 
<P><B><PRE>Operating System:&lt;BR&gt;
&lt;INPUT TYPE=radio NAME=os VALUE=Win95&gt;Windows 95
&lt;INPUT TYPE=radio NAME=os VALUE=WinNT&gt;Windows NT
&lt;INPUT TYPE=radio NAME=os VALUE=UNIX CHECKED&gt;UNIX
&lt;INPUT TYPE=radio NAME=os VALUE=OS2&gt;OS/2
CPU Type:&lt;BR&gt;
&lt;INPUT TYPE=radio NAME=cpu VALUE=Pentium&gt;Intel Pentium
&lt;INPUT TYPE=radio NAME=cpu VALUE=Alpha CHECKED&gt;DEC Alpha
&lt;INPUT TYPE=radio NAME=cpu VALUE=Unknown&gt;Unknown</PRE></B>You should 
always provide a default value for radio buttons because it is assumed that one 
of them must be selected. Quite often, it is appropriate to provide a "none" or 
"unknown" radio button (like the "CPU Type" in the above example) so that the 
user won't be forced to pick an item at random. 
<P>Another useful form element is the drop-down list input field specified by 
the &lt;SELECT&gt;..&lt;/SELECT&gt; set of tags. This form element provides a 
compact way to let the user choose one item from a list. The options are placed 
inside the &lt;SELECT&gt;..&lt;/SELECT&gt; tags. For example, 
<P><B><PRE>&lt;SELECT NAME=weekday&gt;
&lt;OPTION SELECTED&gt;Monday
&lt;OPTION&gt;Tuesday
&lt;OPTION&gt;Wednesday
&lt;OPTION&gt;Thursday
&lt;OPTION&gt;Friday
&lt;/SELECT&gt;</PRE></B>You can use the SELECTED modifier to make one of the 
options the default. Drop-down lists are very useful when you have three or more 
options to choose from. If you have less, consider using radio buttons. The 
&lt;SELECT&gt; tag has additional options that provide you with much 
flexibility. You can read about these advanced options at: 
<P><B><PRE>http://robot0.ge.uiuc.edu/~carlosp/cs317/ft.4-5f.html</PRE></B>The last 
form element that I should mention is the text box. You can create a multi-line 
input field or text box using the &lt;TEXTAREA&gt;..&lt;/TEXTAREA&gt; set of 
tags. The &lt;TEXTAREA&gt; tag requires both a ROWS and a COLS modifer. You can 
place any default text for the text box inside the 
&lt;TEXTAREA&gt;..&lt;/TEXTAREA&gt; tags. 
<P><B><PRE>&lt;TEXTAREA NAME=comments ROWS=3 COLS=60&gt;&lt;/TEXTAREA&gt;</PRE></B>The 
user's web browser will automatically provide scroll bars as needed. However, 
the text box will probably not word-wrap. In order to move to the next line, the 
user must press the enter key. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>If you'd like a more advanced introduction to HTML 
      forms, try this web site:</TD></TR></TBODY></TABLE>
<P><B><PRE>http://robot0.ge.uiuc.edu/~carlosp/cs317/ft.1.html</PRE></B>
<H2><A name="Handling Form Information">Handling Form Information</A></H2>There 
are two ways for your form to receive form information - the GET method and the 
POST method. The transfer mechanism is specified in the &lt;FORM&gt; tag using 
the METHOD modifier. For example, the following HTML line tells the client web 
browser to send the form information back to the server using the GET method. 
<P><B><PRE>&lt;FORM METHOD=get ACTION=/cgi-bin/gestbook.pl&gt;</PRE></B>The GET method 
appends all of the form data to the end of the URL used to invoke the CGI 
script. A question mark is used to separate the original URL (specified by the 
ACTION modifier in the &lt;FORM&gt; tag) and the form information. The server 
software then puts this information into the QUERY_STRING environment variable 
for use in the CGI script that will process the form. 
<P>The GET method can't be used for larger forms because some web servers limit 
the length of the URL portion of a request. (Check the documentation on your 
particular server.) This means that larger forms might blow up if submitted 
using the GET method. For larger forms, the POST method is the answer. 
<P>The POST method sends all of the form information to the CGI program using 
the STDIN filehandle. The web server will set the CONTENT_LENGTH environment 
variable to indicate how much data the CGI program needs to read. 
<P>The rest of this section develops a function capable of reading both types of 
form information. The goal of the function is to create a hash that has one 
entry for each input field on the form. 
<P>The first step is simply to read the form information. The method used to 
send the information is stored in the REQUEST_METHOD environment variable. 
Therefore, we can examine it to tell if the function needs to look at the 
QUERY_STRING environment variable or the STDIN filehandle. Listing 20.1 contains 
a function called getFormData() that places the form information in a variable 
called $buffer regardless of the method used to transmit the information. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Define the getFormData() function. 
      <P>Initialize a buffer. 
      <P>If the GET method is used, copy the form information into the buffer. 
      <P>If the POST method is used, read the form information into the 
      buffer.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 20.1-20LST01.PL - The First Step is to Get the Form 
      Information.</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>sub getFormData {
    my($buffer) = "";

    if ($ENV{'REQUEST_METHOD'} eq 'GET') {
        $buffer = $ENV{'QUERY_STRING'};
    }
    else {
        read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
    }
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Since a single function can handle both the GET and 
      POST methods, you really don't have to worry about which one to use. 
      However, because of the limitation regarding URL length, I suggest that 
      you stick with the POST method.</TD></TR></TBODY></TABLE>
<P>I'm sure that you find this function pretty simple. But you might be 
wondering what information is contained in the $buffer variable. 
<P>Form information is passed to a CGI program in name=value format and each 
input field is delimited by an ampersand (&amp;). For example, if you have a 
form with two fields - one called name and one called age - the form information 
would look like this: 
<P><B><PRE>name=Rolf+D%27Barno&amp;age=34</PRE></B>Can you see the two input fields? 
First, split up the information using the &amp; as the delimiter: 
<P><B><PRE>name=Rolf+D%27Barno
age=34</PRE></B>Next, split up the two input fields based on the = character: 
<P><B><PRE>Field Name: name    Field Value: Rolf+D%27Barno
Field Name: age     Field Value: 34</PRE></B>Remember the section on URL 
encoding from Chapter 19? You see it in action in the name field. The name is 
really Rolf D'Barno. However, with URL encoding spaces are converted to plus 
signs and some characters are converted to their hexadecimal ASCII equivalents. 
If you think about how a single quote might be mistaken for the beginning of an 
HTML value, you can understand why the ASCII equivalent is used. 
<P>Let's add some features to the getFormData() function to split up the input 
fields and store them in a hash variable. Listing 20.2 shows the new version of 
the getFormData() function. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare a hash variable to hold the form's input fields. 
      <P>Call the getFormData() function. 
      <P>Define the getFormData() function. 
      <P>Declare a local variable to hold the reference to the input field hash. 

      <P>Initialize a buffer. 
      <P>If the GET method is used, copy the form information into the buffer. 
      <P>If the POST method is used, read the form information into the buffer. 
      <P>Iterate over the array returned by the split() function. 
      <P>Decode both the input field name and value. 
      <P>Create an entry in the input field hash variable. 
      <P>Define the decodeURL() function. 
      <P>Get the encoded string from the parameter array. 
      <P>Translate all plus signs into spaces. 
      <P>Convert character coded as hexadecimal digits into regular characters. 
      <P>Return the decoded string.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 20.2-20LST02.PL - The First Step is to Get the Form 
      Information.</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>my(%frmFlds);

getFormData(\%frmFlds);

sub getFormData {
    my($hashRef) = shift;
    my($buffer) = "";

    if ($ENV{'REQUEST_METHOD'} eq 'GET') {
        $buffer = $ENV{'QUERY_STRING'};
    }
    else {
        read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
    }

    foreach (split(/&amp;/, $buffer)) {
        my($key, $value) = split(/=/, $_);
        $key   = decodeURL($key);
        $value = decodeURL($value);
        %{$hashRef}-&gt;{$key} = $value;
    }
}

sub decodeURL {
    $_ = shift;
    tr/+/ /;
    s/%(..)/pack('c', hex($1))/eg;
    return($_);
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>The getFormData() function could be considered complete at this point. It 
correctly reads from both the GET and POST transmission methods, decodes the 
information, and places the input fields into a hash variable for easy access. 
<P>There are some additional considerations of which you need to be aware. If 
you simply display the information that a user entered, there are some risks 
involved that you may not be aware of. Let's take a simple example. What if the 
user enters &lt;B&gt;Rolf&lt;/B&gt; in the name field and you subsequently 
displayed that field's value? Yep, you guessed it, Rolf would be displayed in 
bold! For simple formatting HTML tags this is not a problem, and may even be a 
feature. However, if the user entered an SSI tag, he or she may be able to take 
advantage of a security hole - remember the &lt;!--#exec --&gt; tag? 
<P>You can thwart would-be hackers by converting every instance of &lt; to 
&amp;lt and of &gt; to &amp;gt. The HTML standard allows for certain characters 
to be displayed using symbolic codes. This allows you to display a &lt; 
character without the web browser thinking that a new HTML tag is starting. 
<P>If you'd like to give users the ability to retain the character formatting 
HTML tags, you can test for each tag that you want to allow. When an allowed tag 
is found, reconvert it back to using normal &lt; and &gt; tags. 
<P>You might want to check for users entering a series of &lt;P&gt; tags in the 
hopes of generating pages and pages of blank lines. Also, you might want to 
convert pressing the enter key into spaces so that the line endings that the 
user entered are ignored and the text will wrap normally when displayed by a web 
browser. One small refinement of eliminating the line endings could be to 
convert two consecutive newlines into a paragraph (&lt;P&gt;) tag. 
<P>When you put all of these new features together, you wind up with a 
getFormData() function that looks like Listing 20.3. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Declare a hash variable to hold the form's input fields. 
      <P>Call the getFormData() function. 
      <P>Define the getFormData() function. 
      <P>Declare a local variable to hold the reference to the input field hash. 

      <P>Initialize a buffer. 
      <P>If the GET method is used, copy the form information into the buffer. 
      <P>If the POST method is used, read the form information into the buffer. 
      <P>Iterate over the array returned by the split() function. 
      <P>Decode both the input field name and value. 
      <P>Compress multiple &lt;P&gt; tags into one. 
      <P>Convert &lt; into &amp;lt; and &gt; into &amp;gt; stopping HTML tags 
      from interpretation. 
      <P>Turn back on the bold and italic HTML tags. 
      <P>Remove unneded carriage returns. 
      <P>Convert two newlines into a HTML paragraph tag. 
      <P>Convert single newlines into spaces. 
      <P>Create an entry in the input field hash variable. 
      <P>Define the decodeURL() function. 
      <P>Get the encoded string from the parameter array. 
      <P>Translate all plus signs into spaces. 
      <P>Convert character coded as hexadecimal digits into regular characters. 
      <P>Return the decoded string.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 20.3-20LST03.PL - The First Step is to Get the Form 
      Information.</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>my(%frmFlds);

getFormData(\%frmFlds);

sub getFormData {
    my($hashRef) = shift;
    my($buffer) = "";

    if ($ENV{'REQUEST_METHOD'} eq 'GET') {
        $buffer = $ENV{'QUERY_STRING'};
    }
    else {
        read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
    }

    foreach (split(/&amp;/, $buffer)) {
        my($key, $value) = split(/=/, $_);
        $key   = decodeURL($key);
        $value = decodeURL($value);

        $value =~ s/(&lt;P&gt;\s*)+/&lt;P&gt;/g;   # compress multiple &lt;P&gt; tags.
        $value =~ s/&lt;/&amp;lt;/g;           # turn off all HTML tags.
        $value =~ s/&gt;/&amp;gt;/g;
        $value =~ s/&amp;lt;b&amp;gt;/&lt;b&gt;/ig;    # turn on the bold tag.
        $value =~ s!&amp;lt;/b&amp;gt;!&lt;/b&gt;!ig;
        $value =~ s/&amp;lt;i&amp;gt;/&lt;b&gt;/ig;    # turn on the italic tag.
        $value =~ s!&amp;lt;/i&amp;gt;!&lt;/b&gt;!ig;
        $value =~ s!\cM!!g;            # Remove unneeded carriage returns.
        $value =~ s!\n\n!&lt;P&gt;!g;        # Convert 2 newlines into paragraph.
        $value =~ s!\n! !g;            # Convert newline into spaces.
        %{$hashRef}-&gt;{$key} = $value;
    }
}

sub decodeURL {
    $_ = shift;
    tr/+/ /;
    s/%(..)/pack('c', hex($1))/eg;
    return($_);
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>Tracking security problems seems like a never-ending 
      task but it is very important, especially if you are responsible for a web 
      server. As complicated as the getFormData() function is, it is still not 
      complete. The &lt;TEXTAREA&gt; tag lets users enter an unlimited amount of 
      information. What would happen to your web server if someone used the cut 
      and paste ability in Windows 95 to insert four or five megabytes into your 
      form? Perhaps the getFormData() function should have some type of 
      limitation that any individual field should only be 1,024 bytes in 
    length?</TD></TR></TBODY></TABLE>
<H2><A name="Filling in a Form and Mailing the Information">Filling in a Form 
and Mailing the Information</A></H2>You can have a form's information 
automatically mailed to an email address by using the mailto: notation in the 
ACTION modifier of the &lt;FORM&gt; tag. For example, 
<P><B><PRE>&lt;FORM METHOD=get ACTION=mailto:medined@mtolive.com&gt;</PRE></B>When the 
form's submit button is clicked, the form's information will be mailed to the 
email address specified in the &lt;FORM&gt; tag. The information will be URL 
encoded and all on one line. This means you can't read the information until it 
has been processed. 
<P>It is generally a bad idea to email form information because of the URL 
encoding that is done. It is better to save the information to a data file so 
that you can easily read and analyze it later. Sending notifications by email is 
a good idea. For example, you could tell an email reader that a certain form has 
been completed and that the log file should be checked. If you want to send 
email from a CGI script, you can use the sample program from Listing 18.2 in 
Chapter 18, "<A href="ch18.htm">Using Internet 
Protocols</A>." 
<P>Before sending any form information, ensure that it has been decoded. If you 
are using one of the CGI modules or the decoding functions from Chapter 19, 
"What Is CGI?," then you don't have to worry about this requirement. Otherwise, 
please reread the section called "<A 
href="ch19.htm#URL Encoding">URL Encoding</A>" in 
Chapter 19. 
<P>Make sure to use a Reply-To field in the body of your email message because 
you won't know which login name the CGI program will be running under. Including 
the Reply-To field will ensure that the reader of the message can easily respond 
to the email message if needed. 
<H2><A name="Debugging Form Processing CGI Scripts">Debugging Form Processing 
CGI Scripts</A></H2>CGI programs get their information from three sources: the 
URL that invokes them, environment variables, and from the STDIN filehandle. 
Most of the time, this information comes from the web server that invokes the 
CGI script. However, you can manually recreate the script's normal environment. 
This lets you debug a CGI program from the operating system's command line which 
should save you time. 
<P>The first thing to look at is how to set environment variables. The method 
used depends on your operating system. Table 20.2 shows you how to set 
environment variables for a variety of operating systems. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 20.2 - How to Set Environment Variables by Hand 
  <TBODY>
  <TR>
    <TH align=left>Operating System or UNIX Shell</TH>
    <TH align=left>Command</TH></TR>
  <TR>
    <TD vAlign=top>csh </TD>
    <TD vAlign=top>setenv HTTP_USER_AGENT "Mozilla"</TD></TR>
  <TR>
    <TD vAlign=top>ksh or bash </TD>
    <TD vAlign=top>export HTTP_USER_AGENT="Mozilla"</TD></TR>
  <TR>
    <TD vAlign=top>Win95, WinNT, OS/2 </TD>
    <TD vAlign=top>set HTTP_USER_AGENT = Mozilla</TD></TR></TBODY></TABLE>
<P>In order to recreate the environmental variables that a server sets, you need 
to initialize at least the following environmental variables: 
<P>
<UL>
  <LI>CONTENT_LENGTH - If you are using the POST method of processing 
  information, set this variable to the length of the input. Finding the input 
  length is easier than it sounds. Since you'll be creating a file to hold the 
  test form information, you only need to find that file's size. 
  <P></P>
  <LI>REQUEST_METHOD - You should set this to either GET or POST. 
  <P></P>
  <LI>QUERY_STRING - You should value this variable, if you are using the GET 
  method or if your script needs information passed to it via its URL and the 
  extra information should follow a question mark (?). 
  <P></P>
  <LI>PATH_INFO - If your script needs information passed to it via its URL and 
  the extra information should follow a slash (/), then value this variable with 
  the extra information.</LI></UL>
<P>You also need to initialize any other variables that your program needs. 
Rather than retyping the set commands each time you want to test your CGI 
program, create a shell or batch file. 
<P>The next step is to create a text file that will be substituted for STDIN 
when the CGI program is run. You only need to create this text file if you are 
using the POST method. The text file can be called anything you'd like and 
should contain just one line - the line of form information. For example: 
<P><B><PRE>name=Rolf D'Barno&amp;age=34</PRE></B>Notice that you don't need to use URL 
encoding because the information will not be sent through the Internet. 
<P>When you are ready, execute your CGI program from the command line with a 
command like this: 
<P><B><PRE>perl -w gestbook.pl &lt; input.dat</PRE></B>To summarize the debugging 
process follows these steps: 
<P>
<OL>
  <LI>Create a DOS batch or UNIX script file to initialize the environment 
  variables that your CGI program will use. 
  <P></P>
  <LI>Create a test file that contains the form information. Use an &amp; 
  character between name=value fields. 
  <P></P>
  <LI>Execute your CGI script using file redirection to use the test file as 
  STDIN. 
  <P></P>
  <LI>Fix any errors that arise.</LI></OL>
<H2><A name="Creating a Guest Book for Your Site">Creating a Guest Book for Your 
Site</A></H2>In this section, you create a Guest book for your web site. A Guest 
book gives visitors a place to add comments and see what comments other visitors 
have made. I find that they add to the sense of community that a web site has. 
<P>The sample Guest book application will be presented in two stages. First, an 
HTML form is used to request information, then the information is saved and all 
the Guest book entries are displayed by a CGI program. Second, the CGI program 
is enhanced with better error handling and some new features. Figure 20.1 shows 
what the finished Guest book will look like. 
<P><I>Fig. 20.1 - The Finished Guest Book</I> 
<H3><A name="The Basic Guest Book">The Basic Guest Book</A></H3>Typically a 
Guest book application is reached from a web site's home page. You might want to 
add a link like the following to your home page: 
<P><B><PRE>&lt;A HREF="addgest.htm"&gt;[Guestbook]&lt;/A&gt;</PRE></B>Then place the 
web page in Listing 20.4 into the virtual root directory of your web server. 
Clicking on the hypertext link will bring visitors to the Add Entry form. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start the HTML web page. 
      <P>Define the web page header which holds the title. 
      <P>Start the body of the page. 
      <P>Display a header. 
      <P>Display some instructions. 
      <P>Start a HTML form. 
      <P>Start a HTML table. 
      <P>Each row of the table is another input field. 
      <P>Define the submit button. 
      <P>End the table. 
      <P>End the Form. 
      <P>End the body of the page. 
      <P>End the page. </TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 20.4-ADDGEST.htm - The Add Entry to Guest book HTML 
      Form</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>&lt;HTML&gt;
&lt;HEAD&gt;&lt;TITLE&gt;Add to our Guestbook&lt;/TITLE&gt;&lt;/HEAD&gt;
&lt;BODY&gt;
&lt;CENTER&gt;&lt;H1&gt;Add to our Guestbook&lt;/H1&gt;&lt;/CENTER&gt;
Fill in the blanks below to add to our Guestbook.  The only fields that you
have to fill in are the comments and name section.  Thanks!
&lt;HR&gt;
&lt;FORM METHOD=POST ACTION="/cgi-bin/gestbook.pl"&gt;
  &lt;TABLE BORDER=0 CELLPADDING=10&gt;
    &lt;TR&gt;
      &lt;TD&gt;Your Name:&lt;/TD&gt;
      &lt;TD&gt;&lt;INPUT TYPE=text NAME=name SIZE=30&gt;&lt;/TD&gt;
    &lt;/TR&gt;
    &lt;TR&gt;
      &lt;TD&gt;Email:&lt;/TD&gt;
      &lt;TD&gt;&lt;INPUT TYPE=text NAME=email SIZE=40&gt;&lt;/TD&gt;
    &lt;/TR&gt;
    &lt;TR&gt;
      &lt;TD VALIGN=top&gt;Comments:&lt;/TD&gt;
      &lt;TD&gt;&lt;TEXTAREA NAME=comments COLS=60 ROWS=4&gt;&lt;/TEXTAREA&gt;&lt;/TD&gt;
    &lt;/TR&gt;
  &lt;/TABLE&gt;
  &lt;INPUT TYPE=submit VALUE="Add Entry"&gt; &lt;INPUT TYPE=reset&gt;
&lt;/FORM&gt;
&lt;/BODY&gt;
&lt;/HTML&gt;</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>The only thing you might need to change in order for this form to work is the 
ACTION modifier in the &lt;FORM&gt; tag. The directory where you place the CGI 
program might not be /cgi-bin. The addgest.htm file will generate a web page 
that looks like the following figure. 
<P><I>Fig. 20.2 - The Add Entry Form</I> 
<P>The CGI program in Listing 20.5 is invoked when a visitor clicks on the 
submit button of the Add Entry HTML form. This program will process the form 
information, save it to a data file and then create a web page to display all of 
the entries in the data file. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Turn on the warning option. 
      <P>Turn on the strict pragma. 
      <P>Declare a hash variable to hold the HTML form field data. 
      <P>Get the local time and pretend that it is one of the form fields. 
      <P>Get the data from the form. 
      <P>Save the data into a file. 
      <P>Send the HTTP header to the remote web browser. 
      <P>Send the start of page and header information. 
      <P>Send the heading and request a horizontal line. 
      <P>Call the readFormData() function to display the Guest book entries. 
      <P>End the web page. 
      <P>Define the getFormData() function. 
      <P>Declare a local variable to hold the reference to the input field hash. 

      <P>Initialize a buffer. 
      <P>If the GET method is used, copy the form information into the buffer. 
      <P>If the POST method is used, read the form information into the buffer. 
      <P>Iterate over the array returned by the split() function. 
      <P>Decode both the input field name and value. 
      <P>Compress multiple &lt;P&gt; tags into one. 
      <P>Convert &lt; into &amp;lt; and &gt; into &amp;gt; stopping HTML tags 
      from interpretation. 
      <P>Turn back on the bold and italic HTML tags. 
      <P>Remove unneded carriage returns. 
      <P>Convert two newlines into a HTML paragraph tag. 
      <P>Convert single newlines into spaces. 
      <P>Create an entry in the input field hash variable. 
      <P>Define the decodeURL() function. 
      <P>Get the encoded string from the parameter array. 
      <P>Translate all plus signs into spaces. 
      <P>Convert character coded as hexadecimal digits into regular characters. 
      <P>Return the decoded string. 
      <P>Define the zeroFill() function - turns "1" into "01". 
      <P>Declare a local variable to hold the number to be filled. 
      <P>Declare a local variable to hold the string length that is needed. 
      <P>Find difference between current string length and needed length. 
      <P>If the string is big enough (like "12") then return it. 
      <P>If the string is too big, prefix it with some zeroes. 
      <P>Define the saveFormData() function. 
      <P>Declare two local variables to hold the hash and file name. 
      <P>Open the file for appending. 
      <P>Store the contents of the hash in the data file. 
      <P>Close the file. 
      <P>Define the readFormData() function. 
      <P>Declare a local variable to hold the file name. 
      <P>Open the file for reading. 
      <P>Iterate over the lines of the file. 
      <P>Split the line into four variables using ~ as demlimiter. 
      <P>Print the Guest book entry using a minimal amount of HTML tags. 
      <P>Use a horizontal rule to separate entries. 
      <P>Close the file.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 20.5-20LST05.PL - A CGI Program to Add a Guest book Entry and 
      Display a Guest book HTML Page</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#! /user/bin/perl -w
use strict;

    my(%fields);
    my($sec, $min, $hour, $mday, $mon, $year) = (localtime(time))[0..5];
    my($dataFile) = "data/gestbook.dat";

    $mon  = zeroFill($mon, 2);
    $hour = zeroFill($hour, 2);
    $min  = zeroFill($min, 2);
    $sec  = zeroFill($sec, 2);
    $fields{'timestamp'} = "$mon/$mday/$year, $hour:$min:sec";

    getFormData(\%fields);
    saveFormData(\%fields, $dataFile);

    print("Content-type: text/html\n\n");
    print("&lt;HTML&gt;\n");
    print("&lt;HEAD&gt;&lt;TITLE&gt;Guestbook&lt;/TITLE&gt;&lt;/HEAD&gt;\n");
    print("&lt;H1&gt;Guestbook&lt;/H1&gt;\n");
    print("&lt;HR&gt;\n");
    readFormData($dataFile);
    print("&lt;/BODY&gt;\n");
    print("&lt;/HTML&gt;\n");

sub getFormData {
    my($hashRef) = shift;
    my($buffer) = "";

    if ($ENV{'REQUEST_METHOD'} eq "GET") {
        $buffer = $ENV{'QUERY_STRING'};
    }
    else {
        read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
    }

    foreach (split(/&amp;/, $buffer)) {
        my($key, $value) = split(/=/, $_);
        $key   = decodeURL($key);
        $value = decodeURL($value);

        $value =~ s/(&lt;P&gt;\s*)+/&lt;P&gt;/g;   # compress multiple &lt;P&gt; tags.
        $value =~ s/&lt;/&amp;lt;/g;           # turn off all HTML tags.
        $value =~ s/&gt;/&amp;gt;/g;
        $value =~ s/&amp;lt;b&amp;gt;/&lt;b&gt;/ig;    # turn on the bold tag.
        $value =~ s!&amp;lt;/b&amp;gt;!&lt;/b&gt;!ig;
        $value =~ s/&amp;lt;i&amp;gt;/&lt;b&gt;/ig;    # turn on the italic tag.
        $value =~ s!&amp;lt;/i&amp;gt;!&lt;/b&gt;!ig;
        $value =~ s!\cM!!g;            # Remove unneeded carriage returns.
        $value =~ s!\n\n!&lt;P&gt;!g;        # Convert 2 newlines into paragraph.
        $value =~ s!\n! !g;            # convert newline into space.

        %{$hashRef}-&gt;{$key} = $value;
    }

    $fields{'comments'} =~ s!\cM!!g;
    $fields{'comments'} =~ s!\n\n!&lt;P&gt;!g;
    $fields{'comments'} =~ s!\n!&lt;BR&gt;!g;
}

sub decodeURL {
    $_ = shift;
    tr/+/ /;
    s/%(..)/pack('c', hex($1))/eg;
    return($_);
}

sub zeroFill {
    my($temp) = shift;
    my($len)  = shift;
    my($diff) = $len - length($temp);

    return($temp) if $diff &lt;= 0;
    return(('0' x $diff) . $temp);
}

sub saveFormData {
    my($hashRef) = shift;
    my($file)    = shift;

    open(FILE, "&gt;&gt;$file") or die("Unable to open Guestbook data file.");
    print FILE ("$hashRef-&gt;{'timestamp'}~");
    print FILE ("$hashRef-&gt;{'name'}~");
    print FILE ("$hashRef-&gt;{'email'}~");
    print FILE ("$hashRef-&gt;{'comments'}");
    print FILE ("\n");
    close(FILE);
}

sub readFormData {
    my($file)    = shift;

    open(FILE, "&lt;$file") or die("Unable to open Guestbook data file.");
    while (&lt;FILE&gt;) {
        my($timestamp, $name, $email, $comments) = split(/~/, $_);

        print("$timestamp: &lt;B&gt;$name&lt;/B&gt; &lt;A HREF=mailto:$email&gt;$email&lt;/A&gt;\n");
        print("&lt;OL&gt;&lt;I&gt;$comments&lt;/I&gt;&lt;/OL&gt;\n");
        print("&lt;HR&gt;\n");
    }
    close(FILE);
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program introduces no new Perl tricks so you should be able to easily 
understand it. When the program is invoked, it will read the form information 
and then save the information to the end of a data file. After the information 
is saved, the program will generate an HTML page to display all of the entries 
in the data file. 
<P>While the program in Listing 20.5 works well, there are several things that 
can improve it: 
<P>
<UL>
  <LI>Error Handling - instead of simply dying, the program could generate an 
  error page that indicates the problem. 
  <P></P>
  <LI>Field Validation - blank fields should be checked for and warned against. 
  <P></P>
  <LI>Guest book display - visitors should be able to see the Guest book without 
  needing to add an entry.</LI></UL>
<P>The CGI program in Listing 20.6 implements these new features. If you add 
?display to the URL of the script, the script will simply display the entries in 
the data file. If you add ?add to the URL of the script, it will redirect the 
client browser to the addgest.htm web page. If no additional information is 
passed with the URL, the script will assume that it has been invoked from a form 
and will read the form information. After saving the information, the Guest book 
page will be displayed. 
<P>A debugging routine called printENV() has been added to this listing. If you 
have trouble getting the script to work, you can call the printENV() routine in 
order to display all of the environment variables and any form information that 
was read. Place the call to printENV() right before the &lt;/BODY&gt; tag of a 
web page. The displayError() function calls the printENV() function so that the 
error can have as much information as possible when a problem arises. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Turn on the warning option. 
      <P>Turn on the strict pragma. 
      <P>Declare a hash variable to hold the HTML form field data. 
      <P>Get the local time and pretend that it is one of the form fields. 
      <P>Get the data from the form. 
      <P>Was the program was invoked with added URL information? 
      <P>if the display command was used, display the Guest book. 
      <P>if the add command was use, redirect to the Add Entry page. 
      <P>otherwise display an error page. 
      <P>If no extra URL information, check for blank fields. 
      <P>if blank fields, display an error page. 
      <P>Save the form data. 
      <P>Display the Guest book. 
      <P>Exit the program. 
      <P>Define the displayError() function. 
      <P>Display an error page with a specified error message. 
      <P>Define the displayPage() function. 
      <P>Read all of the entries into a hash. 
      <P>Display the Guest book. 
      <P>Define the readFormData() function. 
      <P>Declare local variables for a file name and a hash reference. 
      <P>Open the file for reading. 
      <P>Iterate over the lines of the file. 
      <P>Split the line into four variables using ~ as demlimiter. 
      <P>Create a hash entry to hold the Guest book information. 
      <P>Close the file. 
      <P>Define the getFormData() function. 
      <P>Declare a local variable to hold the reference to the input field hash. 

      <P>Initialize a buffer. 
      <P>If the GET method is used, copy the form information into the buffer. 
      <P>If the POST method is used, read the form information into the buffer. 
      <P>Iterate over the array returned by the split() function. 
      <P>Decode both the input field name and value. 
      <P>Compress multiple &lt;P&gt; tags into one. 
      <P>Convert &lt; into &amp;lt; and &gt; into &amp;gt; stopping HTML tags 
      from interpretation. 
      <P>Turn back on the bold and italic HTML tags. 
      <P>Remove unneded carriage returns. 
      <P>Convert two newlines into a HTML paragraph tag. 
      <P>Convert single newlines into spaces. 
      <P>Create an entry in the input field hash variable. 
      <P>Define the decodeURL() function. 
      <P>Get the encoded string from the parameter array. 
      <P>Translate all plus signs into spaces. 
      <P>Convert character coded as hexadecimal digits into regular characters. 
      <P>Return the decoded string. 
      <P>Define the zeroFill() function - turns "1" into "01". 
      <P>Declare a local variable to hold the number to be filled. 
      <P>Declare a local variable to hold the string length that is needed. 
      <P>Find difference between current string length and needed length. 
      <P>If the string is big enough (like "12") then return it. 
      <P>If the string is too big, prefix it with some zeroes. 
      <P>Define the saveFormData() function. 
      <P>Declare two local variables to hold the hash and file name. 
      <P>Open the file for appending. 
      <P>Store the contents of the hash in the data file. 
      <P>Close the file. </TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 20.6-20LST06.PL - A More Advanced Guest 
  Book</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#! /user/bin/perl -w
#use strict;

    my(%fields);
    my($sec, $min, $hour, $mday, $mon, $year) = (localtime(time))[0..5];
    my($dataFile) = "data/gestbook.dat";

    $mon  = zeroFill($mon, 2);
    $hour = zeroFill($hour, 2);
    $min  = zeroFill($min, 2);
    $sec  = zeroFill($sec, 2);
    $fields{'timestamp'} = "$mon/$mday/$year, $hour:$min:$sec";

    getFormData(\%fields);

    if ($ENV{'QUERY_STRING'}) {
        if ($ENV{'QUERY_STRING'} eq 'display') {
            displayPage();
        }
        elsif ($ENV{'QUERY_STRING'} eq 'add') {
            print("Location: /addgest.htm\n\n");
        }
        else {
            displayError("Unknown Command: &lt;B&gt;$ENV{'QUERY_STRING'}&lt;/B&gt;");
        }
    }
    else {
        if (length($fields{'name'}) == 0) {
            displayError("Please fill the name field,&lt;BR&gt;\n");
        }
        if (length($fields{'comments'}) == 0) {
            displayError("Please fill the comments field,&lt;BR&gt;\n");
        }
        saveFormData(\%fields, $dataFile);
        displayPage();
    }

    exit(0);

sub displayError {
    print("Content-type: text/html\n\n");
    print("&lt;HTML&gt;\n");
    print("&lt;HEAD&gt;&lt;TITLE&gt;Guestbook Error&lt;/TITLE&gt;&lt;/HEAD&gt;\n");
    print("&lt;H1&gt;Guestbook&lt;/H1&gt;\n");
    print("&lt;HR&gt;\n");
    print("@_&lt;BR&gt;\n");
    print("&lt;HR&gt;\n");
    printENV();
    print("&lt;/BODY&gt;\n");
    print("&lt;/HTML&gt;\n");
    exit(0);
}

sub displayPage {
    my(%entries);

    readFormData($dataFile, \%entries);

    print("Content-type: text/html\n\n");
    print("&lt;HTML&gt;\n");
    print("&lt;HEAD&gt;&lt;TITLE&gt;Guestbook&lt;/TITLE&gt;&lt;/HEAD&gt;\n");
    print("&lt;TABLE&gt;&lt;TR&gt;&lt;TD VALIGN=top&gt;&lt;H1&gt;Guestbook&lt;/H1&gt;&lt;/TD&gt;\n");

    print("&lt;TD VALIGN=top&gt;&lt;UL&gt;&lt;LI&gt;&lt;A HREF=\"/cgi-bin/gestbook.pl?add\"&gt;Add an Entry&lt;/A&gt;\n");
    print("&lt;LI&gt;&lt;A HREF=\"/cgi-bin/gestbook.pl?display\"&gt;Refresh&lt;/A&gt;&lt;/UL&gt;&lt;/TD&gt;&lt;/TR&gt;&lt;/TABLE&gt;\n");
    print("&lt;HR&gt;\n");

    foreach (sort(keys(%entries))) {
        my($arrayRef) = $entries{$_};
        my($timestamp, $name, $email, $comments) = ($_, @{$arrayRef});

        print("$timestamp: &lt;B&gt;$name&lt;/B&gt; &lt;A HREF=mailto:$email&gt;$email&lt;/A&gt;\n");
        print("&lt;OL&gt;$comments&lt;/OL&gt;\n");
        print("&lt;HR&gt;\n");
    }
    print("&lt;/BODY&gt;\n");
    print("&lt;/HTML&gt;\n");
}

sub readFormData {
    my($file)    = shift;
    my($hashRef) = shift;

    open(FILE, "&lt;$file") or displayError("Unable to open Guestbook data file.");
    while (&lt;FILE&gt;) {
        my($timestamp, $name, $email, $comments) = split(/~/, $_);

        $hashRef-&gt;{$timestamp} = [ $name, $email, $comments ];
    }
    close(FILE);
}

sub getFormData {
    my($hashRef) = shift;
    my($buffer) = "";

    if ($ENV{'REQUEST_METHOD'} eq "GET") {
        $buffer = $ENV{'QUERY_STRING'};
    }
    else {
        read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
    }

    foreach (split(/&amp;/, $buffer)) {
        my($key, $value) = split(/=/, $_);
        $key   = decodeURL($key);
        $value = decodeURL($value);

        $value =~ s/(&lt;P&gt;\s*)+/&lt;P&gt;/g;   # compress multiple &lt;P&gt; tags.
        $value =~ s/&lt;/&amp;lt;/g;           # turn off all HTML tags.
        $value =~ s/&gt;/&amp;gt;/g;
        $value =~ s/&amp;lt;b&amp;gt;/&lt;b&gt;/ig;    # turn on the bold tag.
        $value =~ s!&amp;lt;/b&amp;gt;!&lt;/b&gt;!ig;
        $value =~ s/&amp;lt;i&amp;gt;/&lt;b&gt;/ig;    # turn on the italic tag.
        $value =~ s!&amp;lt;/i&amp;gt;!&lt;/b&gt;!ig;
        $value =~ s!\cM!!g;            # Remove unneeded carriage returns.
        $value =~ s!\n\n!&lt;P&gt;!g;        # Convert 2 newlines into paragraph.
        $value =~ s!\n! !g;            # convert newline into space.
        %{$hashRef}-&gt;{$key} = $value;
    }
}

sub decodeURL {
    $_ = shift;
    tr/+/ /;
    s/%(..)/pack('c', hex($1))/eg;
    return($_);
}

sub zeroFill {
    my($temp) = shift;
    my($len)  = shift;
    my($diff) = $len - length($temp);

    return($temp) if $diff &lt;= 0;
    return(('0' x $diff) . $temp);
}

sub saveFormData {
    my($hashRef) = shift;
    my($file)    = shift;

    open(FILE, "&gt;&gt;$file") or die("Unable to open Guestbook data file.");
    print FILE ("$hashRef-&gt;{'timestamp'}~");
    print FILE ("$hashRef-&gt;{'name'}~");
    print FILE ("$hashRef-&gt;{'email'}~");
    print FILE ("$hashRef-&gt;{'comments'}");
    print FILE ("\n");
    close(FILE);
}

sub printENV {
    print "The Environment report&lt;BR&gt;\n";
    print "----------------------&lt;BR&gt;&lt;PRE&gt;\n";
    print "REQUEST_METHOD:  *$ENV{'REQUEST_METHOD'}*\n";
    print "SCRIPT_NAME:     *$ENV{'SCRIPT_NAME'}*\n";
    print "QUERY_STRING:    *$ENV{'QUERY_STRING'}*\n";
    print "PATH_INFO:       *$ENV{'PATH_INFO'}*\n";
    print "PATH_TRANSLATED: *$ENV{'PATH_TRANSLATED'}*&lt;/PRE&gt;\n";

    if ($ENV{'REQUEST_METHOD'} eq 'POST') {
        print "CONTENT_TYPE:    $ENV{'CONTENT_TYPE'}&lt;BR&gt;\n";
        print "CONTENT_FILE:    $ENV{'CONTENT_FILE'}&lt;BR&gt;\n";
        print "CONTENT_LENGTH:  $ENV{'CONTENT_LENGTH'}&lt;BR&gt;\n";
    }
    print("&lt;BR&gt;");

    foreach (sort(keys(%ENV))) {
        print("$_: $ENV{$_}&lt;BR&gt;\n");
    }
    print("&lt;BR&gt;");

    foreach (sort(keys(%fields))) {
        print("$_: $fields{$_}&lt;BR&gt;\n");
    }
    print("&lt;BR&gt;");
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>One of the major changes between Listing 20.5 and Listing 20.6 is in the 
readFormData() function. Instead of actually printing the Guest book data, the 
function now creates hash entries for it. This change was done so that an error 
page could be generated if the data file could not be opened. Otherwise, the 
error message would have appeared it the middle of the Guest book page - leading 
to confusion on the part of vistors. 
<P>A table was used to add two hypertext links to the top of the web page. One 
link will let visitors add a new entry and the other refreshes the page. If a 
second visitor has added a Guest book entry while the first visitor was reading, 
refreshing the page will display the new entry. 
<H2><A name=Summary>Summary</A></H2>This chapter introduced you to HTML forms 
and form processing. You learned that HTML tags provide guidelines about how the 
content of a document is structured. For example, the &lt;P&gt; tag indicates a 
new paragraph is starting and the &lt;H1&gt;..&lt;/H1&gt; tags indicate a text 
heading. 
<P>A "correct" HTML document will be entirely enclosed inside of a set of 
&lt;HTML&gt;..&lt;/HTML&gt; tags. Inside the &lt;HTML&gt; tag are 
&lt;HEAD&gt;..&lt;/HEAD&gt; (surrounds document identification information) and 
&lt;BODY&gt;..&lt;/BODY&gt; (surrounds document content information) tags. 
<P>After the brief introduction to HTML, you read about Server-Side Includes. 
They are used to insert information into a document at the time that the page is 
sent to the web browser. This lets the document designer create dynamic pages 
without needing CGI programs. For example, you can display the last modification 
date of a document, or include other document such as a standard footer file. 
<P>Next, HTML forms were discussed. HTML forms display input fields that query 
the visitor to your web site. You can display input boxes, checkboxes, radio 
buttons, selection lists, submit buttons and reset buttons. Everything inside a 
set of &lt;FORM&gt;..&lt;/FORM&gt; tags is considered one form. You can have 
multiple forms on a single web page. 
<P>The &lt;FORM&gt; tag takes two modifiers. The ACTION modifier tell the web 
browser the name of the CGI program that gets invoked when the form's submit 
button is clicked. And the METHOD modifier determines how the form information 
should be sent to the CGI program. If the GET method is used, the information 
from the form's fields will be available in the QUERY_STRING environment 
variable. IF the POST method is used, the form information will be available via 
the STDIN variable. 
<P>The getFormData() function was developed to process form information about 
make it available via a hash variable. This function is the first line of 
defense against hackers. By investing time developing this function to close 
security holes, you are rewarded by having a safer, more stable web site. 
<P>Debugging a CGI script takes a little bit of preparation. First, create a 
batch or shell file that defines the environment variables that your CGI program 
needs. Then, create a test input file if you are using the POST method. Lastly, 
execute the CGI program from the command line using re-direction to point STDIN 
to your test input file. 
<P>Next, a Guest book application was presented. This application used an HTML 
form to gather comments from a user. The comments are saved to a database. Then, 
all of the comments stored in the database are displayed. The first version of 
the Guest book required the user to add an entry before seeing the contents of 
the Guest book. The second version of the Guest book let users view the contents 
without this requirement. In addition, better error checking and new features 
were added. 
<P>The next chapter, "<A href="ch21.htm">Using Perl 
with Web Servers</A>," explores web server log files and ways to automatically 
create web pages. 
<H2><A name="Review Questions">Review Questions</A></H2>
<OL>
  <LI>What does the acronym HTML stand for? 
  <P></P>
  <LI>What are the &lt;H1&gt;..&lt;/H1&gt; set of tags used for? 
  <P></P>
  <LI>What is the down side of using SSI directives? 
  <P></P>
  <LI>Can an HTML form have two submit buttons? 
  <P></P>
  <LI>Why should all angle brackets be replaced in form information? 
  <P></P>
  <LI>How much text can be entered into a &lt;TEXTAREA&gt; input field? 
  <P></P>
  <LI>Can you debug a CGI script?</LI></OL>
<H2><A name="Review Exercises">Review Exercises</A></H2>
<OL>
  <LI>Create a HTML document with a title of "My First HTML Document." 
  <P></P>
  <LI>Modify the document from exercise one to include a form with two input 
  boxes and a text area field. 
  <P></P>
  <LI>Modify the getFormData() function from Listing 20.3 to limit field 
  information to 1,024 characters or less. 
  <P></P>
  <LI>Modify the second Guest book application to only display the first ten 
  entries. Add hypertext links to read the next and previous ten 
entries.</LI></OL>