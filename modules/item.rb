require 'date'

class Item
  attr_accessor :published_date, :archived, :label, :author, :genre

  def initialize(published_date)
    @published_date = published_date
    @archived = false
    @author = 'Unknown author'
    @id = Random.rand(1..1000)
    @label = 'Unknown label'
  end

  def add_genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_label(label)
    @label = label
    @label.items << self unless @label.items.include?(self)
  end

  def add_author(author)
    @author = author
    @author.items << self unless @author.items.include?(self)
  end

  def can_be_archived?
    Date.parse(@published_date).year < Date.today.year - 10
  end

  private :can_be_archived?

  def move_to_archive?
    @archived = can_be_archived?
  end
end
