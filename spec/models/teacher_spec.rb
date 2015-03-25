require 'rails_helper'

RSpec.describe Teacher, type: :model do
  subject do
    Teacher.new({
      prefix: "Mrs",
      name: "Jane Smith",
      grade: "3",

      })
  end

  it "should have a name" do
    teacher = Teacher.new
    teacher.name = "Jane Smith"
    expect(teacher.name).to eq("Jane Smith")
  end
  # .to eq only expects the variable to be equal
# to run spec files in terminal = use the command:
  # rspec

  it "should have a name" do
    teacher = Teacher.new
    teacher.name = "Jane Smith"
    expect(teacher.name).not_to eq(nil)
  end

  # run rspec spec/models/teacher_spec.rb in terminal to test
# positive test
  it "should have a grade" do
    teacher = Teacher.new
    teacher.grade = "testing grade"
    expect(teacher.grade).to eq("testing grade")
  end
# negative test
  it "should have grade" do
    teacher = Teacher.new
    teacher.grade = "testing grade"
    expect(teacher.grade).not_to eq(nil)
  end
  it "should have name, grade, and prefix" do
    teacher = Teacher.new({
      name: "Jane Smith",
      grade: "3",
      prefix: "Mrs",
    })
    expect(teacher.name).to eq("Jane Smith")
    expect(teacher.grade).to eq("3")
    expect(teacher.prefix).to eq("Mrs")
  end

end
