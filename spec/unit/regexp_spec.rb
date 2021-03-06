require 'spec_helper'

try_spec do
  describe Ardm::Property::Regexp  do
    before do
      class ::User < Ardm::Record
        property :id, Serial
        property :regexp, Regexp
      end

      @property = User.properties[:regexp]
    end

    describe '.load' do
      describe 'when argument is a string' do
        before do
          @input  = '[a-z]\d+'
          @result = @property.load(@input)
        end

        it 'create a regexp instance from argument' do
          expect(@result).to eq(Regexp.new(@input))
        end
      end

      describe 'when argument is nil' do
        before do
          @input  = nil
          @result = @property.load(@input)
        end

        it 'returns nil' do
          expect(@result).to be_nil
        end
      end
    end

    describe '.dump' do
      describe 'when argument is a regular expression' do
        before do
          @input  = /\d+/
          @result = @property.dump(@input)
        end

        it 'escapes the argument' do
          expect(@result).to eq('\\d+')
        end
      end

      describe 'when argument is nil' do
        before do
          @input = nil
          @result = @property.dump(@input)
        end

        it 'returns nil' do
          expect(@result).to be_nil
        end
      end
    end
  end
end
