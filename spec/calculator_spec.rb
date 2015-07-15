require 'spec_helper'

RSpec.describe Calculator do
  it 'has a version number' do
    expect(Calculator::VERSION).to eq '0.1.0'
  end

  let(:expression) { double('expression') }

  describe '.new_expression' do

    it 'return a new expression for a given formula' do
      allow(Expression).to receive(:new).and_return(expression)

      new_expression = Calculator.new_expression(formula: '3 - 2')

      expect(new_expression).to be expression
    end
    it 'uses the expression factory provided' do
      new_expression = Calculator.new_expression formula: 'irrelvant',
                                                 factory: -> (_) { expression }
      expect(new_expression).to be expression
    end
  end

  describe '.read_expressions' do
    it 'parses an input file into expressions' do
      expressions = [expression, expression]

      allow(Calculator).to receive(:create_expression).and_return(expression)

      new_expressions = Calculator.read_expressions('spec/data/expressions.txt')

      expect(new_expressions).to eq expressions
    end
  end

  describe '.run' do
    let(:evaluator) { spy('evaluator') }

    it 'evaluates expressions using given evaluator' do
      expressions = [expression, expression]

      allow(Calculator).to receive(:read_expressions).and_return(expressions)

      Calculator.run('some_file.txt', evaluator: evaluator)

      expect(evaluator).to have_received(:evaluate).with(expressions)
    end

    it 'fails gracefully when no file is found' do
      expect { Calculator.run('non_existent_file') }.not_to raise_error
    end
  end
end
