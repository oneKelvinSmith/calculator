require 'simple_calc/parser'

RSpec.describe SimpleCalc::Parser do
  let(:parser) { SimpleCalc::Parser.new }

  describe '#parse' do
    it 'parses an infix expression into a postfix expression' do
      expect(parser.parse('1 + 1')).to eq '1 1 +'
      expect(parser.parse('22 - 13')).to eq '22 13 -'
      expect(parser.parse('7 / 3')).to eq '7 3 /'
      expect(parser.parse('9 * -1')).to eq '9 * 1 -'
    end

    it 'parses an epxression with operator precedence respected' do
      expect(parser.parse('2 - 3 * 4 + 7')).to eq '2 3 4 * 7 + -'
      expect(parser.parse('7 - 6 + 4')).to eq '7 6 4 + -'
      expect(parser.parse('3 - 2 / 2 * 1')).to eq '3 2 2 1 * / -'
      expect(parser.parse('2 / 2 * 1 - 3')).to eq '2 2 1 * 3 - /'
    end
  end

  describe '#tokenize' do
    it 'split an expression into individual tokens' do
      formula = '1 + 42 - ( 3 * 2 ) / 3'
      tokens = ['1', '+', '42', '-', '(', '3', '*', '2', ')', '/', '3']
      expect(parser.tokenize(formula)).to eq tokens
    end

    it 'ignores whitespace when splitting into tokens' do
      formula = '+42 - (3 * 2 )'
      tokens = ['+', '42', '-', '(', '3', '*', '2', ')']
      expect(parser.tokenize(formula)).to eq tokens
    end
  end

  describe '#formulate' do
    it 'turns an array of tokens into a formula' do
      tokens = ['8', '5', '-']
      formula = '8 5 -'
      expect(parser.formulate(tokens)).to eq formula
    end
  end
end
