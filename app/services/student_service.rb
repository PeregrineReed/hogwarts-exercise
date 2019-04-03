class StudentService
  def initialize(house)
    @house = house
    @house_id = get_id(house)
  end

  def student_index
    json(by_house)
  end

  def get_id(house)
    houses = json(all_houses)
    houses.find do |house|
      house[:name] == @house
    end[:id]
  end

  def all_houses
    conn.get
  end

  def by_house
    conn.get("#{@house_id}")
  end

  def json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://hogwarts-as-a-service.herokuapp.com/api/v1/house/') do |f|
      f.headers['x_api_key'] = ENV['HOGWARTS_KEY']
      f.adapter Faraday.default_adapter
    end
  end

end
