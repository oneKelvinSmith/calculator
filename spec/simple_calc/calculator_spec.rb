require 'simple_calc/calculator'
require 'simple_calc/expression'
require 'simple_calc/errors'

RSpec.describe SimpleCalc::Calculator do
  describe '#new_expression' do
    it 'return a new expression for a given formula' do
      calculator = SimpleCalc::Calculator.new
      expression = double 'expression'

      allow(SimpleCalc::Expression).to receive(:new).and_return(expression)
      allow(expression).to receive(:validate!).and_return true

      new_expression = calculator.new_expression(formula: 'formula')

      expect(new_expression).to be expression
    end

    it 'uses the expression factory provided' do
      calculator = SimpleCalc::Calculator.new
      expression = double 'expression'

      allow(expression).to receive(:validate!).and_return true

      new_expression = calculator.new_expression source: -> (_) { expression }

      expect(new_expression).to be expression
    end

    it 'send the expression source the formula' do
      calculator = SimpleCalc::Calculator.new
      source = spy('source')

      calculator.new_expression formula: 'formula', source: source

      expect(source).to have_received(:call).with(formula: 'formula')
    end

    it 'raises a syntax error when an expression is invalid' do
      calculator = SimpleCalc::Calculator.new
      expression = double 'expression'

      allow(expression).to receive(:validate!).and_raise SimpleCalc::SyntaxError

      expect do
        calculator.new_expression(
          formula: 'invalid',
          source: -> (_) { expression }
        )
      end.to raise_error SimpleCalc::SyntaxError
    end
  end

  describe '#read_expressions' do
    it 'parses an input file into expressions' do
      calculator = SimpleCalc::Calculator.new
      expression = double 'expression'

      allow(calculator).to receive(:new_expression).and_return(expression)

      new_expressions = calculator.read_expressions('spec/data/expressions.txt')

      expect(new_expressions).to eq [expression, expression]
    end

    it 'does not create expressions for an empty file' do
      calculator = SimpleCalc::Calculator.new

      expect(calculator).not_to receive(:new_expression)

      calculator.read_expressions('spec/data/empty_file.txt')
    end
  end

  describe '#calculate' do
    it 'collects the results of expression evaluations' do
      calculator = SimpleCalc::Calculator.new
      expression = double 'expression'
      result = double 'result'

      allow(expression).to receive(:evaluate).and_return result

      expect(calculator.calculate([expression])).to eq [result]
    end
  end
end
