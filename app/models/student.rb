class Student < ActiveRecord::Base

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  has_many :program_students
  has_many :programs, through: :program_students
  has_many :comments, as: :commentable
  has_many :tests
  has_many :cbms


end