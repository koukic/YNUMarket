class InformationImage < ApplicationRecord
  belongs_to :information
  mount_uploader :image, ImageUploader
end
