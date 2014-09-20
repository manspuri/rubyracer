require_relative 'die.rb'

class RubyRacer
  attr_reader :players, :length, :board, :die

  def initialize(players, length = 100)
    @board = {}
    @players = players
    @players.each{|player| @board[player] = 0}
    @die = Die.new
    @length = length
  end

  def finished?
    @players.each do |player|
      return true if @board[player] >= @length
    end
    false
  end

  def player_position
    sorted = @board.sort_by {|player, board_position| board_position}
    first = sorted.delete_at(-1)
    second = sorted.delete_at(-1)
    third = sorted.delete_at(-1)
    fourth = sorted.delete_at(-1)
    fifth = sorted.delete_at(-1)
    last = sorted.first
    puts str = <<-string

    1st place #{first[0]}!
    2nd place #{second[0]}!
    3rd place #{third[0]}!
    4th place #{fourth[0]}!
    5th place #{fifth[0]}!

    last... #{last[0]}
    string
  end

  # Returns the winner if there is one, +nil+ otherwise
  # key is player, value is position
  def winner
    @board.sort_by {|player, board_position| board_position}.last.first
  end

  def advance_player!(player)
    @board[player] += @die.roll
  end

    def print_board
    reset_screen!
    @players.each do |player|
      @length.times do |i|
        if @board[player] == i
          print "|#{player}"
        else
          print "| "
        end
      end
      puts "end" #the missing link
    end
    player_position
  end

#########################################
# don't change anything below this line #
#########################################

  #Clears the content on the screen. Ah, a fresh canvas.
  #You don't have to test this
  def clear_screen!
    print "\e[2J"
  end

  #Moves the "cursor" back to the upper left.
  #You don't have to test this
  def move_to_home!
    print "\e[H"
  end

  #You don't have to test this
  def reset_screen!
    clear_screen!
    move_to_home!
  end

end


