#!/usr/bin/env ruby

# +FortuneQuote+ is a class represented quote object to display on X Windows System.
class FortuneQuote < String
  FORTUNE_PATH = '/usr/bin/env fortune'
  WIDTH = 153
  HEIGHT = 3

  attr_accessor :quote

  # +FortuneQuote.generate_quote+                     -> String
  #
  # This method generates fortune with right width and height. By default it
  # is 153 symbols in length and 3 lines at height.
  #
  # @return [String]
  def self.generate_quote
    loop do
      fortune = FortuneQuote.new(`#{FORTUNE_PATH} -n #{WIDTH}`)
      break fortune if fortune.short?
    end
  end

  def initialize(quote)
    super(quote)
    @quote = quote
  end

  # +FortuneQuote#long?+                               -> true or false
  #
  # This method is used to check if quote is too large for X Windows System.
  #
  # @return [TrueClass] if quote is too long.
  # @return [FalseClass] if quote is quiet short.
  # @see #short?
  def long?
    chomp.count("\r\n|\r|\n") > HEIGHT
  end

  # +FortuneQuote#short?+                             -> true or false
  #
  # This method is used to check if quote is quit short for X Windows System.
  #
  # @return [TrueClass] if quote is quiet short.
  # @return [FalseClass] if quote is too long.
  # @see #long?
  def short?
    chomp.count("\r\n|\r|\n") <= HEIGHT
  end
end

print FortuneQuote.generate_quote
