require 'yaml'
require 'pry'

def load_library(file_path)
get_file = YAML.load_file(file_path)
new_hash = {}
  get_file.each do |key, value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end
new_hash
end
def get_japanese_emoticon(file_path,eng_emote)
japanese_emoticon = "Sorry, that emoticon was not found"
  load_library(file_path).each_value do |emotes|
    if eng_emote == emotes[:english]
     japanese_emoticon = emotes[:japanese]
    end
  end
japanese_emoticon
end

def get_english_meaning(file_path,j_emote)
  english_meaning = "Sorry, that emoticon was not found"
    load_library(file_path).each do |meaning, emotes|
     if j_emote == emotes[:japanese]
       english_meaning = meaning.to_s
     end
    end
english_meaning
end