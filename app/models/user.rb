class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_authentication_token!
  has_many :activities
  has_many :track_apis
  
  def generate_authentication_token!
    self.auth_token = SecureRandom.hex(21)
  end

  def balance
    read_attribute(:balance_in_cents) / 100.0
  end

  def credit_balance(amount_in_dollars)
    write_attribute(:balance_in_cents, read_attribute(:balance_in_cents) + (amount_in_dollars * 100))
  end

  def recent_activities(limit)
    activities.order('created_at DESC').limit(limit)
  end

end

