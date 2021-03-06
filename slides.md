---
title: ruby FTW / Linuxtage 2021
author: Christoph Lipautz
theme: Copenhagen
colortheme: beaver
date: April 10, 2021
---

<!--
Ahoi! This is Ruby for the win! For the Linuxtage 2021
-->

# Lets say:

Programming Languages are (kind of) Tools

<!--
From certain point of view programming languages have lot of similarities to
choosing a tool for a certain job. So lets say programming languages are kind
of tools.

With tools, they have in common that they are created to solve some problem in
a different, mostly more simple or elegant way than other tools do.
-->

# Tools FTW\footnote{https://unsplash.com/photos/NL\_DF0Klepc}

![](./media/cesar-carlevarino-aragon-NL_DF0Klepc-unsplash.jpg)

<!--
Therefor we might also say that: The more tools you know, the better you know
if you could save some time, effort or sanity using something else.
-->

# Learn a Programming Language Every Year\footnote{https://unsplash.com/photos/FwF\_fKj5tBo}

![](./media/alice-dietrich-FwF_fKj5tBo-unsplash.jpg)

<!--
There is a good practice that ensures we keep up studying. It states that we
should learn at least one new programming language every year.

If you study new concepts from time to time it will not just enrich your
toolset...
...It will also change your perspective on different problems.
...And it will help you figure out better solutions.

Suppose you learn a new language, then do not compare to what you currently are
aware of.
...Try to figure out what the inventors of this tool were trying to solve.
-->

# Me Reading Stuff

![](./media/me.jpg)

<!--
I'm Christoph and I spent a lot of time building software.
For the last decade I tried to study at least one new programming language
every year.
Now I use go, sometimes python, javascript and some other tools on a daily
basis.
However I'm especially grateful that I can spent a lot of time using Ruby.

In this talk I want to share with you some of my thoughts on Ruby.
-->

# Overview of this Talk

- Why did I stick with Ruby for so many years?

- An Example dealing with Time (Code)

- Resources, Getting Started, More Code(?)

- Question and Answer Session

<!--
I picked up Ruby for the first time somewhere around 13-15 years ago and it
resisted to be number one tool of choice for me.

For the first part of this talk I start with some facets that I really like.

As I think the best way to get to know something is to see it in action.
I will do live coding in the second part.

After that I close with pointing to some selected resources.

If there is some time left, we can go for more code.

In the final part there is some extra time reserved for a Q and A session.

Lets get started.
-->

# Ruby - Interpreted, Object Oriented\footnote{https://www.ruby-lang.org/}

![](./media/ruby-logo.png) Designed for Developer Happiness

<!--
Ruby is an interpreted, object oriented programming language that is known to
focus on developer happiness.

Any ruby software creators profit from code that is easy to write.
But even more important the source produced is extra easy to read.
-->

# Hello World!

```ruby
7.times { print "Hello World!\n" }
```

<!--
Pretty easy to guess what the code snippet does, right?
-->

# Hello World!!

```ruby
7.times { print "Hello World!\n" }
# Hello World!
# Hello World!
# Hello World!
# Hello World!
# Hello World!
# Hello World!
# Hello World!
```

<!--
I could have also just read out the statement:
  "seven times print hello world"
and ask you what do you think it will result to ^^

This style of code can be attributed to the inventor and chief designer of
the language.
-->

# Yukihiro "Matz" Matsumoto

![](./media/img-1542.jpg)

<!--
His name is Yukihiro Matsumoto. He is also referred to as Matz and has a strong
eye on the language structure and design.

And it seems he is also responsible for the very nice community of Ruby.
-->

# A Welcoming Community

Matz is nice, so we are nice.

<!--
A widely known statement in the Ruby community is: Matz is nice, so we are
nice. And Rubyists tend to follow this mantra.

I think I don't have to explain how valuable it is that you have
a community that loves to share code, knowledge and tends to be extra nice
to each other. Rubyist are helpful and welcome you at any point.
-->

# Expect Conventions and Best Practice, but no Strict Rules?\footnote{https://unsplash.com/photos/cvQzH3npXT8}

![](./media/kajetan-sumila-cvQzH3npXT8-unsplash.jpg)

<!--
There are not many rules to follow when coding in Ruby but a lot of good
examples and best practices.

After some time coding Ruby, the conventions given will just feel right.

Several times I've come up with almost the very same code to a problem that I
later found written by someone else.
It is impressive to see how you learn to think in certain ways, without being
forced in a specific direction.
-->

# Conventions?

```ruby
# as convention: expect methods ending with ? to
# respond with a boolean
user.active?

a = [1, 2, 3]
a.member? 2 # true
```
<!--
The code snippet has a variable user and active, suffixed with a question mark,
is send to it. It is likely that you will expect true or false reading this
line.
Same goes to the Array assigned to variable a below. The message clearly checks
if two is a member of that array.

Ruby allows you to use UTF-8 in the source, so you can, as ... in the example,
define method names that end with a question sign.

Any time you see such a method, you can for sure expect that it will return
some value that evaluates either to true or false.

This is no feature of the language, but the way the community sorted out would
be a good style.
No one tells you to do it that way, but now that you know, it will be likely
you will write methods like that as well.
-->

# Conventions!

```ruby
a = [1, 2, 2]
a.uniq # [1, 2]
print a # [1, 2, 2]

# as convention: expect methods with ! to do something
# destructive (or dangerous)
a.uniq! # [1, 2]
print a # [1, 2]
```

<!--
The array one, two, two responds with a new array one, two when uniq is sent.
The original array in variable a is not changed.

Using the destructive method below will not create a new array but change the
existing one.
It changes some internals and this might not be expected, therefor it notifies
the reader with the exclamation mark.

If a method ends with an exclamation mark, it will do something destructive,
like in this case, changing the internals of an object.
In other cases it raises an error if arguments or internals that are provided
are not as expected.
-->

# Everything is a File

Everything in Unix is a file.

<!--
A nice correlation is that where everything in Unix is a file.
-->

# Everything is a Object

Everything in Ruby is a object.

<!--
Everything in Ruby is a
-->

# Everything is an Object

Everything in Ruby is an object.

<!--
...is an object
-->

# Ruby in Action

```ruby
users = User.where :created_at.gte => 3.days.ago
```

<!--
This line of code is extracted from a project that is using the popular web
framework Ruby on Rails.

When I started working with Ruby, one of the very first things that blew my
mind was the way you can deal with Time.

As time handling was such pain to me using other tools
...I was really exited to see such an easy and elegant approach.

The snippet uses some database abstraction and queries alls users that were
created in the last three days...
...or in the other words: users where created at is greater than equal 3 days ago

For this presentation I decided to build a package that offers this time
handling from scratch. For sure in a very simplified version, but we should end
up being able to recreate this statement.
-->

# Timeless Project

<!-- NOTE: build some code -->

# A Word of Warning: Don't mess with primitives!\footnote{https://unsplash.com/photos/QeYLUolK1XY}

![](./media/felix-hoffmann-QeYLUolK1XY-unsplash.jpg)

<!--
The code written was build for demonstrational purpose.

If you want to start with Ruby, it might be a bad idea that the first thing you
do is manipulating its very basic objects.

For this presentation however I think it was a good fit :)
-->

# Resources

Where should I go now?

<!--
If you liked the short demonstration and you want to see more Ruby Code, let
me point you to some proper resources.
-->

# This Presentation at GitHub\footnote{https://github.com/unused/ruby-ftw}

![](./media/github-repo.png)

<!--
Slides and all code - even more than shown - is published at GitHub.

Currently there are only 10 repositories showing up when you search for ruby
ftw on GitHub.
I am sure you will find it quickly.
-->

# Try Ruby\footnote{https://try.ruby-lang.org/}

![](./media/try-ruby.png)

<!--
Visit try ruby on the official site of the language to get a guided tour and a
nice playground in your web browser.
-->

# Join Exercism\footnote{https://exercism.io/tracks/ruby}

![](./media/exercism.png)

<!--
Then have a look at Exercism, which is a open source platform that supports you
when learning a programming language.

It currently has around 50 language tracks, where you solve tasks and get
feedback of real people.
Note that those people are volunteers, so don't be mad if it takes some time to
get reviews of your solution.

I follow this project since 2013 and also contribute as mentor for several
language tracks. Chances are good that you receive some code review from me on
your solution written in Ruby.
-->

# Visit Rails Guides\footnote{https://guides.rubyonrails.org/}

![](./media/rails-guides.png)

<!--
If you are into web development you should definitely browse through the guides
of the Ruby on Rails framework which is the basis of websites like GitHub,
GitLab and Shopify.

It is a collection of many packages that provides so much awesome Ruby code and
it also offers great ways to build web applications.
-->

# Run RuboCop\footnote{https://rubocop.org/}

![](./media/rubocop.png)

<!--
When you've spent some time with Ruby, it is time to meet its widely used
static code analyzer RuboCop.

This tool will help you to use and understand best practices from the Ruby
community.
Besides it is a great project and bundles so much knowledge.

For me it took quite some time to stop hating this tool and get the value
behind, so don't give up easily.
-->

# Slides, Code, Contact - Thanks a lot for Joining!!!

Christoph Lipautz

- @unused in #glt21 chat at IRC OFTC

- [\@unused](https://github.com/unused) at GitHub

- [\@lipdaguit](https://twitter.com/lipdaguit) on Twitter

- [https://github.com/unused/ruby-ftw](https://github.com/unused/ruby-ftw)

<!--
I'm Christoph and use unused as nickname in the
linuxtage IRC channel at OFTC. You can find me on GitHub as unused.

If you want to contact me after the event you will probably find some email
address when duckduckgo'ing my name.
But the easiest way is to write me on Twitter.

A big thank you for the Linuxtage Team for organizing this event.
And many thanks to you for joining my talk. Looking forward to your questions!
-->
