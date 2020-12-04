# The Windows Registry

<P>In Windows 3.1, INI or initialization files were used to hold information 
used to configure application programs. For example, an INI file might have a 
list of the most recently used files or hold the status of an option to save 
modified files. However, INI files had several weaknesses: 
<P>
<UL>
  <LI><B>Uncertain location</B>-INI files could be found in either the 
  <TT>\windows</TT> directory or the application's directory. 
  <P></P>
  <LI><B>Size limitations</B>-INI files were limited to 64K bytes. 
  <P></P>
  <LI><B>Easy to modify</B>-INI files were simple text files. End-users could 
  modify them and create technical support problems. 
  <P></P>
  <LI><B>Hard to backup</B>-Since INI files can be in any directory, it was 
  nearly impossible to backup and restore application configurations.</LI></UL>
<P>These problems, and others, prompted Microsoft to design the Registry. The 
<I>Registry</I> is a database that contains information about your operating 
system, its applications and file associations. An exhaustive list of the 
different types of information is too long reproduce here. Suffice to say that 
the Registry holds both hardware and software information. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>Changing the Registry is dangerous!</B> Make sure that 
      your Registry is backed up and you can afford to totally wreck your test 
      machine. I'm serious; don't mess with the Registry unless you can afford 
      to take the time to back up your system.</TD></TR></TBODY></TABLE>
<P>There are several advantages to using the Registry: 
<P>
<UL>
  <LI><B>Known location</B>-Any program can look into the Registry to see if it 
  has already been loaded. Or it can see if other programs have been loaded. 
  <P></P>
  <LI><B>Hard to modify</B>-The normal computer user will not know about the 
  Registry so he or she won't try to change it which means that configuration 
  errors are less likely. 
  <P></P>
  <LI><B>Easy to back up</B>-Keeping all of the configuration information in two 
  files makes it very easy to back up the Registry. In fact, Windows keeps 
  several backups on its own. The Registry files are discussed in the "<A 
  href="xp0d.htm#Registry Files">Registry 
  Files</A>" section a bit later in this chapter.</LI></UL>
<P>Information in the Registry is stored in a <I>key-value format</I>. This 
means that every value stored in the Registry has an associated key. Similar to 
the lock on your front door. You can't unlock the door without the correct key. 
Likewise, you can't retrieve the stored value without the correct key. Each key 
can have both subkeys and one of more sets of name-value pairs. In fact, you 
might think of each key as an associative array. For example, there is a key 
called <TT>HKEY_USERS\Default\Software\Microsoft\User information</TT> that is 
interesting. This key has several name-value pairs. Here is a small sampling of 
the name-value pairs from the Registry on my system: 
<P>
<TABLE cellPadding=10 border=1>
  <TBODY>
  <TR>
    <TH align=left>Name</TH>
    <TH align=left>Value</TH></TR>
  <TR>
    <TD>Operating System</TD>
    <TD>Microsoft Windows 95</TD></TR>
  <TR>
    <TD>Processor</TD>
    <TD>Pentium</TD></TR>
  <TR>
    <TD>Default Company</TD>
    <TD>Eclectic Consulting</TD></TR>
  <TR>
    <TD>Default First Name</TD>
    <TD>David</TD></TR></TBODY></TABLE>
<P>In addition to named values, there is an unnamed default value that is 
referred to using an empty string as the name. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The concept of a default name-value will become 
      clear if you peek ahead to Figure 23.6 where you'll see a Registry key 
      with several name-value keys defined.</TD></TR></TBODY></TABLE>
<P>As you may guess from looking at the key just mentioned, all of the 
information in the Registry is stored in a hierarchical or tree format-similar 
to a directory structure. Each key can have subkeys. There are three root or 
base keys: 
<P>
<UL>
  <LI><TT>HKEY_DYN_DATA</TT>-The subkeys under this Windows 95 specific key 
  holds system information that will last only as long as the computer is not 
  shutdown or rebooted. In other words, these keys are never written to the hard 
  disk, they exist only in RAM. There are two subkeys: <TT>PerfStats</TT>, which 
  holds network performance statistics and <TT>Config Manager</TT>, which keeps 
  a list of all devices on the computer. 
  <P></P>
  <LI><TT>HKEY_LOCAL_MACHINE</TT>-The subkeys under this key hold information 
  about the local computer and its configuration. It is one of the most used 
  root keys. 
  <P></P>
  <LI><TT>HKEY_USERS</TT>-The subkeys under <TT>HKEY_USERS</TT> hold information 
  about all of the users who have logged into your system. The .Default subtree 
  stores information about the default users. Each individual user will have a 
  subtree of their own.</LI></UL>
<P>Some of the Registry information is accessed so often that Microsoft has 
provided three shortcut keys: 
<P>
<UL>
  <LI><TT>HKEY_CLASSES_ROOT</TT>-This key is identical to 
  <TT>HKEY_LOCAL_MACHINE\SOFTWARE\Classes</TT>. Changing Registry information in 
  either location changes both locations. Document types, document associations, 
  and OLE information are stored under this key. 
  <P></P>
  <LI><TT>HKEY_CURRENT_CONFIG</TT>-This key is identical to 
  <TT>HKEY_LOCAL_MACHINE\Config</TT>. The hardware and system configuration 
  information that is most likely to change is stored under this key. 
  <P></P>
  <LI><TT>HKEY_CURRENT_USER</TT>-This key is a shortcut to the selected user 
  profile in <TT>HKEY_USERS</TT>. It holds information about the configuration 
  and preferences for the currently signed-on user.</LI></UL>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>Remember, <B>changing the Registry is dangerous!</B> 
      Make sure that your Registry is backed up before making 
  changes.</TD></TR></TBODY></TABLE>

## Registry Files

There are two files associated with the Registry. The <TT>user.dat</TT> file holds user-specific 
data, and the <TT>system.dat</TT> file holds everything else. They are located 
in the <TT>\windows</TT> directory and have their hidden, system, and read-only 
attributes turned on. This means that if you run the <TT>dir</TT> command while 
connected to those directories, you will not see these files. When the system is 
booted, both files are read and a single Registry is created in memory. 
<P>The <TT>user.da0</TT> and <TT>system.da0</TT> files in the <TT>\windows</TT> 
directory are copies of the Registry from a successful boot of the computer 
system. If the Registry gets corrupted, Windows will try to fix the problem by 
using these earlier versions. 
<P>You will also find a <TT>system.1<SUP>st</SUP></TT> file in the root 
directory of your boot drive (usually <TT>C:</TT>). The file was created when 
you first installed Windows. If Windows can't recover from a Registry failure 
using the DA0 files, you can try using <TT>system.1<SUP>st</SUP></TT> file. 
<H3><A name="How to Back Up the Registry">How to Back Up the 
Registry</A></H3>You can manually back up the Registry by exporting the 
information using the Windows <TT>regedit</TT> utility. This utility lets you 
export all of the Registry information to a text file. Follow these steps to 
perform the export: 
<P>
<OL>
  <LI>From the Windows Start Button, select the <I>R</I>un... option. 
  <P></P>
  <LI>Type <B>regedit</B> into the Run dialog box. Figure E.1 shows the dialog 
  box. 
  <P><I>Fig. d.1 - Using the Run Dialog Box to Start the Regedit Utility</I> 
  <P></P>
  <LI>Click the OK button. The Registry Editor program will start, as shown in 
  Figure E.2. 
  <P><I>Fig. d.2 - The Registry Editor Is Used To View And Modify Registry 
  Information.</I> 
  <P></P>
  <LI>Choose <I>R</I>egistry, <I>E</I>xport Registry File. The dialog box in 
  Figure E.3 is shown. 
  <P><I>Fig. d.3 - The Export Registry File Dialog Box</I> 
  <P></P>
  <LI>Type in a filename (for example, <TT>c:\backup.reg</TT>), and then click 
  the <I>S</I>ave button.</LI></OL>
<P>This procedure creates a text-based backup of the Registry. You should copy 
this file onto a diskette or other data storage medium. You will probably need 
to compress the resulting backup file since mine was over 1.8 million bytes in 
length-too long to place on a diskette. 
<P>You can also boot your system into DOS mode and copy the 
<TT>\windows\user.dat</TT> and <TT>\windows\system.dat</TT> files either onto a 
diskette or into a directory other than <TT>\windows</TT>. 
<H3><A name="How to Restore the Registry">How to Restore the 
Registry</A></H3>Now that you know how to back up the Registry by using the 
export feature of the Registry Editor, let's look at restoring the Registry 
using the import feature. Use this procedure to import the text-based Registry 
file: 
<P>
<OL>
  <LI>From the Windows Start Button, select the <I>R</I>un... option. 
  <P></P>
  <LI>Type <B>regedit</B> into the Run dialog box and click the OK button. 
  <P></P>
  <LI>Choose <I>R</I>egistry, <I>I</I>mport Registry File. The dialog box in 
  Figure E.4 is shown. 
  <P><I>Fig. d.4 - The Import Registry File Dialog Box Lets You Select a File To 
  Restore From.</I> 
  <P></P>
  <LI>Enter the name of the text-based registry file (for example, 
  <TT>c:\backup.reg</TT>) and click the <I>O</I>pen button. 
  <P></P>
  <LI>Reboot your system.</LI></OL>
<P>If your system is still not working, and you have copied the two Registry 
files and were created in the previous section, "<A 
href="xp0d.htm#How to Back Up the Registry">How to 
Back Up the Registry</A>" , then you can try rebooting to DOS and copy the two 
backup files directly into the <TT>\windows</TT> directory. After copying the 
files, reboot your system. 
<P>If you are still having problems, consider re-installing Windows or calling 
an expert for help. 

## Using the Registry

At this point, you have some background information about the Registry, and you know how to make a 
Registry backup. Let's look at how to use the Registry. To make Registry access 
as easy as possible, I have created an object-oriented module, called 
<TT>DmmReg.pm</TT>, for Registry access. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The module was called <TT>DmmReg</TT> because there 
      is already a module called <TT>Registry.pm</TT> included with Perl for 
      Win32. However, that module has little documentation and I wanted to 
      create something special for this book.</TD></TR></TBODY></TABLE>
<P>The <TT>DmmReg</TT> module was designed to make Registry access as easy as 
possible. You do not need in-depth knowledge of the Registry to use the methods. 
The examples in this chapter show you how to open and create keys, read key 
values, and list subkeys. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=white size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>On the other hand, you might feel more comfortable 
      changing the Registry if you know more. If so, read Que's <I>Special 
      Edition Using the Windows 95 Registry</I> by Jerry 
Honeycutt.</TD></TR></TBODY></TABLE>
<P><B>On the CD</B> - All of the snippets of code that are discussed in the 
following sections are collected into one script file called ELST01.PL on the 
CD-ROM that accompanies this book. When creating your own scripts you merely 
need to cut and paste the lines of code that you're interested in. You won't 
need to hunt through four or five files. 
<P>The next few sections discuss how to do specific Registry tasks using the 
<TT>DmmReg</TT> module. You see how to use the following methods: 
<P>
<UL>
  <LI><TT>openKey()</TT>-This constructor method will open an existing key. It 
  returns the undefined value if the requested key can't be found in the 
  Registry. 
  <P></P>
  <LI><TT>createKey()</TT>-This is another constructor method. It will create a 
  new key and optionally assign a value to the default name in one step. 
  <P></P>
  <LI><TT>getValue()</TT>-This method lets you find the value half of a key's 
  name-value pair. 
  <P></P>
  <LI><TT>setValue()</TT>-This method lets you create or modify a key's 
  name-value pair. 
  <P></P>
  <LI><TT>getKeys()</TT>-This method returns an array that contains a list of 
  subkeys for a given key. 
  <P></P>
  <LI><TT>getValues()</TT>-This method returns a hash that contains name-value 
  entries for a given key.</LI></UL>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=white size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>In order to avoid a bit of potential confusion, let 
      me clarify one thing. The <TT>DmmReg</TT> module has <I>two</I> 
      constructor functions: <TT>createKey()</TT> and <TT>openKey()</TT>. Both 
      functions will return an object reference. If you aren't sure what 
      constructor functions are, see Chapter 14, "<A 
      href="ch14.htm">What Are 
  Objects?</A>."</TD></TR></TBODY></TABLE>
<P></B>
<H3><A name="Opening an Existing Key">Opening an Existing Key</A></H3>To open an 
existing Registry key, you need only know the key's name. For example, if you 
want to determine if a file association exists for <TT>.pl</TT> files, check for 
the existence of the <TT>HKEY_CLASSES_ROOT\.pl</TT> key like this: 
<P>[ic: psc] 
<P><TT>Specify that this script will use the DmmReg module. 
<P></TT><TT>Specify that strict variable checking should be done. 
<P></TT><TT>Declare the $handle variable to be local to the file. 
<P></TT><TT>Create an object of type HKEY_CLASSES_ROOT and open the subkey 
<P></TT><TT>called .pl. The $handle object will hold the object reference. 
<P></TT><TT>Display a message indicating the existence of the subkey. 
<P></TT>
<P><B><PRE>use DmmReg;
use strict;

my($handle);

$handle = HKEY_CLASSES_ROOT-&gt;openKey('.pl');
print("There " .
     (defined($handle)? "is an" : "is no") .
    " association for .pl files\.n");</PRE></B>If your system does not have any 
file associations defined for Perl scripts, this program displays: 
<P><B><PRE>There is no association for .pl files.</PRE></B>The name of the root key is 
used as the class name and the subkey name is passed as the only argument to the 
openKey method. 
<P>If you need to open a key that is deeper in the hierarchy, simply add the 
branches to the argument of the openKey method. 
<P><B><PRE>$handle = HKEY_USERS-&gt;openKey('Default\Software\
Microsoft\User information');</PRE></B>You can also see from this second example 
that the <TT>DmmReg</TT> module lets you create more than one type of object. 
Actually, you can create a different object for each of the six root keys. Each 
class has exactly the same methods and functionality. 
<H3><A name="Creating a New Key">Creating a New Key</A></H3>Creating a new key 
is almost as simple as opening an existing one. You specify the name of the new 
key, and you optionally specify a value for the default name-value pair. For 
example, if you wanted to create a Registry key that holds the name of the last 
data file that your script opened you could do it like this: 
<P><B><PRE>$h = HKEY_LOCAL_MACHINE-&gt;createKey(
  'SOFTWARE\A Perl Test Script\Last Data File',
  'C:\TEST.DAT');</PRE></B>The first argument is the name of the key and the 
second argument is the data that will be assigned to the default name. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>The most confusing aspect of the Registry and its 
      keys is that each key can have both subkeys and name-value pairs 
      associated with it. The default name is represented by an empty string. 
      The <TT>createKey()</TT> method lets you create a new key and assign a 
      value to its default name in one step.</TD></TR></TBODY></TABLE>
<P>You can verify that the assignment worked by using the Registry Editor. The 
new key and its default value is shown in Figure E.5. 
<P><I>Fig. d.5 - Creating Persistant Information in the Registry</I> 
<P>Some programmers refer to this type of information as <I>persistent</I> 
because the Registry key will be around even after your script has ended. 
<P>If the key specified as the parameter to the <TT>createKey()</TT> method 
already exists, then that key will be opened. 
<P>As with the <TT>openKey()</TT> method, you can specify limited access rights 
when opening a key. You can also tell Windows that the key should be kept in 
memory and not written to disk-a volatile key. However, this level of detail is 
more involved than this brief introducton can cover. Please read <I>Special 
Edition Using the Windows 95 Registry</I> if you need more advanced information. 

<H3><A name="Finding a Key's Value">Finding a Key's Value</A></H3>You can find 
out a key's value by using the <TT>getValue()</TT> method in the <TT>DmmReg</TT> 
module. For example, to read the name of the data file that was written in the 
last section, you do this: <B><PRE>Specify that this script will use the DmmReg module.
Specify that strict variable checking should be done.
Declare the $handle and $keyName variables to be local to the file.
Initialize $keyName to be the name of the key we're interested in.
Call the openKey() method, $handle will hold the object reference.
Call the getValue() method. The argument to getValue() is the name of the
    value to be retrieved. In this instance, the default value is sought.
Print the data associated with the default value.</PRE></B>
<P><B><PRE>use DmmReg;
use strict;

my($handle);
my($keyName) = 'SOFTWARE\A Perl Test Script\Last Data File';
my($value)

$handle = HKEY_LOCAL_MACHINE-&gt;openKey($keyName);
$value  = ($handle-&gt;getValue(''))[1];
print("The data file was named $value\n");</PRE></B>This program displays: 
<P><B><PRE>The data file was named C:\TEST.DAT</PRE></B>You may find the call to the 
<TT>getValue()</TT> method to be a little confusing. Let's take a closer look at 
it: 
<P><B><PRE>$data = ($handle-&gt;getValue(''))[1];</PRE></B>The <TT>getValue()</TT> 
method returns an array that holds the data type of the value and the value 
itself. Since you only need the value in this example, an array slice was used. 
You place parentheses around the entire function call to ensure that the return 
value is evaluated in an array context. Then, regular subscripting notation 
selects the second element of the returned array. The second element is assigned 
to <TT>$value</TT>. 
<P>The <TT>DmmReg</TT> module is designed to work with strings, the most popular 
type of data stored in the Registry. While you can work with other data types, 
like binary data, you'll need to look at more advanced books to find out how. 
For example, Que's <I>Special Edition Using the Windows 95 Registry</I> by Jerry 
Honeycutt is a good choice. 
<H3><A name="Setting a Key's Name-value Pairs">Setting a Key's Name-value 
Pairs</A></H3>You've already seen how to set the value of the default name-value 
pair by using the <TT>createKey()</TT> method. In this section, you use the 
<TT>setValue()</TT> method to explicitly set any name-value pair. Let's build on 
the example shown in "<A 
href="xp0d.htm#Creating a New Key">Creating a New 
Key</A>." Perhaps, instead of just saving one data file, you need to save more 
than one. Maybe you have the names of a message file and a data file to store. 
You can use the following script as a template: 
<P>[ic: psc] 
<P><TT>Specify that this script will use the DmmReg module. 
<P></TT><TT>Specify that strict variable checking should be done. 
<P></TT><TT>Declare the $handle and $keyName variables to be local to the file. 
<P></TT><TT>Initialize $keyName to be the name of the key we're interested in. 
<P></TT><TT>Call the createKey() method, $handle will hold the object reference. 

<P></TT><TT>Call the setValue() method once for each name-value pair that needs 
to 
<P></TT><TT>be stored. 
<P></TT>
<P><B><PRE>use DmmReg;
use strict;

my($handle);
my($keyName) = 'SOFTWARE\A Perl Test Script';

$handle = HKEY_LOCAL_MACHINE-&gt;createKey($keyName);
$handle-&gt;setValue('Data File',    'c:\perl5\test.dat');
$handle-&gt;setValue('Date',         '07-01-1996');
$handle-&gt;setValue('Message File', 'c:\perl5\friday.log');</PRE></B>After this 
script is run, you can see the name-value pairs using the Registry Editor as 
shown in Figure E.6. 
<P><I>Fig. d.6 - A Registry Key with Four Name-Value Pairs</I> 
<P>Notice that the default name-value pair is no longer valued. Since you are 
using specifying names with the <TT>setValue()</TT> method, the default name is 
no longer needed. 
<H3><A name="Getting a List of Subkeys">Getting a List of Subkeys</A></H3>The 
<TT>getKeys()</TT> method of the <TT>DmmReg</TT> module is used to retrieve a 
list of subkeys for any specified key. For example, if you need to find all of 
the subkeys for the <TT>HKEY_CURRENT_USER\Network</TT> key use the following 
code. 
<P>[ic: psc] 
<P><TT>Specify that this script will use the DmmReg module. 
<P></TT><TT>Specify that strict variable checking should be done. 
<P></TT><TT>Declare variables to be local to the file. 
<P></TT><TT>Initialize $keyName to be the name of the key we're interested in. 
<P></TT><TT>Open the HKEY_CURRENT_USER\Network subkey. 
<P></TT><TT>Check the status of the openKey() method, die if an error occured. 
<P></TT><TT>Call the getKeys() method. 
<P></TT><TT>Iterate over @subKeys and display the subkeys. 
<P></TT>
<P><B><PRE>use DmmReg;
use strict;

my($handle);
my($keyName) = 'Network';
my(@subKeys);
my($subKey);

$handle = HKEY_CURRENT_USER-&gt;openKey('Network');
die("Unable to open $keyName") unless defined($handle);

$handle-&gt;getKeys(\@subKeys);
foreach $subKey (sort(@subKeys)) {
    print("$subKey\n");
}</PRE></B>This program displays: 
<P><B><PRE>Persistent
Recent</PRE></B>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>There is a bug-that I have not been able to 
      correct-that will not let you get a list of keys starting from one of the 
      six root keys. Since the first level of subkeys do not change, use the 
      Registry Editor to find them.</TD></TR></TBODY></TABLE>
<H3><A name="Getting a List of Name-Value Pairs">Getting a List of Name-Value 
Pairs</A></H3>Earlier, in "Setting a Key's Name-Value Pairs," you saw that each 
Registry key can have name-value pairs associated with it. You use the 
<TT>getValues()</TT> method to get a list of these pairs. 
<P>[ic: psc] 
<P><TT>Specify that this script will use the DmmReg module. 
<P></TT><TT>Specify that strict variable checking should be done. 
<P></TT><TT>Declare variables to be local to the file. 
<P></TT><TT>Initialize $keyName to be the name of the key we're interested in. 
<P></TT><TT>Open the HKEY_LOCAL_MACHINE\SOFTWARE\A Perl Test Script subkey. 
<P></TT><TT>Call the getValues() method to populate the %pairs hash. 
<P></TT><TT>Iterate over %pairs to print the name-value pairs. 
<P></TT>
<P><B><PRE>use DmmReg;
use strict;

my($handle);
my($keyName) = 'SOFTWARE\A Perl Test Script';
my($name);
my(%pairs);

$handle = HKEY_LOCAL_MACHINE-&gt;openKey($keyName);
$handle-&gt;getValues(\%pairs);
foreach $name (sort(keys(%pairs))) {
    printf("%-12.12s: @{$pairs{$name}}[1]\n", $name);
}</PRE></B>This program displays: 
<P><B><PRE>Data File   : c:\perl5\test.dat
Date        : 07-01-1996
Message File: c:\perl5\friday.log</PRE></B>

## Some Common Uses for the Registry

There are several common uses for the Registry besides storing configuration information that needs to be persistent: 
<P>
<UL>
  <LI><B>To create a file association</B>-You can associate an executable file 
  with a data file so that when the data file is double-clicked, the application 
  is started. You can also associate different context menu options (like Open 
  and Print) with each file extension. 
  <P></P>
  <LI><B>To specify an icon</B>-You can use the Registry to determine which icon 
  is displayed in folders for each file extension. 
  <P></P>
  <LI><B>To enable the 'new' context menu option</B>-You can let the user create 
  new data files by using the new context menu option.</LI></UL>
<P>By this time, you understand all of the concepts involved in creating 
Registry keys and name-value pairs, so the code to do each task will be 
presented with very few comments. 
<H3><A name="Creating a File Association">Creating a File 
Association</A></H3>There are three steps to creating file associations: 
<P>
<OL>
  <LI>Tell Windows about the file extension. These lines of code will define 
  extension for both Perl scripts and Perl modules. The default value is used by 
  Windows as a pointer to another Registry key where additonal information is 
  stored. Step 2 will create this secondary key. 
  <P><B><PRE>$handle = HKEY_CLASSES_ROOT-&gt;
  createKey('.pl', 'A Perl File');
$handle = HKEY_CLASSES_ROOT-&gt;
  createKey('.pm', 'A Perl Module');</PRE></B>
  <LI>Create a key for the file extension description. The default value of this 
  key will be used as the file's type in the file's property list. 
  <P><B><PRE>$handle = HKEY_CLASSES_ROOT-&gt;
  createKey('A Perl File',   'Perl Script');
$handle = HKEY_CLASSES_ROOT-&gt;
  createKey('A Perl Module', 'Perl Module');</PRE></B>
  <LI>Create a key for each context menu option that you are creating. The keys 
  for the .pl extension is shown here. Change 'A Perl File' to 'A Perl Module' 
  to create context menu options for .pm files. 
  <P><B><PRE>$handle = HKEY_CLASSES_ROOT-&gt;
  createKey('A Perl File\Shell\Open\Command',
  'C:\MSOFFICE7\WINWORD\WINWORD.EXE %1');

$handle = HKEY_CLASSES_ROOT-&gt;
  createKey('A Perl File\Shell\Edit\Command',
  'C:\MSOFFICE7\WINWORD\WINWORD.EXE %1');

$handle = HKEY_CLASSES_ROOT-&gt;
  createKey('A Perl File\Shell\Print\Command',
  'C:\MSOFFICE7\WINWORD\WINWORD.EXE /p
  %1');</PRE></B></LI></OL>For simplicity's sake, I have all of my associations 
pointing to Microsoft Word, you should start whatever editor you normally use. 
<H3><A name="Setting the Icon for a File Extension">Setting the Icon for a File 
Extension</A></H3>You specify the icon for a file extension by creating a 
<TT>DefaultIcon</TT> subkey under the extension description key like this: 
<P><B><PRE>$handle = HKEY_CLASSES_ROOT-&gt;
  createKey('A Perl File\DefaultIcon',
  'C:\WINDOWS\SYSTEM\SHELL32.DLL,27');</PRE></B>The default value of the 
<TT>DefaultIcon</TT> key indicates which DLL and icon number to use. You can 
experiment with different icon numbers to find one that you like. Icon number 27 
in the <TT>shell32.dll</TT> file looks like a monitor that is displaying a 
starburst. 
<H3><A name="Enabling the 'new' Context Menu Option">Enabling the 'new' Context 
Menu Option</A></H3>If you right-click while inside a folder or on the desktop, 
one of the context menu options is <TT>new</TT>. You can add your own file types 
to the <TT>new</TT> sub-menu by following these steps: 
<P>
<OL>
  <LI>Open the .pl extension key. 
  <P><B><PRE>$handle = HKEY_CLASSES_ROOT-&gt;openKey('.pl');</PRE></B>
  <LI>Create a subkey called <TT>ShellNew</TT>. 
  <P><B><PRE>$handle = HKEY_CLASSES_ROOT-&gt;
  createKey('.pl\ShellNew', '');</PRE></B>
  <LI>Create a name-value pair with a name of <TT>NullFile</TT>.</LI></OL>
<P><B><PRE>$handle-&gt;setValue('NullFile', '');</PRE></B>If you follow these steps 
for both the .pl and .pm extensions, your <TT>new</TT> context menu will look 
like Figure E.7. 
<P><I>Fig. d.7 - The New Sub-menu with Options to Create Perl Files</I> 

## Summary

This chapter briefly introduced you to the Windows Registry. The Registry is used to store all types of information about 
the hardware and software that are installed on your computer system. 
<P>You learned that there are three root keys (<TT>HKEY_DYN_DATA</TT>, 
<TT>HKEY_LOCAL_MACHINE</TT>, and <TT>HKEY_USERS</TT>) and three shortcut keys 
(<TT>HKEY_CLASSES_ROOT</TT>, <TT>HKEY_CURRENT_CONFIG</TT>, and 
<TT>HKEY_CURRENT_USER</TT>). These keys are at the top of a hierarchical 
structure similar to a directory tree. 
<P>The Registry information is stored on two files, <TT>user.dat</TT> and 
<TT>system.dat</TT>. When the system is booted, these files are read into memory 
and the Registry is created. You read about sing the Registry Editor to export 
and import the Registry information for backup and recovery. 
<P>Then, you saw how to use the <TT>DmmReg</TT> module to access and modify 
Registry keys and name-value pairs. Examples were shown that create file 
association for <TT>.pl</TT> and <TT>.pm</TT> files; changed their default 
icons; and added Perl file types to the <TT>new</TT> option of the context menu. 
