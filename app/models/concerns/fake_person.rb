class FakePerson

  attr_reader :name, :title, :company

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
