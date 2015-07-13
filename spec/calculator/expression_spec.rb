require 'spec_helper'
require_relative '../lib/calculator/expression.rb'

RSpec.describe Expression do
  describe 'expression validity' do
    let(:expression) { Expression.new(raw_text) }

    it 'is not valid when it is an empty' do
      let(:raw_text) { ' ' }
      expext(expression).not_to be_valid
    end
  end
end
