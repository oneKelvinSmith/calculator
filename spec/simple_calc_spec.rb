require 'simple_calc'
require 'simple_calc/version'


RSpec.describe SimpleCalc do
  it 'has a version number' do
    expect(SimpleCalc::VERSION).to eq '0.1.0'
  end

  describe '.run' do
    let(:calculator) { spy('calculator') }
    let(:expression) { double('expression') }

    it 'evaluates expressions using given evaluator' do
      expressions = [expression, expression]

      allow(calculator).to receive(:read_expressions).and_return(expressions)

      SimpleCalc.run('some_file.txt', calculator: calculator)

      expect(calculator).to have_received(:evaluate).with(expressions)
    end

    it 'fails gracefully when no file is found' do
      expect { SimpleCalc.run('non_existent_file') }.not_to raise_error
    end
  end
end
