class FakePerson
  
  def initialize
  @name = Faker::Name.name
  @title = Faker::Name.title
  @company = Faker::Company.name
  end

  def FakePerson.fake(count = 1)
    people = []
    count.times do
      people << new
    end
    people
  end
end
 def initialize
    @name = Faker::Company.name
    @motto = Faker::Company.motto
    @bs = Faker::Company.bs
    @ceo = Faker::Company.ceo
  end