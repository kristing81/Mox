class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def generate_authentication_token!
    self.auth_token = SecureRandom.hex(21)
  end

  def person
    Faker::Name.name
  end

end
