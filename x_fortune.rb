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

  # +FortuneQuote#long?+                                   -> String
  #
  # This method is used to check if quoute is too large for X Windows System.
  def long?
    @quote.chomp.count("\n") > 3
  end
end

p FortuneQuote.generate_quoute


