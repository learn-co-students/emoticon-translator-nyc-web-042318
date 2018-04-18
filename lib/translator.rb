# require modules here
require "pry"
require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, array_of_emoticons|
    hash["get_meaning"][array_of_emoticons[1]] = meaning
    hash["get_emoticon"][array_of_emoticons[0]] = array_of_emoticons[1]
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  if emoticons["get_emoticon"].include?(emoticon)
    emoticons["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
    
  

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  if emoticons["get_meaning"].include?(emoticon)
    emoticons["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end