class Api::V1::PeopleController < Api::V1::BaseController
   respond_to :json, :xml

   def index
    @fake_people = FakePerson.fake(params[:count])
    respond_with(@fake_people)
   end
  


end
