class Player < Sprite
    def initialize(life)
        super
        self.x = 0
        self.y = 0
        self.image = Image.load('Scene/images/player1.png')
        @y_prev = self.y #1フレーム前のy座標
        @gravity = 2#重力
        @jump_ok = false #ジャンプ許可
        @speed = 5
        @life = life
        @p_img = [Image.load('Scene/images/player1.png'),
          Image.load('Scene/images/player2.png'),
          Image.load('Scene/images/player3.png'),
          Image.load('Scene/images/player2.png')]
        @ani = 0
        @anm = 0
        @dy = 0
        end

        def update(playershot,playershot2,light_now,ligh_hantei,distance_senser_hantei,sw_hantei, oto_hantei)
            #重力の設定
            y_move = (self.y - @y_prev) + @gravity
            @y_prev = self.y
            if self.y < 340
            @dy = y_move
            self.y += @dy
            else
            @flg = 1
            end
            if @gravity == -20
              self.y -= 30
            @flg = 0
            end
            @gravity = 2

        #左右移動
        self.x += Input.x * @speed

        #ジャンプ スペースキー用
         if Input.key_push?(K_SPACE) && @flg == 1
             JUMP_SOUND.play
             @gravity = -20
             @flg = 0
         end

        #ジャンプ　距離センサー用
        if distance_senser_hantei == true && @flg == 1
            JUMP_SOUND.play
            @gravity = -20
            @flg = 0
        end

        # #弾の発射
        # if ligh_hantei == "open" && PowerGage.getPowerGage > 100
        #   PLAYER_SHOT_SOUND.play #サウンド
        #   PowerGage.setPowerGage(-10)#powerを減らす
        #   playershot << Playershot.new(self.x,self.y)
        # end

        #弾の発射　スイッチ
        if sw_hantei == "ON" && PowerGage.getPowerGage >= 110 && ligh_hantei == "close"
          PLAYER_SHOT_SOUND.play #サウンド
          PowerGage.setPowerGage(-10)#powerを減らす
          playershot << Playershot.new(self.x,self.y)
        end

        # #弾の発射2
        # if ligh_hantei == "open" && PowerGage.getPowerGage >= 300 && Input.key_push?(K_Z)
        #   PLAYER_SHOT_SOUND.play #サウンド
        #   PowerGage.setPowerGage(-300)#powerを減らす
        #   playershot2 << Playershot2.new(self.x + 50,self.y + 10)
        # end

        #弾の発射2
        if PowerGage.getPowerGage >= 400 && oto_hantei == "ON" && ligh_hantei == "close"
          PLAYER_SHOT_SOUND.play #サウンド
          PowerGage.setPowerGage(-300)#powerを減らす
          playershot2 << Playershot2.new(self.x + 50,self.y + 10)
        end

        if ligh_hantei == "open"
          PowerGage.setPowerGage(1)
        end

        @ani += 1
        if @ani == 8
            @ani = 0
            @anm += 1
        end
        if @anm == 4
            @anm = 0
        end
        self.image = @p_img[@anm]

        #描画
        self.draw
    end

    def hit
        self.y = 340
        @flg = 1
    end

    def hit2
        #ここでは何もしない
    end
end

class Playershot < Sprite
  def initialize(x,y)
    super
    self.x = x
    self.y = y
    self.image = Image.new(20,20).circle_fill(10,10,10,C_WHITE)
  end

  def update
    self.draw
    self.x += 10

    if self.x > Window.width
      self.vanish
    end
  end

  def shot
     EXPLOSION_SOUND.play
     self.vanish
  end
end

class Playershot2 < Sprite
  def initialize(x,y)
    super
    self.x = x
    self.y = y
    self.image = Image.new(300,50).box_fill(0,0,300,50,C_YELLOW)
  end

  def update
    self.draw
    self.x += 10

    if self.x > Window.width
      self.vanish
    end
  end

  def shot
     EXPLOSION_SOUND.play
  end
end
