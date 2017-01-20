
require 'gpio/core/pin'

module Gpio
  module Core
    # Represents a series of pin
    class Chipset
      attr_reader :model, :revision, :pins

      def initialize(model, revision)
        @model = model
        @revision = revision
        @pins = []
      end

      def register_pin(id, name, description, capabilities)
        return false if pin?(id) || pin_named?(name)

        @pins << Pin.new(id, name, description, capabilities)

        true
      end

      def pin?(id)
        !pin(id).nil?
      end

      def pin_named?(name)
        !pin_named(name).nil?
      end

      def pin(id)
        @pins.each do |pin|
          return pin if pin.id == id
        end
        nil
      end

      def pin_named(name)
        @pins.each do |pin|
          return pin if pin.name == name
        end
        nil
      end
    end
  end
end
