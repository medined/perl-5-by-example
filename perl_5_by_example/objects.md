# What Are Objects?

<P>Actually, "What are objects?" is a silly question because you already know 
what an object is. Trust your instincts. The book you are reading is an object. 
The knife and fork you eat with are objects. In short, your life is filled with 
them. 
<P>The question that really needs to be asked is, "What are classes?" You see, 
all object-oriented techniques use classes to do the real work. A <I>class</I> 
is a combination of variables and functions designed to emulate an object. 
However, when referring to variables in a class, object-oriented folks use the 
term <I>properties</I>; and when referring to functions in a class, the term 
<I>method</I> is used. 
<P>I'm not sure why new terminology was developed for object-oriented 
programming. Because the terms are now commonplace in the object-oriented 
documentation and products, you need to learn and become comfortable with them 
in order to work efficiently. 
<P>In this chapter, you see how to represent objects in Perl using classes, 
methods, and properties. In addition, you look at the definitions of some big 
words like <I>abstraction</I>, <I>encapsulation</I>, <I>inheritance</I>, and 
<I>polymorphism</I>. 
<P>Following are short definitions for these words. The sections that follow 
expand on these definitions and show some examples of their use. 
<P>
<UL>
  <LI><B>Abstraction:</B> Information about an object (its properties) can be 
  accessed in a manner that isolates how data is stored from how it is accessed 
  and used. 
  <P></P>
  <LI><B>Encapsulation:</B> The information about an object and functions that 
  manipulate the information (its methods) are stored together. 
  <P></P>
  <LI><B>Inheritance:</B> Classes can inherit properties and methods from one or 
  more parent classes. 
  <P></P>
  <LI><B>Polymorphism:</B> A child class can redefine a method already defined 
  in the parent class.</LI></UL>

## Learning about Classes

Before looking at specific examples of object-oriented Perl code, you need to see some 
generic examples. Looking at generic examples while learning the "standard" 
object-oriented terminology will ensure that you have a firm grasp of the 
concepts. If you had to learn new Perl concepts at the same time as the object 
concepts, something might be lost because of information overload. 
<P><I>Classes</I> are used to group and describe object types. Remember the 
character classes from Chapter 10, "Regular Expressions?" A class in the 
object-oriented world is essentially the same thing. Let's create some classes 
for an inventory system for a pen and pencil vendor. Start with a pen object. 
How could you describe a pen from an inventory point of view? 
<P>Well, the pen probably has a part number, and you need to know how many of 
them there are. The color of the pen might also be important. What about the 
level of ink in the cartridge - is that important? Probably not to an inventory 
system because all the pens will be new and therefore full. 
<P>The thought process embodied in the previous paragraph is called 
<I>modeling</I>. Modeling is the process of deciding what will go into your 
objects. In essence, you create a model of the world out of objects. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>The terms <I>object</I> and <I>class</I> are pretty 
      interchangeable. Except that a class might be considered an object 
      described in computer language, whereas an object is just an 
  object.</TD></TR></TBODY></TABLE>
<P>Objects are somewhat situationally dependent. The description of an object, 
and the class, depend on what needs to be done. If you were attempting to design 
a school course scheduling program, your objects would be very different than if 
you were designing a statistics program. 
<P>Now back to the inventory system. You were reading about pens and how they 
had colors and other identifying features. In object talk, these features are 
called <I>properties</I>. Figure 14.1 shows how the pen class looks at this 
stage of the discussion.
<P><I>Fig. 14.1 - The <TT>Pen</TT> class and its properties.</I> 
<P>Now that you have a class, it's time to generalize. Some people generalize 
first. I like to look at the details first and then extract the common 
information. Of course, usually you'd need several classes before any common 
features will appear. But because I've already thought this example through, you 
can cheat a little. 
<P>It's pretty obvious that all inventory items will need a part number and that 
each will have its own quantity-on-hand value. Therefore, you can create a more 
general class than <TT>Pen</TT>. Let's call it <TT>Inventory_item</TT>. Figure 
14.2 shows this new class. 
<P><I>Fig. 14.2 - The <TT>Inventory_item</TT> class and its properties.</I> 
<P>Because some of <TT>Pen</TT>'s properties are now also in 
<TT>Inventory_item</TT>, you need some mechanism or technique to avoid 
repetition of information. This is done by deriving the <TT>Pen</TT> class from 
<TT>Inventory_item</TT>. In other words, <TT>Inventory_item</TT> becomes the 
<I>parent</I> of <TT>Pen</TT>. Figure 14.3 shows how the two classes are now 
related. 
<P><I>Fig. 14.3 - The relationship between <TT>Inventory_item</TT> and 
<TT>Pen.</TT></I> 
<P>You may not have noticed, but you have just used the concept of 
<I>inheritance</I>. The <TT>Pen</TT> class inherits two of its properties from 
the <TT>Inventory_item</TT> class. Inheritance is really no more complicated 
than that. The child class has the properties of itself plus whatever the parent 
class has. 
<P>You haven't seen methods or functions used in classes yet. This was 
deliberate. Methods are inherited in the same way that data is. However, there 
are a couple of tricky aspects of using methods that are better left for later. 
Perhaps even until you start looking at Perl code. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Even though you won't read about methods at this 
      point in the chapter, there is something important that you need to know 
      about inheritance and methods. First, methods are inherited just like 
      properties. Second, using inherited methods helps to create your program 
      quicker because you are using functionality that is already working. 
      Therefore - at least in theory - your programs should be easier to 
    create.</TD></TR></TBODY></TABLE>

## Abstract Thinking

Earlier, I mentioned the term <I>abstraction</I>. Let's examine the idea a little further. In order 
to do this, you need a working definition of the term <I>model</I>. How about, 
"A model is an approximation of something." If you build a model car, some of 
the items in the original car will be missing, like spark plugs, for example. If 
you build a model house, you wouldn't include the plumbing. Thus, the models 
that you build are somewhat abstract; the details don't matter, just the form. 
<P>Abstraction in object-oriented programming works in the same way. As the 
programmer, you present the model of your objects to other programmers in the 
form of an <I>interface</I>. Actually, the interface is just some documentation 
that tells others how to interact with any of your classes. However, nobody 
needs to know what your classes really do. It is enough to say that the file 
object stores the file name and size and presents the information in English. 
Whether the internal format of the information is compressed, Russian, or stored 
in memory or on the hard disk is immaterial to the user of your classes. 
<P>I recommend that as you design an object or class, you occasionally distance 
yourself from the work. Try to view the resulting system through the eyes of 
another to check for inconsistencies and relationships that aren't needed. 
<P>You've learned about abstraction in abstract terms so far. Now let's use the 
<TT>Pen</TT> class that you created earlier to see a concrete example of 
abstraction. The <TT>Pen</TT> class had only one property of its own, the ink 
color (the rest were inherited). For the sake of argument, the ink color can be 
<TT>"blue"</TT>, <TT>"black"</TT>, or <TT>"red"</TT>. When a <TT>Pen</TT> object 
is created (the mechanism of creation is unimportant at the moment), a specific 
color is assigned to it. Use <TT>"blue"</TT> for the moment. Here is a line of 
code to create the object: 
<P><B><PRE>$pen = Pen-&gt;new("blue");</PRE></B>Now the <TT>Pen</TT> object has been 
created. Do you care if the internal format of the ink color is the string 
<TT>"blue"</TT> or the number 1? What if, because you expect to use thousands of 
objects, the internal format changes from a string to a number to save computer 
memory? As long as the interface does not change, the program that uses the 
class does not need to change. 
<P>By keeping the external interface of the class fixed, an abstraction is being 
used. This reduces the amount of time spent retrofitting programs each time a 
change is made to a class the program is using. 

## Overriding Methods with Polymorphism

<I>Polymorphism</I> is just a little more complicated than 
inheritance because it involves methods. Earlier I said you might not learn 
about methods before you look at a real object-oriented Perl program, but I 
changed my mind. Let's make up some methods that belong in an inventory program. 
How about a method to print the properties for debugging purposes or a method to 
change the quantity-on-hand amount? Figure 14.4 shows the 
<TT>Inventory_item</TT> class with these two functions. 
<P><I>Fig. 14.4 - The <TT>Inventory_item</TT> class with methods.</I> 
<P>This new function is automatically inherited by the <TT>PEN</TT> class. 
However, you will run into a problem because the <TT>printProperties()</TT> 
function won't print the ink color. You have three choices: 
<P>
<UL>
  <LI>Change the function in the <TT>Inventory_item</TT> class - This is a bad 
  choice because the generic inventory item should not know any unique 
  information about inventory objects - just general or common information. 
  <P></P>
  <LI>Create a new function in the <TT>Pen</TT> class called 
  <TT>printPenProperties() - </TT>This is another bad choice. By solving the 
  problem this way, every class will soon have its own print functions, and 
  keeping track of the function names would be a nightmare. 
  <P></P>
  <LI>Create a new function in the <TT>Pen</TT> class called 
  <TT>printProperties()</TT> to <I>override</I> the definition from 
  <TT>Inventory_item - </TT>This is a good solution. In fact, this is the way 
  that polymorphism works.</LI></UL>
<P>Perl's take on polymorphism is that if you call a method in your program, 
either the current class or a parent class should have defined that method. If 
the current class has not defined the method, Perl looks in the parent class. If 
the method is still not found, Perl continues to search the class 
<I>hierarchy</I>. 
<P>I can hear you groaning at this point - another object-oriented word! Yes, 
unfortunately. But at least this one uses the normal, everyday definition of the 
word. A <I>hierarchy</I> is an organized tree of information. In our examples so 
far, you have a two-level hierarchy. It's possible to have class hierarchies 
many levels deep. In fact, it's quite common. Figure 14.5 shows a class 
hierarchy with more than one level. 
<P><I>Fig. 14.5 - A class hierarchy with many levels.</I> 
<P>It's probably worth mentioning that some classes contain only information and 
not methods. As far as I know, however, there is no special terminology to 
reflect this. These information-only classes may serve as adjunct or helper 
classes. 

## Keeping Code and Data Together with Encapsulation

There's not much that I need to say about encapsulation. Keeping the methods in the same place as the information 
they affect seems like common sense. It wasn't done using earlier languages 
mostly because the programming tools were not available. The extra work required 
to manually perform encapsulation outweighed the benefits that would be gained. 
<P>One big advantage of encapsulation is that it makes using information for 
unintended purposes more difficult, and this reduces logic errors. For example, 
if pens were sold in lots of 100, the <TT>changeQuantityOnHand()</TT> function 
would reflect this. Changing the quantity by only one would not be possible. 
This enforcement of business rules is one of the biggest attractions of 
object-oriented programming. 

## How Perl Handles Objects

Remember the concept of references that was discussed in Chapter 8,"<A 
href="ch08.htm">References</A>" ? If not, please 
re-read it. References will play a large role in the rest of the chapter and are 
critical to understanding how classes are used. You specifically need to 
remember that the <TT>{ }</TT> notation indicates an anonymous hash. Armed with 
this knowledge and the object-oriented terminology from the first part of this 
chapter, you are ready to look at real Perl objects. Listing 14.1 shows you how 
the <TT>inventory_item</TT> class could be defined in Perl. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a new class called <TT>Inventory_item</TT>. The <TT>package</TT> 
      keyword is used to introduce new classes and namespaces. 
      <P>Define the <TT>new()</TT> function. This function is responsible for 
      constructing a new object. 
      <P>The first parameter to the <TT>new()</TT> function is the class name 
      (<TT>Inventory_item</TT>). This is explained further in the sections 
      "Example: Initializing Object Properties" and "Static Versus Regular 
      Methods" later in the chapter. 
      <P>The <TT>bless()</TT> function is used to change the data type of the 
      anonymous hash to <TT>$class</TT> or <TT>Inventory_item</TT>. Because this 
      is the last statement in the method, its value will be returned as the 
      value of the function. I feel that using the return statement to 
      explicitly return a value would clutter the code in this situation. 
      <P>An anonymous hash is used to hold the properties for the class. For the 
      moment, their values are undefined. Assigning values to properties is 
      discussed in the section "<A 
      href="ch14.htm#Example: Initializing Properties">Example: 
      Initializing Properties</A>" later in this chapter. 
      <P>Switch to the package called <TT>main</TT>. This is the default place 
      for variables and code to go (technically, this is called a 
      <I>namespace</I>). If no classes are defined in your script, then this 
      line is not needed. 
      <P>Assign an instance of the <TT>Inventory_item</TT> class to the 
      <TT>$item</TT> variable.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 14.1-14LST01.PL - Defining the <TT>Inventory_item</TT> 
      Class</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>package Inventory_item;
    sub new {
        my($class) = shift;

        bless {
            "PART_NUM"    =&gt; undef,
            "QTY_ON_HAND" =&gt; undef
        }, $class;
    }

package main;
   $item = Inventory_item-&gt;new();</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>There is a <I>lot</I> of new stuff in this small 10 line listing, and you'll 
need to review it carefully to glean the information needed to understand 
everything that is happening. You'll also start to translate between the Perl 
keywords and the object-oriented terminology. 
<P>The first line, <TT>package Inventory_item;</TT>, says two things, depending 
on if you are thinking in terms of objects or in terms of Perl. When considering 
objects, it begins the definition of a class. When considering Perl, it means 
that a specific namespace will be used. 
<P>You read a little bit about namespace in Chapter 3, "<A 
href="ch03.htm">Variables</A>." A <I>namespace</I> 
is used to keep one set of names from interfering with another. For example, you 
can have a variable named <TT>bar</TT> and a function called <TT>bar</TT>, and 
the names will not conflict because variables and functions each have their own 
namespace. 
<P>The <TT>package</TT> keyword lets you create your own namespace. This lets 
you create more than one function called <TT>new()</TT> as long as each is in 
its own package or namespace. If you need to refer to a specific function in a 
specific namespace, you can use <TT>Inventory_item-&gt;new</TT>, 
<TT>Inventory_item::new</TT>, or <TT>Inventory_item'new</TT>. Which notation you 
use will probably depend on your background. Object-oriented folks will probably 
want to use the <TT>-&gt;</TT> notation. 
<P>The second line, <TT>sub new</TT>, starts the definition of a function. It 
has become accepted practice in the object-oriented world to construct new 
objects with the <TT>new()</TT> method. This is called the class 
<I>constructor</I>. This might be a good time to emphasize that the class 
definition is a template. It's only when the <TT>new()</TT> function is called 
that an object is created or <I>instantiated</I>. Instantiation means that 
memory is allocated from your computer's memory pool and devoted to the use of 
this specific object. The <TT>new()</TT> function normally returns a reference 
to an anonymous hash. Therefore, the <TT>new()</TT> function should never be 
called unless you are assigning its return value to a variable. If you don't 
store the reference into a scalar variable for later use, you'll never be able 
to access the anonymous hash inside the object. For all intents and purposes, 
the anonymous hash <I>is</I> the object. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>Not all objects are represented by hashes. If you 
      need an object to emulate a gas tank, perhaps an anonymous scalar would be 
      sufficient to hold the number of gallons of gas left in the tank. However, 
      you'll see that working with hashes is quite easy once you learn how. 
      Hashes give you tremendous flexibility to solve programming 
  problems.</TD></TR></TBODY></TABLE>
<P>There is nothing magic about the new function name. You could call the 
function that creates new objects <TT>create()</TT> or <TT>build()</TT> or 
anything else, but don't. The standard is <TT>new()</TT>, and everyone who reads 
your program or uses your classes will look for a <TT>new()</TT> function. If 
they don't find one, confusion might set in. There are so few standards in the 
programming business. When they exist, it's usually a good idea to follow them. 
<P>The <TT>bless()</TT> function on the third line changes the data type of its 
first parameter to the string value of its second parameter. In the situation 
shown here, the data type is changed to the name of the package, 
<TT>Inventory_item</TT>. Using <TT>bless()</TT> to change the data type of a 
reference causes the <TT>ref()</TT> function to return the new data type. This 
potentially confusing point is explained further in the section "<A 
href="ch14.htm#Example: Bless the Hash and Pass the Reference">Example: 
Bless the Hash and Pass the Reference</A>" later in this chapter. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>I used the <TT>bless()</TT> function without using 
      parentheses to surround the parameters. While Perl lets you do this, I 
      have been studiously using parentheses to avoid certain issues of 
      precedence that seem beyond the scope of this book. In this special 
      instance, where the anonymous hash is one of the parameters, I feel that 
      using parentheses clutters the source code.</TD></TR></TBODY></TABLE>
<P>Embedded inside the <TT>bless()</TT> function call is the creation of an 
anonymous hash that holds the properties of the class. The hash definition is 
repeated here for your convenience: 
<P><B><PRE>{
    "PART_NUM"    =&gt; undef,
    "QTY_ON_HAND" =&gt; undef
};</PRE></B>Nothing significant is happening here that you haven't seen before. 
Each entry in the hash is a different property of the class. For the moment, I 
have assigned the undefined value to the value part of the entries. Soon you'll 
see how to properly initialize them. 
<P>After the <TT>new()</TT> function is defined, there is another package 
statement: 
<P><B><PRE>package main;</PRE></B>There is no object-oriented way to interpret this 
statement. It simply tells Perl to switch back to using the <TT>main</TT> 
namespace. Don't be fooled into thinking that there is a <TT>main</TT> class 
somewhere. There isn't. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=tomato size=4><B>Caution</B></FONT></TD></TR>
  <TR>
    <TD bgColor=tomato>While you could create a <TT>main</TT> class by 
      defining the <TT>new()</TT> function after the <TT>package main;</TT> 
      statement, things might get to be confusing, so don't do 
it!</TD></TR></TBODY></TABLE>
<P>The last statement in the file is really the first line that gets executed. 
Everything else in the script have been class and method definitions. 
<P><B><PRE>   $item = Inventory_item-&gt;new();</PRE></B>By now, you've probably 
guessed what this statement does. It assigns a reference to the anonymous hash 
to <TT>$item</TT>. You can dereference <TT>$item</TT> in order to determine the 
value of the entries in the hash. If you use the <TT>ref()</TT> function to 
determine the data type of <TT>$item</TT>, you find that its value is 
<TT>Inventory_item</TT>. 
<P>Here are some key items to remember about objects in Perl: 
<P>
<UL>
  <LI><B>All objects are anonymous hashes:</B> While not strictly true, perhaps 
  it should be. Also, most the examples in this book follow this rule. This 
  means that most of the <TT>new()</TT> methods you see return a reference to a 
  hash. <TT>bless()</TT> changes the data type of the anonymous hash: The data 
  type is changed to the name of the class. 
  <P></P>
  <LI><B>The anonymous hash itself is blessed:</B> This means that references to 
  the hash are not blessed. This concept is probably a little unclear. I had 
  trouble figuring it out myself. The next section clarifies this point and uses 
  an example. 
  <P></P>
  <LI><B>Objects can belong to only one class at a time:</B> You can use the 
  <TT>bless()</TT> function to change the ownership at any time. However, don't 
  do this unless you have a good reason. 
  <P>The <TT>-&gt;</TT> operator is used to call a method associated with a 
  class: There are two different ways to invoke or call class methods: 
  <P><B><PRE>$item = new Inventory_item;</PRE></B>or 
  <P><B><PRE>$item = Inventory_item-&gt;new();</PRE></B>Both of these techniques are 
  equivalent, but the <TT>-&gt;</TT> style is preferred by object-oriented 
  folks.</LI></UL>
<H3><A name="Example: Bless the Hash and Pass the Reference">Example: Bless the 
Hash and Pass the Reference</A></H3>If you recall from Chapter 8, the 
<TT>ref()</TT> function returns either the undefined value or a string 
indicating the parameter's data type (<TT>SCALAR</TT>, <TT>ARRAY</TT>, 
<TT>HASH</TT>, <TT>CODE</TT>, or <TT>REF</TT>). When classes are used, these 
data types don't provide enough information. 
<P>This is why the <TT>bless()</TT> function was added to the language. It lets 
you change the data type of any variable. You can change the data type to any 
string value you like. Most often, the data type is changed to reflect the class 
name. 
<P>It is important to understand that the variable itself will have its data 
type changed. The following lines of code should make this clear: 
<P><B><PRE>$foo    = { };
$fooRef = $foo;

print("data of \$foo is "    . ref($foo)    . "\n");
print("data of \$fooRef is " . ref($fooRef) . "\n");

bless($foo, "Bar");

print("data of \$foo is "    . ref($foo)    . "\n");
print("data of \$fooRef is " . ref($fooRef) . "\n");</PRE></B>This program 
displays the following: 
<P><B><PRE>data of $foo is HASH
data of $fooRef is HASH
data of $foo is Bar
data of $fooRef is Bar</PRE></B>After the data type is changed, the 
<TT>ref($fooRef)</TT> function call returns <TT>Bar</TT> instead of the old 
value of <TT>HASH</TT>. This can happen only if the variable itself has been 
altered. This example also shows that the <TT>bless()</TT> function works 
outside the object-oriented world. 
<H3><A name="Example: Initializing Properties">Example: Initializing 
Properties</A></H3>You now know how to instantiate a new class by using a 
<TT>new()</TT> function and how to create class properties (the class 
information) with undefined values. Let's look at how to give those properties 
some real values. You need to start by looking at the <TT>new()</TT> function 
from Listing 14.1. It's repeated here so you don't need to flip back to look for 
it. 
<P><B><PRE>sub new {
        my($class) = shift;
        bless {
            "PART_NUM"    =&gt; undef,
            "QTY_ON_HAND" =&gt; undef
        }, $class;
}</PRE></B>The <TT>new()</TT> function is a <I>static </I>method. Static methods 
are not associated with any specific object. This makes sense because the 
<TT>new()</TT> function is designed to create objects. It can't be associated 
with an object that doesn't exist yet, can it? 
<P>The first argument to a static method is always the class name. Perl takes 
the name of the class from in front of the <TT>-&gt;</TT> operator and adds it 
to the beginning of the parameter array, which is passed to the <TT>new()</TT> 
function. 
<P>If you want to pass two values into the <TT>new()</TT> function to initialize 
the class properties, you can modify the method to look for additional arguments 
as in the following: 
<P><B><PRE>sub new {
        my($class)   = shift;
        my($partNum) = shift;
        my($qty)     = shift;

        bless {
            "PART_NUM"    =&gt; $partNum,
            "QTY_ON_HAND" =&gt; $qty
        }, $class;
}</PRE></B>Each parameter you expect to see gets shifted out of the parameter 
array into a scalar variable. Then the scalar variable is used to initialize the 
anonymous hash. 
<P>You invoke this updated version of <TT>new()</TT> by using this line of code: 

<P><B><PRE>$item = Inventory_item-&gt;new("AW-30", 1200);</PRE></B>While this style of 
parameter passing is very serviceable, Perl provides for the use of another 
technique: passing named parameters. 
<H3><A name="Example: Using Named Parameters in Constructors">Example: Using 
Named Parameters in Constructors</A></H3>The concept of using named parameters 
has been quickly accepted in new computer languages. I was first introduced to 
it while working with the scripting language for Microsoft Word. Rather than 
explain the technique in words, let me show you an example in code, as shown in 
Listing 14.2. I think you'll understand the value of this technique very 
quickly. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a definition of the <TT>Inventory_item</TT> class. 
      <P>Define the constructor for the class. 
      <P>Get the name of the class from the parameter array. 
      <P>Assign the rest of the parameters to the <TT>%params</TT> hash. 
      <P>Bless the anonymous hash with the class name. 
      <P>Use <TT>%params</TT> to initialize the class properties. 
      <P>Start the <TT>main</TT> namespace. 
      <P>Call the constructor for the <TT>Inventory_item</TT> class. 
      <P>Assign the object reference to <TT>$item</TT>. 
      <P>Print the two property values to verify that the property 
      initialization worked.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 14.2-14LST02.PL - Setting Class Properties Using the Class 
      Constructor</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>package Inventory_item;
    sub new {
        my($class)  = shift;
        my(%params) = @_;

        bless {
            "PART_NUM"    =&gt; $params{"PART_NUM"},
            "QTY_ON_HAND" =&gt; $params{"QTY_ON_HAND"}
            }, $class;
    }

package main;

    $item = Inventory_item-&gt;new(
"PART_NUM"    =&gt; "12A-34",
"QTY_ON_HAND" =&gt; 34);

    print("The part number is " . %{$item}-&gt;{'PART_NUM'} . "\n");
    print("The quantity is " . %{$item}-&gt;{'QTY_ON_HAND'} . "\n");</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>One key statement to understand is the line in which the <TT>new()</TT> 
function is called: 
<P><B><PRE>$item = Inventory_item-&gt;new(
"PART_NUM"    =&gt; "12A-34",
               "QTY_ON_HAND" =&gt; 34);</PRE></B>This looks like an associative 
array is being passed as the parameter to <TT>new()</TT>, but looks are 
deceiving in this case. The <TT>=&gt;</TT> operator does exactly the same thing 
as the comma operator. Therefore, the preceding statement is identical to the 
following: 
<P><B><PRE>$item = Inventory_item-&gt;new("PART_NUM", "12A-34", "QTY_ON_HAND", 34);</PRE></B>Also, 
a four element array is being passed to <TT>new()</TT>. 
<P>The second line of the <TT>new()</TT> function, <TT>my(%params) = @_;</TT> 
does something very interesting. It takes the four element array and turns it 
into a hash with two entries. One entry is for <TT>PART_NUM</TT>, and the other 
is for <TT>QTY_ON_HAND</TT>. 
<P>This conversion (array into hash) lets you access the parameters by name 
using <TT>%params</TT>. The initialization of the anonymous hash - inside the 
<TT>bless()</TT> function - takes advantage of this by using expressions such as 
<TT>$params{"PART_NUM"}</TT>. 
<P>I feel that this technique helps to create self-documenting code. When 
looking at the script, you always know which property is being referred to. In 
addition, you can also use this technique to partially initialize the anonymous 
hash. For example, 
<P><B><PRE>$item = Inventory_item-&gt;new("QTY_ON_HAND" =&gt; 34);</PRE></B>gives a 
value only to the QTY_ON_HAND property; the PART_NUM property will remain 
undefined. You can use this technique with any type of function, not just 
constructors. 
<H3><A name="Example: Inheritance, Perl Style">Example: Inheritance, Perl 
Style</A></H3>You already know that inheritance means that properties and 
methods of a parent class will be available to child classes. This section shows 
you can use inheritance in Perl. 
<P>First, a little diversion. You may not have realized it yet, but each package 
can have its own set of variables that won't interfere with another package's 
set. So if the variable <TT>$first</TT> was defined in package A, you could also 
define <TT>$first</TT> in package B without a conflict arising. For example, 
<P><B><PRE>package A;
    $first = "package A";

package B;
    $first = "package B";

package main;
    print("$A::first\n");
    print("$B::first\n");</PRE></B>displays 
<P><B><PRE>package A
package B</PRE></B>Notice that the <TT>::</TT> is being used as a scope 
resolution operator in this example. The <TT>-&gt;</TT> notation will not work; 
also, it's okay that<TT> -&gt;</TT> can't be used because we're not really 
dealing with objects in this example, just different namespaces. 
<P>You're probably wondering what this diversion has to do with inheritance, 
right? Well, inheritance is accomplished by placing the names of parent classes 
into a special array called <TT>@ISA</TT>. The elements of <TT>@ISA</TT> are 
searched left to right for any missing methods. In addition, the 
<TT>UNIVERSAL</TT> class is invisibly tacked on to the end of the search list. 
For example, 
<P><B><PRE>package UNIVERSAL;
    sub AUTOLOAD {
        die("[Error: Missing Function] $AUTOLOAD @_\n");
    }

package A;
    sub foo {
        print("Inside A::foo\n");
    }

package B;
    @ISA = (A);

package main;
    B-&gt;foo();
    B-&gt;bar();</PRE></B>displays 
<P><B><PRE>Inside A::foo
[Error: Missing Function] B::bar B</PRE></B>Let's start with the nearly empty 
class <TT>B</TT>. This class has no properties or methods; it just has a parent: 
the <TT>A</TT> class. When Perl executes <TT>B-&gt;foo()</TT>, the first line in 
the main package, it first looks in <TT>B</TT>. When the <TT>foo()</TT> function 
is not found, it looks to the <TT>@ISA</TT> array. The first element in the 
array is <TT>A</TT>, so Perl looks at the <TT>A</TT> class. Because <TT>A</TT> 
does have a <TT>foo()</TT> method, that method is executed. 
<P>When a method can't be found by looking at each element of the <TT>@ISA</TT> 
array, the <TT>UNIVERSAL</TT> class is checked. The second line of the main 
package, <TT>B-&gt;bar()</TT>, tries to use a function that is not defined in 
either the base class <TT>B</TT> or the parent class <TT>A</TT>. Therefore, as a 
last ditch effort, Perl looks in the <TT>UNIVERSAL</TT> class. The 
<TT>bar()</TT> function is not there, but a special function called 
<TT>AUTOLOAD()</TT> is. 
<P>The <TT>AUTOLOAD()</TT> function is normally used to automatically load 
undefined functions. Its normal use is a little beyond the scope of this book. 
However, in this example, I have changed it into an error reporting tool. 
Instead of loading undefined functions, it now causes the script to end (via the 
<TT>die()</TT> function) and displays an error message indicating which method 
is undefined and which class Perl was looking in. Notice that the message ends 
with a newline to prevent Perl from printing the script name and line number 
where the script death took place. In this case, the information would be 
meaningless because the line number would be inside the <TT>AUTOLOAD()</TT> 
function. 
<P>Listing 14.3 shows how to call the constructor of the parent class. This 
example shows how to explicitly call the parent's constructor. In the next 
section, you learn how to use the <TT>@ISA</TT> array to generically call 
methods in the parent classes. However, because constructors are frequently used 
to initialize properties, I feel that they should always be called explicitly, 
which causes less confusion when calling constructors from more than one parent. 

<P>This example also shows how to inherit the properties of a parent class. By 
calling the parent class constructor function, you can initialize an anonymous 
hash that can be used by the base class for adding additional properties. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a definition of the <TT>Inventory_item</TT> class. 
      <P>Define the constructor for the class. 
      <P>Get the name of the class from the parameter array. 
      <P>Assign the rest of the parameters to the <TT>%params</TT> hash. 
      <P>Bless the anonymous hash with the class name. 
      <P>Use <TT>%params</TT> to initialize the class properties. 
      <P>Start a definition of the <TT>Pen</TT> class. 
      <P>Initialize the <TT>@ISA</TT> array to define the parent classes. 
      <P>Define the constructor for the class. 
      <P>Get the name of the class from the parameter array. 
      <P>Assign the rest of the parameters to the <TT>%params</TT> hash. 
      <P>Call the constructor for the parent class, <TT>Inventory_item</TT>, and 
      assign the resulting object reference to <TT>$self</TT>. 
      <P>Create an entry in the anonymous hash for the <TT>INK_COLOR</TT> key. 
      <P>Bless the anonymous hash so that <TT>ref()</TT> will return 
      <TT>Pen</TT> and return a reference to the anonymous hash. 
      <P>Start the <TT>main</TT> namespace. 
      <P>Call the constructor for the <TT>Pen</TT> class. Assign the object 
      reference to <TT>$item</TT>. Note that an array with property-value pairs 
      are passed to the constructor. 
      <P>Print the three property values to verify that the property 
      initialization worked.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 14.3-14LST03.PL - How to Call the Constructor of a Parent 
      Class</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>package Inventory_item;
    sub new {
        my($class)  = shift;
        my(%params) = @_;
        bless {
            "PART_NUM"    =&gt; $params{"PART_NUM"},
            "QTY_ON_HAND" =&gt; $params{"QTY_ON_HAND"}
            }, $class;
    }

package Pen;
    @ISA = (Inventory_item);

    sub new {
        my($class) = shift;
        my(%params) = @_;
        my($self) = Inventory_item-&gt;new(@_);

        $self-&gt;{"INK_COLOR"} = $params{"INK_COLOR"};

        return(bless($self, $class));
    }

package main;
    $pen = Pen-&gt;new(
        "PART_NUM"    =&gt; "12A-34",
        "QTY_ON_HAND" =&gt; 34,
        "INK_COLOR"   =&gt; "blue");

    print("The part number is " . %{$pen}-&gt;{'PART_NUM'}    . "\n");
    print("The quantity is "    . %{$pen}-&gt;{'QTY_ON_HAND'} . "\n");
    print("The ink color is "   . %{$pen}-&gt;{'INK_COLOR'}   . "\n");</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays: 
<P><B><PRE>The part number is 12A-34
The quantity is 34
The ink color is blue</PRE></B>You should be familiar with all the aspects of 
this script by now. The line <TT>my($self) = Inventory_item-&gt;new(@_);</TT> is 
used to get a reference to an anonymous hash. This hash becomes the object for 
the base class. 
<P>To understand that calling the parent constructor creates the object that 
becomes the object for the base class, you must remember that an object 
<I>is</I> the anonymous hash. Because the parent constructor creates the 
anonymous hash, the base class only needs a reference to that hash in order to 
add its own properties. This reference is stored in the <TT>$self</TT> variable. 

<P>You may also see the variable name <TT>$this</TT> used to hold the reference 
in some scripts. Both <TT>$self</TT> and <TT>$this</TT> are acceptable in the 
object-oriented world. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightcyan size=4><B>Note</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightcyan>I would actually prefer the variable name 
      <TT>$data</TT> because the hash <I>is</I> the object; therefore, the data 
      <I>is</I> the object. But sometimes, it's good to follow conventional 
      wisdom so that others can more easily understand your 
  programs.</TD></TR></TBODY></TABLE>
<H3><A name="Example: Polymorphism">Example: 
Polymorphism</A></H3><I>Polymorphism</I>, although a big word, is a simple 
concept. It means that methods defined in the base class will override methods 
defined in the parent classes. The following small example clarifies this 
concept: 
<P><B><PRE>package A;
    sub foo {
        print("Inside A::foo\n");
    }

package B;
    @ISA = (A);

    sub foo {
        print("Inside B::foo\n");
    }

package main;
    B-&gt;foo();</PRE></B>This program displays 
<P><B><PRE>Inside B::foo</PRE></B>The <TT>foo()</TT> defined in class <TT>B</TT> 
overrides the definition that was inherited from class <TT>A</TT>. 
<P>Polymorphism is mainly used to add or extend the functionality of an existing 
class without reprogramming the whole class. Listing 14.4 uses polymorphism to 
override the <TT>qtyChange()</TT> function inherited from 
<TT>Inventory_item</TT>. In addition, it shows how to call a method in a parent 
class when the specific parent class name (also known as the <I>SUPER</I> class) 
is unknown. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a definition of the <TT>Inventory_item</TT> class. 
      <P>Define the constructor for the class. 
      <P>Get the name of the class from the parameter array. 
      <P>Assign the rest of the parameters to the <TT>%params</TT> hash. 
      <P>Bless the anonymous hash with the class name. 
      <P>Use <TT>%params</TT> to initialize the class properties. 
      <P>Define the <TT>qtyChange()</TT> method. 
      <P>Get the object reference from the parameter array. 
      <P>Get the quantity to change from the parameter array. If there are no 
      more elements in the <TT>@_</TT>, default to using the quantity 1. 
      <P>Use dereferencing to change the <TT>QTY_ON_HAND</TT> property. 
      <P>Start a definition of the <TT>Pen</TT> class. 
      <P>Initialize the <TT>@ISA</TT> array to define the parent classes. 
      <P>Initialize the <TT>@PARENT::ISA</TT> array to let Perl search the @ISA 
      to look for method references. 
      <P>Define the constructor for the class. 
      <P>Get the name of the class from the parameter array. 
      <P>Assign the rest of the parameters to the <TT>%params</TT> hash. 
      <P>Call the constructor for the parent class using the <TT>PARENT::</TT> 
      notation. This searches the classes listed in the <TT>@ISA</TT> array 
      looking for the <TT>new()</TT> function and assigns the resulting object 
      reference to <TT>$self</TT>. 
      <P>Create an entry in the anonymous hash for the <TT>INK_COLOR</TT> key. 
      <P>Return a reference to the anonymous hash. 
      <P>Define the <TT>qtyChange()</TT> method. 
      <P>Get the object reference from the parameter array. 
      <P>Get the quantity to change from the parameter array. If there are no 
      more elements in the @_<TT>,</TT> default to using the quantity 100. 
      <P>Use dereferencing to change the <TT>QTY_ON_HAND</TT> property. 
      <P>Start the <TT>main</TT> namespace. 
      <P>Call the constructor for the <TT>Pen</TT> class. Assign the object 
      reference to <TT>$item</TT>. 
      <P>Print the data type of <TT>$item</TT> to show that it is now 
      <TT>Pen</TT>. 
      <P>Print the three property values to verify that the property 
      initialization worked. 
      <P>Change the quantity by the default amount. 
      <P>Print a newline to separate the previous values from the new value. 
      <P>Print the quantity property value to verify that the change method 
      worked.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 14.4-14LST04.PL - Accessing Methods in Parent 
      Classes</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>package Inventory_item;
    sub new {
        my($class)  = shift;
        my(%params) = @_;
        bless {
            "PART_NUM"    =&gt; $params{"PART_NUM"},
            "QTY_ON_HAND" =&gt; $params{"QTY_ON_HAND"}
        }, $class;
    }

    sub qtyChange {
        my($self)  = shift;
        my($delta)  = $_[0] ? $_[0] : 1;

        $self-&gt;{"QTY_ON_HAND"} += $delta;
    }

package Pen;
    @ISA = ("Inventory_item");
    @PARENT::ISA = @ISA;

    sub new {
        my($class) = shift;
        my(%params) = @_;
        my($self) = $class-&gt;PARENT::new(@_);

        $self-&gt;{"INK_COLOR"} = $params{"INK_COLOR"};

        return($self);
    }

    sub qtyChange {
        my($self)  = shift;
        my($delta)  = $_[0] ? $_[0] : 100;

        $self-&gt;PARENT::qtyChange($delta);
    }


package main;

    $pen = Pen-&gt;new(
        "PART_NUM"=&gt;"12A-34",
        "QTY_ON_HAND"=&gt;340,
        "INK_COLOR" =&gt; "blue");

    print("The data type is "   . ref($pen)                . "\n");
    print("The part number is " . %{$pen}-&gt;{'PART_NUM'}    . "\n");
    print("The quantity is "    . %{$pen}-&gt;{'QTY_ON_HAND'} . "\n");
    print("The ink color is "   . %{$pen}-&gt;{'INK_COLOR'}   . "\n");

    $pen-&gt;qtyChange();
    print("\n");
    print("The quantity is "    . %{$pen}-&gt;{'QTY_ON_HAND'} . "\n");</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays 
<P><B><PRE>The data type is Pen
The part number is 12A-34
The quantity is 340
The ink color is blue

The quantity is 440</PRE></B>The first interesting line in the preceding example 
is <TT>my($delta) = $_[0] ? $_[0] : 1;</TT>. This line checks to see if a 
parameter was passed to <TT>Inventory_item::qtychange()</TT> and if not, assigns 
a value of 1 to <TT>$delta</TT>. This line of code uses the <TT>ternary</TT> 
operator to determine if <TT>$_[0]</TT> has a value or not. A zero is used as 
the subscript because the class reference was shifted out of the parameter array 
and into <TT>$self</TT>. 
<P>The next interesting line is <TT>@PARENT::ISA = @ISA;</TT>. This assignment 
lets you refer to a method defined in the parent class. Perl searches the parent 
hierarchy (the <TT>@ISA</TT> array) until a definition is found for the 
requested function. 
<P>The <TT>Pen::new()</TT> function uses the <TT>@PARENT::ISA</TT> to find the 
parent constructor using this line: <TT>my($self) = 
$class-&gt;PARENT::new(@_);</TT>. I don't really recommend calling parent 
constructors in this manner because the constructor that gets called will depend 
on the order of classes in the <TT>@ISA</TT> array. Having code that is 
dependent on an array keeping a specific order is a recipe for disaster; you 
might forget about the dependency and spend hours trying to find the problem. 
However, I thought you should see how it works. Because the <TT>$class</TT> 
variable (which is equal to <TT>Pen</TT>) is used to locate the parent 
constructor, the hash will be blessed with the name of the base <TT>Pen</TT> 
class - one small advantage of this technique. This is shown by the program's 
output. This technique avoids having to call the <TT>bless()</TT> function in 
the base class constructor. 
<P>By now, you must be wondering where polymorphism fits into this example. 
Well, the simple fact that both the <TT>Pen</TT> and <TT>Inventory_item</TT> 
classes have the <TT>qtyChange()</TT> method means that polymorphism is being 
used. While the <TT>Inventory_item::qtyChange()</TT> method defaults to changing 
the quantity by one, the <TT>Pen::qtyChange()</TT> method defaults to changing 
the quantity by 100. Because the <TT>Pen::qtyChange()</TT> method simply 
modifies the behavior of <TT>Inventory_item::qtyChange()</TT>, it does not need 
to know any details about how the quantity is actually changed. This capability 
to change functionality without knowing the details is a sign that abstraction 
is taking place. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=lightpink size=4><B>Tip</B></FONT></TD></TR>
  <TR>
    <TD bgColor=lightpink>The <TT>Inventory_item::qtychange()</TT> notation 
      refers to the <TT>qtyChange()</TT> function in the <TT>Inventory_item</TT> 
      class, and <TT>Pen::qtyChange()</TT> refers to the <TT>qtyChange()</TT> 
      function in the <TT>Pen</TT> class. This notation lets you uniquely 
      identify any method in your script.</TD></TR></TBODY></TABLE>
<H3><A name="Example: How One Class Can Contain Another">Example: How One Class 
Can Contain Another</A></H3>Now that you have seen several objects in action, 
you probably realize that some class properties will be objects themselves. For 
example, you might have a billing object that contains an inventory object, or 
you might use a car object inside a warehouse object. The possibilities are 
endless. 
<P>Listing 14.5 shows how to add a color object to the inventory system you've 
been building. It also shows you that Perl will execute statements that are not 
part of a function - even those in packages other than main - as soon as they 
are seen by the interpreter. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a definition of the <TT>Inventory_item</TT> class. 
      <P>Define the constructor for the class. 
      <P>Get the name of the class from the parameter array. 
      <P>Assign the rest of the parameters to the <TT>%params</TT> hash. 
      <P>Bless the anonymous hash with the class name. 
      <P>Use <TT>%params</TT> to initialize the class properties. 
      <P>Start a definition of the <TT>Pen</TT> class. 
      <P>Initialize the <TT>@ISA</TT> array to define the parent classes. 
      <P>Define the constructor for the class. 
      <P>Get the name of the class from the parameter array. 
      <P>Assign the rest of the parameters to the <TT>%params</TT> hash. 
      <P>Call the constructor for the parent class and assign the resulting 
      object reference to <TT>$self</TT>. 
      <P>Create an entry in the anonymous hash for the <TT>INK_COLOR</TT> key by 
      calling the constructor for the <TT>Color</TT> class. 
      <P>Return a reference to the anonymous hash that has been blessed into the 
      <TT>Pen</TT> class. 
      <P>Start a definition of the <TT>Color</TT> class. 
      <P>Print a message on <TT>STDOUT</TT>. 
      <P>Create two entries in the <TT>%Colors</TT> hash. 
      <P>Define the constructor for the class. 
      <P>Get the name of the class from the parameter array. 
      <P>Assign the rest of the parameters to the <TT>%params</TT> hash. 
      <P>Assign a reference to one of the entries in the <TT>%Colors</TT> hash 
      to <TT>$self</TT>. This will be used as the object reference. 
      <P>Bless the hash entry into the <TT>Color</TT> class and return 
      <TT>$self</TT> as the object reference. 
      <P>Start the <TT>main</TT> namespace. 
      <P>Print a message on <TT>STDOUT</TT>. 
      <P>Call the constructor for the <TT>Pen</TT> class. Assign the object 
      reference to <TT>$item</TT>. 
      <P>Use <TT>%properties</TT> as a temporary value to simplify the 
      dereferencing process. 
      <P>Print the three property values to verify that the property 
      initialization worked.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 14.5-14LST05.PL - How One Class Can Use or Contain Another 
      Class</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>package Inventory_item;
    sub new {
        my($class)  = shift;
        my(%params) = @_;
        bless {
            "PART_NUM"    =&gt; $params{"PART_NUM"},
            "QTY_ON_HAND" =&gt; $params{"QTY_ON_HAND"}
        }, $class;
}

package Pen;
    @ISA = (Inventory_item);

    sub new {
        my($class) = shift;
        my(%params) = @_;
        my($self) = Inventory_item-&gt;new(@_);

        $self-&gt;{"INK_COLOR"} = Color-&gt;new($params{"INK_COLOR"});

        return(bless($self, $class));
    }

package Color;
    print("Executing Color statements\n");
    $colors{"blue"}  = "Die Lot 13";
    $colors{"red"}   = "Die Lot 5";

    sub new {
        my($class) = shift;
        my($param) = @_;
        my($self) = \$colors{$param};

        return(bless($self, $class));
    }

package main;
    print("Executing main statements\n");

    $pen = Pen-&gt;new(
        "PART_NUM"    =&gt; "12A-34",
        "QTY_ON_HAND" =&gt; 34,
        "INK_COLOR"   =&gt; "blue");

    %properties = %{$pen};
    print("The part number is " . $properties{'PART_NUM'}     . "\n");
    print("The quantity is "    . $properties{'QTY_ON_HAND'}  . "\n");
    print("The ink color is "   . ${$properties{'INK_COLOR'}} . "\n");</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>This program displays 
<P><B><PRE>Executing Color statements
Executing main statements
The part number is 12A-34
The quantity is 34
The ink color is Die Lot 13</PRE></B>Where to start? You already know about the 
<TT>Inventory_item</TT> class and the <TT>@ISA</TT> array. Let's look at the 
assignment to the <TT>INK_COLOR</TT> entry of the <TT>Pen</TT> class. This line, 
<TT>$self-&gt;{"INK_COLOR"} = Color-&gt;new($params{"INK_COLOR"});</TT>, is used 
to call the constructor for the <TT>Color</TT> class. The expression 
<TT>$params{"INK_COLOR"}</TT> passes the value of <TT>"blue"</TT> to the 
<TT>Color</TT> constructor, which returns a reference to one of the colors in 
the <TT>%colors</TT> associative array. 
<P>You can tell that Perl executes all statements that are not inside functions 
because the <TT>print</TT> statement in the <TT>Color</TT> package is executed 
before the <TT>print</TT> statement in the <TT>main</TT> package. This is why 
you can define hash entries inside the <TT>Color</TT> class. When variables are 
defined inside a package but outside a function, they are called <I>static</I> 
variables. You can access one of the hash entries in the <TT>Color</TT> package 
like this: <TT>$Color::colors{"blue"}</TT>. 

## Static Versus Regular Methods and Variables

You already learned that a static method is one that can be called without needing an instantiated object. Actually, you can 
also have static variables as you saw in the last section. Static variables can 
be used to emulate <I>constants</I>, values that don't change. Constants are 
very useful. For example, you can use them for tax rates, mathematical 
constants, and things like state abbreviations. Here is an example using a small 
Perl script: 
<P><B><PRE>package Math;
    $math{'PI'} = 3.1415;

package main;
    print("The value of PI is $Math::math{'PI'}.\n");</PRE></B>This program 
displays 
<P><B><PRE>The value of PI is 3.1415.</PRE></B>You can also do this: 
<P><B><PRE>package Math;
    $PI = 3.1415;
package main;
    print("The value of PI is $Math::PI.\n");</PRE></B>Because you have been 
using a static method all along - the <TT>new()</TT> method - I'll take this 
opportunity to demonstrate a regular function. Listing 14.6 shows how to use the 
<TT>UNIVERSAL</TT> package to define a utility function that is available to all 
classes. 
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=blanchedalmond 
      size=4><B>Pseudocode</B></FONT></TD></TR>
  <TR>
    <TD bgColor=blanchedalmond><TT>
      <P>Start a definition of the <TT>UNIVERSAL</TT> class. 
      <P>Define the <TT>lookup()</TT> method. 
      <P>Dereference the object reference (the first element of <TT>@_</TT>) and 
      use the second parameter as the key into the anonymous hash. Return the 
      value of the hash entry. 
      <P>Start a definition of the <TT>Inventory_item</TT> class. 
      <P>Define the constructor for the class. 
      <P>Get the name of the class from the parameter array. 
      <P>Assign the rest of the parameters to the <TT>%params</TT> hash. 
      <P>Bless the anonymous hash with the class name. 
      <P>Use <TT>%params</TT> to initialize the class properties. 
      <P>Start the <TT>main</TT> namespace. 
      <P>Call the constructor for the <TT>Inventory_item</TT> class. Assign the 
      object reference to <TT>$item</TT>. 
      <P>Print the two property values using the <TT>lookup()</TT> method to 
      verify that the property initialization 
worked.</TT></P></TD></TR></TBODY></TABLE>
<P>
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD bgColor=black><FONT color=#fffaa0 size=4><B>
      <P>Listing 14.6-14LST06.PL - Using a Static Method to Retrieve Class 
      Properties</B></FONT></P></TD></TR>
  <TR>
    <TD bgColor=#fffaa0><B><PRE><BR>
<P>package UNIVERSAL;
    sub lookup {
        return(%{$_[0]}-&gt;{$_[1]});
    }

package Inventory_item;
    sub new {
        my($class)  = shift;
        my(%params) = @_;
        my($self)   = { };

        $self-&gt;{"PART_NUM"}    = $params{"PART_NUM"};
        $self-&gt;{"QTY_ON_HAND"} = $params{"QTY_ON_HAND"};

        return(bless($self, $class));
    }

package main;

    $item = Inventory_item-&gt;new("PART_NUM"=&gt;"12A-34", "QTY_ON_HAND"=&gt;34);

    print("The part number is " . $item-&gt;lookup('PART_NUM')     . "\n");
    print("The quantity is "    . $item-&gt;lookup('QTY_ON_HAND')  . "\n");</B></P></PRE></TT></TD></TR></TBODY></TABLE>
<P>I don't think this example needs any further explanation, so let's use the 
space normally reserved to further discussion of the listing and show you 
another utility function instead. The <TT>printAll()</TT> function shown here 
displays all the properties of a class, or you can specify one or more 
properties to display: 
<P><B><PRE>sub printAll {
    my($self) = shift;
    my(@keys) = @_ ? @_ : sort(keys(%{$self}));

    print("CLASS: $self\n");
    foreach $key (@keys) {
        printf("\t%10.10s =&gt; $self-&gt;{$key}\n", $key);
    }
}</PRE></B>If you put this function into the <TT>UNIVERSAL</TT> package, it will 
be available to any classes you define. 
<P>After constructing an inventory object, the statement 
<TT>$item-&gt;printAll();</TT> might display 
<P><B><PRE>CLASS: Inventory_item=HASH(0x77ceac)
          PART_NUM =&gt; 12A-34
        QTY_ON_HAN =&gt; 34</PRE></B>and the statement 
<TT>$item-&gt;printAll('PART_NUM');</TT> might display 
<P><B><PRE>CLASS: Inventory_item=HASH(0x77ceac)
          PART_NUM =&gt; 12A-34</PRE></B>

## Summary

This chapter served as an introduction to objects. It was not intended to turn you into an overnight object guru. I hope 
that enough information was presented so you have an understanding of the object 
terminology and can read other people's programs. You can also create your own 
methods and properties. However, if you need to create more than a few small 
objects, consider reading a book devoted specifically to object-oriented 
programming. I give this advice because the relationships between objects can 
become complex quickly when more than five objects are being used. 
<P>You learned earlier in the chapter that object-oriented programming has its 
own terminology. This terminology lets you think of objects in a computer 
language independent manner. After describing the object or class as a set of 
properties (information) and methods (functions), the class can be programmed 
using C++, Perl, or Delphi. The programming language is relegated to the role of 
an implementation detail. 
<P>The four big concepts in object-oriented programming are abstraction, 
encapsulation, inheritance, and polymorphism. Abstraction means to isolate the 
access of a property from how it's stored. Encapsulation means that properties 
and the methods that act on them are defined together. Inheritance means that 
one class (the child) can be derived from another (the parent), and the child 
class will have all the properties and methods defined in the parent. 
Polymorphism means that the child class can override properties and methods 
defined in the parent simply by using the same property or method name. 
<P>After defining these words, you read about creating some classes for an 
inventory system; the <TT>Inventory_item</TT> and <TT>Pen</TT> classes were 
described. The <TT>Pen</TT> class was derived from the <TT>Inventory_item</TT> 
class. These classes were used in examples to show how abstraction and 
polymorphism work. 
<P>Next, you looked at object-oriented Perl scripts. You read that it's good to 
keep all class property information in anonymous hashes and that the 
<TT>bless()</TT> function is used to change the data type of a variable - even 
anonymous ones. 
<P>You saw how to initialize properties by passing values to the <TT>new()</TT> 
constructor function. With this technique, you can use named parameters and 
therefore create partially initialized objects if needed. Child classes in Perl 
will not automatically inherit properties from its parents. However, using 
anonymous hashes totally avoids this issue because the parent constructor can be 
explicitly called to create the object. Then, the child can simply add entries 
to the anonymous hash. 
<P>You saw an example of how one class can contain another. The <TT>Pen</TT> 
class used this technique to hold an instance of the <TT>Color</TT> class. 
<P>Static variables and methods are independent of any specific object. For 
example, the <TT>Color</TT> class used a static hash to hold values for the 
colors blue and red. Static variables can be accessed using the notation 
<TT>$Color::colors{"blue"}</TT>. Of course, only static hash variables use this 
notation, but scalars and arrays are accessed similarly. You can use static 
methods like <TT>new()</TT> to create new instances of a class. 
<P>You also saw that the <TT>@ISA</TT> array is used to hold a list of parent 
classes for the base class. In addition, you learned that the <TT>UNIVERSAL</TT> 
class is invisibly added to the end of the <TT>@ISA</TT> array - making it the 
the last class searched for an undefined method. The <TT>AUTOLOAD()</TT> method 
is normally used to load undefined methods; however, in this chapter, it was 
used instead to display an error message telling which method is undefined and 
the base class in which it should be defined. 
<P>The next chapter discusses modules. You see that classes are a specific use 
of the general module functionality and how to store module (and class) 
definition in different script files. You also see how to use some of the 
prewritten modules available in your Perl distribution files and on the 
Internet. 

## Review Questions

<OL>
  <LI>What is an object? 
  <P></P>
  <LI>What is a class? 
  <P></P>
  <LI>What is a property? 
  <P></P>
  <LI>What does the term <I>polymorphism</I> mean? 
  <P></P>
  <LI>Is the <TT>bless()</TT> function used to create classes? 
  <P></P>
  <LI>What does the <TT>package</TT> keyword do? 
  <P></P>
  <LI>What can a static variable be used for? 
  <P></P>
  <LI>Why is it good to use anonymous hashes to represent objects instead of 
  regular arrays? 
  <P></P>
  <LI>How can you create a function that is available to all classes in your 
  script?</LI></OL>

## Review Exercises

<OL>
  <LI>Design an object model of a car. Create objects for the car, tires, and 
  doors. 
  <P></P>
  <LI>Extend the inventory model shown in Figure 14.3 to include three other 
  objects. 
  <P></P>
  <LI>Extend the program in Listing 14.2 to add a third property to the 
  <TT>Pen</TT> class. 
  <P></P>
  <LI>Extend the car model from Exercise 1 to include motorcycle objects. Pay 
  special attention to assumptions you may have made in your original model. Are 
  these still valid assumptions? 
  <P></P>
  <LI>By using the program in Listing 14.2, create a child of <TT>Pen</TT> that 
  can hold two different ink colors.</LI></OL>
