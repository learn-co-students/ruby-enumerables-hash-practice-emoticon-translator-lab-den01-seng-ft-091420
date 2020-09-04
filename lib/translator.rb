require 'pry'
require 'yaml'

def load_library(file_path)
  hash = {}
 emoticons = YAML.load_file(file_path)
  emoticons.each do |key, value|
    hash[key] = {} 
    hash[key][:english] = value[0]
    hash[key][:japanese] = value[1]
 end 
 hash
end

#emoticons is a hash of emoticons {}
#language is the key emoticons[:english]
#emoticon is the inner_key emoticons[:english][inner_key]
#value is the actual emoticons[:english][inner_key] = value

def get_japanese_emoticon(file_path, emoticon)
 load_library(file_path).each do |key, value|
 if value[:english] == emoticon
   return value[:japanese]
 end
 end
   return "Sorry, that emoticon was not found"
 end

def get_english_meaning(file_path, emoticon)
 load_library(file_path).each do |key, value|
   if value[:japanese] == emoticon
     return key 
    end
end
 return "Sorry, that emoticon was not found"
end