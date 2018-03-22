require 'optionparser'
require 'byebug'
require './magic_the_gathering_cli.rb'


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
    exit
  end
end.parse!


mtg_cli = MagicTheGatheringCLI.new(options)
cards = mtg_cli.filter
puts cards.to_json
