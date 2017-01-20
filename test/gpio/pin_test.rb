require 'test_helper'

module GpioTest
  class PinTest < Minitest::Test
    def test_init
      pin = ::Gpio::Core::Pin.new(
        1,
        :test,
        'I am a description',
        ::Gpio::Core::PinCapabilities::INPUT
      )
      assert_equal 1, pin.id
      assert_equal :test, pin.name
      assert_equal 'I am a description', pin.description
    end

    def test_input
      pin = ::Gpio::Core::Pin.new(
        1,
        :test,
        'I am a description',
        ::Gpio::Core::PinCapabilities::INPUT
      )
      assert pin.input_capable?
      assert !pin.output_capable?
    end

    def test_output
      pin = ::Gpio::Core::Pin.new(
        1,
        :test,
        'I am a description',
        ::Gpio::Core::PinCapabilities::OUTPUT
      )
      assert !pin.input_capable?
      assert pin.output_capable?
    end

    def test_input_output
      pin = ::Gpio::Core::Pin.new(
        1,
        :test,
        'I am a description',
        ::Gpio::Core::PinCapabilities::INPUT |
        ::Gpio::Core::PinCapabilities::OUTPUT
      )
      assert pin.input_capable?
      assert pin.output_capable?
    end

    def test_not_in_not_out
      pin = ::Gpio::Core::Pin.new(
        1,
        :test,
        'I am a description',
        ::Gpio::Core::PinCapabilities::N_A
      )
      assert !pin.input_capable?
      assert !pin.output_capable?
    end
  end
end
