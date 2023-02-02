require './nameable'

# Base Decorater class
class BaseDecorater < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
