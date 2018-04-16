# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  new_library={}
  library=YAML.load_file(file)
  new_library["get_emoticon"]={}
  new_library["get_meaning"]={}
  library.each do |meaning, emoticon|
    new_library["get_emoticon"][emoticon[0]]=emoticon[1]
    new_library["get_meaning"][emoticon[1]]=meaning
  end
  new_library
end

def get_japanese_emoticon(file, emoticon)
  library=load_library(file)
  library.each do |lookup_path, hash|
    if lookup_path == "get_emoticon"
      hash.each do |english, japanese|
        if english == emoticon
          return japanese
        end
      end
      return "Sorry, that emoticon was not found"
    end
  end
end

def get_english_meaning(file, emoticon)
  library=load_library(file)
  library.each do |lookup_path, hash|
    if lookup_path == "get_meaning"
      hash.each do |japanese, english_meaning|
        if japanese == emoticon
          return english_meaning
        end
      end
      return "Sorry, that emoticon was not found"
    end
  end
end
