require_relative '../Lib/Player'
require_relative '../Lib/Enemy'
require_relative '../Lib/Tile'
require_relative '../Lib/Tile2'
require_relative '../Lib/sky'
require_relative '../Lib/Haikei'#背景クラスのファイルを読み込み
require_relative '../Lib/Info/PowerGage'#弾を発射するためのパワーゲージクラスのファイル読み込み
require_relative '../Lib/Info/Life'#プレイヤーの残りライフクラス

module Game
  class Director
    def initialize
      @powergage = PowerGage.new #パワーゲージ
      @life = Life.new(3) #プレイヤーの残りライフ
      @haikei = Haikei.new#背景インスタンス
      @tile = Tile.new #床
      @tile2 = Tile2.new
      @player = Player.new #プレイヤー
      @playershots = [] #プレイヤーの弾
      @enemies = [] #敵配列
      @count = 0#敵キャラ生成用カウント
      @sky = Sky.new#空の当たり判定(透明)
    end

    def play
      @haikei.draw#背景を描画
      @tile.update #床を描画
      @tile2.update
      Sprite.check(@tile,@player) #床とプレイヤーのめり込みチェック
      @player.update(@playershots)#プレイヤーの弾の描画
      Sprite.update([@playershots,@enemies])#プレイヤーの弾配列と敵配列の描画
      Sprite.check(@playershots,@enemies)#プレイヤーの弾と敵配列の当たり判定
      @sky.update
      Sprite.check(@sky,@player)
      #敵出現
      if @count % 50 == 0
        @enemies << Enemy.new(600,352)
      end
      @count += 1

      #vanishされたspriteがあれば、消去
      Sprite.clean([@playershots,@enemies])

      #パワーゲージの表示
      @powergage.update
      #プレイヤーの残りライフの表示
      @life.update

    end
  end
end
