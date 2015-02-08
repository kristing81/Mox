class FakeProduct

  attr_reader :name, :price, :department

  def initialize
    @name = Faker::Product.name
    @title = Faker::Product.price
    @company = Faker::Product.department
  end

  
  def FakeProduct.fake(count = 1)
    products = []
    count.times do
      products << new
    end
      products
    end
  end
end