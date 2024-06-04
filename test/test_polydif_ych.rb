# frozen_string_literal: true

require "test_helper"
require "polydif_ych"

class TestPolydifYch < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PolydifYch::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_example
    res = PolydifYch.polydif("x^2+4*x+3+y", "x")
    assert_equal"2*x+4", res
  end

  def test_simplest
    res = PolydifYch.polydif "x^2", "x"
    assert_equal"2*x", res
  end
end
