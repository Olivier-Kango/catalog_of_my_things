require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(published_date, multiplayer, last_played_at)
    super(published_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && Date.parse(@last_played_at).year < Date.today.year - 2
  end

  def to_json(options = {})
    {
      'published_date' => @published_date,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'archived' => @archived
    }.to_json(options)
  end
end
