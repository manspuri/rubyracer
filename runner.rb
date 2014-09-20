require_relative 'ruby_racer'
# players = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"].shuffle
players = ['         Clayton', '      Speedracer', '       GaleForce', 'DaleEarnhardtJr', '    RichardSimmons', '           Mansi', '       Buttercup', '           John', '      DonScraper', '            Frog', '          Potato', '       dragMagic', '         Scraper', '      DonaldDuck', '          Mansi2', '         LoRyder', '        Megatron', '  BlackLightning', '   DanisaurusRex', '    SecondPlace', ' CandidKilsborne', '            Fifi', '         Artemis', '          Hermes', ' JenniferLawrence', '     flashBandit', '          Peggy', '          theKid', '        Dremen42', '          Maaansh', '            Bolt', '         Shomari', '            Jimbo', '     EleventhPlace','    WWChickenDinner','       littlerninja'].shuffle
game = RubyRacer.new(players)

# This clears the screen, so the fun can begin
game.reset_screen!

until game.finished?
  players.each do |player|
    # We print the board out so we can see what's going on since the last advance


    #Then we advance the player
    game.advance_player!(player)

    # We need to sleep a little, otherwise the game will blow right past us.
    # See http://www.ruby-doc.org/core-1.9.3/Kernel.html#method-i-sleep

  end
  game.print_board
  sleep(0.5)
end

# The game is over, so we need to print the "winning" board
game.print_board

puts " "*500 + "Player '#{game.winner}' has won!"
