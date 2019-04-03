require 'rails_helper'

describe 'Student' do
  before :each do
    @data = {
      "id": 52,
      "name": "Gormlaith Gaunt",
    }
    @student = Student.new(@data)
  end
  it 'exists' do
    expect(@student).to be_a(Student)
  end

  it 'has attributes' do
    expect(@student.id).to eq(52)
    expect(@student.name).to eq("Gormlaith Gaunt")
  end
end
