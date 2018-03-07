require_relative '../Lib/Player'
require_relative '../Lib/Enemy'
require_relative '../Lib/Boss'
require_relative '../Lib/Tile'
require_relative '../Lib/Sky' #ボスクラス制限
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
      @sky = Sky.new #ボス移動上限用
      @player = Player.new #プレイヤー
      @player = Player.new(@life) #プレイヤー
      @playershots = [] #プレイヤーの弾
      @enemies = [] #敵配列
      @count = 0#敵キャラ生成用カウント
      @boss = Boss.new(Window.width - 200,200)#ボス生成(テスト用)
    end

    def play
      @haikei.draw#背景を描画
      @tile.update #床を描画
      @sky.update #ボス移動上限天井
      Sprite.check(@tile,@player) #床とプレイヤーのめり込みチェック
      @player.update(@playershots)#プレイヤーの弾の描画
      Sprite.update([@playershots,@enemies])#プレイヤーの弾配列と敵配列の描画
      Sprite.check(@playershots,@enemies)#プレイヤーの弾と敵配列の当たり判定
      if Sprite.check(@enemies,@player,shot=:shot,hit=:hit2)#敵配列とプレイヤー配列の当たり判定
        @life.life -= 1
      end


      Sprite.check(@sky,@boss) #ボス移動上限天井とボスの当たり判定
      Sprite.check(@tile,@boss,shot= :shot,hit= :hit_tile) #ボスと床の当たり判定

      #敵出現
      if @count % 50 == 0
        @enemies << Enemy.new(600,352)
      end
      @count += 1

      #ボス出現 テスト用
      @boss.update

      #vanishされたspriteがあれば、消去
      Sprite.clean([@playershots,@enemies])

      #パワーゲージの表示
      @powergage.update
      #プレイヤーの残りライフの表示
      @life.update
      if @life.life == 0
          Scene.move_to(:gameover)
      end

    end
  end
end
