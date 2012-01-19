#!/usr/bin/env ruby
# encoding: UTF-8

require "test/unit"
require "lib/next.rb"

class Next < Test::Unit::TestCase

  def teardown
    File.delete("result.txt") if File.exist?("result.txt")
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
    check_output_of_next("luc", true, "Luc, le codeur suivant est : etienne.charignon@gmail.com")
  end
  
  def test_read_coder_property
    assert_equal(
      %w{pascal@grange.nom.fr 
         luc@mazardo.com 
         etienne.charignon@gmail.com}, 
      read_coders_property('coders="pascal@grange.nom.fr luc@mazardo.com etienne.charignon@gmail.com"'))
  end

  def test_read_firstname_from_email
    assert_equal("pascal", read_firstname("pascal@grange.nom.fr"))
    assert_equal("etienne", read_firstname("etienne.charignon@gmail.com"))
  end

end
