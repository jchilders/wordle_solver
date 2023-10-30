# typed: true
# frozen_string_literal: true

module Solvers
  class Wordle
    extend T::Sig
    attr_reader :words

    sig { params(words: T::Array[String]).void }
    def initialize(words)
      @words = words
    end

    sig {returns(T::Array[String])}
    def suggestions
      words.map(&:join)
    end

    sig { params(letters: String).returns(T::Array[T::Array[String]]) }
    def with(letters)
      letters.downcase!
      words.keep_if do |word|
        word_t = word.tally
        reqd_t = letters.chars.tally
        reqd_t.all? do |k, v|
          if v == 1
            !word_t[k].nil? && word_t[k] > 0
          else
            word_t[k] == v
          end
        end
      end
    end

    sig { params(letters: String).returns(T::Array[T::Array[String]]) }
    def without(letters)
      letters.downcase!
      words.keep_if { |w| !w.intersect?(letters.chars) }
    end

    sig { params(pos: Integer, letter: String).returns(T::Array[T::Array[String]]) }
    def nth_letter_is(pos, letter)
      letter.downcase!
      words.keep_if { |w| w[pos] == letter }
    end

    sig { params(pos: Integer, letter: String).returns(T::Array[T::Array[String]]) }
    def nth_letter_is_not(pos, letter)
      letter.downcase!
      words.keep_if { |w| w[pos] != letter && w.include?(letter) }
    end
  end
end
