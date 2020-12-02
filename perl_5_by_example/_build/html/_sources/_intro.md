# Introduction

This book is based on the learn-by-doing principle because I believe simply reading about a subject is not the best way to learn. After all, you don't read about putting together a jigsaw puzzle, you put the puzzle together yourself! Programming is the same way. You must actually run some programs in order to really understand the concepts.

*Perl 5 by Example* teaches you how to use the Perl programming language by showing examples that demonstrate the concepts being discussed. The examples are designed to give you a chance to experiment-which in turn should clarify the material.

The topics are covered in a straightforward, non-technical manner which allows you to quickly understand the fundamental principles. After the main topic of each chapter is introduced, sub-topics are explored in their own sections. Each section has its own Perl examples with explanations given in psuedocode. 

Each chapter finishes with review questions of varying difficulty based on the material in that chapter. The answers usually come from the text or are deducible from the text, but occasionally you might need to experiment a little. Try to answer the questions at all difficulty levels. If you get stuck turn to the answers provided in Appendix A. Also, look at the summary sections after reading each chapter and return to them frequently. After you've gone through several chapters, you'll begin to understand more often the reason why a concept was illustrated or a question was asked. Returning to questions that frustrated you earlier and realizing that now you know the answers can be a big confidence builder. 

## Who Should Use This Book?

*Perl 5 by Example* should be read by anyone seeking to learn Perl. If you don't know any other programming languages, read part one. If you already know another language, then skip to part two. To see how Perl differs from other languages start with [References](./references.md)

This book follows a simple format. Each chapter contains a single topic-usually. First, you read about the topic and then you see examples that let you work directly with Perl to understand how the concepts can be applied to a program. At the end of each chapter is a summary, ollowed by review questions and exercises. 

This approach is designed to serve a broad range of readers from novice to advanced. If you've never programmed before, the learn-by-doing approach will help you move quickly and easily though this book. If you have programming experience, you'll find plenty of material to refine and enhance what you already know, and to give you a solid understanding of how Perl works. 

## What do I Need?

In order to effectively use this book you need two things. You need a working copy of Perl 5. And you need a text editor. That's it. 

You can use the examples in this book with just about any hardware and operating system. I'm not sure that they would work on an Amiga system but other than that you should be able to run every example. 

## How to Use This Book

There are several ways to use this book. One obvious method is to begin at the first page 
and proceed in order until the last. Most beginning programmers will use this 
method and the book is specifically designed so that each chapter builds on the 
last. Alternatively, you can read up to [Regular Expressions](./regular-expressions.md) and then 
skip to the [Function List](./function-list.md). You can then read specific chapters as needed when your projects demand them. Either approach works. 

```{note}
It is critical to read through the Perl Command Reference (Appendix C) at least once before starting any major project. Otherwise, you might spend hours developing a function that Perl already has pre-defined.
```

## Code Listings

Many readers prefer to type in most of the example code by hand; this helps them focus on the code one line at a time. Another good approach is to work through an example in a chapter, close the book, and enter it by hand from memory. The struggle that you experience will help to deepen your understanding. Remember, getting lost can be how you learn to find you way. 

If you're lazy, can't type fast, or are prone to wrist pains like some of my friends, you can copy the listings from the CD-ROM that is included at the back of this book. Each listing that is on the CD-ROM has a listing header like this: 

>Listing 10.1 - 10LST01.PL - This is a Sample Listing Header

```
# This is a sample program line.
```

The name of the Perl source file will always be the same as the listing's number. After each example, experiment a little and see what happens. Change a few things, or add a couple, and change the code a bit. This will help you enjoy the learning experience more. The most important attribute of a successful learning experience is fun. If it is fun and you enjoy it, you will stay with it longer. 

## Conventions

The following conventions are used in this book: 

* Code line, functions, variable names, and any text you see on-screen appear in a special `monospace` typeface.
* File names are also set in a `monospace` typeface.
* New terms are in *italic*.
* Case is very important in Perl programming. Always pay attention to upper-case and lower-case in variable and function names.
* If you are required to type text, the text you must type will appear in a block quote.. For example, "Type **perl -w test.pl**." Usually, however, the line is set off by itself in a monospace typeface, as shown in the following example: 
 
> `perl -w test.pl`

## Overview

Perl I, "Basic Perl," consists of the first 8 chapters of this book.

* [Getting Your Feet Wet](./getting-your-feet-wet.md) - presents a short history of Perl and lets you create and execute your first Perl 
program.
* [Numeric and String Literals](./literals.md) - tells you how to explicitly represent non-changeable information in your program.
* [Variables](./variables.md) - shows how to represent changeable information.
* [Operators](./operators.md) - discusses how to change the information.
* [Functions](./functions.md) - discusses how to create parcels of code that you can call or execute by name.
* [Statements](./statements.md) - dives deep into exactly what the term *statement* means to Perl.
* [Control Statements](./control-statements.md) - shows how different statements can uses to control your programs.
* [References](./references.md) - completes the introduction to Perl basics by taking a peek into the world of data structures. 

The next three chapters make up Part II, "Intermediate Perl." These chapters contain valuable information that will let you create powerful, complete applications.

* [Using Files](./files.md) - discusses how files can be uses to store and retrieve information.
* [Regular Expressions](./regular-expressions.md) - highlights one of Perl's most useful abilities - pattern 
matching.
* [Creating Reports](./reports.md) - shows you how to present information in a structured way using Perl's inherent reporting ability.

Part III, "Advanced Perl," discusses some of the more difficult aspects of Perl.
* [Using Special Variables](./special-variables.md) - lists all of the special variables that you use in Perl and shows examples of the more useful ones.
* [Handling Errors and Signals](./errors.md) - introduces the concept of error handling.
* [What Are Objects?](./objects.md) - discusses the wonderful world of object-oriented programming.
* [Perl Modules](./modules.md) - shows you how to create your own modules to aid in reusing existing functions.
* [Debugging Perl](./debugging.md) - helps you to find the bugs or problems in your programs.
* [Command-line Options](./cli.md) - lists all of the options that you can use on the command-line that starts Perl.

Part IV, "Perl and the Internet," looks at how 
Perl can be used with the Internet.
* [Using Internet Protocols](./internet-protocols.md) - discusses several of the protocols commonly used on the Internet-such as FTP, SMTP, and POP.
* [What is CGI?](./cgi.md) - eases you into writing scripts that can be executed by remote users.
* [Form Processing](./form-processing.md) - discusses HTML forms and how Perl scripts can process form information.
* [Using Perl with Web Servers](./web-servers.md) - examines web server log file and how to create HTML web pages using Perl.
* [Internet Resources](./internet-resources.md) - lists 
several types of Perl resources that are available on the Internet-such as Usenet Newsgroups, web sites, and the `#perl` and `#cgi` IRC channels.

Also included are:
* [Review Question Answers](./review-answers.md) - contains answers to the review questions that are at the end of every chapter. Try not to peek!
* [Glossary](./glossary.md) - lists definitions for some words you might be unfamiliar with.
* [Function List](./function-list.md) - contains a list of Perl's many functions.
* [Using the Registry in Windows 95/NT](./windows-registry.md) - introduces you to the Registry database used by Windows 95 and Windows NT to store system and application information.
* [What's on the CD?](./cd-contents.md) - describes the contents of the CD.

## Copyright

Copyright 1996, Que Corporation. All rights reserved. No part of this book may be used or reproduced in any form or by any means, or stored in a database or retrieval system without prior written permission of the publisher except in the case of brief quotations embodied in critical articles and reviews. Making copies of any part of this book for any purpose other than your own personal use is a violation of United States copyright laws. For information, address Que Corporation, 201 West 103<SUP>rd</SUP> Street, Indianapolis, IN 46290. Notice: This material is from *Perl 5 by Example*, ISBN: 0-7897-0866-3. The electronic version of this material has not been through the final proof reading stage that the book goes through before being published in printed form. Some errors may exist here that are corrected before the book is published. This material is provided "as is" without any warranty of any kind