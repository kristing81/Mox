class Api::V1::BaseController < ApplicationController
 
  before_action :authenticate_with_token!
  
  before_filter :throttle

  respond_to :json, :xml


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

  def throttle
    client_ip = request.env["REMOTE_ADDR"]
    key = "count:#{client_ip}"
    count = REDIS.get(key)

    unless count
      REDIS.set(key, 0)
      REDIS.expire(key, THROTTLE_TIME_WINDOW)
      return true
    end

    if count.to_i >= THROTTLE_MAX_REQUESTS
      render :status => 429, :json => {:message => "You have fired too many requests. Please wait for some time."}
      return
    end
    REDIS.incr(key)
    true
  end

end