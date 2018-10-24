require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')

class CustomerTest < MiniTest::Test

  def setup
    @customer = Customer.new('Alex', 30.00)
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

  def test_buy_drink
    @customer.buy_drink(3.50)
    expected = 26.50
    actual = @customer.wallet
    assert_equal(expected, actual)
  end 
end
