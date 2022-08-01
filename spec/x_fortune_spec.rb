require './x_fortune'
require 'rspec'
require 'rspec/collection_matchers'

RSpec.describe FortuneQuote do
  let(:quote) { described_class.new(`/usr/bin/env fortune -n 153`).chomp }

  describe '.generate_quoute' do
    it '' do
      expect(quote).to be_a(String)
    end

    it 'should be an instance of String' do
      #binding.irb
      expect(quote).to have_at_least(1).characters
    end

    it 'should return short quote' do
      expect(quote).to include(/\r\n|\r|\n/).at_most(3).times
    end
  end
end
