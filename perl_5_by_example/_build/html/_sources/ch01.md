# Getting Your Feet Wet

You are about to embark on a journey through the world of Perl programming. 

You'll find that the trip has been made easier by many examples liberally sprinkled along the trail. The beginning of the trip covers the basic concepts of the Perl language. Then you move on to some of the more advanced concepts - how to create Perl statements and whole programs. At the end of the trip, some guideposts are placed - in the form of Internet sites - to show you how to explore more advanced programming topics on your own. 

Do you know any other programming languages? If so, then learning Perl will be a snap. If not, take it slow, try all of the examples, and have fun experimenting as you read. 

I thought about adding a section here about programming ideals. Or perhaps, a discussion about the future of Perl. And then I realized that when I was first learning computer languages, I didn't really care about that stuff. I just wanted to know about the language and what I could *do* with it. 

With that in mind, the next section on Perl's origin is very short. After all, you can read all the background information you'd like using a web browser by starting at [Perl's home page](http://www.perl.org)

## Origins

Perl began as the result of one man's frustration and, by his own account, inordinate laziness. It is a unique language in ways that cannot be conveyed simply by describing the technical details of the language. Perl is a state of mind as much as a language grammar. One of the oddities of the language is that its name has been given quite a few definitions. Originally Perl meant the **P**ractical **E**xtraction **R**eport **L**anguage. However, programmers also refer to is as the **P**athologically **E**clectic **R**ubbish **L**ister. Or even, **P**ractically **E**verything **R**eally **L**ikeable. 

Let's take a few minutes to look at the external forces which provoked Perl into being - it should give you an insight into the way Perl was *meant* to be used. Back in 1986, Larry Wall found himself working on a task which involved generating reports from a lot of text files with cross references. Being a UNIX programmer, and because the problem involved manipulating the contents of text files, he started to use awk for the task. But it soon became clear that awk wasn't up to the job; with no other obvious candidate for the job, he'd just have to write some code. 

Now here's the interesting bit: Larry could have just written a utility to manage the particular job at hand and gotten on with his life. He could see, though, that it wouldn't be long before he'd have to write another special utility to handle something else which the standard tools couldn't quite hack. (It's possible that he realized that most programmers were *always* writing special utilities to handle things which the standard tools couldn't quite hack...) 

So rather than waste any more of his time, he invented a new language and wrote an interpreter for it. If that seems like a paradox, it isn't really - it's always a bit more of an effort to set yourself up with the right tools, but if you do it right, the effort pays off. 

The new language had an emphasis on system management and text handling. After a few revisions, it could handle regular expressions, signals, and network sockets too. It became known as Perl and quickly became popular with frustrated, lazy UNIX programmers. And the rest of us. 

```{note}
Is it "Perl" or "perl"? The definitive word from Larry Wall is that it doesn't matter. Many programmers like to refer to languages with capitalized names (Perl) but the program originated on a UNIX system where short, lower-case names (awk, sed, and so forth) were the norm. As with so many things about the language, there's no single "right way" to do it; just use it the way you want. It's a tool, after all, not a dogma. If you're sufficiently pedantic, you may want to call it "[Pp]erl" after you've read about [Regular Expressions](./regular-expressions.md).
```

## Similar to C?

Perl programs bear a passing resemblance to C programs, perhaps because Perl was written in C, or perhaps because Larry found some of its syntactic conventions handy. But Perl is less pedantic and a lot more concise than C.

Perl can handle low-level tasks quite well, particularly since Perl 5, when the whole messy business of references was put on a sound footing. In this sense it has a lot in common with C. But Perl handles the internals of data types, memory allocation and such automatically and seamlessly.

This habit of picking up interesting features as it went along - regular expressions here, database handling there - has been regularized in Perl 5. It is now fairly easy to add your favorite bag of tricks to Perl by using modules. It is likely that many of the added - on features of Perl such as socket handling will be dropped from the core of Perl and moved out to modules after a time. 

## Cost and Licensing

Perl is free. The full source code and documentation are free to copy, compile, print, and give away. Any programs you write in Perl are yours to do with as you please; there are no royalties to pay and no restrictions on distributing them as far as Perl is concerned. 

It's not completely "public domain," though, and for very good reason. If the source were completely public domain, it would be possible for someone to make minor alterations to it, compile it, and sell it - in other words, to rip off its creator. On the other hand, without distributing the source code, it's hard to make sure that everyone who wants to can use it. 

The GNU General Public License is one way to distribute free software without the danger of someone taking advantage of you. Under this type of license, source code may be distributed freely and used by anybody, but any programs derived using such code must be released under the same type of license. In other words, if you derive any of your source code from GNU-licensed source code, you have to release your source code to anyone who wants it. 

This is often sufficient to protect the interests of the author, but it can lead to a plethora of derivative versions of the original package. This may deprive the original author of a say in the development of their own creation. It can also lead to confusion on the part of the end users as it becomes hard to establish which is the definitive version of the package, whether a particular script will work with a given version, and so on.

That's why Perl is released under the terms of the "Artistic" license. This is a variation on the GNU General Public License which says that anyone who releases a package derived from Perl must make it clear that the package is not actually Perl. All modifications must be clearly flagged, executables renamed if necessary, and the original modules distributed along with the modified versions. The effect is that the original author is clearly recognized as the "owner" of the package. The general terms of the GNU General Public license also apply.

## Do You Have Perl Installed?

It's critically important to have Perl installed on your computer before reading too much further. As you read the examples, you'll want to try them. If Perl is not already installed, momentum and time will be lost. 

It is very easy to see if your system already has Perl installed. Simply go to a command-line prompt and type: 

```bash
perl -v
```

Hopefully, the response will be similar to this: 

```text
This is perl, version 5.001
Unofficial patchlevel 1m.
Copyright 1987-1994, Larry Wall
Win32 port Copyright (c) 1995 Microsoft Corporation.
All rights reserved.
Developed by hip communications inc., http://info.hip.com/info/
Perl for Win32 Build 107
Built Apr 16 1996@14:47:22
Perl may be copied only under the terms
of either the Artistic License or the
GNU General Public License, which
may be found in the Perl 5.0 source kit.
```

If you get an error message or you have version 4 of Perl, please see your system administrator or install Perl yourself. The next section describes how to get and install Perl.

## Getting and Installing Perl

New versions of Perl are released on the Internet and distributed to Web sites and ftp archives across the world. UNIX binaries are generally not made available on the Internet, as it is generally better to build Perl on your system so that you can be certain it will work. All UNIX systems have a C compiler, after all. 

Each operating system has its own way of getting and installing Perl. 

* <B>For UNIX and OS/2</B> - The Perl Home Page contains a [download link](https://www.perl.org/get.html) that will enable you to download the latest Perl version.

* <B>For Windows 95/Windows NT</B> - The [home page](https://www.activestate.com/products/perl/) of ActiveState Tool Corp. has a *Download Now* link. Download ActivePerl and start programming today!

Instructions for compiling Perl or for installing on each operating system are included with the distribution files. Follow the instructions provided and you should having a working Perl installation rather quickly. If you have trouble installing Perl, skip ahead to [Internet Resources](./internet-resources.md), also connect to the #perl IRC channel, and ask for help. Don't be shy!

## Your First Perl Program

Your first Perl program will show how to display a line of text on your monitor. First, you create a text file to hold the Perl program. Then you run or execute the Perl program file. 

### Creating the Program

A Perl program consists of an ordinary text file containing a series of Perl statements. Statements are written in what looks like a amalgam of C, UNIX shell script, and English. In fact, that's pretty much what it is. 

Perl code can be quite free-flowing. The broad syntactic rules governing where a statement starts and ends are: 

* Leading spaces on a line are ignored. You can start a Perl statement anywhere you want: At the beginning of the line, indented for clarity (recommended) or even right-justified (definitely frowned on because the code would be difficult to understand) if you like.
* Statements are terminated with a semi-colon. 
* Spaces, tabs, and blank lines outside of strings are irrelevant - one space is as good as a hundred. That means you can split statements over several lines for clarity. A string is basically a series of characters enclosed in quotes. The [Numeric and String Literals](./literals.md) page contains a better definition for strings.
* Anything after a hash sign (#) is ignored except in strings. Use this fact to pepper your code with useful comments.

Here's a Perl statement inspired by Kurt Vonnegut:

```perl
print("My name is Yon Yonson\n");
```

No prizes for guessing what happens when Perl runs this code - it prints out `My name is Yon Yonson`. If the `\n` doesn't look familiar, don't worry - it simply means that Perl should print a newline character after the text, or in other words, go to the start of the next line. 

Printing more text is a matter of either stringing together statements like this, or giving multiple arguments to the `print()` function:

```perl
print("My name is Yon Yonson,\n"); 
print("I live in Wisconsin,\n", "I work in a lumbermill there.\n");
```

So what does a complete Perl program look like? Here's a small example, complete with the invocation line at the top and a few comments:

```perl
#!/usr/local/bin/perl -w
print("My name is Yon Yonson,\n");
print("I live in Wisconsin,\n", "I work in a lumbermill there.\n");
```

That's not at all typical of a Perl program, though; it's just a linear sequence of commands with no complexity.

You can create your Perl program by starting any text processor: 

* <B>In UNIX</B> - you can use `emacs` or `vi`. 
* <B>In Windows 95/Windows NT</B> - you can use `notepad` or `edit`. 
* <B>In OS/2</B> - you can use `e` or `epm`.

Create a file called `test.pl` that contains the preceding three lines.

### Invocation

Assuming that Perl is correctly installed and working on your system, the simplest way to run a Perl program is to type the following:

```bash
perl <filename>.pl
```

The `filename` should be replaced by the name of the program that you are trying to run or execute. If you created a `sample.pl` file while reading the previous section, you can run it like this: `>perl sample.pl` This example assumes that perl is in the execution path; if not, you will need to supply the full path to perl too. For example, on UNIX the command might be: `>/usr/local/bin/perl sample.pl` Whereas on Windows NT, you might need to use: `>c:\perl5\bin\perl sample.pl` UNIX systems have another way to invoke a program. However, you need to do two things. The first is to place a line like `>#!/usr/local/bin/perl` at the start of the Perl file. This tells UNIX that the rest of this script file is to be run by `/usr/local/bin/perl`. The second step is to make the program file itself executable by changing its mode: `>chmod +x sample.pl` Now you can execute the program file directly and let the program file tell the operating system what interpreter to use while running it. The new command line is simply: `>sample.pl`

```{note}
The printed version of this book used "test" for the name of the Perl script in the above example. However, it was pointed out that many Unix systems already have a program named "test", so I changed the name to "sample" to avoid possible confusion. In addition, the printed version did not include the .pl extension when executing the script.
```

## Comments in Your Program

It is very important to place comments into your Perl programs. Comments will enable you to figure out the intent behind the mechanics of your program. For example, it is very easy to understand that your program adds 66 to another value. But, in two years, you may forget how you derived the number 66 in the first place. 

Comments are placed inside a program file using the # character. Everything after the # is ignored. For example: 

```perl
# This is whole line is ignored. 
print("Perl is easy.\n"); # Here's a half-line comment.
```

## Summary

You've finished the first chapter of the book and already written and executed a Perl program. Believe it or not, you've now done more than most people that I talk to on the web. Let's quickly review what you've read so far. 

Perl was created to solve a need, not to match the ideals of computer science. It has evolved from being a simple hack to a full-fledged modern programming language. Perl's syntax is similar to the C programming language. However, it has a lot a features that were borrowed from UNIX tools. 

Perl is very cost-effective in a lot of situations because it is free. There are legal restrictions that you need to follow. However, any restrictions are listed in the documentation that comes with Perl, and you don't need that information repeated. 

Perl programs are simply text files. They are created in any text editor. As long as you give the file an extension of .pl, running the file will be easy. 

Most systems will run Perl program file called `test.pl` with the following command: `>perl test.pl`You can add comments to your Perl program using the # character. Anything after the # character is ignored. 

I hope the journey has been very smooth so far. The only difficulty may have been if you did not have Perl installed. The next part of the journey will be to learn some basic building blocks in the form of numeric and string literals. But literals will have to wait until the next chapter... 

## Review Questions

Answers to Review Questions are in Appendix A: 

1. What is the address of Perl's home page? 
1. Who was the creator of Perl? 
1. How much does Perl cost? 
1. Why are comments important to programming?

## Review Exercises

1. Connect to the Perl Home page and spend a few minutes looking at the links. 
1. Create and run a Perl program that prints `Hello, World` on the monitor.
