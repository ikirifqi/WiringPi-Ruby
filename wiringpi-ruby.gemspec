Gem::Specification.new do |s|
  s.name	= 'wiringpi-ruby'
  s.version	= '2.0.1'
  s.license = 'GNU Lesser General Public License v3'
  s.date	= '2021-06-30'
  s.platform= Gem::Platform::RUBY
  s.summary	= 'Forked from WiringPi-Ruby.'
  s.authors	= ["Rifqi", "Fauzi"]
  s.email	= 'no-reply@gmail.com'
  s.files	= Dir.glob('lib/wiringpi/*.rb') + Dir.glob('lib/*.rb') + Dir.glob('ext/**/**/*.{c,h}') + Dir.glob('ext/**/*.{c,h,rb}')
  s.homepage	= 'http://rubygems.org/gems/wiringpi-ruby'
  s.extensions	= ['ext/wiringpi/extconf.rb']
  s.description = 'WiringPi library wrapper for the Raspberry Pi. Wraps up version 2.x of the Arduino wiring-like WiringPi library into a convinient Ruby gem. Credit to Gordon for the WiringPi library, which can be found here: http://www.wiringpi.com'
end
