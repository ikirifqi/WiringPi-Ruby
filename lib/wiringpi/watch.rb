module WiringPi
	class GPIO
		def watch(pin, *states, &block)
			raise 'block is required' unless block_given?

			unless states.include?(WiringPi::FALLING) || states.include?(WiringPi::RISING)
				raise 'states must WiringPi::FALLING or WiringPi::RISING or both'
			end

			Thread.new do
				last_value = digital_read(pin)
				loop do
					new_value = digital_read(pin)
					if new_value != last_value
						state = WiringPi::FALLING if new_value == 0
						state = WiringPi::RISING if new_value == 1
						block.call new_value if states.include?(state)
						last_value = new_value
					end
				end
			end
		end
	end
end
