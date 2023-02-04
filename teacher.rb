require_relative './person'

# Teacher class
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true, role: 'Teacher')
    super(age, name, parent_permission: parent_permission, role: role)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
