class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.integer :price
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
