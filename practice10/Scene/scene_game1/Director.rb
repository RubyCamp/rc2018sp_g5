require_relative '../Lib/Player'
require_relative '../Lib/Map'

module Game
    class Director
        def initialize
            @map = Map.new
            @player = Player.new(200,200,@map.map)
        end

        def play
            @player.update
            Window.draw_tile(0,0,@map.map,@map.map_tile,0,0,@map.map[0].length,@map.map.length,-1)
        end
    end
end
