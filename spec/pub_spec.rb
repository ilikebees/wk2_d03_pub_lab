require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../customer')
require_relative('../drink')

class PubTest < MiniTest::Test

  def setup
    alex = Customer.new('Alex', 30.00)
    laura = Customer.new('Laura', 25.00)

    customers = [alex, laura]

    beer1 = Drink.new("Salty Kiss", 3.50)
    beer2 = Drink.new("Dead Pony Club", 5.50)
    gnt = Drink.new("G&T", 4.50)
    wine = Drink.new("Pinot Grigio", 4.00)

    drinks = [beer1, beer2, gnt, wine]

    @pub = Pub.new("Salt Horse", customers, drinks)
  end

  def test_has_name
    expected = "Salt Horse"
    actual = @pub.name
    assert_equal(expected, actual)
  end

  def test_has_drinks
    expected = 4
    actual = @pub.drinks.length
    assert_equal(expected, actual)
  end

  def test_has_customers
    expected = 2
    actual = @pub.customers.length
    assert_equal(expected, actual)
  end

  def test_cash_starts_empty
    expected = 0.00
    actual = @pub.till
    assert_equal(expected, actual)
  end

  def test_accept_cash
    expected = 4.00
    @pub.accept_cash(4.00)
    actual = @pub.till
    assert_equal(expected, actual)
  end

  def test_customer_buys_drink
    expected = 4.50
    @pub.customer_buys_drink(@pub.customers[1], @pub.drinks[2])
    actual = @pub.till
    assert_equal(expected, actual)
  end

end
