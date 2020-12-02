# Introduction

This book is based on the learn-by-doing principle because I believe simply 
reading about a subject is not the best way to learn. After all, you don't read 
about putting together a jigsaw puzzle, you put the puzzle together yourself! 
Programming is the same way. You must actually run some programs in order to 
really understand the concepts.

<I>Perl 5 by Example</I> teaches you how to use the Perl programming language 
by showing examples that demonstrate the concepts being discussed. The examples 
are designed to give you a chance to experiment-which in turn should clarify the 
material.

The topics are covered in a straightforward, non-technical manner which 
allows you to quickly understand the fundamental principles. After the main 
topic of each chapter is introduced, sub-topics are explored in their own 
sections. Each section has its own Perl examples with explanations given in 
psuedocode. 

Each chapter finishes with review questions of varying difficulty based on 
the material in that chapter. The answers usually come from the text or are 
deducible from the text, but occasionally you might need to experiment a little. 
Try to answer the questions at all difficulty levels. If you get stuck turn to 
the answers provided in Appendix A. Also, look at the summary sections after 
reading each chapter and return to them frequently. After you've gone through 
several chapters, you'll begin to understand more often the reason why a concept 
was illustrated or a question was asked. Returning to questions that frustrated 
you earlier and realizing that now you know the answers can be a big confidence 
builder. 

## Who Should Use This Book?

<I>Perl 5 by Example</I> should be read by anyone seeking to learn Perl. If you don't 
know any other programming languages, chapters 2 through 7 will give you a solid 
introduction to the basics. If you already know another language, then skip 
chapters 2 through 7 to see how Perl differs from other languages and start with 
Chapter 8, "<A href="p5be/ch08.htm">References</A>." 

This book follows a simple format. Each chapter contains a single 
topic-usually. First, you read about the topic and then you see examples that 
let you work directly with Perl to understand how the concepts can be applied to 
a program. At the end of each chapter is a summary, followed by review questions 
and exercises. 

This approach is designed to serve a broad range of readers from novice to 
advanced. If you've never programmed before, the learn-by-doing approach will 
help you move quickly and easily though this book. If you have programming 
experience, you'll find plenty of material to refine and enhance what you 
already know, and to give you a solid understanding of how Perl works. 

## What do I Need?

In order to effectively use this book you need two things. You need a working copy of Perl 5. And you need a text editor. That's it. 

You can use the examples in this book with just about any hardware and 
operating system. I'm not sure that they would work on an Amiga system but other 
than that you should be able to run every example. 

## How to Use This Book

There are several ways to use this book. One obvious method is to begin at the first page 
and proceed in order until the last. Most beginning programmers will use this 
method and the book is specifically designed so that each chapter builds on the 
last. Alternatively, you can read up to Chapter 10, "<A 
href="p5be/ch10.htm">Regular Expressions</A>," and then 
skip to Appendix C, "<A href="p5be/xp0c.htm">Function 
List</A>." You can then read specific chapters as needed when your projects 
demand them. Either approach works. 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=white size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>It is critical to read through the Perl Command 
      Reference (Appendix C) at least once before starting any major project. 
      Otherwise, you might spend hours developing a function that Perl already 
      has pre-defined. </TD></TR></TBODY></TABLE></P>

## Code Listings

Many readers prefer to type in most of the example code by hand; this helps them focus on the code one line at 
a time. Another good approach is to work through an example in a chapter, close 
the book, and enter it by hand from memory. The struggle that you experience 
will help to deepen your understanding. Remember, getting lost can be how you 
learn to find you way. 

If you're lazy, can't type fast, or are prone to wrist pains like some of my 
friends, you can copy the listings from the CD-ROM that is included at the back 
of this book. Each listing that is on the CD-ROM has a listing header like this: 

<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>Listing 10.1 - 10LST01.PL 
      - This is a Sample Listing Header </B></FONT></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
# This is a sample program line.</PRE></B></TD></TR></TBODY></TABLE>

The name of the Perl source file will always be the same as the listing's 
number. After each example, experiment a little and see what happens. Change a 
few things, or add a couple, and change the code a bit. This will help you enjoy 
the learning experience more. The most important attribute of a successful 
learning experience is fun. If it is fun and you enjoy it, you will stay with it 
longer. 

## Conventions

The following conventions are used in this book: 

<UL>
  <LI>Code line, functions, variable names, and any text you see on-screen 
  appear in a special <TT>monospace</TT> typeface. 
 
  <LI>File names are also set in a <TT>monospace</TT> typeface. 
 
  <LI>New terms are in <I>italic</I>. 
 
  <LI>Case is very important in Perl programming. Always pay attention to 
  upper-case and lower-case in variable and function names. 
 
  <LI>If you are required to type text, the text you must type will appear in 
  boldface. For example, "Type <B>perl -w test.pl</B>." Usually, however, the 
  line is set off by itself in a monospace typeface, as shown in the following 
  example: 
 
  <B><PRE>perl -w test.pl</PRE></B></LI></UL>

## Overview

Perl I, "Basic Perl," consists of the first 8 chapters of this book. These 
chapter discuss the fundamentals of Perl. Chapter 1, "<A 
href="p5be/ch01.htm">Getting Your Feet Wet</A>, " 
presents a short history of Perl and lets you create and execute your first Perl 
program. Chapter 2, "<A href="p5be/ch02.htm">Numeric and 
String Literals</A>," tells you how to explicitly represent non-changeable 
information in your program. Chapter 3, "<A 
href="p5be/ch03.htm">Variables</A>," shows how to 
represent changeable information. Then Chapter 4, "<A 
href="p5be/ch04.htm">Operators</A>," discusses how to 
change the information. Chapter 5, "<A 
href="p5be/ch05.htm">Functions</A>," discusses how to 
create parcels of code that you can call or execute by name. Chapter 6, "<A 
href="p5be/ch06.htm">Statements</A>," dives deep into 
exactly what the term <I>statement</I> means to Perl. Chapter 7, "<A 
href="p5be/ch07.htm">Control Statements</A>," shows how 
different statements can uses to control your programs. Chapter 8, "<A 
href="p5be/ch08.htm">References</A>," completes the 
introduction to Perl basics by taking a peek into the world of data structures. 


The next three chapters make up Part II, "Intermediate Perl." These chapters 
contain valuable information that will let you create powerful, complete 
applications. Chapter 9, "<A href="p5be/ch09.htm">Using 
Files</A>," discusses how files can be uses to store and retrieve information. 
Chapter 10, "<A href="p5be/ch10.htm">Regular 
Expressions</A>," highlights one of Perl's most useful abilities-pattern 
matching. Chapter 11, "<A href="p5be/ch11.htm">Creating 
Reports</A>," shows you how to present information in a structured way using 
Perl's inherent reporting ability.

Part III, "Advanced Perl," discusses some of the more difficult aspects of 
Perl. Chapter 12, "<A href="p5be/ch12.htm">Using Special 
Variables</A>," lists all of the special variables that you use in Perl and 
shows examples of the more useful ones. Chapter 13, "<A 
href="p5be/ch13.htm">Handling Errors and Signals</A>," 
introduces the concept of error handling. Chapter 14, "<A 
href="p5be/ch14.htm">What Are Objects?</A>," discusses 
the wonderful world of object-oriented programming. Chapter 15, "<A 
href="p5be/ch15.htm">Perl Modules</A>," shows you how to 
create your own modules to aid in reusing existing functions. Chapter 16, "<A 
href="p5be/ch16.htm">Debugging Perl</A>," helps you to 
find the bugs or problems in your programs. Chapter 17, "<A 
href="p5be/ch17.htm">Command-line Options</A>," lists 
all of the options that you can use on the command-line that starts Perl.

Part IV, "Perl and the Internet," consists of 5 chapters that look at how 
Perl can be used with the Internet. Chapter 18, "<A 
href="p5be/ch18.htm">Using Internet Protocols</A>," 
discusses several of the protocols commonly used on the Internet-such as FTP, 
SMTP, and POP. Chapter 19, "<A href="p5be/ch19.htm">What 
is CGI?</A>," eases you into writing scripts that can be executed by remote 
users. Chapter 20, "<A href="p5be/ch20.htm">Form 
Processing</A>," discusses HTML forms and how Perl scripts can process form 
information. Chapter 21, "<A href="p5be/ch21.htm">Using 
Perl with Web Servers</A>," examines web server log file and how to create HTML 
web pages using Perl. Chapter 22, "<A 
href="p5be/ch22.htm">Internet Resources</A>," lists 
several types of Perl resources that are available on the Internet-such as 
Usenet Newsgroups, web sites, and the <TT>#perl</TT> and <TT>#cgi</TT> IRC 
channels.

Chapter 23, "<A 
href="p5be/ch01.htm#Review Questions">Review 
Questions</A>," contains answers to the review questions that are at the end of every chapter. Try not to peek! Chapter 24, "<A href="p5be/xp0b.htm">Glossary</A>," lists definitions for some words you might be unfamiliar with. Chapter 25, "<A href="p5be/xp0c.htm">Function List</A>," contains a list of Perl's many functions. Chapter 26, "<A 
href="p5be/xp0d.htm">Using the Registry in Windows 95/NT</A>," introduces you to the Registry database used by Windows 95 and Windows NT to store system and application information. Chapter 27, "<A href="p5be/xp0e.htm">What's on the CD?</A>," describes the contents of the CD.

## Copyright

Copyright 1996, Que Corporation. All rights reserved. No part of this book may be used or reproduced in any form or by any 
  means, or stored in a database or retrieval system without prior written permission of the publisher except in the case of brief quotations embodied in critical articles and reviews. Making copies of any part of this book for any purpose other than your own personal use is a violation of United States copyright laws. For information, address Que Corporation, 201 West 103<SUP>rd</SUP> Street, Indianapolis, IN 46290. Notice: This material is from <I>Perl 5 by Example</I>, ISBN: 0-7897-0866-3. The electronic version of this material has not been through the final proof reading stage that the book goes through before being published in printed form. Some errors may exist here that are corrected before the book is published. This material is provided "as is" without any warranty of any kind