module WiringPi
	class ScrollPhat
		def initialize
			Wiringpi.scrollPhatSetup
		end

		def printf(text)
			Wiringpi.scrollPhatPrintf(text)
		end

		def point(x, y, color)
			Wiringpi.scrollPhatPoint(x, y, color)
		end

		def line(x0, y0, x1, y1, color)
			Wiringpi.scrollPhatLine(x0, y0, x1, y1, color)
		end

		def lineTo(x, y, color)
			Wiringpi.scrollPhatLineTo(x, y, color)
		end

		def rectangle(x1, y1, x2, y2, color)
			Wiringpi.scrollPhatRectangle(x1, y1, x2, y2, color)
		end

		def update
			Wiringpi.scrollPhatUpdate
		end

		def clear
			Wiringpi.scrollPhatClear
		end

		def putChar(char)
			Wiringpi.scrollPhatPutchar(char)
		end

		def puts(str)
			Wiringpi.scrollPhatPuts(str)
		end

		def printSpeed(cps10)
			Wiringpi.scrollPhatPrintSpeed(cps10)
		end

		def intensity(percent)
			Wiringpi.scrollPhatIntensity(percent)
		end
	end
end
