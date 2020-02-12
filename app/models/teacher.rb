class Teacher < User
  has_one_attached :pic
  has_many :subjects
end