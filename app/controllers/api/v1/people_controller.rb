class Api::V1::PeopleController < Api::V1::BaseController
   respond_to :json, :xml

   def create_person
    respond_with Faker::Name.name
   end
  


end
