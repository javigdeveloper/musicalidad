class Student < ApplicationRecord
  has_one_attached :pic
  has_many :student_subjects
  has_many :subjects, through: :student_subjects
end