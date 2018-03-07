require_relative '../Lib/Player'
require_relative '../Lib/Enemy'
require_relative '../Lib/Boss'
require_relative '../Lib/Tile'
<<<<<<< HEAD
require_relative '../Lib/Tile2'
require_relative '../Lib/Sky' #ボスクラス制限
=======
>>>>>>> 1364b718b92ac28965ec3f9bf7c7c70a7ba14e46
require_relative '../Lib/Haikei'#背景クラスのファイルを読み込み
require_relative '../Lib/Sky'
require_relative '../Lib/Info/PowerGage'#弾を発射するためのパワーゲージクラスのファイル読み込み
<<<<<<< HEAD
require_relative '../Lib/Info/Life'#プレイヤーの残りライフ
require_relative '../Lib/Info/BossLife'#ボスの残りライフ
=======
require_relative '../Lib/Info/Life'#プレイヤーの残りライフクラス
require_relative '../Lib/Info/BossLife'#ボスの残りライフクラス
require_relative '../senser/senser_all'
require_relative '../senser/ligh_f'
>>>>>>> 1364b718b92ac28965ec3f9bf7c7c70a7ba14e46

module Game
  class Director
    def initialize(board)
      @powergage = PowerGage.new #パワーゲージ
<<<<<<< HEAD
      @life = Life.new(3) #プレイヤーの残りライフ
      @bosslife = BossLife.new(100) #ボスのライフ
      @haikei = Haikei.new#背景インスタンス
      @tile = Tile.new #床
      @tile2 = Tile2.new #床
      @sky = Sky.new #ボス移動上限用
      @player = Player.new(@life) #プレイヤー
=======
      @life = Life.new #プレイヤーの残りライフ
      @haikei = Haikei.new#背景インスタンス
      @tile = Tile.new #床
      @player = Player.new #プレイヤー
>>>>>>> 1364b718b92ac28965ec3f9bf7c7c70a7ba14e46
      @playershots = [] #プレイヤーの弾
      @enemies = [] #敵配列
      @boss = Boss.new(400,200) #ボス
      @boss_life = Bosslife.new(200)#ボスのライフ
      @count = 0#敵キャラ生成用カウント
      @board = board
      @senser_all = Senser_all.new(board)
      @light_now = 0
      @sky = Sky.new
    end

    def play
      @light_now = @senser_all.light_now_getter
      open_light = Scene.ligh_open_getter#光センサ取得
      close_light = Scene.ligh_close_getter#光センサ取得

      @haikei.draw#背景を描画
      @tile.update #床を描画
<<<<<<< HEAD
      @tile2.update
=======

>>>>>>> 1364b718b92ac28965ec3f9bf7c7c70a7ba14e46
      @sky.update #ボス移動上限天井
      @player.update(@playershots,@light_data,Ligh_f.main(open_light,close_light,@board.analog_read(0)))#プレイヤーの弾の描画
      Sprite.check(@tile,@player) #床とプレイヤーのめり込みチェック
      Sprite.update([@playershots,@enemies])#プレイヤーの弾配列と敵配列の描画
      Sprite.check(@playershots,@enemies)#プレイヤーの弾と敵配列の当たり判定
      if Sprite.check(@enemies,@player,shot=:shot,hit=:hit2) #敵配列とプレイヤー配列の当たり判定
        @life.life -= 1
      end
      Sprite.check(@playershots,@boss,shot= :shot,hit = :hitboss) #プレイヤーの弾配列とボスの当たり判定


      Sprite.check(@sky,@boss) #ボス移動上限天井とボスの当たり判定
      Sprite.check(@tile,@boss,shot= :shot,hit= :hit_tile) #ボスと床の当たり判定

      #ボスとプレイヤーの弾の当たり判定
      if Sprite.check(@playershots,@boss,shot= :shot,hit= :hit_boss)
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

      #Gameover処理
      if @life.life == 0
          BGM_SOUND.stop
          Scene.move_to(:gameover)
      end


      #Ligh_f.main(open_light,close_light,@board.analog_read(0))

       #@senser_all.draw
    end
  end
end
