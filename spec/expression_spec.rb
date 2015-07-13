require 'spec_helper'

RSpec.describe Expression do
  describe '#valid?' do
    let(:expression) { Expression.new(text: text) }

    describe 'invalid expressions' do
      describe 'nothing' do
        let(:text) { nil }
        specify { expect(expression).not_to be_valid }
      end

      describe 'an empty string' do
        let(:text) { '' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'a blank string' do
        let(:text) { ' ' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'alphabetical characters' do
        let(:text) { 'the quick brown fox jumps over the lazy dog' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'missing parenthesis' do
        let(:text) { '(()' }
        xspecify { expect(expression).not_to be_valid }
      end
    end

    describe 'valid expressions' do
      describe 'a sum' do
        let(:text) { '5+2' }
        specify { expect(expression).to be_valid }
      end
      describe 'a substraction' do
        let(:text) { '7-7' }
        specify { expect(expression).to be_valid }
      end
      describe 'a multiplication' do
        let(:text) { '7*7' }
        specify { expect(expression).to be_valid }
      end
      describe 'a division' do
        let(:text) { '7/7' }
        specify { expect(expression).to be_valid }
      end
    end
  end
end
