# Calculator

A simple calculator...


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_calc'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install simple_calc
```

Alternatively install gem form source via:

```bash
$ git clone https://github.com/oneKelvinSmith/simple_calc.git
$ cd simple_calc
$ rake install
```

## Usage

Given a file named 'expressions.txt' with these contents:

```
7+7/7+7*7-7
(5+2) +1+7*7-(3+4)
```

Simple calculator will evaluate the expressions like this:


```bash
$ calculate expressions.txt
50
50
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
