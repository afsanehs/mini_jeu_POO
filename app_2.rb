 require 'bundler'
 require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def intro
    puts "------------------------------------------------" 
    puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "-------------------------------------------------"
end

def ask_name 
    puts "Quel est ton prénom?"
    player1 = HumanPlayer.new(gets.chomp)
end

intro 
ask_name

binding.pry
