class Genre
  attr_accessor :name, :id, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end

  # Data Serialization
  def to_json(options = {})
    {
      id: @id,
      name: @name
    }.to_json(options)
  end
end
