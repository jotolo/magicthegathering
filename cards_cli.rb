require 'optionparser'
require 'byebug'
require './magic_the_gathering_api.rb'
require './card.rb'
require './helpers.rb'

include Helpers

options = {}

OptionParser.new do |parser|
  parser.banner = "Usage: cards_cli [options]"

  parser.on("-c", "--colors FIELDS", Array, "Colors for filtering. Comma separated value. Eg: Blue,Red,White") do |filters|
    options[:colors] = filters
  end

  parser.on("-l", "--legalities FIELDS", Array, "Legality Formats for filtering. Comma separated value. Eg: Commander,Legacy,Khans of Tarkir Block") do |filters|
    options[:legalities] = filters
  end

  parser.on("-g", "--group FIELDS", Array, "Fields for grouping. Comma separated value. Eg: set,rarity") do |filters|
    options[:group] = filters
  end

  parser.on("-p", "--page COUNT", Integer, "Page amount to consume. Number") do |filters|
    options[:pages] = filters
  end

  parser.on("-h", "--help", "Show this help message") do
    puts parser
  end
end.parse!

# Getting the collection from MTG API
api_manager = MagicTheGatheringAPI.new('MTG')
cards_collection = api_manager.all_cards(options[:pages])

# Filtering by legalities format
if legality_options = options[:legalities]
  cards_collection = cards_collection.select{|x| ((x.formats||[]) & legality_options).any?}
end

# Filtering by colors
if colors_options = options[:colors]
  colors_options = colors_options.sort
  cards_collection = cards_collection.select{|x| x.colors&.sort == colors_options}
end

# Grouping by group fields
if group_options = options[:group]
  cards_collection = deep_group_by(cards_collection, group_options, 0)
end

puts cards_collection.to_json
