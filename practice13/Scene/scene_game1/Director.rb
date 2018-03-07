require_relative '../Lib/Player'
require_relative '../Lib/Enemy'
require_relative '../Lib/Tile'
require_relative '../Lib/Haikei'#背景クラスのファイルを読み込み
require_relative '../Lib/Info/PowerGage'#弾を発射するためのパワーゲージクラスのファイル読み込み
require_relative '../Lib/Info/Life'#プレイヤーの残りライフクラス
require_relative '../senser/senser_all'
require_relative '../senser/ligh_f'

module Game
  class Director
    def initialize(board)
      @powergage = PowerGage.new #パワーゲージ
      @life = Life.new(3) #プレイヤーの残りライフ
      @haikei = Haikei.new#背景インスタンス
      @tile = Tile.new #床
      @player = Player.new #プレイヤー
      @playershots = [] #プレイヤーの弾
      @enemies = [] #敵配列
      @count = 0#敵キャラ生成用カウント
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
      Sprite.check(@tile,@player) #床とプレイヤーのめり込みチェック
      @player.update(@playershots,@light_data,Ligh_f.main(open_light,close_light,@board.analog_read(0)))#プレイヤーの弾の描画
      Sprite.update([@playershots,@enemies])#プレイヤーの弾配列と敵配列の描画
      Sprite.check(@playershots,@enemies)#プレイヤーの弾と敵配列の当たり判定

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

      #Ligh_f.main(open_light,close_light,@board.analog_read(0))

       #@senser_all.draw
    end
  end
end
