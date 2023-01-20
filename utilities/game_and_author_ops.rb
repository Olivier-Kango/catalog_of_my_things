require_relative './open_file'
require_relative '../modules/game'
require_relative '../modules/author'

module GameAndAuthor
  AUTHORS_FILE_PATH = './storage_files/authors.json'.freeze
  GAMES_FILE_PATH = './storage_files/games.json'.freeze

  # ----------------- Author Operations ----------------

  def create_author
    puts "Enter Author's First Name: "
    first_name = gets.chomp
    puts "Enter Author's Last Name: "
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def save_authors
    return unless @authors.any?

    json_sting = JSON.generate(@authors, { max_nesting: false })
    File.write(AUTHORS_FILE_PATH, json_sting)
  end

  def load_authors
    data = open_file(AUTHORS_FILE_PATH)
    return [] unless data.any?

    data.map { |author| Author.new(author['first_name'], author['last_name']) }
  end

  def list_authors
    if @authors.empty?
      puts 'No authors available. Please create one.'
    else
      @authors.each_with_index { |author, index| puts "#{index}) Name: #{author.first_name} #{author.last_name}" }
    end
  end

  # ------------------ Game Operations -----------------
  def create_game
    puts "Enter the Game's publish date: YY-MM-DD: "
    published_date = gets.chomp

    puts 'Is this Game Multiplayer? (Y/N)'
    multiplayer = gets.chomp.upcase == 'Y'

    puts 'Enter the last date this Game played at: YY-MM-DD'
    last_played_at = gets.chomp

    puts "Data: #{published_date}, #{multiplayer} ,#{last_played_at}"
    author = create_author
    game = Game.new(published_date, multiplayer, last_played_at)
    game.move_to_archive?
    author.add_item(game)

    @games.push(game)
    @authors.push(author)

    save_games
    save_authors
    puts 'Game created successfully! ✌🏼'
  end

  def save_games
    return unless @games.any?

    json_sting = JSON.generate(@games, { max_nesting: false })
    File.write(GAMES_FILE_PATH, json_sting)
  end

  def load_games
    data = open_file(GAMES_FILE_PATH)
    return [] unless data.any?

    puts "REturned data #{data}"
    data.map { |game| Game.new(game['published_date'], game['multiplayer'], game['last_played_at']) }
  end

  def list_games
    if @games.empty?
      puts 'No games available, Create a new Game'
    else
      @games.each_with_index do |game, index|
        puts "Game #{index}) Published date: #{game.published_date},
                multiplayer: #{game.multiplayer},
                last palyed at: #{game.last_played_at}"
      end
    end
  end
end
