require 'yaml'
require 'pry'
# require modules here

def load_library(path)
  helper = YAML.load_file(path)
  translated = {}
  helper.each do |name, array|
    translated[name] = {
      :english => array[0],
      :japanese => array[1]
      # binding.pry
    }
    # binding.pry
  end
  translated
  # binding.pry
end

def get_japanese_emoticon(path, emoticon)
  helper = load_library(path)
  helper.each do |eng, hash|
    if hash[:english] == emoticon
      return hash[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_english_meaning(path, emoticon)
  helper = load_library(path)
  helper.each do |eng, hash|
    if hash[:japanese] == emoticon
      return eng
    end
    # binding.pry
  end
  return "Sorry, that emoticon was not found"
end
