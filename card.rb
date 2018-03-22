class Card
  attr_reader :set, :rarity, :colors, :artist, :formats, :fields
  def initialize(fields)
    @fields = fields
    @set = fields['set']
    @rarity = fields['rarity']
    @colors = fields['colors']
    @artist = fields['artist']
    @formats = fields['legalities']&.map{|x| x['format']}
  end
end