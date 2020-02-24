class InformationImage < ApplicationRecord
  belongs_to :information
  mount_uploaders :image, ImageUploader
end
