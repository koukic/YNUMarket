class Information < ApplicationRecord
  acts_as_taggable
  paginates_per 10
  before_destroy :not_referenced_by_any_line_item
  has_many :information_images, dependent: :destroy
  accepts_nested_attributes_for :information_images
  # mount_uploaders :image, ImageUploader
  # serialize :image, JSON
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true
  has_many :reviews,dependent: :destroy
  validates :title, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum
  allowed."}
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum
  allowed."}
  CONDITION = [
            {
              "category": "フリマ",
              "order": 0,
              "items": [
                {
                  "key": "k",
                  "name": "教科書",
                  "order": 0
                },
                {
                  "key": "m",
                  "name": "漫画",
                  "order": 1
                }
              ]
            },
            {
              "category": "サークル",
              "order": 1,
              "items": [
                {
                  "key": "b",
                  "name": "バスケ",
                  "order": 0
                },
                {
                  "key": "s",
                  "name": "サッカー",
                  "order": 1
                }
              ]
            }
          ]


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
