class Player < Sprite
    def initialize
        super
        self.x = 0
        self.y = 0
        self.image = Image.new(32,32,C_RED)
        @y_prev = 32
        @gravity = 2
        @jump_ok = false
        @selfprev = 0
        @speed = 5
    end

    def update(playershot)

        #重力の設定
        y_move = (self.y - @y_prev) + @gravity
        @y_prev = self.y
        self.y += y_move
        @gravity = 2

        #左右移動
        self.x += Input.x * @speed

        #ジャンプ
        if Input.key_push?(K_SPACE) && @flg == 1
            # JUMP_SOUND.play
            @gravity = -20
            @flg = 0
        end

        #弾の発射
        if Input.key_push?(K_Z) && PowerGage.getPowerGage > 100
          SHOT_SOUND.play #サウンド
          PowerGage.setPowerGage(-10)#powerを減らす
          playershot << Playershot.new(self.x,self.y)
        end

        #描画
        self.draw
    end

    def hit
        self.y = 368
        @flg = 1
    end
end

class Playershot < Sprite
  def initialize(x,y)
    super
    self.x = x
    self.y = y
    self.image = Image.new(20,20).circle_fill(10,10,10,C_RED)
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
