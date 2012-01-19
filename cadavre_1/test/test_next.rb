#!/usr/bin/env ruby
# encoding: UTF-8

require "test/unit"
require "lib/next.rb"

class Next < Test::Unit::TestCase

  def teardown
    File.delete("result.txt") if File.exist?("result.txt")
  end

  def check_output_of_main(firstname, expected_output)
	  assert_equal(expected_output, main(firstname)[0])
  end
  
  def test_usage
	  assert_equal(false, system("lib/next.rb > result.txt"))
	  assert_equal(["usage : next.rb <votre prénom>" + "\n"], IO.readlines("result.txt"))	 
  end
    
  def test_next_give_the_next_player_given_your_firstname_in_parameter
    check_output_of_main("etienne", "Etienne, le codeur suivant est : pascal@grange.nom.fr")
    check_output_of_main("luc", "Luc, le codeur suivant est : etienne.charignon@gmail.com")
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
