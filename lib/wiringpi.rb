require 'wiringpi/wiringpi'
module WiringPi
  extend self

  # GPIO signal
  HIGH = 1
  LOW = 0

  # GPIO signal event
  FALLING = :falling
  RISING = :rising

  INPUT = 0
  OUTPUT = 1
  PWM_OUTPUT = 1

  PUD_OFF = 0
  PUD_DOWN = 1
  PUD_UP = 2

  LSPFIRST = 0
  MSBFIRST = 1

  class Modules
    class ModuleBase
      attr_reader :name, :pin_base, :pin_count, :pin_end

      def initialize
        @name = 'Unknown'
        @pin_base = 0
        @pin_count = 0
        @pin_end = 0
      end

      def new
        @pin_end = @pin_base + @pin_count
        update_name
      end

      def update_name
        @name = " at offset #{@pin_base}"
      end
    end
  end
end

Dir[File.dirname(__FILE__) + '/wiringpi/**/*.rb'].each { |file| require file }
