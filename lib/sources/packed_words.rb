# typed: true
# frozen_string_literal: true

module Sources
  class PackedWords
    extend T::Sig

    attr_reader :words

    def initialize
      words_packed = File.binread("words.msgpack")
      @words = MessagePack.unpack(words_packed)
    end
  end
end
