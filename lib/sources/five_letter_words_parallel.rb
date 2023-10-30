# typed: true
# frozen_string_literal: true

require "msgpack"

module Sources
  class FiveLetterWordsParallel
    extend T::Sig

    attr_reader :words

    def initialize
      require "polyphony"
      @words = []
      fd = IO.sysopen("words.msgpack")
      io = IO.new(fd, "r")
      unpacker = MessagePack::Unpacker.new
      io.feed_loop(unpacker, :feed_each) do |word|
        @words = word
      end
    end
  end
end
