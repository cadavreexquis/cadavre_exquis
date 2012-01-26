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

def main(firstname)
  codersFollower=init_follower_map
  if firstname == nil
    return ["usage : next.rb <votre prénom>", 1]
  end
  key = firstname.tr_s('ë','e').downcase 
  if(codersFollower[key] == nil)
    return [firstname.capitalize + ", tu ne fait pas parti du jeu. Tu peux faire un \"pull request\".", 0]
  end
  [firstname.capitalize + ", le codeur suivant est : " + codersFollower[key], 0]
end

if $0 == __FILE__
  (output, exit_code) = main $*[0]
  puts output
  exit exit_code
end
