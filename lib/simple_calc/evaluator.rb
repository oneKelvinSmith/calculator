module SimpleCalc
  class Evaluator
    def evaluate(formula)
      tokens = formula.split
      evaluation = []

      tokens.each do |token|
        shunt(token, evaluation)
      end
      normalize(evaluation.pop)
    end

    private

    def shunt(token, evaluation)
      case token
      when /\d/
        evaluation.push(token.to_f)
      when '-', '/', '*', '+'
        first, second = evaluation.pop(2)
        evaluation.push(first.send(token, second))
      end
    end

    def normalize(number)
      if number % 1 == 0
        Integer(number)
      else
        number.round(3)
      end.to_s
    end
  end
end
