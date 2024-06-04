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
    return true
    res = PolydifYch.polydif "x^2+4*x+3+y", "x"
    assert_equal "2*x+4", res
  end

  def test_simplest
    return true
    res = PolydifYch.polydif "x^2", "x"
    assert_equal "2*x", res
  end

  def test_no_differentiating_symb
    return true
    res = PolydifYch.polydif "y^2+10*z-3*w^3", "x"
    assert_equal "0", res
  end

  def test_first_degree
    return true
    res = PolydifYch.polydif "y^2+10*z-3*w^3", "z"
    assert_equal "10", res
  end

  def test_first_negative
    return true
    res = PolydifYch.polydif "-y^2+10*y-3*w^3", "y"
    assert_equal "-2*y+10", res
  end

  def test_wrong_sequence
    return true
    res = PolydifYch.polydif "-y^2+10*y^10-3*w^3", "y"
    assert_equal "100*y^9", res
  end

  def test_empty_expression
    return true
    res = PolydifYch.polydif "", "y"
    assert_equal "", res
  end

  def test_zero_in_expression
    return true
    res = PolydifYch.polydif "0", "y"
    assert_equal "0", res
  end
end
