module WiringPi
  class Serial
    attr_reader :id, :device, :baud
    @id = 0
    @device = '/dev/ttyAMA0'
    @baud = 9600

    def initialize(device = '/dev/ttyAMA0', baud = 9600)
      @id = Wiringpi.serialOpen(device, baud)
      @device = device
      @baud = baud
    end

    def serial_close
      Wiringpi.serialClose(@id)
      @id = nil
    end

    def serial_put_char(char)
      raise 'serial connection is closed' if @id.nil?
      Wiringpi.serialPutchar(@id, char)
    end

    def serial_puts(string)
      raise 'serial connection is closed' if @id.nil?
      Wiringpi.serialPuts(@id, string)
    end

    def serial_data_avail
      raise 'serial connection is closed' if @id.nil?
      Wiringpi.serialDataAvail(@id)
    end

    def serial_get_char
      raise 'serial connection is closed' if @id.nil?
      Wiringpi.serialGetchar(@id)
    end
  end
end
