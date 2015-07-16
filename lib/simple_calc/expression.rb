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
      @value ||= evaluate_formula(parse(formula))
      value
    end

    private

    attr_reader :formula, :parser, :evaluator, :value

    def parse(formula)
      parser.parse formula
    end

    def evaluate_formula(parsed_formula)
      evaluator.evaluate parsed_formula
    end

    def valid_characters
      '\d\+\/\-\*\(\)\s'
    end

    def empty
      ''
    end
  end
end
