class ApplicationController < ActionController::Base
  protect_from_forgery with: :reset_session

  before_filter :throttle

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
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
