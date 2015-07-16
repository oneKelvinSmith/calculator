module SimpleCalc
  class Tokenizer
    def tokenize(formula)
      allowed_tokens = %r{^\s|\d+|\*|\+|-|\(|\)|/}
      formula.gsub(allowed_tokens).map(&:to_s)
    end

    def formulate(tokens)
      tokens.join(' ')
    end
  end
end
