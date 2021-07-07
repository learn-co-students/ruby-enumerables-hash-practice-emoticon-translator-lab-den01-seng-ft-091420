# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  new_emoticons = Hash.new 
  emoticons.each do |key, values|
     new_emoticons[key] = {
       :english => values[0],
       :japanese => values[1]
     } 
  end
  return new_emoticons   
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  emoticons.each do |key, values|
    values.each do |key_2, value|
      if value == emoticon
        japanese_emoticon = emoticons[key][:japanese]
        return japanese_emoticon
      end 
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  emoticons.each do |key, values|
    values.each do |key_2, value|
      if value == emoticon
        english_meaning = key
        return english_meaning
      end 
    end
  end
  return "Sorry, that emoticon was not found"
end