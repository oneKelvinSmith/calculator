module SimpleCalc
  class Evaluator
    def evaluate(formula)
      tokens = formula.split
      evaluation = []

      tokens.each do |token|
        shunt(token, evaluation)
      end
      Integer(evaluation.pop).to_s
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
  end
end
