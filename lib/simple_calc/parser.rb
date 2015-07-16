require 'simple_calc/tokenizer'

module SimpleCalc
  class Parser
    def initialize(args = {})
      @tokenizer = args[:tokenizer] || Tokenizer.new
      @tokens = []
      @operators = []
    end

    def parse(formula)
      reset
      tokenize(formula).each do |token|
        shunt(token)
      end
      tokens << operators.pop until operators.empty?
      formulate(tokens)
    end

    private

    attr_accessor :tokens, :operators, :tokenizer

    def reset
      @tokens = []
      @operators = []
    end

    def tokenize(formula)
      tokenizer.tokenize(formula)
    end

    def formulate(tokens)
      tokenizer.formulate(tokens)
    end

    def shunt(token)
      case token
      when '-', '/', '*', '+'
        shunt_operators(token)
      when '('
        shunt_left_paren(token)
      when ')'
        shunt_right_paren
      else
        shunt_number(token)
      end
    end

    def shunt_operators(token)
      previous = operators.last
      tokens << operators.pop if precedent?(token, previous)
      operators << token
    end

    def shunt_right_paren
      tokens << operators.pop until operators.last == '('
      operators.pop
    end

    def shunt_left_paren(token)
      operators << token
    end

    def shunt_number(token)
      tokens << token
    end

    def precedence
      {
       '+' => 0,
       '-' => 0,
       '/' => 1,
       '*' => 1
      }
    end

    def precedent?(token, previous)
      precedence.key?(previous) &&
        precedence[token] < precedence[previous]
    end
  end
end
