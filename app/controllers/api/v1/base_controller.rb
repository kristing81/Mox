class Api::V1::BaseController < ApplicationController
  before_create :generate_authentication_token!
  before_action :authenticate_with_token!

  respond_to :json, :xml


  skip_before_action :verify_authenticity_token

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.present?
  end

  def person
    person = Faker::Name.name
  end

  private

  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end
end