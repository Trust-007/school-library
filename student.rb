require './person'

class Student < Person
  def initialize(id, age, classroom, name = 'unknown', parent_permission: true)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯(ツ)/¯'
  end
end
