# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticons_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, emoticon_list|
    emoticons_hash["get_meaning"][emoticon_list[1]] = meaning
    emoticons_hash["get_emoticon"][emoticon_list[0]] = emoticon_list[1]
  end
  emoticons_hash
end

def get_japanese_emoticon(yaml_file,emoticon)
  library = load_library(yaml_file)
  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yaml_file,emoticon)
  library = load_library(yaml_file)
  if  library["get_meaning"][emoticon]
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
