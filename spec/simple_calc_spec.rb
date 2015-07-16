require 'simple_calc'
require 'simple_calc/version'
require 'simple_calc/errors'

RSpec.describe SimpleCalc do
  it 'has a version number' do
    expect(SimpleCalc::VERSION).to eq '0.1.0'
  end

  describe '.run' do
    let(:calculator)     { spy('calculator') }
    let(:expression)     { double('expression') }
    let(:file_not_found) { Errno::ENOENT }
    let(:syntax_error)   { SimpleCalc::SyntaxError }

    it 'evaluates expressions using given evaluator' do
      allow(calculator).to receive(:read_expressions).and_return([expression])

      SimpleCalc.run('some_file.txt', calculator: calculator)

      expect(calculator).to have_received(:calculate).with([expression])
    end

    it 'fails gracefully when no file is found' do
      expect { SimpleCalc.run('no_file') }.not_to raise_error
    end

    it 'provides a useful message when the file is not found' do
      allow(calculator).to receive(:read_expressions).and_raise(file_not_found)

      useful_message = 'Please ensure that the correct filename is provided'
      message = SimpleCalc.run('no_file', calculator: calculator)

      expect(message).to eq useful_message
    end

    it 'provides a useful message when file contents are invalid' do
      allow(calculator).to receive(:read_expressions).and_raise(syntax_error)

      useful_message = 'Please ensure that file contains valid expression '\
        'e.g. (5 + 2) + 1 + 7 * 7 - (3 + 4)'
      message = SimpleCalc.run('no_file', calculator: calculator)

      expect(message).to eq useful_message
    end
  end
end
