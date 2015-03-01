class TrackApi < ActiveRecord::Base
  serialize :query_params, Hash 
  belongs_to :user
end
