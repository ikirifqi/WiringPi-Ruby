module WiringPi
  class I2C
		attr_reader :device_id

		def initialize(device_address)
			@device_id = Wiringpi.wiringPiI2CSetup(device_address)
		end

		def read
			Wiringpi.wiringPiI2CRead(@device_id)
		end

		def write(data)
			Wiringpi.wiringPiI2CWrite(@device_id, data)
		end

		def read_reg_8(reg)
			Wiringpi.wiringPiI2CReadReg8(@device_id, reg)
		end

		def write_reg_8(reg, data)
			Wiringpi.wiringPiI2CWriteReg8(@device_id, reg, data)
		end

		def read_reg_16(reg)
			Wiringpi.wiringPiI2CReadReg16(@device_id, reg)
		end

		def write_reg_16(reg, data)
			Wiringpi.wiringPiI2CWriteReg16(@device_id, reg, data)
		end
  end
end
