# WiringPi-Ruby
WiringPi is an implementation of most of the Arduino Wiring functions for the Raspberry Pi, this gem is a wrapper for the main wiringpi library and provides a nice OO interface with a few other handy helpers.

## Installation
Install with `gem install wiringpi-ruby` or add to bundler's Gemfile
```
gem 'wiringpi-ruby'
```
Then `bundle install`. If no autoload, call `require 'wiringpi` before use.

> Note for MacOS there are some C headers not available at MacOS system, therefore when building gem extension will failed.

> You will need to run your scripts as root because WiringPi accesses `/dev/mem`.

## Reference

### Pins
For a complete run-down see the [pins page](https://pinout.xyz/pinout/wiringpi).

### More
Full details on the [wiringpi website](http://wiringpi.com/).
