[![Build Status](https://travis-ci.org/enilsen16/Eefgilm.svg?branch=master)](https://travis-ci.org/enilsen16/Eefgilm)
[![Gem Version](https://badge.fury.io/rb/eefgilm.svg)](http://badge.fury.io/rb/eefgilm)
[![Stories in Ready](https://badge.waffle.io/enilsen16/eefgilm.png?label=ready&title=Ready)](https://waffle.io/enilsen16/eefgilm)
#Eefgilm: A gem for cleaning up your Gemfile

#Description:

Eefgilm automatically modifies a ruby gemfile to make them a little easier to read, it does this by alphabetizing the gems, removing all comments, and removing all whitespace including leading and trailing.

These Gemfile best practices are all loosely based on a [blog post](http://mcdowall.info/posts/gemfile-best-practices-and-discourse/) written by John McDowall.

###These best practices are:

- Consistent use of Ruby hash syntax. Use either the old hashrocket or the new Ruby 1.9 syntax, but not both.
- Consistent use of a single quoted delimiter. Use either apostrophes or quotation marks, but not both.
- No commented Gem references. If it’s commented out, it shouldn’t be there.
- Comments relating to a Gem are on the same line as the gem statement, not above.
- Group gems that are sourced from Git repos at the top. Chances are they are referencing pre-versions that will become general release and you can change the reference to be part of the General project group later.
- Group gems that are sourced from a project path after Git repo sourced Gems. These are probably gems that you might make public and thus reference in the general project gem group later.
- Group all of the General project gems together (consider using the :default group).
- Group all of the Production project gems together after the General gems.
- Group all of the Asset gems after the Production group.
- Group all of the Test related gems after the Asset gems.
- Group all of the Development related gems after the Test gems.
- Within all Gem groups, sort the references by Alphabetical order.
- When adding new gems, maintain the alphabetical ordering within the groups.


## Installation
The simplest way to install Eefgilm is to run this command:

     gem install eefgilm

Alternatively you can include it in a gem file with:

     gem 'eefgilm'

and then run

     bundle install

---

## Demo

A gif of 2 versions of Gemfile i.e before using the gem and after using the gem.

![Banner](http://zippy.gfycat.com/DeliriousInsidiousHumpbackwhale.gif)

---
## Usage

Once you have installed eefgilm on your system or in a project directory its quite simple to use. In the directory who's gemfile you would like to modify run:

    eefgilm

Currently it will not ask you for any confirmation before making modifications, nor will it create a backup so please be careful when using eefgilm. It may be a good idea to backup your gemfile beforehand hand this can be done with:

     cp Gemfile Gemfilebackup

---
## Contributing
We welcome contributions! If you want to help out you have many options:

1. Fork it ( https://github.com/enilsen16/eefgilm/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

---
##Issues
If you find a bug or have a suggestion, please create a new issue and we will look into it. Thank You.
[Create a new issue](https://github.com/enilsen16/Eefgilm/issues/new)

---

##Thanks
The following people have helped with development or project design in one form or another:<br>
[Steve Buckley](https://github.com/buckleys78)<br>
[Brook Riggio](https://github.com/brookr)<br>
[Cheri](https://github.com/cherimarie)<br>
[David](https://github.com/dbalatero)<br>

---
##License

And now for the fun part...

The MIT License (MIT)

Copyright (c) <2014> <Marco Lindsay & Erik Nilsen>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
