module WiringPi
  class Modules
    class Mcp23017 < ModuleBase
      attr_reader :i2c_address

      def initialize(pin_base, i2c_address = 0x0)
        super
        @pin_base = pin_base
        @pin_count = 16
        @i2c_address = i2c_address
        Wiringpi.mcp23017Setup(pin_base, i2c_address)
      end
    end
  end
end
