# Using Special Variables

<P>Perl uses quite a few special variables to control various behaviors of 
functions. You can use special variables to hold the results of searches, the 
values of environment variables, and flags to control debugging. In short, every 
aspect of Perl programming uses special variables. 

## What Are the Special Variables?

Table 12.1 shows a list of the special variables you can use 
in your programs. The order of this list is identical to the list in the file 
<TT>PERLVAR.htm</TT>, which comes with your Perl distribution. This table lets 
you quickly find any special variable you may come across in examples or someone 
else's code. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 12.1 - Perl's Special Variables</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Variable Name </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD vAlign=top><TT>$_</TT> </TD>
    <TD vAlign=top>The default parameter for a lot of functions.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$.</TT> </TD>
    <TD vAlign=top>Holds the current record or line number of the file handle 
      that was last read. It is read-only and will be reset to 0 when the file 
      handle is closed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$/</TT> </TD>
    <TD vAlign=top>Holds the input record separator. The record separator is 
      usually the newline character. However, if <TT>$/</TT> is undefined, the 
      Perl reads the entire file as one input file.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$,</TT> </TD>
    <TD vAlign=top>The output separator for the <TT>print()</TT> function. 
      Normally, this variable is an empty string. However, setting <TT>$,</TT> 
      to a newline might be useful if you need to print each element in the 
      parameter list on a separate line.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$\</TT> </TD>
    <TD vAlign=top>Added as an invisible last element to the parameters passed 
      to the <TT>print()</TT> function. Normally, an empty string, but if you 
      want to add a newline or some other suffix to everything that is printed, 
      you can assign the suffix to <TT>$\</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$#</TT> </TD>
    <TD vAlign=top>The default format for printed numbers. Normally, it's set 
      to <TT>%.20g</TT>, but you can use the format specifiers covered in the 
      section "<A 
      href="ch09.htm#Example: Printing Revisited">Example: 
      Printing Revisited</A>" in Chapter 9 to specify your own default 
  format.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$%</TT> </TD>
    <TD vAlign=top>Holds the current page number for the default file handle. 
      If you use <TT>select()</TT> to change the default file handle, 
      <TT>$%</TT> will change to reflect the page number of the newly selected 
      file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$=</TT> </TD>
    <TD vAlign=top>Holds the current page length for the default file handle. 
      Changing the default file handle will change <TT>$=</TT> to reflect the 
      page length of the new file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$-</TT> </TD>
    <TD vAlign=top>Holds the number of lines left to print for the default 
      file handle. Changing the default file handle will change <TT>$-</TT> to 
      reflect the number of lines left to print for the new file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$~</TT> </TD>
    <TD vAlign=top>Holds the name of the default line format for the default 
      file handle. Normally, it is equal to the file handle's name.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^</TT> </TD>
    <TD vAlign=top>Holds the name of the default heading format for the 
      default file handle. Normally, it is equal to the file handle's name with 
      <TT>_TOP</TT> appended to it.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$|</TT> </TD>
    <TD vAlign=top>If nonzero, will flush the output buffer after every 
      <TT>write()</TT> or <TT>print()</TT> function. Normally, it is set to 
  0.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$$</TT> </TD>
    <TD vAlign=top>This UNIX-based variable holds the process number of the 
      process running the Perl interpreter.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$?</TT> </TD>
    <TD vAlign=top>Holds the status of the last pipe close, back-quote string, 
      or <TT>system()</TT> function. You can find more information about the 
      <TT>$?</TT> variable in Chapter 13, "Handling Exceptions and Signals." 
  </TD></TR>
  <TR>
    <TD vAlign=top><TT>$&amp;</TT> </TD>
    <TD vAlign=top>Holds the string that was matched by the last successful 
      pattern match.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$`</TT> </TD>
    <TD vAlign=top>Holds the string that preceded whatever was matched by the 
      last successful pattern match.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$'</TT> </TD>
    <TD vAlign=top>Holds the string that followed whatever was matched by the 
      last successful pattern match.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$+</TT> </TD>
    <TD vAlign=top>Holds the string matched by the last bracket in the last 
      successful pattern match. For example, the statement <TT>/Fieldname: 
      (.*)|Fldname: (.*)/ &amp;&amp; ($fName = $+);</TT> will find the name of a 
      field even if you don't know which of the two possible spellings will be 
      used.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$*</TT> </TD>
    <TD vAlign=top>Changes the interpretation of the <TT>^</TT> and <TT>$</TT> 
      pattern anchors. Setting <TT>$*</TT> to 1 is the same as using the 
      <TT>/m</TT> option with the regular expression matching and substitution 
      operators. Normally, <TT>$*</TT> is equal to 0.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$0</TT> </TD>
    <TD vAlign=top>Holds the name of the file containing the Perl script being 
      executed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$&lt;number&gt;</TT> </TD>
    <TD vAlign=top>This group of variables (<TT>$1</TT>, <TT>$2</TT>, 
      <TT>$3</TT>, and so on) holds the regular expression pattern memory. Each 
      set of parentheses in a pattern stores the string that match the 
      components surrounded by the parentheses into one of the 
      <TT>$&lt;number&gt;</TT> variables.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$[</TT> </TD>
    <TD vAlign=top>Holds the base array index. Normally, it's set to 0. Most 
      Perl authors recommend against changing it without a very good 
  reason.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$]</TT> </TD>
    <TD vAlign=top>Holds a string that identifies which version of Perl you 
      are using. When used in a numeric context, it will be equal to the version 
      number plus the patch level divided by 1000.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$"</TT> </TD>
    <TD vAlign=top>This is the separator used between list elements when an 
      array variable is interpolated into a double-quoted string. Normally, its 
      value is a space character.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$;</TT> </TD>
    <TD vAlign=top>Holds the subscript separator for multi-dimensional array 
      emulation. Its use is beyond the scope of this book.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$!</TT> </TD>
    <TD vAlign=top>When used in a numeric context, holds the current value of 
      <TT>errno</TT>. If used in a string context, will hold the error string 
      associated with <TT>errno</TT>. For more information about <TT>errno</TT>, 
      see Chapter 13, "Handling Exceptions."</TD></TR>
  <TR>
    <TD vAlign=top><TT>$@</TT> </TD>
    <TD vAlign=top>Holds the syntax error message, if any, from the last 
      <TT>eval()</TT> function call. For more information about <TT>errno</TT>, 
      see Chapter 13, "Handling Exceptions."</TD></TR>
  <TR>
    <TD vAlign=top><TT>$&lt;</TT> </TD>
    <TD vAlign=top>This UNIX-based variable holds the read uid of the current 
      process.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$&gt;</TT> </TD>
    <TD vAlign=top>This UNIX-based variable holds the effective uid of the 
      current process.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$)</TT> </TD>
    <TD vAlign=top>This UNIX-based variable holds the read gid of the current 
      process. If the process belongs to multiple groups, then <TT>$)</TT> will 
      hold a string consisting of the group names separated by spaces.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$:</TT> </TD>
    <TD vAlign=top>Holds a string that consists of the characters that can be 
      used to end a word when word-wrapping is performed by the <TT>^</TT> 
      report formatting character. Normally, the string consists of the space, 
      newline, and dash characters.</TD></TR>
  <TR>
    <TD vAlign=top>$^D </TD>
    <TD vAlign=top>Holds the current value of the debugging flags. For more 
      information, see Chapter 16, "<A 
      href="ch16.htm">Debugging Perl</A>." </TD></TR>
  <TR>
    <TD vAlign=top><TT>$^F</TT> </TD>
    <TD vAlign=top>Holds the value of the maximum system file description. 
      Normally, it's set to 2. The use of this variable is beyond the scope of 
      this book.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^I</TT> </TD>
    <TD vAlign=top>Holds the file extension used to create a backup file for 
      the in-place editing specified by the <TT>-i</TT> command line option. For 
      example, it could be equal to ".bak."</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^L</TT> </TD>
    <TD vAlign=top>Holds the string used to eject a page for report printing. 
      Chapter 11, "<A href="ch11.htm">Creating 
      Reports</A>," shows how to use this variable to create simple 
  footers.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^P</TT> </TD>
    <TD vAlign=top>This variable is an internal flag that the debugger clears 
      so it will not debug itself.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^T</TT> </TD>
    <TD vAlign=top>Holds the time, in seconds, at which the script begins 
      running.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^W</TT> </TD>
    <TD vAlign=top>Holds the current value of the <TT>-w</TT> command line 
      option.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^X</TT> </TD>
    <TD vAlign=top>Holds the full path name of the Perl interpreter being used 
      to run the current script.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$ARGV</TT> </TD>
    <TD vAlign=top>Holds the name of the current file being read when using 
      the diamond operator <TT>(&lt;&gt;)</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>@ARGV</TT> </TD>
    <TD vAlign=top>This array variable holds a list of the command line 
      arguments. You can use <TT>$#ARGV</TT> to determine the number of 
      arguments minus one.</TD></TR>
  <TR>
    <TD vAlign=top><TT>@F</TT> </TD>
    <TD vAlign=top>This array variable holds the list returned from autosplit 
      mode. Autosplit mode is associated with the <TT>-a</TT> command line 
      option.</TD></TR>
  <TR>
    <TD vAlign=top><TT>@INC</TT> </TD>
    <TD vAlign=top>This array variable holds a list of directories where Perl 
      can look for scripts to execute. The list is mainly used by the 
      <TT>require</TT> statement. You can find more information about require 
      statements in Chapter 15, "<A 
      href="ch15.htm">Perl Modules</A>." </TD></TR>
  <TR>
    <TD vAlign=top><TT>%INC</TT> </TD>
    <TD vAlign=top>This hash variable has entries for each filename included 
      by <TT>do</TT> or <TT>require</TT> statements. The key of the hash entries 
      are the filenames, and the values are the paths where the files were 
    found.</TD></TR>
  <TR>
    <TD vAlign=top><TT>%ENV</TT> </TD>
    <TD vAlign=top>This hash variable contains entries for your current 
      environment variables. Changing or adding an entry affects only the 
      current process or a child process, never the parent process. See the 
      section "<A 
      href="ch12.htm#Example: Using the %ENV Variable">Example: 
      Using the %ENV Variable</A>" later in this chapter.</TD></TR>
  <TR>
    <TD vAlign=top><TT>%SIG</TT></TD>
    <TD vAlign=top>This hash variable contains entries for signal handlers. 
      For more information about signal handlers, see Chapter 13, "<A 
      href="ch13.htm">Handling Exceptions and 
      Signals</A>."</TD></TR>
  <TR>
    <TD vAlign=top>_ </TD>
    <TD vAlign=top>This file handle (the underscore) can be used when testing 
      files. If used, the information about the last file tested will be used to 
      evaluate the new test.</TD></TR>
  <TR>
    <TD vAlign=top><TT>DATA</TT> </TD>
    <TD vAlign=top>This file handle refers to any data following 
      <TT>__END__</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>STDERR</TT> </TD>
    <TD vAlign=top>This file handle is used to send output to the standard 
      error file. Normally, this is connected to the display, but it can be 
      redirected if needed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>STDIN</TT> </TD>
    <TD vAlign=top>This file handle is used to read input from the standard 
      input file. Normally, this is connected to the keyboard, but it can be 
      changed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>STDOUT</TT> </TD>
    <TD vAlign=top>This file handle is used to send output to the standard 
      output file. Normally, this is the display, but it can be 
  changed.</TD></TR></TBODY></TABLE>
<P>Table 12.2 puts the variables into different categories so you can see how 
they relate to one another. This organization is better than Table 12.1 when you 
are creating your own programs. Some of the categories covered in Table 12.2 
have their own chapters. The sub-headings in the table point out which chapter 
you can look at for more information. 
<P>
<TABLE cellPadding=10 border=1>
  <CAPTION>Table 12.2 - Perl's Special Variables</CAPTION>
  <TBODY>
  <TR>
    <TH align=left>Variable Name </TH>
    <TH align=left>Description</TH></TR>
  <TR>
    <TD colSpan=2><I>Variables That Affect Arrays</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>$"</TT> </TD>
    <TD vAlign=top>The separator used between list elements when an array 
      variable is interpolated into a double-quoted string. Normally, its value 
      is a space character.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$[</TT> </TD>
    <TD vAlign=top>Holds the base array index. Normally, set to 0. Most Perl 
      authors recommend against changing it without a very good reason.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$;</TT> </TD>
    <TD vAlign=top>Holds the subscript separator for multi-dimensional array 
      emulation. Its use is beyond the scope of this book. For a more in-depth 
      look at Perl programming, see Que's Special Edition Using Perl for Web 
      Programming.</TD></TR>
  <TR>
    <TD colSpan=2><I>Variables Used with Files (See Chapter 9, "<A 
      href="ch09.htm">Using Files</A>")</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>$.</TT> </TD>
    <TD vAlign=top>This variable holds the current record or line number of 
      the file handle last read. It is read-only and will be reset to 0 when the 
      file handle is closed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$/</TT> </TD>
    <TD vAlign=top>This variable holds the input record separator. The record 
      separator is usually the newline character. However, if <TT>$/</TT> is set 
      to an empty string, two or more newlines in the input file will be treated 
      as one.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$|</TT> </TD>
    <TD vAlign=top>This variable, if nonzero, will flush the output buffer 
      after every <TT>write()</TT> or <TT>print()</TT> function. Normally, it is 
      set to 0.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^F</TT> </TD>
    <TD vAlign=top>This variable holds the value of the maximum system file 
      description. Normally, it's set to 2. The use of this variable is beyond 
      the scope of this book.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$ARGV</TT> </TD>
    <TD vAlign=top>This variable holds the name of the current file being read 
      when using the diamond operator <TT>(&lt;&gt;)</TT>.</TD></TR>
  <TR>
    <TD vAlign=top>_ </TD>
    <TD vAlign=top>This file handle (the underscore) can be used when testing 
      files. If used, the information about the last file tested will be used to 
      evaluate the latest test.</TD></TR>
  <TR>
    <TD vAlign=top><TT>DATA</TT> </TD>
    <TD vAlign=top>This file handle refers to any data following 
      <TT>__END__</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>STDERR</TT> </TD>
    <TD vAlign=top>This file handle is used to send output to the standard 
      error file. Normally, this is connected to the display, but it can be 
      redirected if needed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>STDIN</TT> </TD>
    <TD vAlign=top>This file handle is used to read input from the standard 
      input file. Normally, this is connected to the keyboard, but it can be 
      changed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>STDOUT</TT> </TD>
    <TD vAlign=top>This file handle is used to send output to the standard 
      output file. Normally, this is the display, but it can be changed.</TD></TR>
  <TR>
    <TD colSpan=2><I>Variables Used with Patterns (See Chapter 10, "<A 
      href="ch10.htm">Regular 
    Expressions</A>")</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>$&amp;</TT> </TD>
    <TD vAlign=top>This variable holds the string that was matched by the last 
      successful pattern match.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$`</TT> </TD>
    <TD vAlign=top>This variable holds the string that preceded whatever was 
      matched by the last successful pattern match.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$'</TT> </TD>
    <TD vAlign=top>This variable holds the string that followed whatever was 
      matched by the last successful pattern match.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$+</TT> </TD>
    <TD vAlign=top>This variable holds the string matched by the last bracket 
      in the last successful pattern match. For example, the statement 
      <TT>/Fieldname: (.*)|Fldname: (.*)/ &amp;&amp; ($fName = $+);</TT> will 
      find the name of a field even if you don't know which of the two possible 
      spellings will be used.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$*</TT> </TD>
    <TD vAlign=top>This variable changes the interpretation of the <TT>^</TT> 
      and <TT>$</TT> pattern anchors. Setting <TT>$*</TT> to 1 is the same as 
      using the <TT>/m</TT> option with the regular expression matching and 
      substitution operators. Normally, <TT>$*</TT> is equal to 0.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$&lt;number&gt;</TT> </TD>
    <TD vAlign=top>This group of variables (<TT>$1</TT>, <TT>$2</TT>, 
      <TT>$3</TT>, and so on) holds the regular expression pattern memory. Each 
      set of parentheses in a pattern stores the string that matches the 
      components surrounded by the parentheses into one of the 
      <TT>$&lt;number&gt;</TT> variables.</TD></TR>
  <TR>
    <TD colSpan=2><I>Variables Used with Printing</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>$,</TT> </TD>
    <TD vAlign=top>This variable is the output separator for the 
      <TT>print()</TT> function. Normally, this variable is an empty string. 
      However, setting <TT>$,</TT> to a newline might be useful if you need to 
      print each element in the parameter list on a separate line.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$\</TT> </TD>
    <TD vAlign=top>The variable is added as an invisible last element to the 
      parameter list passed to the <TT>print()</TT> function. Normally, it's an 
      empty string, but if you want to add a newline or some other suffix to 
      everything that is printed, you can assign the suffix to 
<TT>$\</TT>.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$#</TT> </TD>
    <TD vAlign=top>This variable is the default format for printed numbers. 
      Normally, it's set to <TT>%.20g</TT>, but you can use the format 
      specifiers covered in by the section "<A 
      href="ch09.htm#Example: Printing Revisited">Example: 
      Printing Revisited</A>" in Chapter 9 to specify your own default 
  format.</TD></TR>
  <TR>
    <TD colSpan=2><I>Variables Used with Processes (See Chapter 13, "Handing 
      Exceptions and Signals")</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>$$</TT> </TD>
    <TD vAlign=top>This UNIX-based variable holds the process number of the 
      process running the Perl interpreter.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$?</TT> </TD>
    <TD vAlign=top>This variable holds the status of the last pipe close, 
      back-quote string, or <TT>system()</TT> function. More information about 
      the <TT>$?</TT> variable can be found in Chapter 13, "Handling Exceptions 
      and Signals."</TD></TR>
  <TR>
    <TD vAlign=top><TT>$0</TT> </TD>
    <TD vAlign=top>This variable holds the name of the file containing the 
      Perl script being executed.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$]</TT> </TD>
    <TD vAlign=top>This variable holds a string that identifies which version 
      of Perl you are using. When used in a numeric context, it will be equal to 
      the version number plus the patch level divided by 1000.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$!</TT> </TD>
    <TD vAlign=top>This variable, when used in a numeric context, holds the 
      current value of <TT>errno</TT>. If used in a string context, it will hold 
      the error string associated with <TT>errno</TT>. For more information 
      about <TT>errno</TT>, see Chapter 13, "Handling Exceptions and 
  Signals."</TD></TR>
  <TR>
    <TD vAlign=top><TT>$@</TT> </TD>
    <TD vAlign=top>This variable holds the syntax error message, if any, from 
      the last <TT>eval()</TT> function call. For more information about 
      <TT>errno</TT>, see Chapter 13, "Handling Exceptions and Signals."</TD></TR>
  <TR>
    <TD vAlign=top><TT>$&lt;</TT> </TD>
    <TD vAlign=top>This UNIX-based variable holds the read uid of the current 
      process.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$&gt;</TT> </TD>
    <TD vAlign=top>This UNIX-based variable holds the effective uid of the 
      current process.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$)</TT> </TD>
    <TD vAlign=top>This UNIX-based variable holds the read gid of the current 
      process. If the process belongs to multiple groups, then <TT>$)</TT> will 
      hold a string consisting of the group names separated by spaces.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^T</TT> </TD>
    <TD vAlign=top>This variable holds the time, in seconds, at which the 
      script begins running.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^X</TT> </TD>
    <TD vAlign=top>This variable holds the full path name of the Perl 
      interpreter being used to run the current script.</TD></TR>
  <TR>
    <TD vAlign=top><TT>%ENV</TT> </TD>
    <TD vAlign=top>This hash variable contains entries for your current 
      environment variables. Changing or adding an entry will affect only the 
      current process or a child process, never the parent process. See the 
      section "<A 
      href="ch12.htm#Example: Using the %ENV Variable">Example: 
      Using the %ENV Variable</A>" later in this chapter.</TD></TR>
  <TR>
    <TD vAlign=top><TT>%SIG</TT> </TD>
    <TD vAlign=top>This hash variable contains entries for signal handlers. 
      For more information about signal handlers, see Chapter 13, "Handling 
      Exceptions and Signals."</TD></TR>
  <TR>
    <TD colSpan=2><I>Variables Used with Reports (see Chapter 11, "<A 
      href="ch11.htm">Creating 
  Reports</A>")</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>$%</TT> </TD>
    <TD vAlign=top>This variable holds the current page number for the default 
      file handle. If you use <TT>select()</TT> to change the default file 
      handle, <TT>$%</TT> will change to reflect the page number of the newly 
      selected file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$=</TT> </TD>
    <TD vAlign=top>This variable holds the current page length for the default 
      file handle. Changing the default file handle will change <TT>$=</TT> to 
      reflect the page length of the new file handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$-</TT> </TD>
    <TD vAlign=top>This variable holds the number of lines left to print for 
      the default file handle. Changing the default file handle will change 
      <TT>$-</TT> to reflect the number of lines left to print for the new file 
      handle.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$~</TT> </TD>
    <TD vAlign=top>This variable holds the name of the default line format for 
      the default file handle. Normally, it is equal to the file handle's 
    name.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^</TT> </TD>
    <TD vAlign=top>This variable holds the name of the default heading format 
      for the default file handle. Normally, it is equal to the file handle's 
      name with <TT>_TOP</TT> appended to it.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$:</TT> </TD>
    <TD vAlign=top>This variable holds a string that consists of the 
      characters that can be used to end a word when word-wrapping is performed 
      by the <TT>^</TT> report formatting character. Normally, the string 
      consists of the space, newline, and dash characters.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^L</TT> </TD>
    <TD vAlign=top>This variable holds the string used to eject a page for 
      report printing. Chapter 11, "<A 
      href="ch11.htm">Creating Reports</A>," shows 
      how to use this variable to create simple footers.</TD></TR>
  <TR>
    <TD colSpan=2><I>Miscellaneous Variables</I></TD></TR>
  <TR>
    <TD vAlign=top><TT>$_</TT> </TD>
    <TD vAlign=top>This variable is used as the default parameter for a lot of 
      functions.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^D</TT> </TD>
    <TD vAlign=top>This variable holds the current value of the debugging 
      flags. For more information, see Chapter 16, "<A 
      href="ch16.htm">Debugging Perl</A>." </TD></TR>
  <TR>
    <TD vAlign=top><TT>$^I</TT> </TD>
    <TD vAlign=top>This variable holds the file extension used to create a 
      backup file for the in-place editing specified by the <TT>-i</TT> command 
      line option. For example, it could be equal to ".bak."</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^P</TT> </TD>
    <TD vAlign=top>This variable is an internal flag that the debugger clears 
      so that it will not debug itself.</TD></TR>
  <TR>
    <TD vAlign=top><TT>$^W</TT> </TD>
    <TD vAlign=top>This variable holds the current value of the <TT>-w</TT> 
      command line option.</TD></TR>
  <TR>
    <TD vAlign=top><TT>@ARGV</TT> </TD>
    <TD vAlign=top>This array variable holds a list of the command line 
      arguments. You can use <TT>$#ARGV</TT> to determine the number of 
      arguments minus one.</TD></TR>
  <TR>
    <TD vAlign=top><TT>@F</TT> </TD>
    <TD vAlign=top>This array variable holds the list returned from autosplit 
      mode. Autosplit mode is associated with the <TT>-a</TT> command line 
      option.</TD></TR>
  <TR>
    <TD vAlign=top><TT>@INC</TT> </TD>
    <TD vAlign=top>This array variable holds a list of directories where Perl 
      can look for scripts to execute. The list is used mainly by the require 
      statement. You can find more information about <TT>require</TT> statements 
      in Chapter 15, "<A href="ch15.htm">Perl 
      Modules</A>." </TD></TR>
  <TR>
    <TD vAlign=top><TT>%INC</TT> </TD>
    <TD vAlign=top>This hash variable has entries for each filename included 
      by <TT>do</TT> or <TT>require</TT> statements. The key of the hash entries 
      are the filenames and the values are the paths where the files were 
    found.</TD></TR></TBODY></TABLE>
<P>Most of these variables are discussed in other chapters of the book, and some 
of the variables are simple enough to use that you don't need to see examples by 
this time. However, the <TT>DATA</TT> file handle and the <TT>%ENV</TT> 
associated array deserve some additional mention. They are discussed in the 
following sections. 
<H3><A name="Example: Using the DATA File Handle">Example: Using the <I>DATA</I> 
File Handle</A></H3>As you no doubt realize by now, Perl has some really odd 
features, and the <TT>DATA</TT> file handle is one of them. This file handle 
lets you store read-only data in the same file as your Perl script, which might 
come in handy if you need to send both code and data to someone via e-mail. 
<P>When using the <TT>DATA</TT> file handle, you don't need to open or close the 
file handle - just start reading from the file handle using the diamond 
operator. The following simple example shows you how to use the <TT>DATA</TT> 
file handle. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Read all the lines that follow the line containing <TT>__END__</TT>. 
      <P>Loop through the <TT>@lines</TT> array, printing each element. 
      <P>Everything above the <TT>__END__</TT> line is code; everything below is 
      data.</TT></P></TD></TR></TBODY></TABLE>
<P><B><PRE>@lines = &lt;DATA&gt;;

foreach (@lines) {
    print("$_");
}

__END__
Line one
Line two
Line three</PRE></B>This program displays the following: 
<P><B><PRE>Line one
Line two
Line three</PRE></B>
<H3><A name="Example: Using the %ENV Variable">Example: Using the <I>%ENV</I> 
Variable</A></H3><I>Environment variables</I> are used by the operating system 
to store bits of information that are needed to run the computer. They are 
called environment variables because you rarely need to use them and because 
they simply remain in the background - just another part of the overall 
computing environment of your system. When your Perl process is started, it is 
given a copy of the environment variables to use as needed. 
<P>You can change the environment variables, but the changes will not persist 
after the process running Perl is ended. The changes will, however, affect the 
current process and any child processes that are started. 
<P>You can print out the environment variables by using these lines of code: 
<P><B><PRE>foreach $key (keys(%ENV)) {
    printf("%-10.10s: $ENV{$key}\n", $key);
}</PRE></B>On my Windows 95 machine, this program displays the following: 
<P><B><PRE>WINBOOTDIR: C:\WINDOWS
TMP       : C:\WINDOWS\TEMP
PROMPT    : $p$g
CLASSPATH : .\;e:\jdk\classes;
TEMP      : C:\WINDOWS\TEMP
COMSPEC   : C:\WINDOWS\COMMAND.COM
CMDLINE   : perl -w 12lst01.pl
BLASTER   : A220 I10 D3 H7 P330 T6
WINDIR    : C:\WINDOWS
PATH      : C:\WINDOWS;C:\WINDOWS\COMMAND;C:\PERL5\BIN;
TZ        : GMT-05:00</PRE></B>Only a few of these variables are interesting. 
The <TT>TMP</TT> and <TT>TEMP</TT> variables let you know where temporary files 
should be placed. The <TT>PATH</TT> variable lets the system know where to look 
for executable programs. It will search each directory in the list until the 
needed file is found. The <TT>TZ</TT> variable lets you know which time zone the 
computer is running in. 
<P>The most useful variable is probably the <TT>PATH</TT> statement. By changing 
it, you can force the system to search the directories you specify. This might 
be useful if you suspect that another program of the same name resides in 
another directory. By placing the current directory at the beginning of the 
<TT>PATH</TT> variable, it will be searched first and you'll always get the 
executable you want. For example: 
<P><B><PRE>$ENV{"PATH"} = ".;" . $ENV{"PATH"};</PRE></B>A single period is used to 
refer to the current directory, and a semicolon is used to delimit the 
directories in the <TT>PATH</TT> variable. So this statement forces the 
operating system to look in the current directory before searching the rest of 
the directories in <TT>PATH</TT>. 
<P>Environment variables can be useful if you want a quick way to pass 
information between a parent and a child process. The parent can set the 
variables, and the child can read it. 

## Summary

This chapter gathered into one location all the special variables used by Perl. Most of the variables have already been 
discussed in previous chapters, and a few will be discussed in later chapters. 
<P>Table 12.1 was organized to follow the <TT>PERLVAR.htm</TT> document that 
comes in the Perl distribution, so if you aren't familiar with a variable used 
in someone else's code, that's the place to look. The variables are basically 
ordered alphabetically. 
<P>Table 12.2 was organized according to functionality. Some variables are used 
with files, some with arrays, and so forth. 
<P>You saw an example of how to use the <TT>DATA</TT> file handle to read 
information from the same file that holds the Perl script. 
<P>The <TT>%ENV</TT> variable was also discussed. This hash is used to hold the 
environmental variables used mostly by the operating system. 
<P>In the next chapter, "<A 
href="ch13.htm">Handling Exceptions and 
Signals</A>," you learn about how to handle error conditions, use the 
<TT>eval()</TT> function, and other things dealing with exceptions that can 
happen while your program runs. 

## Review Questions

<OL>
  <LI>What is the <TT>$/</TT> variable used for? 
  <P></P>
  <LI>What file handle is used to avoid a second system call when doing two or 
  more file tests? 
  <P></P>
  <LI>What will the following program display? 
  <P><B><PRE>$_ = "The big red shoe";
m/[rs].*\b/;
print("$`\n");</PRE></B>
  <LI>What variable holds the value of the last match string? 
  <P></P>
  <LI>What will the following program display? 
  <P><B><PRE>@array = (1..5);
$" = "+";
print("@array\n");</PRE></B>
  <LI>What does the following program display? 
  <P><B><PRE>@array = ('A'..'E');

foreach (@array) {
    print();
}

$\ = "\n";
foreach (@array) {
    print();
}</PRE></B></LI></OL>

## Review Exercises

<OL>
  <LI>Write a program that changes the array element separator used in 
  interpolation of arrays inside double-quoted strings to be a comma instead of 
  a space. 
  <P></P>
  <LI>Write a program that displays which version of the Perl interpreter you 
  are running. 
  <P></P>
  <LI>Create a file in your temporary directory. (Hint: use the <TT>%ENV</TT> 
  special variable.) 
  <P></P>
  <LI>Write a program that uses the <TT>$\</TT> to end each printed element with 
  an <TT>":END"</TT> string. 
  <P></P>
  <LI>Write a program that prints the last record in a file. The records should 
  be variable-length, but each record starts with the string <TT>"START:"</TT>. 
  (Hint: look at the <TT>$/</TT> variable.)</LI></OL>
