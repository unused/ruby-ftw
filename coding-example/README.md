
# Timeless

A time handling package to showcase the beauty of [Ruby](https://ruby-lang.org).

A word of warning:

## Usage

```ruby
require 'timeless'

puts (5.days + 5.hours + 5.minutes).from_now # Time<2021, ...>
```

## Development

```sh
$ bundle install # install dependencies
$ bundle exec ruby tests/ # run testsuite
$ bundle exec irb -r './timeless' # interactive ruby shell
```

## Sidenotes and Further Readings

When testing with time it's a good practice to freeze time! If you do not, a
timestamp might be off milliseconds within your test and randomly fail if it
belongs to a differen "second" breaking an equality assertions. Use [timecop]
or check [rails testing time helpers]. Additionally you can rely on your static
knowledge rather than doing dynamic calculation in your testsuite. Just think
of an age validator that ensures a person is of 18 years or more.


[timecop]: https://github.com/travisjeffery/timecop "A gem providing time travel and freezing"
[rails testing time helpers]: https://api.rubyonrails.org/classes/ActiveSupport/Testing/TimeHelpers.html