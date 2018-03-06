require_relative '../Lib/Player'
require_relative '../Lib/Enemy'
require_relative '../Lib/Tile'
require_relative '../Lib/Haikei'#背景クラスのファイルを読み込み

module Game
  class Director
    def initialize
      @haikei = Haikei.new#背景インスタンス
      @tile = Tile.new
      @player = Player.new
      @playershots = [] #プレイヤーの弾
      @enemies = [] #敵配列
      @count = 0#敵キャラ生成用
    end

    def play
      @haikei.draw#背景を描画
      @tile.update #床を描画
      Sprite.check(@tile,@player)
      @player.update(@playershots)
      Sprite.update([@playershots,@enemies])
      Sprite.check(@playershots,@enemies)

      if @count % 50 == 0
                @enemies << Enemy.new(600,352)
            end

        @count += 1
        Sprite.clean([@playershots,@enemies])

    end
  end
end
