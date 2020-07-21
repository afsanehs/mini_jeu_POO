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
        puts "#{@name} attaque #{player.name}"
        damage_received = compute_damage
        puts "il lui inflige #{damage_received} points de dommages"
        player.gets_damage(damage_received)
    end
    def compute_damage 
        return rand(1..6)
    end
end 

#classe hérite de Player 
class HumanPlayer < Player 
    attr_accessor :weapon_level
    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 100
        @weapon_level = 1
    end
    def compute_damage
        rand(1..6) * @weapon_level
    end
    def search_weapon
        dice_toss = rand(6) + 1
        puts "Tu as trouvé une arme de niveau #{dice_toss}"
        if dice_toss > @weapon_level
            @weapon_level = dice_toss
            puts "Youhoo ! elle est meilleure que ton arme actuelle : tu la prends."
        end
        if dice_toss < @weapon_level
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end
    def add_life_points(points)
        new_points = points + @life_points
        if new_points > 100
            @life_points = 100
        else
            @life_points = new_points
        end
    end
    def search_health_pack 
        @dice_toss = rand(6) + 1
        if @dice_toss == 1
            puts "Tu n'as rien trouvé..."
        end
        if @dice_toss >= 2 and @dice_toss <= 5
            add_life_points(50)
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        end 
        if @dice_toss == 6
            add_life_points(80)
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end 
    end
end 

puts "end of file"
