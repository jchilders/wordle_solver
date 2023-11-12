# typed: true
# frozen_string_literal: true

class Trie
  include Enumerable

  attr_accessor :children, :is_word

  def initialize
    @children = {}
    @is_word = false
  end

  class << self
    def from_words(words)
      new.tap do |trie|
        words.each { |word| trie.insert(word) }
      end
    end
  end

  def insert(word)
    node = self
    word.each_char do |char|
      node.children[char] ||= self.class.new
      node = node.children[char]
    end
    node.is_word = true
  end

  def delete(word)
    __delete(self, word, 0)
  end

  def include?(word)
    node = self
    word.each_char do |char|
      return false if node.children[char].nil?

      node = node.children[char]
    end
    node.is_word
  end

  def words
    all_words = []
    __all_words(self, "", all_words)
    all_words
  end

  def __all_words(node, current_word, all_words)
    if node.is_word
      all_words.push(current_word)
    end

    node.children.each do |char, child_node|
      __all_words(child_node, current_word + char, all_words)
    end
  end

  def words_with_char(char)
    each do |node, words|
      __words_with_char(node, "", words, char)
    end
  end

  def words_with_char_at_index(char, index)
    each do |node, words|
      __words_with_char_at_index(node, "", words, char, index)
    end
  end

  def each
    words = []
    yield(self, words)
    words
  end

  private

  def find_all_words(node, prefix, words)
    words << prefix if node.is_word
    node.children.each_key do |key|
      find_all_words(node.children[key], prefix + key, words)
    end
  end

  def __words_with_char(node, prefix, words, char)
    # if the current node is a word and contains the given character, add it to
    # the list of words
    words << prefix if node.is_word && prefix.include?(char)

    # recursively check all child nodes
    node.children.each_key do |key|
      child_node = node.children[key]
      new_prefix = prefix + key
      __words_with_char(child_node, new_prefix, words, char)
    end
  end

  def __words_with_char_at_index(node, prefix, words, char, index)
    # if the current node is a word and contains the given character at the
    # given index, add it to the list of words
    words << prefix if node.is_word && prefix[index] == char

    # recursively check all child nodes
    node.children.each_key do |key|
      child_node = node.children[key]
      new_prefix = prefix + key
      __words_with_char_at_index(
        child_node,
        new_prefix,
        words,
        char,
        index,
      )
    end
  end

  def __delete(node, word, index)
    if index == word.length
      if node.is_word
        node.is_word = false
        return node.children.empty?
      end
      return false
    end

    char = word[index]
    return false if node.children[char].nil?

    should_delete_child = __delete(node.children[char], word, index + 1)

    if should_delete_child
      node.children.delete(char)
      return node.children.empty? && !node.is_word
    end

    false
  end
end
