class StudentService
  def initialize(house)
    @house = house
  end

  def student_index
    response = conn.get("slytherin?api_key=#{ENV['HOGWARTS_KEY']}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:data][0][:attributes][:students]
  end

  def conn
    Faraday.new(url: 'http://hogwarts-it.herokuapp.com/api/v1/house/') do |f|
      f.adapter Faraday.default_adapter
    end
  end

end
