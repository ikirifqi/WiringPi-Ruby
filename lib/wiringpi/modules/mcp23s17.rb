module WiringPi
  class Mcp23s17 < ModuleBase
    attr_reader :spi_port, :device_id

    def initialize(pin_base, spi_port, device_id)
      super
      @pin_base = pin_base
      @pin_count = 16
      @spi_port = spi_port || 0
      @device_id = device_id || 0
      Wiringpi.mcp23s17Setup(pin_base, spi_port, device_id)
    end
  end
end
