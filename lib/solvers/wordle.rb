# typed: true
# frozen_string_literal: true

module Solvers
  class Wordle
    attr_reader :words

    def initialize(words)
      @words = words
    end

    def suggestions
      words.map(&:join)
    end

    def with(letters)
      letters.downcase!
      words.keep_if do |word|
        word_t = word.chars.tally
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

    def without(letters)
      letters.downcase!
      words.keep_if { |w| !w.chars.intersect?(letters.chars) }
    end

    def nth_letter_is(pos, letter)
      letter.downcase!
      words.keep_if { |w| w.chars[pos] == letter }
    end

    def nth_letter_is_not(pos, letter)
      letter.downcase!
      words.keep_if { |w| w.chars[pos] != letter }
    end
  end
end
