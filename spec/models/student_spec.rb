require 'rails_helper'

RSpec.describe Student, type: :model do
  subject do
    Student.new({
      first_name: "Townes",
      last_name: "VanHuysen",
      grade: "1",
      strengths: "reading skills",
      weaknesses: "math",
      
      })
  end
  # to make a new comment variable
  let(:comment) do
    Comment.new({
      content: "I am a comment",  
    })
  end
  it "should have name, dob, grade, strengths, and weaknesses" do
    student = Student.new({
      first_name: "Townes",
      last_name: "VanHuysen",
      grade: "1",
      strengths: "reading skills",
      weaknesses: "math",
      
    })
    expect(student.first_name).to eq("Townes")
    expect(student.last_name).to eq("VanHuysen")
    expect(student.grade).to eq("1")
    expect(student.strengths).to eq("reading skills")
    expect(student.weaknesses).to eq("math")
    
  end
  it "should have comments that can be added" do
    subject.comments << comment
    expect(subject.comments.length).to eq(1)
  
  end

end

