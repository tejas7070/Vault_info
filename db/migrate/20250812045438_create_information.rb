class CreateInformation < ActiveRecord::Migration[8.0]
  def change
    create_table :information do |t|
      t.string :title
      t.text :main
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
