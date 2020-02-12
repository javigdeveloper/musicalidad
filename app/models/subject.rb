class Subject < ApplicationRecord
  has_many :student_subjects
  belongs_to :teacher
  has_many :students, through: :student_subjects
end
