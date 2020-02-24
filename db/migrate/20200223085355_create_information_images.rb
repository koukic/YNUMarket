class CreateInformationImages < ActiveRecord::Migration[5.2]
  def change
    create_table :information_images do |t|
      t.string :image
      t.references :information, foreign_key: true

      t.timestamps
    end
  end
end
