require 'spec_helper'

RSpec.describe Calculator do
  it 'has a version number' do
    expect(Calculator::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
