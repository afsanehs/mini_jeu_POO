 require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#intro defines names for the two players
def intro 
    @player1 = Player.new("Josiane")
    puts "à ma droite Josiane"
    @player2 = Player.new("José")
    puts "à ma gauche José"
end

#game uses methods from player file to simulate the game and end it when one player reaches 0 points
def game  
    puts "Voici l'état de chaque joueur :"
    while @player1.life_points > 0 && @player2.life_points >0 do
        puts "Passons à la phase d'attaque :"
        puts @player1.attacks(@player2)
        puts @player2.show_state
        if @player2.life_points <= 0
            break
        end
        puts @player2.attacks(@player1)
        puts @player1.show_state
        sleep 1
    end
end

intro
game