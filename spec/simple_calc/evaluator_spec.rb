require 'simple_calc/evaluator'

RSpec.describe SimpleCalc::Evaluator do
  let(:evaluator) { SimpleCalc::Evaluator.new }

  describe '#evaluate' do
    describe 'simple expressions' do
      specify { expect(evaluator.evaluate('21 21 +')).to eq '42' }
      specify { expect(evaluator.evaluate('5 3 -')).to eq '2' }
      specify { expect(evaluator.evaluate('9 3 /')).to eq '3' }
      specify { expect(evaluator.evaluate('1 -5 *')).to eq '-5' }
    end

    describe 'complex expressions' do
      specify { expect(evaluator.evaluate('21 21 + 2 / 3 *')).to eq '63' }
      specify { expect(evaluator.evaluate('5 3 - 3 8 * 3 /')).to eq '8' }
    end

    describe 'precision of 3 for floating point numbers' do
      specify { expect(evaluator.evaluate('2 3 /')).to eq '0.667' }
    end
  end
end
