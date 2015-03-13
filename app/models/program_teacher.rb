class ProgramTeacher < ActiveRecord::Base
  belongs_to :program
  belongs_to :teacher
end
