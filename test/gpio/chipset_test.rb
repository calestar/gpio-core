require 'test_helper'

module GpioTest
  class ChipsetTest < Minitest::Test
    def test_init
      chipset = ::Gpio::Core::Chipset.new('I am a chipset', 1234)
      assert_equal 'I am a chipset', chipset.model
      assert_equal 1234, chipset.revision
      assert_empty chipset.pins
      assert !chipset.pin(:blue)
    end

    def test_add_pin
      chipset = ::Gpio::Core::Chipset.new('I am a chipset', 1234)
      assert chipset.register_pin(
        1, :test, 'I am a pin',
        ::Gpio::Core::PinCapabilities::INPUT
      )
      pin = chipset.pin(1)
      assert pin
      assert_equal(1, pin.id)
      assert_equal(:test, pin.name)
      assert_equal('I am a pin', pin.description)
      assert pin.input_capable?
      assert !pin.output_capable?
      assert_equal(1, chipset.pins.size)
      assert chipset.pin? 1
    end

    def test_duplicate_pin_id
      chipset = ::Gpio::Core::Chipset.new('I am a chipset', 1234)
      assert chipset.register_pin(
        1, :test, 'I am a pin',
        ::Gpio::Core::PinCapabilities::INPUT
      )
      assert !chipset.register_pin(
        1, :test2, 'I am another pin',
        ::Gpio::Core::PinCapabilities::INPUT
      )
      assert_equal(1, chipset.pins.size)
    end

    def test_duplicate_pin_name
      chipset = ::Gpio::Core::Chipset.new('I am a chipset', 1234)
      assert chipset.register_pin(
        1, :test, 'I am a pin',
        ::Gpio::Core::PinCapabilities::INPUT
      )
      assert !chipset.register_pin(
        2, :test, 'I am another pin',
        ::Gpio::Core::PinCapabilities::INPUT
      )
      assert_equal(1, chipset.pins.size)
    end

    def test_multiple_pin
      chipset = ::Gpio::Core::Chipset.new('I am a chipset', 1234)
      assert chipset.register_pin(
        1, :test, 'I am a pin',
        ::Gpio::Core::PinCapabilities::INPUT
      )
      assert chipset.register_pin(
        2, :test2, 'I am another pin',
        ::Gpio::Core::PinCapabilities::INPUT
      )
      assert_equal(2, chipset.pins.size)
    end
  end
end
