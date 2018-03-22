require './magic_the_gathering_api.rb'
require './card.rb'
require './helpers.rb'
class MagicTheGatheringCLI
  include Helpers
  attr_reader :options

  def initialize(options)
    @options = options
  end

  # Filtering result following command instructions
  def filter
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

    cards_collection
  end
end