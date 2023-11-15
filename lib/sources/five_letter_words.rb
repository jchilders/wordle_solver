# frozen_string_literal: true

require "msgpack"

module Sources
  class FiveLetterWords
    FILE = "words_five_letters.msgpack"
    attr_reader :words
    attr_accessor :addasf

    def thing1
      if thing1
        
      else
      end
    end

    def initialize
      require "polyphony"
      @words = []
      io = IO.new(IO.sysopen(FILE), "r")
      unpacker = MessagePack::Unpacker.new
      io.feed_loop(unpacker, :feed_each) do |word|
        @words = word
      end
    end
  end
end