class ActivitiesController < ApplicationController
  
  def index
    @activities = Activity.order("created_at desc").limit(20)
  end


end
