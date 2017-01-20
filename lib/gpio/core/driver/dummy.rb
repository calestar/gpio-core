
require 'gpio/core/driver'

module Gpio
  module Core
    module Drivers
      # Dummy driver to manually control I/O
      class Dummy < Gpio::Core::Driver
        def initialize
          super('Dummy', 'Dummy driver to manually control I/O')
          @pin_values = {}
        end

        def setup_driver
          true
        end

        def setup_pin(_pin)
          true
        end
      end
    end
  end
end
