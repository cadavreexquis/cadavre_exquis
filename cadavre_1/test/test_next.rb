#!/usr/bin/env irb

require "test/unit"
require "next.rb"

class Next < Test::Unit::TestCase

  def teardown
    File.delete("result.txt")
  end

  def check_cmd_output(cmd, expectedExitCode, expected_result)
	  assert_equal(expectedExitCode, system(cmd + "> result.txt"))
	  assert_equal([expected_result + "\n"], IO.readlines("result.txt"))	 
  end
  
  def test_usage
    check_cmd_output("lib/next.rb", false, "usage : next.rb <votre prénom>")
  end
    
  def test_next_give_the_next_player_given_your_first_name_in_parameter
    check_cmd_output("lib/next.rb etienne", true, "Etienne, le codeur suivant est : pascal@grange.nom.fr")
  end

end
