require 'simple_calc/parser'

RSpec.describe SimpleCalc::Parser do
  let(:parser) { SimpleCalc::Parser.new }

  describe '#parse' do
    describe 'simple expressions' do
      specify { expect(parser.parse('1 + 1')).to eq '1 1 +' }
      specify { expect(parser.parse('22 - 13')).to eq '22 13 -' }
      specify { expect(parser.parse('7 / 3')).to eq '7 3 /' }
      specify { expect(parser.parse('9 * -1')).to eq '9 * 1 -' }
    end

    describe 'complex expressions with operator precedence' do
      specify { expect(parser.parse('2 - 3 * 4 + 7')).to eq '2 3 4 * 7 + -' }
      specify { expect(parser.parse('7 - 6 + 4')).to eq '7 6 4 + -' }
      specify { expect(parser.parse('3 - 2 / 2 * 1')).to eq '3 2 2 1 * / -' }
      specify { expect(parser.parse('2 / 2 * 1 - 3')).to eq '2 2 1 * 3 - /' }
    end

    specify 'given examples' do
      examples = [['7+7/7+7*7-7',        '7 7 7 / 7 7 * 7 - + +'],
                  ['(5+2) +1+7*7-(3+4)', '5 2 + 1 7 7 * 3 4 + - + +']]
      examples.each do |infix, postfix|
        expect(parser.parse(infix)).to eq postfix
      end
    end
  end
end
