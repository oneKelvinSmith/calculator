module SimpleCalc
  class Parser
    def parse(formula)
      tokens = []
      operators = []
      tokenize(formula).each do |token|
        shunt(token, operators, tokens)
      end
      tokens << operators.pop until operators.empty?
      formulate(tokens)
    end

    def tokenize(formula)
      formula.gsub(allowed_tokens).map(&:to_s)
    end

    def formulate(tokens)
      tokens.join(' ')
    end

    private

    def shunt(token, operators, tokens)
      case token
      when '-', '/', '*', '+'
        shunt_operators(token, operators, tokens)
      when '('
        shunt_left_paren(token, operators)
      when ')'
        shunt_right_paren(operators, tokens)
      else
        shunt_number(token, tokens)
      end
    end

    def shunt_operators(token, operators, tokens)
      previous = operators.last
      tokens << operators.pop if precedent?(token, previous)
      operators << token
    end

    def shunt_right_paren(operators, tokens)
      tokens << operators.pop until operators.last == '('
      operators.pop
    end

    def shunt_left_paren(token, operators)
      operators << token
    end

    def shunt_number(token, tokens)
      tokens << token
    end

    def precedent?(token, previous)
      !previous.nil? && precedence[token] < precedence[previous]
    end

    def allowed_tokens
      %r{^\s|\d+|\*|\+|-|\(|\)|/}
    end

    def precedence
      {
       '+' => 0,
       '-' => 0,
       '/' => 1,
       '*' => 1
      }
    end
  end
end
