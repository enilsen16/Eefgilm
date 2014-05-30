[![Gem Version](https://badge.fury.io/rb/eefgilm@2x.png)](http://badge.fury.io/rb/eefgilm)
[![Stories in Ready](https://badge.waffle.io/enilsen16/eefgilm.png?label=ready&title=Ready)](https://waffle.io/enilsen16/eefgilm)
#Eefgilm: A gem for cleaning up your Gemfile

#Description:
**Important, currently does not support gem groups. If you have groups they will not included in the revised gemfile!**

This gem automatically modifies a ruby gemfile to make them a little easier to read, it does this by alphabetizing the gems, removing all comments, and removing all whitespace including leading and trailing.

---

## Installation
The simplest way to install Eefgilm is to
Run this command:

     gem install eefgilm

Alternatively you can include it in a gem file with:

     gem 'eefgilm'

and then run

     bundle install

---
## Usage

Once you have installed eefgilm on your system or in a project directory its quite simple to use. In the directory who's gemfile you would like to modify run:

    eefglim

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
##Contact
If you find a bug have a suggestion or just want to say hi please feel free to contact Marco <lindsay_marco@hotmail.com>

---

##Thanks
The following people have helped with development or project design in one form or another:
[https://github.com/buckleys78](https://github.com/buckleys78)
[https://github.com/brookr](https://github.com/brookr)
[https://github.com/cherimarie](https://github.com/cherimarie)
[https://github.com/dbalatero](https://github.com/dbalatero)

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
