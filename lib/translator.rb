# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  new_emotes = {}

  emoticons.each do | key, value |
    new_emotes[key] = {}
    new_emotes[key][:english] = value[0]
    new_emotes[key][:japanese] = value[1]
  end
  new_emotes
end

def get_japanese_emoticon(path, emoticon)
  load_library(path).each do | key, value |
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  load_library(path).each do | key, value |
    if value[:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end
