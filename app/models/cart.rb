class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  
  def add_information(information)
     current_item = line_items.find_by(information_id: information.id)
     if current_item
       current_item.increment(:quantity)
     else
       current_item = line_items.build(information_id: information.id)
     end
     current_item
  end
end
