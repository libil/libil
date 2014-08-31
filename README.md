# Libil

Libil is a library and a command line to convert a sentence or a word to using [Basa Walikan
Jogja](http://jengjeng.matriphe.com/2007/06/09/bahasa-walikan-jogja/) implemented in Ruby.

## Installation

Libil is packaged as RubyGems. You can install it using `gem` command

```bash
$ gem install libil
$ rbenv rehash          # if you're using rbenv
```

From Source

```bash
$ bundler install
$ gem build libil.gemspec
$ gem install libil-0.1.0.gem
```

## Usage

Libil can be use as a library or a command line. To use it on your Ruby app or Rails app include `libil` on your
source.

```ruby
require 'libil'
converted = Libil::convert("Bali Ora, Mas?")
```

If you want to use it as command line, easy just run `libil` followed by word or sentence to convert.

```bash
$ libil Bali Ora, Mas?
```

## License

The MIT License (MIT)

Copyright (c) 2014 Didiet Noor

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