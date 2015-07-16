module SimpleCalc
  class Expression
    def initialize(args = {})
      @formula   = args[:formula] || empty
      @parser    = args[:parser] || Parser.new
      @evaluator = args[:evaluator] || Evaluator.new
    end

    def valid?
      !(formula.gsub(/[^#{valid_characters}]/, empty).strip).empty?
    end

    def validate!
      if valid?
        true
      else
        fail SyntaxError
      end
    end

    def evaluate
      parsed_formula = parser.parse formula
      evaluator.evaluate(parsed_formula)
    end

    private

    attr_reader :formula, :parser, :evaluator

    def valid_characters
      '\d\+\/\-\*\(\)\s'
    end

    def empty
      ''
    end
  end
end
