# overtimer

Calculates employee payroll info based on California laws (overtime, doubletime, etc)

## Usage

Assuming you've installed the gem with `gem install overtimer`:

```ruby
require 'rubygems'
require 'overtimer'

# Create a workweek using an array of hours per day for 1 week
ww = Overtimer::Workweek.new [17,12,15,11,12,4,0]

# Do the deductions meet your expectation (pull requests welcome)
ww.total == 71
ww.regular == 40,
ww.overtime == 23
ww.doubletime == 8

# What about only one of the days in the workweek?
wd = ww[0]

# How about these? Are they correct? They are for me anyway.
wd.total == 17
wd.regular == 8
wd.overtime == 4
wd.doubletime == 5
```
