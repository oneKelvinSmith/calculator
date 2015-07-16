require 'simple_calc/tokenizer'

RSpec.describe SimpleCalc::Tokenizer do
  let(:tokenizer) { SimpleCalc::Tokenizer.new }

  describe '#tokenize' do
    it 'splits an expression into individual tokens' do
      formula = '1 + 42 - ( 3 * 2 ) / 3'
      tokens = ['1', '+', '42', '-', '(', '3', '*', '2', ')', '/', '3']
      expect(tokenizer.tokenize(formula)).to eq tokens
    end

    it 'ignores whitespace when splitting tokens' do
      formula = '+42 - (3 * 2 )'
      tokens = ['+', '42', '-', '(', '3', '*', '2', ')']
      expect(tokenizer.tokenize(formula)).to eq tokens
    end
  end

  describe '#formulate' do
    it 'turns an array of tokens into a formula' do
      tokens = ['8', '5', '-']
      formula = '8 5 -'
      expect(tokenizer.formulate(tokens)).to eq formula
    end
  end
end
