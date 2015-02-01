class FakeProduct

  def initialize
    p "Find out your product's name, price and department"
  end
  
  def name
    Faker::Commerce.product_name
  end

  def price
    Faker::Commerce.price
  end

  def department
    Faker::Commerce.department
  end
end