require 'ostruct'

class Operator
  def initialize(args)
    @symbol = args[:symbol]
    @precedence = precedence_map[@symbol]
  end

  def precedent(other)
    return other if precedence < other.precedence
    self
  end

  protected

  attr_reader :precedence

  private

  def precedence_map
    {
      '+' => 1,
      '-' => 1,
      '/' => 2,
      '*' => 2
    }
  end
end
