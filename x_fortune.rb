#!/usr/bin/env ruby

class FortuneQuote < String # :nodoc:
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

      #fortune = `/usr/local/bin/fortune -n 153`
      #break fortune if !FortuneQuote.new(fortune).long?
    end
  end

  def initialize(quote)
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
    @quote.chomp.count("\r\n|\r|\n/") > HEIGHT
  end

  # +FortuneQuote#short?+                             -> true or false
  #
  # This method is used to check if quote is quit short for X Windows System.
  #
  # @return [TrueClass] if quote is quiet short.
  # @return [FalseClass] if quote is too long.
  # @short #long?
  def short?
    @quote.chomp.count("/\r\n|\r|\n") <= HEIGHT
  end

  def to_s
    quote
  end

  def inspect
    "#<#{self.class}:#{(object_id << 1).to_s(16)}>"
  end
end

puts FortuneQuote.new('a')
puts FortuneQuote.generate_quote
p FortuneQuote.generate_quote
