class Activity < ActiveRecord::Base
  attr_reader :activity
  
  belongs_to :user
  belongs_to :trackable, polymorphic: true

end
