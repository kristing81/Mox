class TrackApi < ActiveRecord::Base
  serialize :query_params, Hash 
  belongs_to :user
  scope :newest_first, lambda { order("track_apis.created_at DESC") }
end
