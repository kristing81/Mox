class CreateTrackApis < ActiveRecord::Migration
  def change
    create_table :track_apis do |t|

      t.timestamps null: false
    end
  end
end
