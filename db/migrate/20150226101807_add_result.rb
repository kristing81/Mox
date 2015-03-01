class AddResult < ActiveRecord::Migration
  def change
  add_column :track_apis, :result_code, :integer
  add_column :track_apis, :result_message, :string
  end
end
