#!/usr/bin/env irb

require "test/unit"

class Generator
   def initialize(value)
     @next= value.keys.join
   end
   def next
     @next
    end
end

class GeneratorTest < Test::Unit::TestCase

  def test_with_hash_parameter
	assert_equal("ac", Generator.new({ "a" => 1, "c" => 1 }).next )
  end
end

