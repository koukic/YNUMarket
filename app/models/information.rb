class Information < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  mount_uploaders :image, ImageUploader
  serialize :image, JSON
  has_many :line_items
  belongs_to :user, optional: true
  has_many :reviews,dependent: :destroy
  validates :title, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum
  allowed."}
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum
  allowed."}
  CONDITION = %w{ New Fair Poor }
  
  
  
  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("title LIKE ? OR description LIKE ?",
          "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
  
   

  
  private
  
  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
