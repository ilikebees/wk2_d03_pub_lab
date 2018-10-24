require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new("Salty Kiss", 3.50, 1.5)
  end

  def test_drink_has_name
    expected = "Salty Kiss"
    actual = @drink.name
    assert_equal(expected, actual)
  end

  def test_drink_has_price
    expected = 3.50
    actual = @drink.price
    assert_equal(expected, actual)
  end

  def test_drink_has_units
    expected = 1.5
    actual = @drink.units
    assert_equal(expected, actual)
  end


end
