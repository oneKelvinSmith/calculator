module SimpleCalc
  class Evaluator
    # def evaluate(function)
    #   tokens = function.split
    #   evaluation = []

    #   tokens.each do |token|
    #     shunt(token)
    #   end
    #   evaluation.pop
    # end

    # private

    # def shunt(token)
    #   case token
    #   when /\d/
    #     evaluation.push(token.to_f)
    #   when '-', '/', '*', '+'
    #     first, second = evaluation.pop(2)
    #     evaluation.push(first.send(token, second))
    #   end
    # end
  end
end
