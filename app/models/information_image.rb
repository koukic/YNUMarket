class InformationImage < ApplicationRecord
  belongs_to :information
  mount_uploaders :images, ImageUploader
end
