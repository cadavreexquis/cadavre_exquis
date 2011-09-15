#!/usr/bin/env irb

require "test/unit"

class Generator
   def initialize(value)   
     if value.respond_to?("keys")
       @next= value.keys.join 
     end
   end
   
   def next
    @next
   end
end

class GeneratorTest < Test::Unit::TestCase

  def test_with_hash_parameter
	  assert_equal("ac", Generator.new({ "a" => 1, "c" => 1 }).next )
  end
    
  def test_with_string_parameter
	  assert_equal(nil, Generator.new("abc").next )
  end

end

