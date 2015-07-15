# coding: utf-8

require 'spec_helper'

RSpec.describe Expression do
  describe '#valid?' do
    let(:expression) { Expression.new(formula: formula) }

    describe 'invalid expressions' do
      describe 'nothing' do
        let(:formula) { nil }
        specify { expect(expression).not_to be_valid }
      end

      describe 'an empty string' do
        let(:formula) { '' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'a blank string' do
        let(:formula) { ' ' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'alphabetical characters' do
        let(:formula) { 'the quick brown fox jumps over the lazy dog' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'uppercase alphabetical characters' do
        let(:formula) { 'THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG' }
        specify { expect(expression).not_to be_valid }
      end

      describe 'random characters' do
        let(:formula) { '!@#$%^&{}":;|\~`"?><.,[]±§' }
        specify { expect(expression).not_to be_valid }
      end
    end

    describe 'valid expressions' do
      describe 'a number' do
        let(:formula) { '42' }
        specify { expect(expression).to be_valid }
      end

      describe 'a number wrapped in parenthesis' do
        let(:formula) { '(13)' }
        specify { expect(expression).to be_valid }
      end

      describe 'a sum' do
        let(:formula) { '5 + 2' }
        specify { expect(expression).to be_valid }
      end

      describe 'a substraction' do
        let(:formula) { '7 - 7' }
        specify { expect(expression).to be_valid }
      end

      describe 'a multiplication' do
        let(:formula) { '7 * 7' }
        specify { expect(expression).to be_valid }
      end

      describe 'a division' do
        let(:formula) { '7 / 7' }
        specify { expect(expression).to be_valid }
      end

      describe 'a complex formula' do
        let(:formula) { '(5+2) +1+7*7-(3+4)' }
        specify { expect(expression).to be_valid }
      end
    end
  end
end
