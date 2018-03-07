require_relative '../Lib/Player'
require_relative '../Lib/enemy'
require_relative '../Lib/tile'

module Game
    class Director
        def initialize
            @tile = Tile.new
            @player = Player.new
            @enemy = Enemy.new
        end

        def play
            Sprite.check(@tile,@player)
            @player.update
            @enemy.update
            @tile.update
        end
    end
end
