module Gpio
  module Core
    # Represents a driver to interact with the chipset
    # This class is meant to be subclassed and provides
    # only utility functions
    class Driver
      attr_reader :name, :description

      def initialize(name, description)
        @name = name
        @description = description
        @initialized_pins = {}
        @initialized = false
      end

      def initialized?
        @initialized
      end

      def setup
        return false if initialized?
        return false unless setup_driver

        @initialized = true
        true
      end

      def pin_initialized?(pin)
        @initialized_pins.key?(pin.id)
      end

      def initialize_pin(pin)
        return false if pin_initialized?(pin)
        return false unless setup_pin(pin)

        @initialized_pins[pin.id] = pin
        true
      end
    end
  end
end
