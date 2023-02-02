require './base_decorater'

# Capitalize Decorator class
class CapitalizeDecorator < BaseDecorater
  def correct_name
    @nameable.capitalize
  end

  def test
    @nameable
  end
end
