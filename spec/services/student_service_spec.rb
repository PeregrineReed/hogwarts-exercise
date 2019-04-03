require 'rails_helper'

describe 'StudentService' do
  before :each do
    @house = 'Slytherin'
    @student_service = StudentService.new(@house)
  end
  it 'exists' do
    expect(@student_service).to be_a(StudentService)
  end

  describe 'instance methods' do
    it '#conn' do
      expect(@student_service.conn).to be_a(Faraday::Connection)
      expect(@student_service.conn.build_url.hostname)
        .to eq('hogwarts-as-a-service.herokuapp.com')
      expect(@student_service.conn.build_url.path)
        .to eq('/api/v1/house/')
    end

    it '#student_index' do
      expect(@student_service.student_index).to be_a(Array)
      expect(@student_service.student_index[0][:name]).to eq("Gormlaith Gaunt")
    end

    it '#get_id' do
      expect(@student_service.get_id(@house)).to eq(4)
    end
  end
end
