class LineItem < ApplicationRecord
  belongs_to :information
  belongs_to :cart
end
