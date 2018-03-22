require 'spec_helper'

describe MagicTheGatheringCLI do
  it "should return 300 elements from first 3 pages" do
    options= {pages: 3}
    cli_manager = MagicTheGatheringCLI.new(options)
    cards = cli_manager.filter
    expect(cards.count).to eq(300)
  end

   it "should return an Array with White Cards" do
     options= {colors: ['White'], pages: 3}
     cli_manager = MagicTheGatheringCLI.new(options)
     cards = cli_manager.filter
     expect(cards).to be_a(Array)
     expect(cards.count).to be <= 300
     cards.each do |c|
       expect(c.colors).to include('White')
     end
   end

  it "should return an Array with Commander Legalities and White Cards" do
    options= {legalities: ['Commander'],colors: ['White'], pages: 7}
    cli_manager = MagicTheGatheringCLI.new(options)
    cards = cli_manager.filter
    expect(cards).to be_a(Array)
    expect(cards.count).to be <= 700
    cards.each do |c|
      expect(c.formats).to include('Commander')
      expect(c.colors).to include('White')
    end
  end

  it "should return an Array with Commander Legalities Cards" do
    options= {legalities: ['Commander'], pages: 5}
    cli_manager = MagicTheGatheringCLI.new(options)
    cards = cli_manager.filter
    expect(cards).to be_a(Array)
    expect(cards.count).to be <= 500
    cards.each do |c|
      expect(c.formats).to include('Commander')
    end
  end

  it "should return an Hash" do
    options= {group: ['set'], pages: 3}
    cli_manager = MagicTheGatheringCLI.new(options)
    cards = cli_manager.filter
    expect(cards).to be_a(Hash)
  end
end