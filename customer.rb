class Customer

  attr_reader :name, :wallet, :age, :alcohol_level

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @alcohol_level = 0.0
  end

  def buy_drink(drink)
    @wallet -= drink.price
    @alcohol_level += drink.units
  end

end
