require 'simple_calc/calculator'
require 'simple_calc/errors'

module SimpleCalc
  def self.run(file, options = {})
    calculator = options[:calculator] || SimpleCalc::Calculator.new
    expressions = calculator.read_expressions(file)
    calculator.evaluate(expressions)
  rescue Errno::ENOENT
    'Please ensure that the correct filename is provided'
  rescue SimpleCalc::SyntaxError
    'Please ensure that file contains valid expression '\
      'e.g. (5 + 2) + 1 + 7 * 7 - (3 + 4)'
  end
end
