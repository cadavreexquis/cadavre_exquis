#!/usr/bin/ruby
# encoding: UTF-8

CODER_FILE_NAME="../.coders"

def read_coders_property(property)
  /coders="(.*)"/.match(property)[1].split(/ /)
end

def read_firstname(email)
  email.split(/@|\./)[0]
end

def init_follower_map
  coders = read_coders_property(IO.readlines(CODER_FILE_NAME)[0])
  result_map = Hash.new
  coders.length.times do |coder_index|
    follower_index = coder_index + 1
    follower_index = 0 if follower_index == coders.length 
    result_map[read_firstname(coders[coder_index])]= coders[follower_index] 
  end  
  return result_map
end

codersFollower=init_follower_map

if $0 == __FILE__
  if $*[0] == nil
    puts "usage : next.rb <votre prénom>"
    exit 1
  end
  puts $*[0].capitalize + ", le codeur suivant est : " + codersFollower[$*[0]]
end
