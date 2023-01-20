class Author
  attr_accessor :first_name, :last_name
  attr_reader :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = Random.rand(1..1000)
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self
  end

  def to_json(options = {})
    {
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json(options)
  end
end
