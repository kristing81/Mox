class Api::V1::BaseController < ApplicationController
  before_create :generate_authentication_token!
  before_action :authenticate_with_token!

  respond_to :json, :xml
end