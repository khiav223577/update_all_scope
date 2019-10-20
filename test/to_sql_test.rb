# frozen_string_literal: true

require 'test_helper'

class UpdateAllScopeTest < Minitest::Test
  def setup
  end

  def test_that_it_has_a_version_number
    refute_nil ::UpdateAllScope::VERSION
  end
end
