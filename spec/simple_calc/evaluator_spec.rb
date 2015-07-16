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
      specify { expect(evaluator.evaluate('21 21 +')).to eq '42' }
      specify { expect(evaluator.evaluate('5 3 -')).to eq '2' }
    end
  end
end
