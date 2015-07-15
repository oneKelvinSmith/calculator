require 'simple_calc/operator'

RSpec.describe SimpleCalc::Operator do
  describe 'precedence' do
    let(:creator) { SimpleCalc::Operator.public_method(:new) }

    let(:sum) { creator.call(symbol: '+') }
    let(:sub) { creator.call(symbol: '-') }
    let(:div) { creator.call(symbol: '/') }
    let(:mul) { creator.call(symbol: '*') }

    it 'should know which option has precedence' do
      expect(sum.precedent(sub)).to be sum
      expect(sum.precedent(mul)).to be mul
      expect(sum.precedent(div)).to be div

      expect(sub.precedent(sum)).to be sub
      expect(sub.precedent(mul)).to be mul
      expect(sub.precedent(div)).to be div

      expect(mul.precedent(sub)).to be mul
      expect(mul.precedent(sum)).to be mul
      expect(mul.precedent(div)).to be mul

      expect(div.precedent(sub)).to be div
      expect(div.precedent(sum)).to be div
      expect(div.precedent(mul)).to be div
    end
  end
end
