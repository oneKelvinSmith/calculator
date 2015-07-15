require 'simple_calc/calculator'

module SimpleCalc
  def self.run(file, options = {})
    calculator = options[:calculator] || SimpleCalc::Calculator.new
    expressions = calculator.read_expressions(file)
    calculator.evaluate(expressions)
  rescue Errno::ENOENT
    'Please make sure that the correct filename is provided'
  end
end
