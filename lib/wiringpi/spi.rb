module WiringPi
  class SPI
		attr_reader :channel

		def initialize(channel, speed)
			@channel = channel
			Wiringpi.wiringPiSPISetup(channel, speed)
		end

		def wiringPiSPIGetFd
			Wiringpi.wiringPiSPIGetFd(@channel)
		end

		def wiringPiSPIDataRW(data)
			Wiringpi.wiringPiSPIDataRW(@channel, data)
		end
  end
end
