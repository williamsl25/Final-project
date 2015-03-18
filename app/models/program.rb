class Program < ActiveRecord::Base
  # validates :name, presence: true
  has_many :program_students
  has_many :students, through: :program_students
  has_many :program_teachers
  has_many :teachers, through: :program_teachers
  has_many :comments, as: :commentable
  belongs_to :user

  FOCUS_OPTIONS= [
    ["Phonemic Awareness", "Phonemic Awareness"],
    ["Alphabetic Principle", "Alphabetic Principle"],
    ["Fluency", "Fluency"],
    ["Vocabulary", "Vocabulary"],
    ["Comprehension", "Comprehension"],
    
  ]

end

