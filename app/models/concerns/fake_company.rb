class FakeCompany

  attr_reader :name, :motto, :bs, :ceo
  def initialize
    @name = Faker::Company.name
    @motto = Faker::Company.catch_phrase
    @bs = Faker::Company.bs
    @ceo = Faker::Company.ceo
  end


  def FakeCompany.fake(count = 1)
    companies = []
    count.times do
      companies << new
    end
    companies
    end
  end
end