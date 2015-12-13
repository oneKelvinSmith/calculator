# coding: utf-8

require 'simple_calc/expression'
require 'simple_calc/errors'

RSpec.describe SimpleCalc::Expression do
  describe '#valid?' do
    let(:expression) { SimpleCalc::Expression.new formula: formula }

    describe 'invalid expressions' do
      describe 'nothing' do
        let(:formula) { nil }
        specify { expect(expression).not_to be_valid }
      end

      describe 'an empty string' do
        let(:formula) { '' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'a blank string' do
        let(:formula) { ' ' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'alphabetical characters' do
        let(:formula) { 'the quick brown fox jumps over the lazy dog' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'uppercase alphabetical characters' do
        let(:formula) { 'THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'random characters' do
        let(:formula) { '!@#$%^&{}":;|\~`"?><.,[]±§' }
        specify { expect(expression).not_to be_valid }
      end
    end

    describe 'valid expressions' do
      describe 'a number' do
        let(:formula) { '42' }
        specify { expect(expression).to be_valid }
      end

      describe 'a number wrapped in parenthesis' do
        let(:formula) { '(13)' }
        specify { expect(expression).to be_valid }
      end

      describe 'a sum' do
        let(:formula) { '5 + 2' }
        specify { expect(expression).to be_valid }
      end

      describe 'a substraction' do
        let(:formula) { '7 - 7' }
        specify { expect(expression).to be_valid }
      end

      describe 'a multiplication' do
        let(:formula) { '7 * 7' }
        specify { expect(expression).to be_valid }
      end

      describe 'a division' do
        let(:formula) { '7 / 7' }
        specify { expect(expression).to be_valid }
      end

      describe 'a complex formula' do
        let(:formula) { '(5+2) +1+7*7-(3+4)' }
        specify { expect(expression).to be_valid }
      end
    end
  end

  describe '#validate!' do
    it 'raises a syntax error if expression is not valid' do
      expression = SimpleCalc::Expression.new formula: 'formula'

      allow(expression).to receive(:valid?).and_return false

      expect { expression.validate! }.to raise_error SimpleCalc::SyntaxError
    end

    it 'returns true for valid expression' do
      expression = SimpleCalc::Expression.new formula: 'formula'

      allow(expression).to receive(:valid?).and_return true

      expect(expression.validate!).to be true
    end
  end

  describe '#evaluate' do
    it 'parses the given formula' do
      parser = spy 'parser'
      params = {
        formula: 'formula',
        evaluator: spy,
        parser: parser
      }
      expression = SimpleCalc::Expression.new params

      expression.evaluate

      expect(parser).to have_received(:parse).with 'formula'
    end

    it 'evaluates the parsed formula' do
      parser = spy 'parser'
      evaluator = spy 'evaluator'
      params = {
        formula: 'formula',
        evaluator: evaluator,
        parser: parser
      }
      expression = SimpleCalc::Expression.new params

      allow(parser).to receive(:parse).and_return 'parsed'

      expression.evaluate

      expect(evaluator).to have_received(:evaluate).with 'parsed'
    end

    it 'returns the result of the evaluation' do
      parser = spy 'parser'
      evaluator = spy 'evaluator'
      params = {
        formula: 'formula',
        evaluator: evaluator,
        parser: parser
      }
      expression = SimpleCalc::Expression.new params

      allow(parser).to receive(:parse).and_return 'parsed'
      allow(evaluator).to receive(:evaluate).and_return 'result'

      expect(expression.evaluate).to eq 'result'
    end

    it 'memoizes the result' do
      parser = spy 'parser'
      evaluator = spy 'evaluator'
      params = {
        formula: 'formula',
        evaluator: evaluator,
        parser: parser
      }
      expression = SimpleCalc::Expression.new params

      2.times { expression.evaluate }

      expect(parser).to have_received(:parse).once
      expect(evaluator).to have_received(:evaluate).once
    end
  end
end
