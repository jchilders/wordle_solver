# frozen_string_literal: true

require_relative "helper"
require "minitest/autorun"

# This class exists simply to ensure that everything is installed and working.
class SanityTest < Minitest::Test
  def test_truth
    assert(true)
  end
end
