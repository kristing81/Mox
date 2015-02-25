class ActivitiesController < ApplicationController
  
  def index
    @activities = current_user.track_apis.all
  end


end
