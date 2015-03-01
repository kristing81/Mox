class Add < ActiveRecord::Migration
  def change
    add_column :track_apis, :query_params, :text
  end
end
