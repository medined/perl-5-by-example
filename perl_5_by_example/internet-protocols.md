# Using Internet Protocols

<P>One of the reasons the Internet has blossomed so quickly is because everyone 
can understand the <I>protocols</I> that are spoken on the net. A protocol is a 
set of commands and responses. There are two layers of protocols that I'll 
mention here. The low-level layer is called TCP/IP and while it is crucial to 
the Internet, we can effectively ignore it for now. The high-level protocols 
like ftp, smtp, pop, http, and telnet are what you'll read about in this 
chapter. They use TCP/IP as a facilitator to communicate between computers. The 
protocols all have the same basic pattern: 
<P>
<UL>
  <LI><B>Begin a Conversation</B> - Your computer (the client) starts a 
  conversation with another computer (the server). 
  <P></P>
  <LI><B>Hold a Conversation</B> - During the conversation, commands are sent 
  and acknowledged. 
  <P></P>
  <LI><B>End a Conversation</B> - The conversation is terminated.</LI></UL>
<P>Figure 18.1 shows what the protocol for sending mail looks like. The end-user 
creates a mail message and then the sending system, using the mail protocol, 
holds a conversation with the receiving system. </P>
<P><I>Fig. 18.1 - Figure 18.1 - All Protocols Follow This Communications 
Model.</I> 
<P>Internet conversations are done with sockets, in a manner similar to using 
the telephone or shouting out a window. I won't kid you, sockets are a 
complicated subject. They are discussed in the "<A 
href="ch18.htm#Sockets">Sockets</A>" section which 
follows. Fortunately, you only have to learn about a small subset of the socket 
functionality in order to use the high-level protocols. 
<P>Table 18.1 provides a list of the high-level protocols that you can use. This 
chapter will not be able to cover them all, but if you'd like to investigate 
further, the protocols are detailed in documents at the 
<B>http://ds.internic.net/ds/dspg0intdoc.html</B> web site. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 18.1-A Small Sampling of Protocols</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Protocol </TH>
    <TH align=left>Number </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>auth </TD>
    <TD vAlign=top>113 </TD>
    <TD vAlign=top>Authentication</TD></TR>
  <TR>
    <TD vAlign=top>echo </TD>
    <TD vAlign=top>7 </TD>
    <TD vAlign=top>Checks server to see if they are running.</TD></TR>
  <TR>
    <TD vAlign=top>finger </TD>
    <TD vAlign=top>79 </TD>
    <TD vAlign=top>Lets you retrieve information about a user.</TD></TR>
  <TR>
    <TD vAlign=top>ftp </TD>
    <TD vAlign=top>21 </TD>
    <TD vAlign=top>File Transfer Protocol</TD></TR>
  <TR>
    <TD vAlign=top>nntp </TD>
    <TD vAlign=top>119 </TD>
    <TD vAlign=top>Network News Transfer Protocol - Usenet News Groups</TD></TR>
  <TR>
    <TD vAlign=top>pop </TD>
    <TD vAlign=top>109 </TD>
    <TD vAlign=top>Post Office Protocol - incoming mail</TD></TR>
  <TR>
    <TD vAlign=top>smtp </TD>
    <TD vAlign=top>25 </TD>
    <TD vAlign=top>Simple Mail Transfer Protocol - outgoing mail</TD></TR>
  <TR>
    <TD vAlign=top>time </TD>
    <TD vAlign=top>37 </TD>
    <TD vAlign=top>Time Server</TD></TR>
  <TR>
    <TD vAlign=top>telnet </TD>
    <TD vAlign=top>23 </TD>
    <TD vAlign=top>Lets you connect to a host and use it as if you were a 
      directly connected terminal.</TD></TR></TBODY></TABLE>
<P>Each protocol is also called a service. Hence the term, mail server or ftp 
server. Underlying all of the high-level protocols is the very popular Transfer 
Control Protocol/Internet Protocol or TCP/IP. You don't need to know about 
TCP/IP in order to use the high-level protocols. All you need to know is that 
TCP/IP enables a server to <I>listen</I> and respond to an incoming 
conversation. Incoming conversations arrive at something called a port. A 
<I>Port</I> is an imaginary place where incoming packets of information can 
arrive (just like a ship arrives at a sea port). Each type of service (for 
example, mail or file transfer) has its own port number. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>If you have access to a UNIX machine, look at the 
      /etc/services file for a list of the services and their assigned port 
      numbers.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>New for the Electronic 
      Edition</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Peter van der Landen pointed out that Windows 95 has 
      a file called \windows\services which has a list of services and their 
      assigned port numbers. It's a good bet that Windows NT has the same file, 
      but I can't verify this yet.
      <P>12/27/96 - Bruce Rhodewait pointed out that Windows NT lists its 
      services in C:\WINNT\SYSTEM32\DRIVERS\etc\services. Of course if you 
      installed Windows NT into a different base directory, use that base 
      directory instead of C:\WINNT.</P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Errata 
  Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The printed version of this book said that you 
      should look in /etc/protocols in order to find the list of services. Peter 
      (from Europe) pointed out this problem.</TD></TR></TBODY></TABLE>
<P>In this chapter, we take a quick look at sockets, and then turn our attention 
to examples that use them. You see how to send and receive mail. Sending mail is 
done using the Simple Mail Transfer Protocol (SMTP) which is detailed in an RFC 
numbered 821. Receiving mail is done using the Post Office Portocol (POP) as 
detailed in RFC 1725. 

## Sockets

<I>Sockets</I> are the low-level links that enable Internet conversations. There are a whole slew of functions that deal 
with sockets. Fortunately, you don't normally need to deal with them all. A 
small subset is all you need to get started. This section will focus in on those 
aspects of sockets that are useful in Perl. There will be whole areas of sockets 
that I won't mention. 
<P>Table 18.2 lists all of the Perl functions that relate to sockets so you have 
a handy reference. But remember, you probably won't need them all. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 18.2-Perl's Socket Functions</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Function </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>accept(NEWSOCKET, SOCKET)</TD>
    <TD vAlign=top>Accepts a socket connection from clients waiting for a 
      connection. The original socket, SOCKET, is left alone, and a new socket 
      is created for the remote process to talk with. SOCKET must have already 
      been opened using the socket() function. Returns true if it succeeded, 
      false otherwise. </TD></TR>
  <TR>
    <TD vAlign=top>bind(SOCKET, PACKED_ADDRESS) </TD>
    <TD vAlign=top>Binds a network address to the socket handle. Returns true 
      if it succeeded, false otherwise.</TD></TR>
  <TR>
    <TD vAlign=top>connect(SOCKET, PACKED_ADDRESS) </TD>
    <TD vAlign=top>Attempts to connect to a socket. Returns true if it 
      succeeded, false otherwise.</TD></TR>
  <TR>
    <TD vAlign=top>getpeername(SOCKET) </TD>
    <TD vAlign=top>Returns the packed address of the remote side of the 
      connection. This function can be used to reject connections for security 
      reasons, if needed.</TD></TR>
  <TR>
    <TD vAlign=top>getsockname(SOCKET) </TD>
    <TD vAlign=top>Returns the packed address of the local side of the 
      connection.</TD></TR>
  <TR>
    <TD vAlign=top>getsockopt(SOCKET, LEVEL, OPTNAME) </TD>
    <TD vAlign=top>Returns the socket option requested, or undefined if there 
      is an error.</TD></TR>
  <TR>
    <TD vAlign=top>listen(SOCKET, QUEUESIZE)</TD>
    <TD vAlign=top>Creates a queue for SOCKET with QUEUESIZE slots. Returns 
      true if it succeeded, false otherwise.</TD></TR>
  <TR>
    <TD vAlign=top>recv(SOCKET, BUFFER, LENGTH, FLAGS)</TD>
    <TD vAlign=top>Attempts to receive LENGTH bytes of data into a buffer from 
      SOCKET. Returns the address of the sender, or the undefined value if 
      there's an error. BUFFER will be grown or shrunk to the length actually 
      read. However, you must initalize BUFFER befure use. For example 
      my($buffer) = '';.</TD></TR>
  <TR>
    <TD vAlign=top>select(RBITS, WBITS, EBITS, TIMEOUT) </TD>
    <TD vAlign=top>Examines file descriptors to see if they are ready or if 
      they have exception conditions pending.</TD></TR>
  <TR>
    <TD vAlign=top>send(SOCKET, BUFFER, FLAGS, [TO]) </TD>
    <TD vAlign=top>Sends a message to a socket. On unconnected sockets you 
      must specify a destination (the TO parameter). Returns the number of 
      characters sent, or the undefined value if there is an error.</TD></TR>
  <TR>
    <TD vAlign=top>setsockopt(SOCKET, LEVEL, OPTNAME, OPTVAL) </TD>
    <TD vAlign=top>Sets the socket option requested. Returns undefined if 
      there is an error. OPTVAL may be specified as undef if you don't want to 
      pass an argument.</TD></TR>
  <TR>
    <TD vAlign=top>shutdown(SOCKET, HOW) </TD>
    <TD vAlign=top>Shuts down a socket connection in the manner indicated by 
      HOW. If HOW = 0, all incoming information will be ignored. If HOW = 1, all 
      outgoing information will stopped. If HOW = 2, then both sending and 
      receiving is disallowed.</TD></TR>
  <TR>
    <TD vAlign=top>socket(SOCKET, DOMAIN, TYPE, PROTOCOL) </TD>
    <TD vAlign=top>Opens a specific TYPE of socket and attaches it to the name 
      SOCKET. See "The Server Side of a Conversation" for more details. Returns 
      true if successful, false if not.</TD></TR>
  <TR>
    <TD vAlign=top>socketpair(SOCK1, SOCK2, DOMAIN, TYPE, PROTO) </TD>
    <TD vAlign=top>Creates an unnamed pair of sockets in the specified domain, 
      of the specified type. Returns true if successful, false if 
  not.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>If you are interested in knowing everything about 
      sockets, you need to get your hands on some UNIX documentation. The Perl 
      set of socket functions are pretty much a duplication of those available 
      using the C language under UNIX. Only the parameters are different because 
      Perl data structures are handled differently. You can find UNIX 
      documentation at <B><A 
      href="http://www.delorie.com/gnu/docs/">http://www.delorie.com/gnu/docs/</A></B> 
      on the World Wide Web.</TD></TR></TBODY></TABLE>
<P>Programs that use sockets inherently use the client-server paradigm. One 
program creates a socket (the server) and another connects to it (the client). 
The next couple of sections will look at both server programs and client 
programs. 

### The Server Side of a Conversation

Server programs will use the socket() function to create a 
socket; bind() to give the socket an address so that it can be found; listen() 
to see if anyone wants to talk; and accept() to start the conversation. Then 
send() and recv() functions can be used to hold the conversation. And finally, 
the socket is closed with the close() funtion. 
<P>The socket() call will look something like this: 
<P><B><PRE>$tcpProtocolNumber = getprotobyname('tcp') || 6;

socket(SOCKET, PF_INET(), SOCK_STREAM(), $tcpProtocolNumber)
    or die("socket: $!");</PRE></B>The first line gets the TCP protocol number 
using the getprotobyname() function. Some systems - such as Windows 95 - do not 
implement this function, so a default value of 6 is provided. Then, the socket 
is created with socket(). The socket name is SOCKET. Notice that it looks just 
like a file handle. When creating your own sockets, the first parameter is the 
only thing that you should change. The rest of the function call will 
<I>always</I> use the same last three parameters shown above. The actual meaning 
of the three parameters is unimportant at this stage. If you are curious, please 
refer to the UNIX documentation previously mentioned. 
<P>Socket names exist in their own namespace. Actually, there are several 
pre-defined namespaces that you can use. The namespaces are called <I>protocol 
families</I> because the namespace controls how a socket connects to the world 
outside your process. For example, the PF_INET namespace used in the socket() 
function call above is used for the Internet. 
<P>Once the socket is created, you need to bind it to an address with the bind() 
function. The bind() call might look like this: 
<P><B><PRE>$port = 20001;
$internetPackedAddress = pack('Sna4x8', AF_INET(), $port, "\0\0\0\0");

bind(SOCKET, $internetPackedAddress)
    or die("bind: $!");</PRE></B>All Internet sockets reside on a computer with 
symbolic name. The server's name in conjunction with a port number makes up a 
socket's address. For example, www.water.com:20001. Symbolic names also have a 
number equivalent known as the dotted decimal address. For example, 145.56.23.1. 
Port numbers are a way of determining which socket at www.water.com you'd like 
to connect to. All port numbers below 1024 (or the symbolic constant, 
IPPORT_RESERVED) are reserved for special sockets. For example, port 37 is 
reserved for a time service and 25 is reserved for the smtp service. The value 
of 20,001 used in this example was picked at random. The only limitations are: 
use a value above 1024 and no two sockets on the same computer should have the 
same port number. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>You can always refer to your own computer using the 
      dotted decimal address of 127.0.0.1 or the symbolic name 
  localhost.</TD></TR></TBODY></TABLE>
<P>The second line of this short example creates a full Internet socket address 
using the pack() function. This is another complicated topic that I will 
sidestep. As long as you know the port number and the server's address, you can 
simply plug those values into the example code and not worry about the rest. The 
important part of the example is the "\0\0\0\0" string. This string holds the 
four numbers that make up the dotted decimal Internet address. If you already 
know the dotted decimal address, convert each number to octal and replace the 
appropriate \0 in the string. 
<P>If you know the symbolic name of the server instead of the dotted decimal 
address, use the following line to create the packed Internet address: 
<P><B><PRE>$internetPackedAddress = pack('S n A4 x8', AF_INET(), $port,
    gethostbyname('www.remotehost.com'));</PRE></B>After the socket has been 
created and an address has been bound to it, you need to create a queue for the 
socket. This is done with the listen() function. The listen() call looks like 
this: 
<P><B><PRE>listen(SOCKET, 5) or die("listen: $!");</PRE></B>This listen() statement 
will create a queue that can handle 5 remote attempts to connect. The sixth 
attempt will fail with an appropriate error code. 
<P>Now that the socket exists, has an address, and has a queue, your program is 
ready to begin a conversation using the accept() function. The accept() function 
makes a copy of the socket and starts a conversation with the new socket. The 
original socket is still available and able to accept connections. You can use 
the fork() function, in UNIX, to create child processes to handle multiple 
conversations. The normal accept() function call looks like this: 
<P><B><PRE>$addr = accept(NEWSOCKET, SOCKET) or die("accept: $!");</PRE></B>Now the 
conversation has been started, use print(), send(), recv(), read(), or write() 
to hold the conversation. The examples later in the chapter show how the 
conversations are held. 

### The Client Side of a Conversation

Client programs will use socket() to create a socket and 
connect() to initiate a connection to a server's socket. Then input/output 
functions are used to hold a conversation. And the close() function closes the 
socket. 
<P>The socket() call for the client program is the same as that used in the 
server: 
<P><B><PRE>$tcpProtocolNumber = getprotobyname('tcp') || 6;

socket(SOCKET, PF_INET(), SOCK_STREAM(), $tcpProtocolNumber)
    or die("socket: $!");</PRE></B>After the socket is created, the connect() 
function is called like this: 
<P><B><PRE>$port = 20001;
$internetPackedAddress = pack('Sna4x8', AF_INET(), $port, "\0\0\0\0");

connect(SOCKET, $internetPackedAddress) or die("connect: $!");</PRE></B>The 
packed address was explained in "<A 
href="ch18.htm#The Server Side of a Conversation">The 
Server Side of a Conversation</A>." The SOCKET parameter has no relation to the 
name used on the server machine. I use SOCKET on both sides for convenience. 
<P>The connect() function is a <I>blocking</I> function. This means that it will 
wait until the connection is completed. You can use the select() function to set 
non-blocking mode, but you'll need to look in the UNIX documentation to find out 
how. It's a bit complicated to explain here. 
<P>After the connection is made, you use the normal input/output functions or 
the send() and recv() functions to talk with the server. 
<P>The rest of the chapter will be devoted to looking at examples of specific 
protocols. Let's start out by looking at the time service. 

## Using the Time Service

It is very important that all computers on a given network report the same time. This 
allows backups and other regularly scheduled events to be automated. Instead of 
manually adjusting the time on every computer in the network, you can designate 
a time server. The other computers can use the time server to determine the 
correct time and adjust their own clocks accordingly. 
<P>Listing 18.1 contains a program that can retrieve the time from any time 
server in the world. Modify the example to access your own time server by 
setting the $remoteServer variable to your server's symbolic name. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Turn on the warning compiler option.</TT> 
      <P><TT>Load the Socket module.</TT> 
      <P><TT>Turn on the strict pragma.</TT> 
      <P><TT>Initialize the $remoteServer to the symbolic name of the time 
      server.</TT> 
      <P><TT>Set a variable equal to the number of seconds in 70 years.</TT> 
      <P><TT>Initialize a buffer variable, $buffer.</TT> 
      <P><TT>Declare $socketStructure.</TT> 
      <P><TT>Declare $serverTime.</TT> 
      <P><TT>Get the tcp protocol and time port numbers, provide defaults in 
      case the getprotobyname() and getservbyname() functions are not 
      implemented.</TT> 
      <P><TT>Initialize $serverAddr with the Internet address of the time 
      server.</TT> 
      <P><TT>Display the current time on the local machine, also called the 
      localhost.</TT> 
      <P><TT>Create a socket using the standard parameters.</TT> 
      <P><TT>Initialize $packedFormat with format specifiers.</TT> 
      <P><TT>Connect the local socket to the remote socket that is providing the 
      time service.</TT> 
      <P><TT>Read the server's time as a 4 byte value. </TT>
      <P><TT>Close the local socket.</TT> 
      <P><TT>Unpack the network address from a long (4 byte) value into a string 
      value.</TT> 
      <P><TT>Adjust the server time by the number of seconds in 70 years.</TT> 
      <P><TT>Display the server's name, the number of seconds difference between 
      the remote time and the local time, and the remote time.</TT> 
      <P><TT>Declare the ctime() function.</TT> 
      <P><TT>Return a string reflecting the time represented by the 
      parameter.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 18.1-18LST01.PL - Getting the Time from a Time Service 
      </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#!/usr/bin/perl  -w

use Socket;
use strict;

my($remoteServer)     = 'saturn.planet.net';

my($secsIn70years)    = 2208988800;
my($buffer)           = '';
my($socketStructure);
my($serverTime);

my($proto)      = getprotobyname('tcp')        || 6;
my($port)       = getservbyname('time', 'tcp') || 37;
my($serverAddr) = (gethostbyname($remoteServer))[4];

printf("%-20s %8s %s\n",  "localhost", 0, ctime(time()));

socket(SOCKET, PF_INET, SOCK_STREAM, $proto)
    or die("socket: $!");

my($packFormat) = 'S n a4 x8';   # Windows 95, SunOs 4.1+
#my($packFormat) = 'S n c4 x8';   # SunOs 5.4+ (Solaris 2)
connect(SOCKET, pack($packFormat, AF_INET(), $port, $serverAddr))
    or die("connect: $!");

read(SOCKET, $buffer, 4);
close(SOCKET);

$serverTime  = unpack("N", $buffer);
$serverTime -= $secsIn70years;

printf("%-20s %8d %s\n", $remoteServer, $serverTime - time,
    ctime($serverTime));

sub ctime {
    return(scalar(localtime($_[0])));
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>Each operating system will have a different method to update the local time. 
So I'll leave it in your hands to figure how to do that. 
<P>The next section is devoted to sending mail. First the protocol will be 
explained and then you see a Perl script that can send a mail message. 

## Sending Mail (SMTP)

Before you send mail, the entire message needs to be composed. You need to know where it is 
going, who gets it, and what the text of the message is. When this information 
has been gathered, you begin the process of transferring the information to a 
mail server. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The mail service will be listening for your 
      connection on TCP port 25. But this information will not be important 
      until you see some Perl code later in the chapter.</TD></TR></TBODY></TABLE>
<P>The message that you prepare can only use alphanumeric characters. If you 
need to send binary information (like files), use the MIME protocol. The details 
of the MIME protocol can be found at the <B><A 
href="http://ds.internic.net/ds/dspg0intdoc.html">http://ds.internic.net/ds/dspg0intdoc.html</A></B> 
web site. 
<P>SMTP uses several commands to communicate with mail servers. These commands 
are described in Table 18.3. The commands are not case-insensitive, which means 
you can use either Mail or MAIL. However, remember that mail addresses are 
case-sensitive. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 18.3-The SMTP Command Set</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Command </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD colSpan=2><I>Basic Commands</I></TD></TR>
  <TR>
    <TD vAlign=top>HELO</TD>
    <TD vAlign=top>Initiates a conversation with the mail server. When using 
      this command you can specify your domain name so that the mail server 
      knows who you are. For example, HELO mailhost2.planet.net.</TD></TR>
  <TR>
    <TD vAlign=top>MAIL</TD>
    <TD vAlign=top>Indicates who is sending the mail. For example, MAIL 
      FROM:<medined@mtolive.com>. Remember this is not your name, it's the 
      name of the person who is sending the mail message. Any returned mail will 
      be sent back to this address.</TD></TR>
  <TR>
    <TD vAlign=top>RCPT</TD>
    <TD vAlign=top>Indicates who is recieving the mail. For example, RCPT 
      TO:<rolf@earthdawn.com>. You can indicate more than one user by 
      issuing multiple RCPT commands.</TD></TR>
  <TR>
    <TD vAlign=top>DATA</TD>
    <TD vAlign=top>Indicates that you are about to send the text (or body) of 
      the message. The message text must end with the following five letter 
      sequence: "\r\n.\r\n".</TD></TR>
  <TR>
    <TD vAlign=top>QUIT</TD>
    <TD vAlign=top>Indicates that the conversation is over.</TD></TR>
  <TR>
    <TD colSpan=2><I>Advanced Commands (see RFC 821 for details)</I></TD></TR>
  <TR>
    <TD vAlign=top>EXPN</TD>
    <TD vAlign=top>Indicates that you are using a mailing list.</TD></TR>
  <TR>
    <TD vAlign=top>HELP</TD>
    <TD vAlign=top>Asks for help from the mail server.</TD></TR>
  <TR>
    <TD vAlign=top>NOOP</TD>
    <TD vAlign=top>Does nothing other than get a reponse from the mail 
    server.</TD></TR>
  <TR>
    <TD vAlign=top>RSET</TD>
    <TD vAlign=top>Aborts the current conversation.</TD></TR>
  <TR>
    <TD vAlign=top>SEND</TD>
    <TD vAlign=top>Sends a message to a user's terminal instead of a 
    mailbox.</TD></TR>
  <TR>
    <TD vAlign=top>SAML</TD>
    <TD vAlign=top>Sends a message to a user's terminal and to a user's 
      mailbox.</TD></TR>
  <TR>
    <TD vAlign=top>SOML</TD>
    <TD vAlign=top>Sends a message to a user's terminal if they are logged on, 
      otherwise sends the message to the user's mailbox.</TD></TR>
  <TR>
    <TD vAlign=top>TURN</TD>
    <TD vAlign=top>Reverses the role of client and server. This might be 
      useful if the client program can also act as a server and needs to receive 
      mail from the remote computer.</TD></TR>
  <TR>
    <TD vAlign=top>VRFY</TD>
    <TD vAlign=top>Verifies the existance and user name of a given mail 
      address. This command is not implemented in all mail servers. And it can 
      be blocked by firewalls.</TD></TR></TBODY></TABLE>
<P>Every command will receive a reply from the mail server in the form of a 
three digit number followed by some text describing the reply. For example, 250 
OK or 500 Syntax error, command unrecognized. The complete list of reply codes 
is shown in Table 18.4. Hopefully, you'll never see most of them. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 18.4-Reply Codes Used by Mail Servers</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Code </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top>211</TD>
    <TD vAlign=top>A system status or help reply.</TD></TR>
  <TR>
    <TD vAlign=top>214</TD>
    <TD vAlign=top>Help Message.</TD></TR>
  <TR>
    <TD vAlign=top>220</TD>
    <TD vAlign=top>The server is ready.</TD></TR>
  <TR>
    <TD vAlign=top>221</TD>
    <TD vAlign=top>The server is ending the conversation.</TD></TR>
  <TR>
    <TD vAlign=top>250</TD>
    <TD vAlign=top>The requested action was completed.</TD></TR>
  <TR>
    <TD vAlign=top>251</TD>
    <TD vAlign=top>The specified user is not local, but the server will 
      forward the mail message.</TD></TR>
  <TR>
    <TD vAlign=top>354</TD>
    <TD vAlign=top>This is a reply to the DATA command. After getting this, 
      start sending the body of the mail message, ending with "\r\n.\r\n".</TD></TR>
  <TR>
    <TD vAlign=top>421</TD>
    <TD vAlign=top>The mail server will be shutdown. Save the mail message and 
      try again later.</TD></TR>
  <TR>
    <TD vAlign=top>450</TD>
    <TD vAlign=top>The mailbox that you are trying to reach is busy. Wait a 
      little while and try again.</TD></TR>
  <TR>
    <TD vAlign=top>451</TD>
    <TD vAlign=top>The requested action was not done. Some error occured in 
      the mail server.</TD></TR>
  <TR>
    <TD vAlign=top>452</TD>
    <TD vAlign=top>The requested action was not done. The mail server ran out 
      of system storage.</TD></TR>
  <TR>
    <TD vAlign=top>500</TD>
    <TD vAlign=top>The last command contained a syntax error or the command 
      line was too long.</TD></TR>
  <TR>
    <TD vAlign=top>501</TD>
    <TD vAlign=top>The parameters or arguments in the last command contained a 
      syntax error.</TD></TR>
  <TR>
    <TD vAlign=top>502</TD>
    <TD vAlign=top>The mail server has not implemented the last command.</TD></TR>
  <TR>
    <TD vAlign=top>503</TD>
    <TD vAlign=top>The last command was sent out of sequence. For example, you 
      might have sent DATA before sending RECV.</TD></TR>
  <TR>
    <TD vAlign=top>504</TD>
    <TD vAlign=top>One of the parameters of the last command has not been 
      implemented by the server.</TD></TR>
  <TR>
    <TD vAlign=top>550</TD>
    <TD vAlign=top>The mailbox that you are trying to reach can't be found or 
      you don't have access rights.</TD></TR>
  <TR>
    <TD vAlign=top>551</TD>
    <TD vAlign=top>The specified user is not local, part of the text of the 
      message will contain a forwarding address.</TD></TR>
  <TR>
    <TD vAlign=top>552</TD>
    <TD vAlign=top>The mailbox that you are trying to reach has run out of 
      space. Store the message and try again tomorrow or in a few days - after 
      the user gets a chance to delete some messages.</TD></TR>
  <TR>
    <TD vAlign=top>553</TD>
    <TD vAlign=top>The mail address that you specified was not syntactically 
      correct.</TD></TR>
  <TR>
    <TD vAlign=top>554</TD>
    <TD vAlign=top>The mail transaction has failed for unknown 
  causes.</TD></TR></TBODY></TABLE>
<P>Now that you've seen all of the SMTP commands and reply codes, let's see what 
a typical mail conversation might look like. In the following conversation, the 
'>' lines are the SMTP commands that your programs issues. The '<' lines 
are the mail server's replies. 
<P><B><PRE>>HELO
<250 saturn.planet.net Hello medined@mtolive.com [X.X.X.X],pleased to meet you

>MAIL From: <(Rolf D'Barno, 5th Circle Archer)>
<250 <(Rolf D'Barno, 5th Circle Archer)>... Sender ok

>RCPT To: <medined@mtolive.com>
<250 <medined@mtolive.com>... Recipient ok

>DATA
<354 Enter mail, end with "." on a line by itself

>From: (Rolf D'Barno, 5th Circle Archer)
>Subject: Arrows
>This is line one.
>This is line two.
>.
<250 AAA14672 Message accepted for delivery

>QUIT
<221 saturn.planet.net closing connection</PRE></B>The bold lines are the 
commands that are sent to the server. Some of the SMTP commands are a bit more 
complex than others. In the next few sections, the MAIL, RCPT and DATA commands 
are discussed. You will also see how to react to undeliverable mail. 

### The MAIL Command

The MAIL command tells the mail server to start a new conversation. It's also used to let the 
mail server know where to send a mail message to report errors. The syntax looks 
like this: 
<P><B><PRE>MAIL FROM:<reverse-path></PRE></B>If the mail server accepts the 
command, it will reply with a code of 250. Otherwise, the reply code will be 
greater than 400. 
<P>In the example shown previously 
<P><B><PRE>>MAIL From:<(medined@mtolive.com)>
<250 <(medined@mtolive.com)>... Sender ok</PRE></B>The reverse-path is 
different from the name given as the sender following the DATA command. You can 
use this technique to give a mailing list or yourself an alias. For example, if 
you are maintaining a mailing list to your college alumnis, you might want the 
name that appears in the reader's mailer to be '87 RugRats instead of your own 
name. 

### The RCPT Command

You tell the mail server who the recipient of your message is by using the RCPT command. You can 
send more than one RCPT command for multiple recipients. The server will respond 
with a code of 250 to each command. The syntax for the RCPT is: 
<P><B><PRE>RCPT TO:<forward-path></PRE></B>Only one recipient can be named per 
RCPT command. If the recipient is not known to the mail server, the response 
code will be 550. You might also get a response code indicating that the 
recipient is not local to the server. If that is the case, you will get one of 
two responses back from the server: 
<P>
<UL>
  <LI><B>251 User not local; will forward to <forward-path></B> - This 
  reply means that the server will forward the message. The correct mail address 
  is returned so that you can store it for future use. 
  <P></P>
  <LI><B>551 User not local; please try <forward-path></B> - This reply 
  means that the server won't forward the message. You need to issue another 
  RCPT command with the new address.</LI></UL>

### The DATA Command

After starting the mail conversation and telling the server who the recipient or recipients 
are, you use the DATA command to send the body of the message. The syntax for 
the DATA command is very simple: 
<P><B><PRE>DATA</PRE></B>After you get the standard 354 response, send the body of the 
message followed by a line with a single period to indicate that the body is 
finished. When the end of message line is received, the server will repond with 
a 250 reply code. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The body of the message can also include several 
      header items like Date, Subject, To, Cc, and From.</TD></TR></TBODY></TABLE>

### Reporting Undeliverable Mail

The mail server is responsible for reporting undeliverable mail, so 
you may not need to know too much about this topic. However, this information 
may come in handy if you ever run a list service or if you send a message from a 
temporary account. 
<P>An endless loop happens when a error notification message is sent to a 
non-existent mailbox. The server keeps trying to send a notification message to 
the reverse-path specified in the MAIL command. 
<P>The answer to this dilema is to specify an empty reverse path in the MAIL 
command of a notification message like this: 
<P><B><PRE>MAIL FROM:<></PRE></B>An entire mail session that delivers a error 
notification message might look like the following: 
<P><B><PRE>MAIL FROM:<>
250 ok
RCPT TO:<@HOST.COM@HOSTW.ARPA>
250 ok
DATA
354 send the mail data, end with .
Date: 12 May 96 12:34:53
From: MEDINED@mtolive.com
To: ROBIN@UIC.HOST.COM
Subject: Problem delivering mail.

Robin, your message to JACK@SILVER.COM was not
delivered.

    SILVER.COM said this:
        "550 No Such User"
.
250 ok</PRE></B>

### Using Perl to Send Mail

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>I found out, on 11/30/96, that some mail servers 
      require you to add your domain name to the HELO command. If your server 
      has this requirement then the server response is <TT>501 HELO requires 
      domain address</TT>.</TD></TR></TBODY></TABLE>I'm sure that by now you've had 
enough theory and would like to see some actual Perl code. Without further 
explanation, Listing 18.2 shows you how to send mail. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>The script in Listing 18.2 was tested on Windows 95. 
      Some comments have been added to indicate changes that are needed for 
      SunOS 4.1+ and SunOS 5.4+ (Solaris 2). The SunOS comments were supplied by 
      Qusay H. Mahmoud - also known as perlman on IRC. <I>Thanks, 
  Qusay!</I></TD></TR></TBODY></TABLE></I>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Turn on the warning compiler option.</TT> 
      <P><TT>Load the Socket module.</TT> 
      <P><TT>Turn on the strict pragma.</TT> 
      <P><TT>Initialize $mailTo which holds the recipient's mail address.</TT> 
      <P><TT>Initialize $mailServer which holds the symbolic name of your mail 
      server.</TT> 
      <P><TT>Initialize $mailFrom which holds the originator's mail 
      address.</TT> 
      <P><TT>Initialize $realName which holds the text that appears in the From 
      header field.</TT> 
      <P><TT>Initialize $subject which holds the text that appears in the 
      Subject header field.</TT> 
      <P><TT>Initialize $body which holds the text of the letter.</TT> 
      <P><TT>Declare a signal handler for the Interrupt signal. This handler 
      will trap users hitting Ctrl+c or Ctrl+break.</TT> 
      <P><TT>Get the protocol number for the tcp protocol and the port number 
      for the smtp service. Windows 95 and NT do not implement the 
      getprotobyname() or getservbyname() functions so default values are 
      supplied.</TT> 
      <P><TT>Initialize $serverAddr with the mail server's Internet 
      address.</TT> 
      <P><TT>The $length variable is tested to see if is defined, if not, then 
      the gethostbyname() function failed.</TT> 
      <P><TT>Create a socket called SMTP using standard parameters.</TT> 
      <P><TT>Initialize $packedFormat with format specifiers.</TT> 
      <P><TT>Connect the socket to the port on the mail server.</TT> 
      <P><TT>Change the socket to use unbuffer input/output. Normally, sends and 
      receives are stored in an internal buffer before being sent to your 
      script. This line of code eliminates the buffering steps.</TT> 
      <P><TT>Create a temporary buffer. The buffer is temporary because it is 
      local to the block surrounded by the curly brackets.</TT> 
      <P><TT>Read two responses from the server. My mail server sends two 
      reponses when the connection is made. Your server may only send one 
      response. </TT>
      <P><TT>If so, delete one of the recv() calls.</TT> 
      <P><TT>Send the HELO command. The sendSMTP() function will take care of 
      reading the response.</TT> 
      <P><TT>Send the MAIL command indicating where messages that the mail 
      server sends back (like undeliverable mail messages) should be sent.</TT> 
      <P><TT>Send the RCPT command to specify the recipient.</TT> 
      <P><TT>Send the DATA command.</TT> 
      <P><TT>Send the body of the letter. Note that no reponses are received 
      from the mail server while the letter is sent.</TT> 
      <P><TT>Send a line containing a single period indicating that you are 
      finished sending the body of the letter.</TT> 
      <P><TT>Send the QUIT command to end the conversation.</TT> 
      <P><TT>Close the socket.</TT> 
      <P><TT>Define the closeSocket() function which will act as a signal 
      handler.</TT> 
      <P><TT>Close the socket.</TT> 
      <P><TT>Call die() to display a message and end the script.</TT> 
      <P><TT>Define the sendSMTP() function.</TT> 
      <P><TT>Get the debug parameter.</TT> 
      <P><TT>Get the smtp command from the parameter array.</TT> 
      <P><TT>Send the smtp command to STDERR if the debug parameters was 
      true.</TT> 
      <P><TT>Send the smtp command to the mail server.</TT> 
      <P><TT>Get the mail server's response.</TT> 
      <P><TT>Send the response to STDERR if the debug parameter was true.</TT> 
      <P><TT>Split the response into reply code and message, and return just the 
      reply code.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 18.2-18LST02.PL - Sending Mail with Perl </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#!/usr/bin/perl -w

use Socket;
use strict;

my($mailTo)     = 'medined@mtolive.com';
my($mailServer) = 'mtolive.com';

my($mailFrom)   = 'medined@mtolive.com';
my($realName)   = "Rolf D'Barno";
my($subject)    = 'Test';
my($body)       = "Test Line One.\nTest Line Two.\n";

$main::SIG{'INT'} = 'closeSocket';

my($proto)      = getprotobyname("tcp")        || 6;
my($port)       = getservbyname("SMTP", "tcp") || 25;
my($serverAddr) = (gethostbyname($mailServer))[4];

die('gethostbyname failed.') unless (defined($serverAddr));

socket(SMTP, AF_INET(), SOCK_STREAM(), $proto)
    or die("socket: $!");

$packFormat = 'S n a4 x8';   # Windows 95, SunOs 4.1+
#$packFormat = 'S n c4 x8';   # SunOs 5.4+ (Solaris 2)

connect(SMTP, pack($packFormat, AF_INET(), $port, $serverAddr))
    or die("connect: $!");

select(SMTP); $| = 1; select(STDOUT);    # use unbuffered i/o.

{
    my($inpBuf) = '';

    recv(SMTP, $inpBuf, 200, 0);
    recv(SMTP, $inpBuf, 200, 0);
}

sendSMTP(1, "HELO\n");
sendSMTP(1, "MAIL From: <$mailFrom>\n");
sendSMTP(1, "RCPT To: <$mailTo>\n");
sendSMTP(1, "DATA\n");

send(SMTP, "From: $realName\n", 0);
send(SMTP, "Subject: $subject\n", 0);
send(SMTP, $body, 0);

sendSMTP(1, "\r\n.\r\n");
sendSMTP(1, "QUIT\n");

close(SMTP);

sub closeSocket {     # close smtp socket on error
    close(SMTP);
    die("SMTP socket closed due to SIGINT\n");
}

sub sendSMTP {
    my($debug)  = shift;
    my($buffer) = @_;

    print STDERR ("> $buffer") if $debug;
    send(SMTP, $buffer, 0);

    recv(SMTP, $buffer, 200, 0);
    print STDERR ("< $buffer") if $debug;

    return( (split(/ /, $buffer))[0] );
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>> HELO
< 250 saturn.planet.net Hello medined@stan54.planet.net
    [207.3.100.120], pleased to meet you
> MAIL From: <medined@mtolive.com>
< 250 <medined@mtolive.com>... Sender ok
> RCPT To: <~r00tbeer@fundy.csd.unbsj.ca>
< 250 <~r00tbeer@fundy.csd.unbsj.ca>... Recipient ok
> DATA
< 354 Enter mail, end with "." on a line by itself
>
.
< 250 TAA12656 Message accepted for delivery
> QUIT
< 221 saturn.planet.net closing connection</PRE></B>The lines in bold are the 
commands that were sent to the server. The body of the letter is not shown in 
the output. However, Figure 18.2 shows how the letter looks when displayed using 
Netscape's mail program. 
<P><I>Fig. 18.2 - The Letter Created by 18LST02.pl</I> 
<P>Listing 18.2, while long, is very straightforward. In order to use it 
yourself, you need only change the first two assignments. Change $mailTo to your 
own email address. And change $mailServer to your own mail server. Now run the 
script. After a minute or two a new mail message will appear in your mailbox. 

## Receiving Mail (POP)

The flip side to sending mail is, of course, receiving it. This is done using the POP or Post 
Office Protocol. Since you've already read about the SMTP protocol in detail, 
I'll skip describing the details of the POP. After all, the details can be read 
in the RFC documents when they are needed. Instead, I'll use the POP3Client 
module - available on the CD-ROM - to demonstrate receiving mail. 
<P>Listing 18.3 contains a program that will <I>filter</I> your mail. It will 
display a report of the authors and subject line for any mail that relates to 
EarthDawn(tm), a role-playing game from FASA. This program will not delete any 
mail from the server, so you can experiment with confidence. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Before trying to run this program, make sure that 
      the POP3Client module (POP3Client.pm) is in the Mail subdirectory of the 
      library directory. You may need to create the Mail subdirectory as I did. 
      On my system, this directory is called c:/perl5/Lib/Mail, it is probably 
      different on your system though. See your system administration if you 
      need help placing the file into the correct directory.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>This script was tested using Windows 95. You might need 
      to modify it for other systems. On SunOS 5.4+ (Solaris 2), you'll need to 
      change the POP3Client module to use a packing format of 'S n c4 x8' 
      instead of 'S n a4 x8'. Other changes might also be 
needed.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Turn on the warning compiler option.</TT> 
      <P><TT>Load the POP3Client module. The POP3Client module will load the 
      Socket module automatically.</TT> 
      <P><TT>Turn on the strict pragma.</TT> 
      <P><TT>Declare some variables used to temporary values.</TT> 
      <P><TT>Define the header format for the report.</TT> 
      <P><TT>Define the detail format for the report.</TT> 
      <P><TT>Initialize $username to a valid username for the mail server.</TT> 
      <P><TT>Initialize $password to a valid password for the user name.</TT> 
      <P><TT>Create a new POP3Client object.</TT> 
      <P><TT>Iterate over the mail messages on the server. $pop->Count holds 
      the number of messages waiting on the server to be read.</TT> 
      <P><TT>Initialize a flag variable. When set true, the script will have 
      </TT>
      <P><TT>a mail message relating to EarthDawn.</TT> 
      <P><TT>Iterate over the headers in each mail messages. The Head() method 
      of the POP3Client module returns the header lines one at a time in the $_ 
      variable.</TT> 
      <P><TT>Store the author's name if looking at the From header line.</TT> 
      <P><TT>Store the subject if looking at the Subject line.</TT> 
      <P><TT>This is the filter test. It checks to see if the word "EarthDawn" 
      is in the subject line. If so, the $earthDawn flag variable is set to true 
      (or 1).</TT> 
      <P><TT>This line is commented out, normally it would copy the text of the 
      message into the @body array.</TT> 
      <P><TT>This line is also commented out, it will delete the current mail 
      message from the server. <B>Use with caution!</B> Once deleted, you can't 
      recover the messages.</TT> 
      <P><TT>Set the flag variable, $earthDawn, to true.</TT> 
      <P><TT>Write a detail line to the report if the flag variable is 
      true.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 18.3-18LST03.PL - Creating a Mail Filter </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#!/usr/bin/perl -w

use Mail::POP3Client;
use strict;

my($i, $from, $subject);

format main::STDOUT_TOP =
    @|||||||||||||||||||||||||||||||||||||||||||||||||  Pg @<
    "Waiting Mail Regarding EarthDawn",                    $%

    Sender                  Subject
    ----------------------  ---------------------------------
.

format main::STDOUT =
    @<<<<<<<<<<<<<<<<<<<<<  @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
           $from,                    $subject
.

my($username)   = 'medined';
my($password)   = 'XXXXXXXX';
my($mailServer) = 'mailhost2.planet.net';

my($pop) = Mail::POP3Client->new($username, $password, $mailServer);

for ($i = 1; $i <= $pop->Count; $i++) {
    my($earthDawn) = 0;

    foreach ($pop->Head($i)) {
        $from = $1 if /From:\s(.+)/;
        $subject = $1 if /Subject:\s(.+)/;

        if (/Subject: .*EarthDawn/) {
            $earthDawn = 1;
        }
    }

    if ($earthDawn) {
        write();
    }
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>Waiting Mail Regarding EarthDawn           Pg 1

    Sender                  Subject
    ----------------------  ---------------------------------
    Bob.Schmitt             [EarthDawn] Nethermancer
    Doug.Stoechel           [EarthDawn] Weaponsmith
    Mindy.Bailey            [EarthDawn] Troubador</PRE></B>When you run this 
script, you should change $username, $password, and $mailServer and the filter 
test to whatever is appropriate for your system. 
<P>You could combine the filter program with the send mail program (from Listing 
18.2) to create an automatic mail-response program. For example, if the subject 
of a message is "Info," you can automatically send a pre-defined message with 
information about a given topic. You could also create a program to 
automatically forward the messages to a covering person while you are on 
vacation. I'm sure that with a little thought you can come up with a half-dozen 
ways to make your life easier by automatically handling some of your in-coming 
mail. 

## Checking for Upness (Echo)

Occasionally it's good to know if a server is up and functioning. 
The echo service is used to make that determination. Listing 18.4 shows a 
program that checks the upness of two servers. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>Windows 95 (and perhaps other operating systems) can't 
      use the SIGALRM interrupt signal. This may cause problems if you use this 
      script on those systems because the program will wait forever when a 
      server does not respond.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Turn on the warning compiler option.</TT> 
      <P><TT>Load the Socket module.</TT> 
      <P><TT>Turn on the strict pragma.</TT> 
      <P><TT>Display a message if the red.planet.net server is reachable.</TT> 
      <P><TT>Display a message if the saturn.planet.net server is 
      reachable.</TT> 
      <P><TT>Declare the echo() function.</TT> 
      <P><TT>Get the host and timeout parameters from the paramter array. If no 
      timeout parameter is specified, 5 seconds wil be used.</TT> 
      <P><TT>Declare some local variables.</TT> 
      <P><TT>Get the tco protocol and echo port numbers.</TT> 
      <P><TT>Get the server's Internet address.</TT> 
      <P><TT>If $serverAddr is undefined then the name of the server was 
      probably incorrect and an error message is displayed.</TT> 
      <P><TT>Check to see if the script is running under Windows 95.</TT> 
      <P><TT>If not under Windows 95, store the old alarm handler function, set 
      the alarm handler to be an anonymous function that simply ends the script, 
      and set an alarm to go off in $timeout seconds.</TT> 
      <P><TT>Initialize the status variable to true.</TT> 
      <P><TT>Create a socket called ECHO.</TT> 
      <P><TT>Initialize $packedFormat with format specifiers.</TT> 
      <P><TT>Connect the socket to the remote server.</TT> 
      <P><TT>Close the socket.</TT> 
      <P><TT>Check to see if the script is running under Windows 95.</TT> 
      <P><TT>If not under Windows 95, reset the alarm and restore the old alarm 
      handler function.</TT> 
      <P><TT>Return the status.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 18.4-18LST04.PL - Using the Echo Service </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#!/usr/bin/perl -w

use Socket;
use strict;

print "red.planet.net is up.\n" if echo('red.planet.net');
print "saturn.planet.net is up.\n" if echo('saturn.planet.net');

sub echo {
    my($host)    = shift;
    my($timeout) = shift || 5;

    my($oldAlarmHandler, $status);

    my($proto)      = getprotobyname("tcp")        || 6;
    my($port)       = getservbyname("echo", "tcp") || 7;
    my($serverAddr) = (gethostbyname($host))[4];

    return(print("echo: $host could not be found, sorry.\n"), 0)
        if ! defined($serverAddr);

    if (0 == Win32::IsWin95) {
        $oldAlarmHandler = $SIG{'ALRM'};
        $SIG{'ALRM'} = sub { die(); };
        alarm($timeout);
    }

    $status = 1;    # assume the connection will work.

    socket(ECHO, AF_INET(), SOCK_STREAM(), $proto)
        or die("socket: $!");

    $packFormat = 'S n a4 x8';   # Windows 95, SunOs 4.1+
    #$packFormat = 'S n c4 x8';   # SunOs 5.4+ (Solaris 2)

    connect(ECHO, pack($packFormat, AF_INET(), $port, $serverAddr))
        or $status = 0;

    close(ECHO);

    if (0 == Win32::IsWin95) {
        alarm(0);
        $SIG{'ALRM'} = $oldAlarmHandler;
    }

    return($status);
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program will display: 
<P><B><PRE>echo: red.planet.net could not be found, sorry.
saturn.planet.net is up.</PRE></B>When dealing with the echo service, you only 
need to make the connection in order to determine that the server is up and 
running. As soon as the connection is made, you can close the socket. 
<P>Most of the program should be pretty familiar to you be now. However, you 
might not immediately realize what return statement in the middle of the echo() 
function does. The return statement is repeated here: 
<P><B><PRE>return(print("echo: $host could not be found, sorry.\n"), 0)
        if ! defined($serverAddr);</PRE></B>The statement uses the comma 
operator to execute two statement where normally you would see one. The last 
statement to be evaluated is the value for the series of statements. In this 
case, a zero value is returned. I'm not recommending this style of coding, but I 
thought you should see it a least once. Now, if you see this technique in 
another programmer's scripts you'll understand it better. The return statement 
could also be done written like this: 
<P><B><PRE>if (! defined($serverAddr) {
    print("echo: $host could not be found, sorry.\n")
    return(0);
}</PRE></B>

## Transferring Files (FTP)

One of the backbones of the Internet is the ability to transfer files. There are 
thousands of servers from which you can download files. For the latest graphic 
board drivers to the best in shareware to the entire set of UNIX sources, FTP is 
the answer. 
<P>The program in Listing 18.5 downloads the perl FAQ in compressed format from 
ftp.cis.ufl.edu and displays a directory in two formats. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>The <A 
      href="ftplib.htm">ftplib.pl</A> file can be 
      found on the CD-ROM that accompanies this book. Please put it into your 
      Perl library directory. I have modified the standard ftplib.pl that is 
      available from the Internet to allow the library to work under Windows 95 
      and Windows NT.</TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Turn on the warning compiler option.</TT> 
      <P><TT>Load the ftplib library.</TT> 
      <P><TT>Turn on the strict pragma.</TT> 
      <P><TT>Declare a variable to hold directory listings.</TT> 
      <P><TT>Turn debugging mode on. This will display all of the protocol 
      commands and responses on STDERR.</TT> 
      <P><TT>Connect to the ftp server providing a userid of anonymous and your 
      email address as the password.</TT> 
      <P><TT>Use the list() function to get a directory listing without first 
      changing to the directory.</TT> 
      <P><TT>Change to the /pub/perl/faq directory.</TT> 
      <P><TT>Start binary mode. This is very important when gets compressed 
      files or executables.</TT> 
      <P><TT>Get the Perl FAQ file.</TT> 
      <P><TT>Use list() to find out which files are in the current directory and 
      then print the list.</TT> 
      <P><TT>Use dir() to find out which files are in the current directory and 
      then print the list.</TT> 
      <P><TT>Turn debugging off.</TT> 
      <P><TT>Change to the /pub/perl/faq directory.</TT> 
      <P><TT>Use list() to find out which files are in the current directory and 
      then print the list.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 18.5-18LST05.PL - Using the ftplib Library 
</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#!/usr/bin/perl -w

require('ftplib.pl');
use strict;

my(@dirList);

ftp::debug('ON');
ftp::open('ftp.cis.ufl.edu', 'anonymous', 'medined@mtolive.com') or die($!);

@dirList = ftp::list('pub/perl/faq');

ftp::cwd('/pub/perl/faq');
ftp::binary();
ftp::gets('FAQ.gz');

@dirList = ftp::list();
print("list of /pub/perl/faq\n");
foreach (@dirList) {
    print("\t$_\n");
}
@dirList = ftp::dir();
print("list of /pub/perl/faq\n");
foreach (@dirList) {
    print("\t$_\n");
}

ftp::debug();
ftp::cwd('/pub/perl/faq');
@dirList = ftp::list();
print("list of /pub/perl/faq\n");
foreach (@dirList) {
    print("\t$_\n");
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE><< 220 flood FTP server (Version wu-2.4(21) Tue Apr 9 17:01:12 EDT 1996) ready.
>> user anonymous
<< 331 Guest login ok, send your complete e-mail address as password.
>> pass .....
<< 230-                     Welcome to the
<< 230-                  University of Florida
.
.
.
<< 230 Guest login ok, access restrictions apply.
>> port 207,3,100,103,4,135
<< 200 PORT command successful.
>> nlst pub/perl/faq
<< 150 Opening ASCII mode data connection for file list.
<< 226 Transfer complete.
>> cwd /pub/perl/faq
<< 250 CWD command successful.
>> type i
<< 200 Type set to I.
>> port 207,3,100,103,4,136
<< 200 PORT command successful.
>> retr FAQ.gz
<< 150 Opening BINARY mode data connection for FAQ.gz (75167 bytes).
<< 226 Transfer complete.
>> port 207,3,100,103,4,138
<< 200 PORT command successful.
>> nlst
<< 150 Opening BINARY mode data connection for file list.
<< 226 Transfer complete.
list of /pub/perl/faq
     FAQ
     FAQ.gz
>> port 207,3,100,103,4,
139
<< 200 PORT command successful.
>> list
<< 150 Opening BINARY mode data connection for /bin/ls.
<< 226 Transfer complete.
list of /pub/perl/faq
     total 568
     drwxrwxr-x   2 1208     31           512 Nov  7  1995 .
     drwxrwxr-x  10 1208     68           512 Jun 18 21:32 ..
     -rw-rw-r--   1 1208     31        197446 Nov  4  1995 FAQ
     -rw-r--r--   1 1208     31         75167 Nov  7  1995 FAQ.gz
list of /pub/perl/faq
     FAQ
     FAQ.gz</PRE></B>I'm sure that you can pick out the different FTP commands 
and responses in this output. Notice that the FTP commands and responses are 
only displayed when the debugging feature is turned on. 

## Reading the News (NNTP)

One of the most valuable services offered on the net is Usenet newsgroups. Most newsgroups 
are question and answer forums. You post a message - perhaps asking a question. 
And, usually, you get a quick response. In addition, a small number of 
newsgroups are used to distribute information. [](./internet-resources.md) describes 
some specific newsgroups that you might want to read. 
<P>Like most services, NNTP uses a client/server model. You connect to a news 
server and request information using NNTP. The protocol consists of a series of 
commands and replies. I think NNTP is a bit more complicated than the other 
because the variety of things you might want to do with news articles is larger. 

<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>Some of the NNTP commands will result in very large 
      responses. For example, the LIST command will retrieve the name of every 
      newsgroup that your server knows about. Since there are over 10,000 
      newsgroups it might take a lot of time for the response to be 
  received.</TD></TR></TBODY></TABLE>
<P>I suggest using Perl to filter newsgroups or to retrieve all the articles 
available and create reports or extracts. Don't use Perl for a full-blown news 
client. Use Java, Visual Basic, or another language that is designed with user 
interfaces in mind. In addition, there are plenty of great free or inexpensive 
news clients available, why reinvent the wheel? 
<P>Listing 18.6 contains an object-oriented program that encapsulates a small 
number of NNTP commands so that you can experiment with the protocol. Only the 
simplest of the commands have been implemented to keep the example small and 
uncluttered. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Turn on the warning compiler option.</TT> 
      <P><TT>Load the Socket mdoule.</TT> 
      <P><TT>Turn on the strict pragma.</TT> 
      <P><TT>Begin the News package. This also started the definition of the 
      News class.</TT> 
      <P><TT>Define the new() function - the constructor for the News 
      class.</TT> 
      <P><TT>Get the class name from the parameter array.</TT> 
      <P><TT>Get the name of the news server from the parameter array.</TT> 
      <P><TT>Declare a hash with two entries - the class properties.</TT> 
      <P><TT>Bless the hash.</TT> 
      <P><TT>Call the initialize() function that connects to the server.</TT> 
      <P><TT>Define a signal handler to gracefully handle Ctrl+C and 
      Ctrl+Break.</TT> 
      <P><TT>Return a reference to the hash - the class object.</TT> 
      <P><TT>Define the initialize() function - connects to the news 
      server.</TT> 
      <P><TT>Get the class name from the parameter array.</TT> 
      <P><TT>Get the protocol number, port number, and server address.</TT> 
      <P><TT>Create a socket.</TT> 
      <P><TT>Initialize the format for the pack() function.</TT> 
      <P><TT>Connect to the news server.</TT> 
      <P><TT>Modify the socket to use non-buffered I/O.</TT> 
      <P><TT>Call the getInitialResponse() function.</TT> 
      <P><TT>Define getInitialResponse() - receive response from 
      connection.</TT> 
      <P><TT>Get the class name from the parameter array.</TT> 
      <P><TT>Initialize a buffer to hold the reponse.</TT> 
      <P><TT>Get the reponse from the server.</TT> 
      <P><TT>Print the response if debugging is turned on.</TT> 
      <P><TT>Define closeSocket() - signal handler.</TT> 
      <P><TT>Close the socket.</TT> 
      <P><TT>End the script.</TT> 
      <P><TT>Define DESTROY() - the deconstructor for the class.</TT> 
      <P><TT>Close the socket.</TT> 
      <P><TT>Define debug() - turns debugging on or off.</TT> 
      <P><TT>Get the class name from the parameter array.</TT> 
      <P><TT>Get the state (on or off) from the parameter array.</TT> 
      <P><TT>Turn debugging on if the state is on or 1.</TT> 
      <P><TT>Turn debugging off if the state is off or 0.</TT> 
      <P><TT>Define send() - send a NNTP command and get a response.</TT> 
      <P><TT>Get the class name from the parameter array.</TT> 
      <P><TT>Get the command from the parameter array.</TT> 
      <P><TT>Print the command if debugging is turned on.</TT> 
      <P><TT>Send the command to the news server.</TT> 
      <P><TT>Get a reply from the news server.</TT> 
      <P><TT>Print the reply if debugging is turned on.</TT> 
      <P><TT>Return the reply to the calling routine.</TT> 
      <P><TT>Define article() - gets an news article from the server.</TT> 
      <P><TT>Get the class name from the parameter array.</TT> 
      <P><TT>Get the article number from the parameter array.</TT> 
      <P><TT>Return the response to the ARTICLE command. No processing of the 
      reponse is needed.</TT> 
      <P><TT>Define group() - gets information about a specific newsgroup.</TT> 
      <P><TT>Get the class name from the parameter array.</TT> 
      <P><TT>Get the newsgroup name from the parameter array.</TT> 
      <P><TT>Split the response using space characters as a delimiter.</TT> 
      <P><TT>Define help() - gets a list of commands and descriptions from 
      server.</TT> 
      <P><TT>Return the response to the HELP command.</TT> 
      <P><TT>Define quit() - ends the session with the server.</TT> 
      <P><TT>Send the QUIT command.</TT> 
      <P><TT>Close the socket.</TT> 
      <P><TT>Start the main package or namespace.</TT> 
      <P><TT>Declare some local variables.</TT> 
      <P><TT>Create a News object.</TT> 
      <P><TT>Turn debugging on.</TT> 
      <P><TT>Get information about the comp.lang.perl.misc newsgroup.</TT> 
      <P><TT>If the reply is good, display the newgroup information.</TT> 
      <P><TT>Turn debugging off.</TT> 
      <P><TT>Initialize some loop variables. The loop will execute 5 times.</TT> 

      <P><TT>Start looping through the article numbers.</TT> 
      <P><TT>Read an article, split the reponse using newline as the 
      delimiter.</TT> 
      <P><TT>Search through the lines of the article for the From and Subject 
      lines.</TT> 
      <P><TT>Display the article number, author, and subject.</TT> 
      <P><TT>Turn debugging on.</TT> 
      <P><TT>Get help from the server. They will be displayed because debugging 
      is on.</TT> 
      <P><TT>Stop the NNTP session.</TT> 
      <P><TT>Define the min() function - find smallest element in parameter 
      array.</TT> 
      <P><TT>Store the first element into $min.</TT> 
      <P><TT>Interate over the parameter array.</TT> 
      <P><TT>If the current element is smaller than $min, set $min equal to 
      it.</TT> 
      <P><TT>Return $min.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 18.6-18LST06.PL - Using the NNTP Protocol to Read Usenet News 
      </B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>#!/usr/bin/perl -w

use Socket;
use strict;

package News;

    sub new {
        my($class)      = shift;
        my($server)     = shift || 'news';

        my($self) = {
            'DEBUG'  => 0,
            'SERVER' => $server,
        };

        bless($self, $class);

        $self->initialize();

        $main::SIG{'INT'} = 'News::closeSocket';

        return($self);
    }

    sub initialize {
        my($self)   = shift;

        my($proto)      = getprotobyname('tcp')        || 6;
        my($port)       = getservbyname('nntp', 'tcp') || 119;
        my($serverAddr) = (gethostbyname($self->{'SERVER'}))[4];

        socket(SOCKET, main::AF_INET(), main::SOCK_STREAM(), $proto)
            or die("socket: $!");

        my($packFormat) = 'S n a4 x8';   # Windows 95, SunOs 4.1+
        #my($packFormat) = 'S n c4 x8';   # SunOs 5.4+ (Solaris 2)

        connect(SOCKET, pack($packFormat, main::AF_INET(), $port, $serverAddr))
            or die("connect: $!");

        select(SOCKET);
        $| = 1;
        select(main::STDOUT);

        $self->getInitialResponse();
    }

    sub getInitialResponse {
        my($self)   = shift;
        my($inpBuf) = '';

        recv(SOCKET, $inpBuf, 200, 0);
        print("<$inpBuf\n") if $self->{'DEBUG'};
    }

    sub closeSocket {     # close smtp socket on error
        close(SOCKET);
        die("\nNNTP socket closed due to SIGINT\n");
    }

    sub DESTROY {
        close(SOCKET);
    }

    sub debug {
        my($self) = shift;
        my($state) = shift;

        $self->{'DEBUG'} = 1 if $state =~ m/on|1/i;
        $self->{'DEBUG'} = 0 if $state =~ m/off|0/i;
    }

    sub send {
        my($self)   = shift;
        my($buffer) = @_;

        print("> $buffer") if $self->{'DEBUG'};
        send(SOCKET, $buffer, 0);

        # Use a large number to receive because some articles
        # can be huge.
        recv(SOCKET, $buffer, 1000000, 0);
        print("< $buffer") if $self->{'DEBUG'};

        return($buffer);
    }

    # NNTP Commands

    sub article {
        my($self)          = shift;
        my($articleNumber) = shift;

        return($self->send("ARTICLE $articleNumber\n"));
    }

    sub group {
        my($self)      = shift;
        my($newsgroup) = shift;

        split(/ /, $self->send("GROUP $newsgroup\n"));
    }

    sub help {
        return($_[0]->send("HELP\n"));
    }

    sub quit {
        $_[0]->send("QUIT\n");
        close(SOCKET);
    }

package main;

    my(@lines, $from, $help, $subject);

    my($obj) = News->new('jupiter.planet.net');
    $obj->debug('ON');

    my($replyCode, $numArticles, $firstArticle, $lastArticle) =
        $obj->group('comp.lang.perl.misc');

    if (211 == $replyCode ) {
        printf("\nThere are %d articles, from %d to %d.\n\n",
            $numArticles, $firstArticle, $lastArticle);
    }

    $obj->debug('OFF');

    my($loopVar);
    my($loopStart) = $firstArticle;
    my($loopEnd)   = min($lastArticle, $firstArticle+5);

    for ($loopVar = $loopStart; $loopVar <= $loopEnd; $loopVar++) {
        @lines = split(/\n/, $obj->article($loopVar));
        foreach (@lines) {
            $from    = $1 if (/From:\s(.*?)\s/);
            $subject = $1 if (/Subject:\s(.*)/);
        }
        print("#$loopVar\tFrom:    $from\n\tSubject: $subject\n\n");
    }

    $obj->debug('ON');
    $help    = $obj->help();

    $obj->quit();

sub min {
    my($min) = shift;

    foreach (@_) {
        $min = $_ if $_ < $min;
    }
    return($min);
}</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE><200 jupiter.planet.net InterNetNews NNRP server INN 1.4 22-Dec-93 ready (post

> GROUP comp.lang.perl.misc
< 211 896 27611 33162 comp.lang.perl.misc

There are 896 articles, from 27611 to 33162.

#27611  From:    rtvsoft@clearlight.com
    Subject: Re: How do I suppress this error message

#27612  From:    aml@world.std.com
    Subject: Re: find and replace

#27613  From:    hallucin@netvoyage.net
    Subject: GRRRR!!!! Connect error!

#27614  From:    mheins@prairienet.org
    Subject: Re: Why does RENAME need parens?

#27615  From:    merlyn@stonehenge.com
    Subject: Re: Date on Perl 2ed moved?
#27616  From:    Tim
    Subject: Re: How do I suppress this error message

> HELP
< 100 Legal commands
  authinfo user Name|pass Password
  article [MessageID|Number]
  body [MessageID|Number]
  date
  group newsgroup
  head [MessageID|Number]
  help
  ihave
  last
  list [active|newsgroups|distributions|schema]
  listgroup newsgroup
  mode reader
  newgroups yymmdd hhmmss ["GMT"] [<distributions>]
  newnews newsgroups yymmdd hhmmss ["GMT"] [<distributions>]
  next
  post
  slave
  stat [MessageID|Number]
  xgtitle [group_pattern]
  xhdr header [range|MessageID]
  xover [range]
  xpat header range|MessageID pat [morepat...]
  xpath xpath MessageID
Report problems to <medined@mtolive.com>
.</PRE></B>The program previously listed is very useful for hacking but it is 
not ready for professional use in several respects. The first problem is that it 
pays no attention to how large the incoming article is. It will read up to one 
million characters. This is probably not good. You might consider a different 
method. The second problem is that it ignores error messages sent from the 
server. In a professional program, this is a bad thing to do. Use this program 
as a launchpad to a more robust application. 

## The World Wide Web (HTTP)

Unfortunately, the HTTP protocol is a bit extensive to cover in 
this introductory book. However, if you've read and understood the examples in 
this chapter. Then, you'll have little problem downloading some modules from the 
CPAN archives and quickly writing your own web crawling programs. You can find 
out more about CPAN in [](./internet-resources.md).

<P>In order to get you started, there are two files on the CD-ROM, url.pl and 
url_get.pl. These libraries will retrieve web documents when given a specific 
URL. Place them into your Perl directory and run the program in Listing 18.7. It 
will download the Perl home page into the $perlHomePage variable. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P><TT>Load the url_get library.</TT> 
      <P><TT>Initialize $perlHomePage with the contents of the Perl home 
      page.</TT> 
      <P></TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 18.7-18LST07.PL - Retrieving the Perl Home 
    Page.</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>require 'url_get.pl';

$perlHomePage = url_get('http://www.perl.com');</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>The HTTP standard is kept on the <A 
href="http://www.w3.org/pub/WWW/Protocols/HTTP/HTTP2.html">http://www.w3.org/pub/WWW/Protocols/HTTP/HTTP2.html</A> 
web page. 

## Summary

Learning Internet protocols will give you a 
very valuable skill and enable you to save time by automating some of the more 
mundane tasks you do. I'm sure you'll be able to come up with some fascinating 
new tools to make yourself more productive. For example, The other day I 
stumbled across a web site that searched a newsgroup for all URLs mentioned in 
the messages and stored them on a web page sorted by date. This is an obvious 
time saver. That webmaster no longer needs to waste time reading the message to 
find interesting sites to visit. 
<P>You started off this chapter with a list of some protocols or services that 
are available. Then you learned that protocols are set of commands and responses 
that both a server and a client understand. The high-level protocols (like mail 
and file-transfer) rest on top of the TCP/IP protocol. TCP/IP was ignored 
because, like any good foundation, you don't need to know its details in order 
to use it. 
<P>Servers and clients use a different set of functions. Servers use socket(), 
bind(), listen(), accept(), close(), and a variety of I/O functions. Client use 
socket(), connect(), close(), and a variety of I/O functions. 
<P>On the server side, every socket must have an address which consists of the 
server's address and a port number. The port number can be any number greater 
than 1024. The name and port are combined using a colon as a delimiter. For 
example, www.foo.com:4000. 
<P>Next, you looked at an example of the time service. This service is useful 
for synchronizing all of the machines on a network. 
<P>SMTP or Simple Mail Transport Protocol is used for sending mail. There are 
only five basic commands: HELO, MAIL, RCPT, DATA, and QUIT. These commands were 
discussed and then an mail sending program was shown in Listing 18.2. 
<P>The natural corollary to sending mail is receiving mail - done with the POP 
or Post Office Protocol. Listing 18.3 contained a program to filter incoming 
mail looking for a specific string. It produced a report of the messages that 
contained that string in the subject line. 
<P>After looking at POP, you saw how to use the Echo service to see if a server 
was running. This service is of marginal use under in Windows operating systems 
because they do now handle the SIGALRM signal. So a process might wait forever 
for a server to respond. 
<P>Then, you looked at FTP or File Transfer Protocol. This protocol is used to 
send files between computers. The example in Listing 18.5 used object-oriented 
techniques to retrieve the Perl Frequently Asked Questions file. 
<P>NNTP was next. The news protocol can retrieve articles from a news server. 
While the example was a rather large program, it still only covered a few of the 
commands that are available. 
<P>Lastly, the HTTP protocol was mentioned. A very short - two line - program 
was given to retrieve a single web page. 

## Review Questions

<OL>
  <LI>What is a protocol? 
  <P></P>
  <LI>What is a socket? 
  <P></P>
  <LI>What is the POP? 
  <P></P>
  <LI>Will client programs use the bind() function? 
  <P></P>
  <LI>Do newly created sockets have an address? 
  <P></P>
  <LI>What is a port? 
  <P></P>
  <LI>When sending the body or text of an email message, will the server 
  response after each line? 
  <P></P>
  <LI>Why shouldn't the echo service by used by Windows operating systems? 
  <P></P>
  <LI>What is the largest NNTP reponse in terms of bytes?</LI></OL>

## Review Exercises

<OL>
  <LI>Send an e-mail message to <B>medined@mtolive.com</B>. Use a subject of 
  "Perl by Example" and let me know your opinion of the book so far. 
  <P></P>
  <LI>Modify the mail filter program in Listing 18.3 to search the From line 
  instead of the Subject line. 
  <P></P>
  <LI>Change the news program into filter so that you will only print the author 
  and subject of interesting news articles.</LI></OL>
