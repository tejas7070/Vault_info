class AddkeyToinformation < ActiveRecord::Migration[8.0]
  def change
    add_column :information, :key, :string
  end
end
