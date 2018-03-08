require_relative '../Lib/Player'
require_relative '../Lib/Enemy'
require_relative '../Lib/Boss'
require_relative '../Lib/Tile'
require_relative '../Lib/Tile2'
require_relative '../Lib/Sky' #ボスクラス制限
require_relative '../Lib/Haikei'#背景クラスのファイルを読み込み
require_relative '../Lib/Info/PowerGage'#弾を発射するためのパワーゲージクラスのファイル読み込み
require_relative '../Lib/Info/Life'#プレイヤーの残りライフクラス
require_relative '../Lib/Info/Bosslife'#ボスの残りライフクラス
require_relative '../senser/senser_all'
require_relative '../senser/ligh_f'
require_relative '../senser/distance_senser'#距離センサ


module Game
  class Director
    def initialize(board)
      @powergage = PowerGage.new #パワーゲージ
      @life = Life.new(5) #プレイヤーの残りライフ
      @bosslife = BossLife.new(3)#ボスの残りライフ
      @haikei = Haikei.new#背景インスタンス
      @tile = Tile.new #床
      #@tile2 = Tile2.new #床
      @sky = Sky.new #ボス移動上限用
      @player = Player.new(@life) #プレイヤー
      @playershots = [] #プレイヤーの弾
      @playershots2 = [] #プレイヤーの弾2
      @enemies = [] #敵配列
      @count = 0#敵キャラ生成用カウント
      @boss = Boss.new(Window.width - 200,200)#ボス生成(テスト用)
      @board = board
      @senser_all = Senser_all.new(board)
      @light_now = 0

    end

    def play
     @light_now = @senser_all.light_now_getter
     open_light = Scene.ligh_open_getter#光センサ取得
     close_light = Scene.ligh_close_getter#光センサ取得

      @haikei.draw#背景を描画
      @tile.update #床を描画
      #@tile2.update #床を描画
      @sky.update #ボス移動上限天井
      Sprite.check(@tile,@player) #床とプレイヤーのめり込みチェック
      @player.update(@playershots,@playershots2,@light_data,Ligh_f.main(open_light,close_light,@board.analog_read(0)),Distance_senser.main(@senser_all.distance_value_getter))#プレイヤーの弾の描画
      Sprite.update([@playershots,@playershots2,@enemies])#プレイヤーの弾配列と敵配列の描画
      Sprite.check(@playershots,@enemies)#プレイヤーの弾と敵配列の当たり判定
      Sprite.check(@playershots2,@enemies)#プレイヤーの弾2と敵配列の当たり判定
      if Sprite.check(@enemies,@player,shot=:shot,hit=:hit2)#敵配列とプレイヤー配列の当たり判定
        @life.life -= 1
      end


      Sprite.check(@sky,@boss) #ボス移動上限天井とボスの当たり判定
      Sprite.check(@tile,@boss,shot= :shot,hit= :hit_tile) #ボスと床の当たり判定
      Sprite.check(@tile2,@boss,shot= :shot,hit= :hit_tile) #ボスと床の当たり判定
      #ボスとプレイヤーの弾の当たり判定
      if Sprite.check(@playershots,@boss,shot= :shot,hit= :hit_p)
        @bosslife.bosslife -= 1
      end
      #ボスとプレイヤーの弾2の当たり判定
      if Sprite.check(@playershots2,@boss,shot= :shot,hit= :hit_p)
        @bosslife.bosslife -= 1
      end

      #敵出現
      if @count % 50 == 0
        @enemies << Enemy.new(600,352)
      end
      @count += 1

      #ボス出現
      @boss.update

      #vanishされたspriteがあれば、消去
      Sprite.clean([@playershots,@enemies])

      #パワーゲージの表示
      @powergage.update
      #プレイヤーの残りライフの表示
      @life.update
      #Bossの残りライフの表示
      @boss_life

      #Gameover処理
      if @life.life == 0 || @player.y > Window.height
          BGM_SOUND.stop
          Scene.move_to(:gameover)
      end

      #ボスの残りライフの表示
      @bosslife.update
      if @bosslife.bosslife == 0
          Scene.move_to(:gameclear)#gameoverは仮
      end

    end
  end
end
