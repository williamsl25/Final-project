class Teacher < ActiveRecord::Base
  has_many :program_teachers
  has_many :programs, through: :program_teachers
  has_many :students
end
