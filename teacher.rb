require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_h
    {
      id: @id,
      age: @age,
      name: @name,
      specialization: @specialization,
      rentals: @rentals
    }
  end
end
