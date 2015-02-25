class TrackApi < ActiveRecord::Migration
  def change
    add_column :track_apis, :request_url, :string
    add_column :track_apis, :user_id, :integer
    add_column :track_apis, :auth_token, :integer
    add_index :track_apis, :user_id
    add_index :track_apis, :auth_token
  end
end
