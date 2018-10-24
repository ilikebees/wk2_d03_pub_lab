class Pub

  attr_reader :name, :drinks, :customers, :till

  def initialize(name, customers, drinks)
    @name = name
    @drinks = drinks
    @customers = customers
    @till = 0.0 #Always going to be 0 so not a required argument. Initial parameter. It just exists.
  end

  def accept_cash(cash)
    @till += cash
  end

  def customer_buys_drink(customer, drink)
    if customer.wallet >= drink.price && age_check(customer)
      @till += drink.price
      customer.buy_drink(drink)
    end
  end

  def age_check(customer)
    if customer.age > 18
      return true
    else
      return false
    end
  end

end
