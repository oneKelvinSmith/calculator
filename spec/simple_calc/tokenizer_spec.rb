require 'simple_calc/tokenizer'

RSpec.describe SimpleCalc::Tokenizer do
  describe '#tokenize' do
    it 'splits an expression into individual tokens' do
      tokenizer = SimpleCalc::Tokenizer.new

      expect(tokenizer.tokenize '1 + 42 - ( 3 * 2 ) / 3')
        .to eq ['1', '+', '42', '-', '(', '3', '*', '2', ')', '/', '3']
    end

    it 'ignores whitespace when splitting tokens' do
      tokenizer = SimpleCalc::Tokenizer.new

      expect(tokenizer.tokenize '+42 - (3 * 2 )')
        .to eq ['+', '42', '-', '(', '3', '*', '2', ')']
    end
  end

  describe '#formulate' do
    it 'turns an array of tokens into a formula' do
      tokenizer = SimpleCalc::Tokenizer.new

      expect(tokenizer.formulate ['8', '5', '-']).to eq '8 5 -'
    end
  end
end
