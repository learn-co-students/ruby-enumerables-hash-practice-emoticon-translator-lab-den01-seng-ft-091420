require "yaml"
require 'pry'
emoticons = YAML.load_file("./lib/emoticons.yml")

def load_library(emoticons)
  emoticons = YAML.load_file("./lib/emoticons.yml")
  eng = []
  jap = []
  emoticons.each do |emot_name, the_emotes|
    the_emotes.each_with_index do |item,index| 
      if (index %2 ==0) then 
      eng.push(item)
      else
      jap.push(item)
      end
    end
  end
  ultimate = emoticons.each_with_object({}) do |(emot_name, the_emotes), big_hash|
    big_hash[emot_name] = {}
    big_hash[emot_name] = {:english => eng[big_hash.length - 1], :japanese => jap[big_hash.length - 1]}
  end
  ultimate
end


def get_english_meaning(emoticons, emote)
  the_lib = load_library(emoticons)
  arg = Proc.new {"!"}
  found = the_lib.find(arg) do |emotname, eoj|
    the_lib[emotname][:japanese] == emote
          end
  if found[0] == "!"
    p "Sorry, that emoticon was not found"
  else
    found[0]
  end
end




def get_japanese_emoticon(emoticons, emot)
  p emot
  the_lib = load_library(emoticons)
  arg = Proc.new {"!"}
    found = the_lib.find(arg) do |emotname, eoj|
    the_lib[emotname][:english] == emot
    end
  if found[0] =="!"
    p "Sorry, that emoticon was not found"
  else 
    found[1][:japanese]
  end
end




#the_lib.find(arg) do |emotname, eoj|
 #   putsthe_lib[emotname][:english] == emote
#    "O:)"




