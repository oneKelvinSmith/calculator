require 'simple_calc/calculator'
require 'simple_calc/expression'

RSpec.describe SimpleCalc::Calculator do
  let(:expression) { double('expression') }
  let(:calculator) { SimpleCalc::Calculator.new }

  describe '#new_expression' do
    it 'return a new expression for a given formula' do
      allow(SimpleCalc::Expression).to receive(:new).and_return(expression)

      expect(calculator.new_expression(formula: 'formula')).to be expression
    end

    it 'uses the expression factory provided' do
      new_expression = calculator.new_expression(source: -> (_) { expression })
      expect(new_expression).to be expression
    end

    it 'send the expression source the formula' do
      source = spy('source')
      calculator.new_expression(formula: 'formula', source: source)
      expect(source).to have_received(:call).with(formula: 'formula')
    end
  end

  describe '#read_expressions' do
    it 'parses an input file into expressions' do
      expressions = [expression, expression]

      allow(calculator).to receive(:new_expression).and_return(expression)

      new_expressions = calculator.read_expressions('spec/data/expressions.txt')

      expect(new_expressions).to eq expressions
    end
  end
end
