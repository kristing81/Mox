class FakeCompany

  def initialize
    p "Find out your company's name, motto, bs and ceo"
  end
  
  def name
    Faker::Company.name
  end

  def motto
    Faker::Company.catch_phrase
  end

  def bs
    Faker::Company.bs
  end

  def ceo
    Faker::Name.name
  end
end