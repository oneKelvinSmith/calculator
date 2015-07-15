module SimpleCalc
  class Expression
    def initialize(args = {})
      @formula = args[:formula] || empty
    end

    def valid?
      !(formula.gsub(/[^#{valid_characters}]/, empty).strip).empty?
    end

    private

    attr_reader :formula

    def valid_characters
      '\d\+\/\-\*\(\)\s'
    end

    def empty
      ''
    end
  end
end
