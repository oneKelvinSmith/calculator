require 'spec_helper'
require 'calculator/operator'

RSpec.describe Operator do
  describe 'precedence' do
    let(:sum) { Operator.new(symbol: '+') }
    let(:sub) { Operator.new(symbol: '-') }
    let(:div) { Operator.new(symbol: '/') }
    let(:mul) { Operator.new(symbol: '*') }

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
