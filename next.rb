#!/usr/bin/ruby

codersFolower={"etienne" => "pascal@grange.nom.fr",
  "pascal" => "luc@mazardo.com",
  "luc" => "cbegot@gmail.com",
  "c" => "etienne.charignon@gmail.com"}
  

puts $*[0].capitalize + ", le codeur suivant est : " + codersFolower[$*[0]]