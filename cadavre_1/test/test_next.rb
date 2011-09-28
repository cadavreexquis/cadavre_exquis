#!/usr/bin/env irb
# encoding: UTF-8

require "test/unit"
require "next.rb"

class Next < Test::Unit::TestCase

  def teardown
    File.delete("result.txt")
  end

  def check_output_of_next(params, expected_exit_code, expected_result)
	  assert_equal(expected_exit_code, system("lib/next.rb" +" " + params + "> result.txt"))
	  assert_equal([expected_result + "\n"], IO.readlines("result.txt"))	 
  end
  
  def test_usage
    check_output_of_next("", false, "usage : next.rb <votre prénom>")
  end
    
  def test_next_give_the_next_player_given_your_first_name_in_parameter
    check_output_of_next("etienne", true, "Etienne, le codeur suivant est : pascal@grange.nom.fr")
  end

end
