# frozen_string_literal: true

require "trie"

class TrieTest < Minitest::Test
  def setup
    @trie = Trie.new
  end

  def test_words
    @trie.insert("apple")
    @trie.insert("banana")
    assert_equal(2, @trie.words.size)
  end

  def test_include?
    @trie.insert("apple")
    @trie.insert("apples")
    assert(@trie.include?("apple"))
    assert(@trie.include?("apples"))
    refute(@trie.include?("appl"))
    refute(@trie.include?("apply"))
    refute(@trie.include?("mapple"))
  end

  def test_words_with_char
    @trie.insert("apple")
    @trie.insert("banana")
    @trie.insert("clove")
    assert_equal(@trie.words_with_char("a"), ["apple", "banana"])
  end

  def test_words_with_char_at_index
    @trie.insert("apple")
    @trie.insert("banana")
    @trie.insert("carrot")
    assert_equal(@trie.words_with_char_at_index("a", 1), ["banana", "carrot"])
  end

  def test_delete
    @trie.insert("apple")
    assert(@trie.include?("apple"))
    @trie.delete("apple")
    refute(@trie.include?("apple"))
  end
end
