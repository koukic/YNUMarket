class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :condition
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
