class Api::V1::BaseController < ApplicationController
  require 'net/http'
  before_action :authenticate_with_token! 

  respond_to :json, :xml

  around_filter :deduct_balance

  skip_before_action :verify_authenticity_token

  def authenticate_with_token!
    token = params[:auth_token]
    user = User.where(auth_token: token).first

    if user.present?
      sign_in user, store: false
    else
      respond_with({error: "Unauthorized"}, status: :unauthorized)
    end
  end

 
  private

  def deduct_balance
    begin
      @user = current_user
      if @user.balance_in_cents > 0
        @user.balance_in_cents -=1
        @user.save
        response.headers["X-REMAINING-BALANCE"] = @user.balance_in_cents.to_s
        yield
      else
        respond_with({errors: "Balance is empty"}, status: :payment_required)
      end
    ensure
      # raise request.query_parameters.inspect
      TrackApi.create(request_url: request.original_url, user_id: @user.id, query_params: request.query_parameters, result_code: response.status, result_message: response.message)
    end
  end
end