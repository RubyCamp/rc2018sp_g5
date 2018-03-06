require_relative '../Lib/Player'
require_relative '../Lib/Map'
require_relative '../Lib/Haikei'#背景クラスのファイルを読み込み

module Game
  class Director
    def initialize
      @haikei = Haikei.new#背景インスタンス
      @map = Map.new
      @player = Player.new(200,200,@map.map)
      @playershots = []
    end

    def play
      @haikei.draw#背景を描画
      @player.update(@playershots)

      Sprite.update([@playershots])
      Window.draw_tile(0,0,@map.map,@map.map_tile,0,0,@map.map[0].length,@map.map.length,-1)
    end
  end
end
