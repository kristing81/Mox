class Api::V1::CompaniesController < Api::V1::BaseController
   respond_to :json, :xml

    def index
      @fake_company = FakeCompany.fake(params[:count].to_i)
      respond_with(@fake_company)
      track_activity @fake_company
   end

end

