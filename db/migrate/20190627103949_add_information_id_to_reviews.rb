class AddInformationIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :information_id, :integer
  end
end
