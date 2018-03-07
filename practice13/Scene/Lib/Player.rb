class Player < Sprite
    def initialize
        super
        self.x = 0
        self.y = 0
        self.image = Image.new(32,32,C_RED)
        @y_prev = 32 #1フレーム前のy座標
        @gravity = 2#重力
        @jump_ok = false #ジャンプ許可
        @speed = 5
        @shot = 0
        @s_flag = 0
    end

    def update(playershot,light_now,ligh_hantei)

        #重力の設定
        y_move = (self.y - @y_prev) + @gravity
        @y_prev = self.y
        self.y += y_move
        @gravity = 2

        #左右移動
        self.x += Input.x * @speed

        #ジャンプ
        if Input.key_push?(K_SPACE) && @flg == 1
            JUMP_SOUND.play
            @gravity = -20
            @flg = 0
        end
        #p ligh_hantei
        #p @s_flag
        #弾の発射
        #if Input.key_push?(K_Z) && PowerGage.getPowerGage > 100
=begin
        if light_now == "open" && @s_flag == 0
          @shot = 1
          @s_flag = 1
        elsif light_now == "open" && @s_flag == 1
          @shot = 0
        elsif light_now == "colse" && @s_flag == 0
          @s_flag = 0
        else
          @shot = 0
        end
=end
        if ligh_hantei == "open" && PowerGage.getPowerGage > 100
          PLAYER_SHOT_SOUND.play #サウンド
          PowerGage.setPowerGage(-10)#powerを減らす
          playershot << Playershot.new(self.x,self.y)
        end

        #描画
        self.draw
    end

    def hit
        self.y = 468
        @flg = 1
    end

    def hit2
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
     EXPLOSION_SOUND.play
     self.vanish
  end
end
