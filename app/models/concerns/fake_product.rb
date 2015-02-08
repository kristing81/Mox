class FakeProduct

  attr_reader :name, :price, :department

  def initialize
    @name = Faker::Commerce.product_name
    @title = Faker::Commerce.price
    @company = Faker::Commerce.department
  end

  
  def FakeProduct.fake(count = 1)
    products = []
    count.times do
      products << FakeProduct.new
    end
      products
  end
end

