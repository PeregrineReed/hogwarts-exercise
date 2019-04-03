class SearchFacade

  attr_reader :house

  def initialize(house)
    @house = house
  end

  def students
    service.student_index.map do |student_data|
      Student.new(student_data)
    end
  end

  def service
    StudentService.new(@house)
  end

end
