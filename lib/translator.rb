require 'yaml'
require 'pry'

def load_library(yaml_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
    final = emoticons.each_with_object ({}) do |(key, value), final_hash|
      if !final_hash[key]
        final_hash[key] = {
        :english => value[0],
        :japanese => value[1]
      }
    end
    final
  end
end

def get_japanese_emoticon(yaml_file, english_emoticons)
  library = load_library(yaml_file)
    library.each do |meaning, emoticons|
      if library[meaning][:english] == english_emoticons
        return library[meaning][:japanese]
      end
    end
    return "Sorry, that emoticon was not found"
  end


def get_english_meaning(yaml_file, japanese_emoticons)
  library = load_library(yaml_file)
    library.each do |meaning, emoticons|
      if library[meaning][:japanese] == japanese_emoticons
        return meaning
      end
    end
    return "Sorry, that emoticon was not found"
  end
