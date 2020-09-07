require 'yaml'
require 'pry'

def load_library(yaml)
  new_library = {}
  thing = YAML.load_file(yaml)
  thing.each do |key, values|
    new_library[key] = {:english => values[0], :japanese => values[1]}
  end
  new_library
end

def get_japanese_emoticon(yaml, emoticon)
  local_library = load_library(yaml)
  local_library.each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  p "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml, japanese_emoticon)
  emoticon_library = load_library(yaml)
  emoticon_library.each do |key, value|
    if value[:japanese] == japanese_emoticon
      return key
    end
  end
  p "Sorry, that emoticon was not found"
end