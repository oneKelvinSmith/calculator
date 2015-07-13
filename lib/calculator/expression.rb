class Expression
  def initialize(args)
    @text = args[:text] || blank_text
  end

  def valid?
    !valid_text.empty?
  end

  private

  attr_reader :text

  def blank_text
    ''
  end

  def valid_text
    text.gsub(/[a-z]/, blank_text).strip
  end
end
