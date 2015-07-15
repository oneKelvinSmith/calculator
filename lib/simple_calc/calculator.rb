require 'simple_calc/expression'

module SimpleCalc
  class Calculator
    def read_expressions(file)
      File.readlines(file).map do |line|
        new_expression(formula: line.strip)
      end
    end

    def new_expression(args)
      source = args[:source] || SimpleCalc::Expression.public_method(:new)
      formula = args[:formula]
      source.call(formula: formula)
    end
  end
end
