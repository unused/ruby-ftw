---
title: ruby FTW / Linuxtage 2021
author: Christoph Lipautz
theme: Copenhagen
colortheme: beaver
date: March 17, 2021
---

<!--
Ahoi! This is Ruby for the win! for the Linuxtage 2021
-->

# Lets say:

Programming Languages are (kind of) Tools

<!--
From certain point of view programming languages have lot of similarities to
choosing tools for a job.

They have in common that they were created to solve a certain problem in a
different, mostly more simple or elegant way.

Therefor we might say that the more tools you know, the better you will know if
you could save some time, effort or sanity.
-->

# Learn a Programming Language Every Year

Do not strictly compare, but try to understand its purpose.

<!--
There is a good practice that allows us to keep up studying. If you learn
at least one programming language a year it will enrich your perspective on
different problems and help you figure out better solutions.
-->

# Christoph Lipautz

![](./media/me.jpg)

<!--
I'm Christoph and I spent a lot of time building software. On a daily basis I
do this using go, sometimes python, javascript or and some other tools.

However I'm especially grateful that I can spent a lot of time using ruby.

In this talk I want to give you some insights on why I love to work with ruby.

As this is a live (remote) presentation, feel free to interrupt me anytime
to ask a question!
-->

# Overview

- Why did I stick with Ruby for so many years?
- Super Brief Basics (Code)
- An Example dealing with Time (Code)
- Resources, Getting Started, Q/A or more Code

# Ruby\footnote{https://www.ruby-lang.org/}

![](./media/ruby-logo.png) Designed for Developer Happiness

<!--
So Ruby is know to focus on developer happiness. That can be attributed to
the inventor and chief designer of the language.
-->

# Yukihiro "Matz" Matsumoto

![](./media/img-1542.jpg)

<!--
Yukihiro Matsumoto, also referred to as Matz has a strong eye on the language
structure and
-->

# Matz is nice, so we are nice

- A welcoming community
- Conventions and best practice, no strict rules
- A well aged environment

# Everything is a file

Everything in Unix is a file

# Everything is a object

Everything in Ruby is a object

# Everything is an object

Everything in Ruby is an object

# Lets GO ^^

<!--
interactive ruby irb...

1 + 1
'foobar'
:foobar
1.0 + 1.0
class A
  def foo
    "first"
    "last"
  end
end
a = A.new
# calling method foo of object instance stored in a we tend to say: sending
# message :foo to the instance.
a.foo # last ... last line is returned, no explicit return required
# for sure we could also use an explicit return state but we tend to skip
# things that are not necessary to improve readability.
# same goes for bracec, not all are required
a.foo()
# Note that this allows you to choose what you like best, but most rubyist
# tend to same or similar styles over time. for sure you can also use static
# code analyzer that will help you figure out style rule violations, and inform
# about best practice.
# as everything is an object, we can send messages to primitives
1
-->

# Ruby on Rails in Action

```ruby
users = User.where :created_at.gte => 3.days.ago
```

# Timeless Project


# Resources, Tips and Hints

- mention Try Ruby
- mention Exercism + Enumerator Example
- mention Guides Ruby on Rails
- mention Rubocop

