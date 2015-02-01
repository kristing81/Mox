class FakePerson
  
  def initialize
    p "Find out your person's name, title, and the company they work at"
  end

  
  def name
    Faker::Name.name
  end

  def title
    Faker::Name.title
  end

  def works_at
    Faker::Company.name
  end
end