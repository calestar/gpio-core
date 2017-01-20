require 'test_helper'

module GpioTest
  class CoreTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Gpio::Core::VERSION
    end
  end
end
