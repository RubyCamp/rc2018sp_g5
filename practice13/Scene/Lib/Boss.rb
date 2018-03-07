class Boss < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.new(100,100,C_BLUE)
        @flg = 1 #ボスさん 0:UP移動 1:DOWN移動
    end

    def update
        self.draw
        if @flg == 1
            self.y += 10
        elsif @flg == 0
            self.y -= 10
        end
    end

    #移動上限に達したとき、DOWN移動に変更
    def hit
        @flg = 1
    end

    #床に接触したら、UP移動に変更
    def hit_tile
        @flg = 0
    end

    def hit_boss
        self.vanish
    end
end
