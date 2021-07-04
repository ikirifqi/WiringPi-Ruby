module WiringPi
  class GPIO
    attr_reader :modules, :pins

    @@system_ready = false

    def self.setup(pin_layout = GPIO_WPI)
      return if @@system_ready

      case pin_layout
      when GPIO_WPI; Wiringpi.wiringPiSetup
      when GPIO_NORMAL; Wiringpi.wiringPiSetupGpio
      when GPIO_PHYSICAL; Wiringpi.wiringPiSetupPhys
      when GPIO_SYSTEM; Wiringpi.wiringPiSetupSys
      else raise 'unknown pin layout to setup'
      end

      @@system_ready = true
    end

    def initialize(&block)
      raise 'system is not ready, please call WiringPi::GPIO.setup first' unless @@system_ready

      @pins = []
      @modules = []
      setup_wiring_pi
      instance_eval &block if block_given?
    end

    def read_byte(starting_pin)
      8.times.map { |time| Wiringpi.digitalRead(starting_pin + time) }.join
    end

    def write_byte(starting_pin, byte)
      bits = byte.to_s(2) unless byte.length == 8
      offset = starting_pin
      bits.each_char do |bit|
        Wiringpi.digitalWrite(offset, bit)
        offset += 1
      end
    end

    def digital_read(pin)
      pins = [pin] unless pin.is_a?(Array)
      res = pins.collect { |pin| Wiringpi.digitalRead(pin) }
      res.count == 1 ? res.first : res
    end

    def digital_write(pin, value)
      pins = [pin] unless pin.is_a?(Array)
      pins.each { |pin| Wiringpi.digitalWrite(pin, value) }
    end

    def analog_read(pin)
      pins = [pin] unless pin.is_a?(Array)
      res = pins.collect { |pin| Wiringpi.analogRead(pin) }
      res.count == 1 ? res.first : res
    end

    def analog_write(pin, value)
      pins = [pin] unless pin.is_a?(Array)
      pins.each { |pin| Wiringpi.analogWrite(pin, value) }
    end

    def pin_mode(pin, mode)
      Wiringpi.pinMode(pin, mode)
    end

    def pull_up_dn_control(pin, mode)
      Wiringpi.pullUpDnControl(pin, mode)
    end

    def delay(ms)
      Wiringpi.delay(ms)
    end

    def delay_microseconds(ms)
      Wiringpi.delayMicroseconds(ms)
    end

    def millis
      Wiringpi.millis
    end

    def micros
      Wiringpi.micros
    end

    # NOTE: deprecated call to Wiringpi.piBoardRev
    def pi_board_rev
      Wiringpi.piBoardRev
    end

    def wpi_pin_to_gpio(pin)
      Wiringpi.wpiPinToGpio(pin)
    end

    def phys_pin_to_gpio(pin)
      Wiringpi.physPinToGpio(pin)
    end

    def pwm_set_mode(mode)
      Wiringpi.pwmSetMode(mode)
    end

    def pwm_set_range(range)
      Wiringpi.pwmSetRange(range)
    end

    def pwm_set_clock(divisor)
      Wiringpi.pwmSetClock(divisor)
    end

    def soft_pwm_create(pin, initial_value, pwm_range)
      Wiringpi.softPwmCreate(pin, initial_value, pwm_range)
    end

    def soft_pwm_write(pin, value)
      Wiringpi.softPwmWrite(pin, value)
    end

    def gpio_clock_set(pin, freq)
      Wiringpi.gpioClockSet(pin, freq)
    end

    def wait_for_interrupt(pin, ms)
      Wiringpi.waitForInterrupt(pin, ms)
    end

    def wiringpi_isr(pin, mode, fn)
      Wiringpi.wiringPiISR(pin, mode, fn)
    end

    def shift_out(dpin, cpin, order, val )
      Wiringpi.shiftOut(dpin,cpin,order,val)
    end

    def shift_in(dpin, cpin, order)
      Wiringpi.shiftIn(dpin,cpin,order)
    end

    def add_module(module_instance)
      @modules << module_instance
      puts "Added module #{module_instance.name}"

      module_instance.pin_count.times do |offset|
        @pins[offset + module_instance.pin_base] = 'ENABLED'
      end
    end
  end
end
