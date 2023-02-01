require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, classroom, name = 'unknown', parent_permission: true)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
