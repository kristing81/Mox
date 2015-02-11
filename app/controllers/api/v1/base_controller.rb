class Api::V1::BaseController < ApplicationController
  require 'net/http'
  before_action :authenticate_with_token! 
  # before_filter :throttle
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

  # def throttle
  #   client_ip = request.env["REMOTE_ADDR"]
  #   key = "count:#{client_ip}"
  #   count = REDIS.get(key)

  #   unless count
  #     REDIS.set(key, 0)
  #     REDIS.expire(key, THROTTLE_TIME_WINDOW)
  #     return true
  #   end

  #   if count.to_i >= THROTTLE_MAX_REQUESTS
  #     render :status => 429, :json => {:message => "You have fired too many requests. Please wait for some time."}
  #     return
  #   end
  #   REDIS.incr(key)
  #   true
  # end

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
    end
  end
end