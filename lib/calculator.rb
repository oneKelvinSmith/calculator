require 'calculator/version'
require 'calculator/expression'
require 'awesome_print'

module Calculator
  def self.run(file, options = {})
    evaluator = options[:evaluator]
    expressions = read_expressions(file)
    evaluator.evaluate(expressions)
  rescue Errno::ENOENT
    'Please make sure that the correct filename is provided'
  end

  def self.read_expressions(file)
    File.readlines(file).map do |line|
      create_expression(formula: line)
    end
  end

  def self.new_expression(args)
    new_expression = args[:factory] || Expression.public_method(:new)
    formula = args[:formula]
    new_expression.call(formula: formula)
  end
end
