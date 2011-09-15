#!/usr/bin/ruby

codersFolower={"etienne" => "pascal@grange.nom.fr",
  "pascal" => "luc@mazardo.com",
  "luc" => "cbegot@gmail.com",
  "christophe" => "etienne.charignon@gmail.com"}
  

if $0 == __FILE__
  if $*[0] == nil
    puts "usage : next.rb <votre prénom>"
    exit 1
  end
  puts $*[0].capitalize + ", le codeur suivant est : " + codersFolower[$*[0]]
end