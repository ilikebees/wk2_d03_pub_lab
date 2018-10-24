require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../drink')

class CustomerTest < MiniTest::Test

  def setup
    @customer = Customer.new('Alex', 30.00, 29)
    @drink = Drink.new('Jagarbomb', 3.50, 2.0)
  end

  def test_customer_has_name
    expected = 'Alex'
    actual = @customer.name
    assert_equal(expected, actual)
  end

  def test_customer_has_wallet
    expected = 30.00
    actual = @customer.wallet
    assert_equal(expected, actual)
  end

  def test_customer_has_age
    expected = 29
    actual = @customer.age
    assert_equal(expected, actual)
  end

  def test_buy_drink
    @customer.buy_drink(@drink)
    expected = 26.50
    actual = @customer.wallet
    assert_equal(expected, actual)
  end

  def test_alcohol_level__start
    expected = 0.0
    actual = @customer.alcohol_level
    assert_equal(expected, actual)
  end

  def test_alcohol_level_closing_time
    expected = 2.0
    actual = @customer.buy_drink(@drink)
    assert_equal(expected, actual)
  end

end
