require 'rails_helper'

describe 'SearchFacade' do
  before :each do
    @house = 'Slytherin'
    @search_facade = SearchFacade.new(@house)
  end

  it 'exists' do
    expect(@search_facade).to be_a(SearchFacade)
  end

  describe 'instance methods' do
    it '#house' do
      expect(@search_facade.house).to eq('Slytherin')
    end

    it 'students' do
      students = @search_facade.students.all? do |student|
        student.class == Student
      end

      expect(students).to eq(true)
    end

    it 'service' do
      expect(@search_facade.service).to be_a(StudentService)
    end

  end
end
