require 'spec_helper'

describe MagicTheGatheringAPI do
  it "should return 100 elements from first page" do
    api_manager = MagicTheGatheringAPI.new('MTG')
    cards = api_manager.cards(1)
    expect(cards.count).to eq(100)
  end

  it "should return an Array" do
    api_manager = MagicTheGatheringAPI.new('MTG')
    cards = api_manager.cards(1)
    expect(cards).to be_a(Array)
  end

  it "should return an Array of Card" do
    api_manager = MagicTheGatheringAPI.new('MTG')
    cards = api_manager.cards(1)
    cards.each do |c|
      expect(c).to be_a(Card)
    end
  end

  it "should return 300 elements from first 3 pages" do
    api_manager = MagicTheGatheringAPI.new('MTG')
    cards = api_manager.all_cards(3)
    expect(cards.count).to eq(300)
  end
end