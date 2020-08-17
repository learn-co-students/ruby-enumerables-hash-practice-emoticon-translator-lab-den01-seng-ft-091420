# require modules here
require "yaml"
require 'pry'

def load_library(file)
  result = Hash.new
  emoticons = YAML.load_file(file)
  emoticons.each do |name, emoj|
    result[name] = {}
    result[name][:english] = emoj.first
    result[name][:japanese] = emoj.last
  end
  result
end

def get_english_meaning(file, emoticon)
  final_result = nil
  result = Hash.new
 emoticons = load_library(file)
 emoticons.each do |key, value|
   result[value[:japanese]]= key
   final_result = result[emoticon]
   if final_result == nil
     final_result = "Sorry, that emoticon was not found"
   end
  end
final_result
end

def get_japanese_emoticon(file, emoticon)
    final_result = nil
    result = Hash.new
    emoticons = load_library(file)
    emoticons.each do |key, value|
      result[value[:english]] = value[:japanese]
      final_result = result[emoticon]
      if final_result == nil
        final_result = "Sorry, that emoticon was not found"
      end
    end
    final_result
 end

