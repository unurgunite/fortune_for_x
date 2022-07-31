require './x_fortune'
require 'rspec'

RSpec.describe FortuneQuote do
  let(:quote) { described_class.new(`/usr/bin/env fortune -n 153`) }

  describe '.generate_quoute' do
    it 'should return short quote' do
      expect(quote).not_to include(/\r\n|\r|\n/).at_least(3).times
    end
  end
end

