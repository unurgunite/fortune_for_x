#!/usr/bin/env ruby

class FortuneQuote < String # :nodoc:
  # +FortuneQuote.generate_quoute+
  def self.generate_quoute
    loop do
      fortune = `/usr/local/bin/fortune -n 153`
      break fortune if !FortuneQuote.new(fortune).long?
    end
  end

  def initialize(quote)
    @quote = quote
  end

  # +FortuneQuote#long?+                                   -> true or false
  #
  # This method is used to check if quote is too large for X Windows System.
  #
  # @return [TrueClass] if quote is too long.
  # @return [FalseClass] if quote is quiet short.
  def long?
    @quote.chomp.count("\n") > 3
  end
end

print FortuneQuote.generate_quoute

