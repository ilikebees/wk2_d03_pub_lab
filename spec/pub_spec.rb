require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../customer')
require_relative('../drink')

class PubTest < MiniTest::Test

  def setup
    alex = Customer.new('Alex', 0.00, 29)
    laura = Customer.new('Laura', 25.00, 33)
    brian = Customer.new('Brian', 10.00, 17)
    rob = Customer.new('Rob', 30.00, 23)

    customers = [alex, laura, brian, rob]

    beer1 = Drink.new("Salty Kiss", 3.50, 1.5)
    beer2 = Drink.new("Dead Pony Club", 5.50, 3.5)
    gnt = Drink.new("G&T", 4.50, 2.3)
    wine = Drink.new("Pinot Grigio", 4.00, 5.1)

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
    expected = 3
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

  def test_customer_buys_drink__success
    expected = 4.50
    @pub.customer_buys_drink(@pub.customers[1], @pub.drinks[2])
    actual = @pub.till
    assert_equal(expected, actual)
  end

  def test_customer_buys_drink__fail
    expected = 0.00
    @pub.customer_buys_drink(@pub.customers[0], @pub.drinks[2])
    actual = @pub.till
    assert_equal(expected, actual)
  end

  def test_customer_buys_drink__fail_underage
    expected = 0.00
    @pub.customer_buys_drink(@pub.customers[2], @pub.drinks[2])
    actual = @pub.till
    assert_equal(expected, actual)
  end

  def test_age_check__pass
    expected = true
    actual = @pub.age_check(@pub.customers[0])
    assert_equal(expected, actual)
  end

  def test_age_check__fail
    expected = false
    actual = @pub.age_check(@pub.customers[2])
    assert_equal(expected, actual)
  end

  def test_drunk_check__pass
    expected = false
    @pub.customer_buys_drink(@pub.customers[2], @pub.drinks[2])
    actual =
  end

end
