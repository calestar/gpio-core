require 'test_helper'

module GpioTest
  class DriverTest < Minitest::Test
    def test_initialize
      driver = Gpio::Core::Drivers::Dummy.new
      assert !driver.initialized?
      assert driver.setup
      assert driver.initialized?
    end

    def test_pin_init
      driver = Gpio::Core::Drivers::Dummy.new
      assert driver.setup

      pin = Gpio::Core::Pin.new(
        1, :pin, "I'm a pin",
        Gpio::Core::PinCapabilities::INPUT
      )
      assert !driver.pin_initialized?(pin)
      assert driver.initialize_pin(pin)
      assert driver.pin_initialized?(pin)
    end
  end
end
