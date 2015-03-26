require 'rails_helper'

RSpec.describe Cbm, type: :model do
  subject do
    Cbm.new({
      
      score: '45',
      description: "Average",
      student_id: "1",
      })
  end
  it "should have score, description, date taken, and student id" do
    cbm = Cbm.new({
      
      score: '45',
      description: "Average",
      student_id: "1",
    })
    
    expect(cbm.score).to eq(45)
    expect(cbm.description).to eq("Average")
    expect(cbm.student_id).to eq(1)
  end
end
