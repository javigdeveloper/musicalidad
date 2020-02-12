class Student < ApplicationRecord
  has_one_attached :pic
  belongs_to :subject
end