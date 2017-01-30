class AddDfsIdToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :dfs_id, :string
  end
end
