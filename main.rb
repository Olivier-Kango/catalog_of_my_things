require_relative './utilities/genre_and_album'
require_relative './utilities/app_book_lab'
require_relative './utilities/game_and_author_ops'

class Main
  include GenreAndAlbum
  include GameAndAuthor
  include AppBookLab

  def initialize
    @genres = load_genres
    @music_albums = load_albums
    @authors = load_authors
    @games = load_games
    @labels = load_labels
    @books = load_books

    @options = "
    Please choose an option entering a number:
    1. - List all books
    2. - List all music albums
    3. - List of games
    4. - List all genres
    5. - List all labels
    6. - List all authors
    7. - Add a book
    8. - Add a music album
    9. - Add a game

    0. - Exit
    "
  end

  def list_choice(number)
    case number
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    end
  end

  # user choice handler
  def user_choice(number)
    if number.between?(1, 6)
      list_choice(number)
    else
      case number
      when 7
        create_book
      when 8
        create_album
      when 9
        create_game
      end
    end
  end

  # Run app until the exist option is chosen
  def run
    puts "\n============= Welcome to the Catalogue of things App! =============="
    terminate = false

    until terminate
      puts @options
      input = gets.chomp

      if input.match(/\A\d+\Z/) # If the input is a number continue else return an error
        number = input.to_i
        if number.between?(1, 9)
          user_choice(number)
        elsif number.zero?
          terminate = true
          puts "Thanks for using the app.🙂 \nExisting..."
        else
          puts 'Unkown input. Try again.'
        end
      else
        puts 'Use numbers only.🚶🏼‍♂️'
      end
    end
  end
end

app = Main.new
app.run
