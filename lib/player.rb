require "pry"

class Player
    attr_accessor :name, :life_points
    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 10
    end
    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end
    def gets_damage(damage_received)
        @life_points = @life_points - damage_received
        if @life_points <= 0 
            puts "le joueur #{@name} a été tué !"
        end
    end
    def attacks(player)
        damage_received = compute_damage
        player.gets_damage(damage_received)
        puts "#{@name} attaque #{player.name}"
        puts "il lui inflige #{damage_received} points de dommages"
    end
    def compute_damage 
        return rand(1..6)
    end
end 

puts "end of file"
