#!/usr/bin/env ruby
# encoding: UTF-8

FileUnderTest = "bin/next.rb"

require "test/unit"
require FileUnderTest

class Next < Test::Unit::TestCase

  def teardown
    File.delete("result.txt") if File.exist?("result.txt")
  end

  def check_output_of_main(firstname, expected_output)
	  assert_equal(expected_output, main(firstname)[0])
  end
  
  def test_usage
	  assert_equal(false, system(FileUnderTest +  " > result.txt"))
	  assert_equal(["usage : " + FileUnderTest + " <votre prénom>" + "\n"], IO.readlines("result.txt"))	 
  end
    
  def test_next_give_the_next_player_given_your_firstname_in_parameter
    check_output_of_main("etienne", "Etienne, le codeur suivant est : pascal@grange.nom.fr")
    check_output_of_main("luc", "Luc, le codeur suivant est : etienne.charignon@gmail.com")
  end
  
  def test_next_ignore_e_trema
    check_output_of_main("raphaël", "Raphaël, le codeur suivant est : luc@mazardo.com")
  end
  
  def test_next_accept_capitalized_first_name
    check_output_of_main("Etienne", "Etienne, le codeur suivant est : pascal@grange.nom.fr")
  end
  
  def test_next_with_unknown_user_respond_degage
    check_output_of_main("inconnu", 'Inconnu, tu ne fait pas parti du jeu. Tu peux faire un "pull request".')
    check_output_of_main("autreinconnu", 'Autreinconnu, tu ne fait pas parti du jeu. Tu peux faire un "pull request".')
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
