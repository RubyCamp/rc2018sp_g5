class Player < Sprite
    def initialize(x,y,map)
        super
        self.x = x
        self.y = y
        self.image = Image.new(32,32,C_RED)
        @y_prev = 32
        @gravity = 2
        @jump_ok = false
        @map = map
        @selfprev = x
    end

    #対応する配置パーツ番号を返す
    def collision_tile(x,y,array)
        return array[y/32][x/32]
    end

    def update(playershot)

        #重力の設定
        y_move = (self.y - @y_prev) + @gravity
        #すり抜け防止
        if y_move > 31
            y_move = 31
        end
        if y_move < -31
            y_move = -31
        end
        @y_prev = self.y
        self.y += y_move
        @gravity = 2

        #床衝突判定
        #キャラの右下端と左下端の座標が障害物パーツであった場合
        if collision_tile(self.x,self.y+31,@map) == 1 or collision_tile(self.x+31,self.y+31,@map) == 1
            self.y = self.y/32*32 #32で割って余りを切り捨て、再び掛けたとき、Yが32の倍数になるようにする
            @jump_ok = true #地面に接地しているのでジャンプを許可する
        else
            @jump_ok = false #地面に接地していないので、ジャンプは許可しない
        end


        #左右移動
        @selfprev = self.x
        if @kabe
            self.x += Input.x * 10
        else
            self.x == @selfprev
        end

        #右側壁衝突判定
        if collision_tile(self.x+31,self.y,@map) ==1 or collision_tile(self.x+31,self.y+31,@map) == 1
            self.x = self.x/32*32
            @kabe = false
        else
            @kabe = true
        end


        #ジャンプ
        if Input.key_push?(K_SPACE) && @jump_ok
            # JUMP_SOUND.play
            @gravity = -20
        end

        #弾
        if Input.key_push?(K_B)
          playershot << Playershot.new(self.x,self.y)
        end

        #描画
        self.draw
    end
end

class Playershot < Sprite
  def initialize(x,y)
    super
    self.x = x
    self.y = y
    self.image = Image.new(32,32,C_RED)
  end
  def update
    self.draw
    self.x += 10

    if self.x > 640
      self.vanish
    end
  end
  def shot
     self.vanish
  end
end
