require './name_able'
require './decorators'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, age, name = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? == true || @parent_permission == true
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end



person = Person.new(01, 22, 'maximilianus')
person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name