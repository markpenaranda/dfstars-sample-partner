class AddCreditsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :credits, :float
  end
end
