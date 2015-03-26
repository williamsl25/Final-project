require 'rails_helper'

RSpec.describe Program, type: :model do
  subject do
    Program.new({
      name: "A program",
      focus: "some focus",
      })
  end
# to make a new comment variable
  let(:comment) do
    Comment.new({
      content: "I am a comment", 
      
    })
  end
  it "should have a name" do
    program = Program.new
    program.name = "A program"
    expect(program.name).not_to eq(nil)
  end
# run rspec in terminal to test
# positive test
  it "should have a focus" do
    program = Program.new
    program.focus = "some focus"
    expect(program.focus).to eq("some focus")
  end
  it "should have comments that can be added" do
    subject.comments << comment
    expect(subject.comments.length).to eq(1)
  
  end
end
