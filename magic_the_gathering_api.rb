require 'httparty'
class MagicTheGatheringAPI
  include HTTParty
  base_uri 'api.magicthegathering.io'
  attr_accessor :options

  def initialize(service)
    @options = { query: { site: service, page: 1 } }
  end

  # Get cards from specific page
  def cards(page)
    self.options[:query][:page] = page || 1
    http_response = self.class.get("/v1/cards", @options)
    json_response = JSON.parse(http_response.body)
    cards = []
    json_response["cards"].each do |json_card|
      cards << Card.new(json_card)
    end
    cards
  end

  # Get all cards
  def all_cards(pages)
    cards_collection = []
    page = 1
    loop do
      cards_page = self.cards(page)
      cards_collection += cards_page
      break if cards_page.empty? || (pages ? page >= pages : false)
      page += 1
    end
    cards_collection
  end
end