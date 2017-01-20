module Gpio
  module Core
    module PinCapabilities
      INPUT  = 1
      OUTPUT = 2
      N_A    = 4
    end

    # Represents a hardware pin.
    class Pin
      attr_reader :id, :name, :description

      def initialize(id, name, description, capabilities)
        @id = id
        @name = name
        @description = description
        @capabilities = capabilities
      end

      def output_capable?
        (@capabilities & PinCapabilities::OUTPUT) == PinCapabilities::OUTPUT
      end

      def input_capable?
        (@capabilities & PinCapabilities::INPUT) == PinCapabilities::INPUT
      end
    end
  end
end
