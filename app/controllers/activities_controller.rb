class ActivitiesController < ApplicationController
  
  def index
    @activities = current_user.track_apis.newest_first.all
  end


end
