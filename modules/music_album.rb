require_relative './item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(published_date, on_spotify: false)
    super(published_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  private :can_be_archived?

  # Data Serialization
  def to_json(options = {})
    {
      publish_date: @published_date,
      on_spotify: @on_spotify,
      archived: @archived
    }.to_json(options)
  end
end
