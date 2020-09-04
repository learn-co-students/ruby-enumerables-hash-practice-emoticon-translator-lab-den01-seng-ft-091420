# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file("lib/emoticons.yml")
  n_emoticon = {}
  emoticons.each do |name,arrays|
      n_emoticon[name] ||= {}
      n_emoticon[name][:english] = arrays[0]
      n_emoticon[name][:japanese] = arrays[1]
  end
n_emoticon
end

def get_japanese_emoticon(file_path, e_emoticon)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
      return idioms[:japanese] if idioms[:english] == e_emoticon
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, j_emoticon)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
    return meaning if idioms[:japanese] == j_emoticon
  end
    "Sorry, that emoticon was not found"
 end 