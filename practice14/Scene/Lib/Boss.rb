class Boss < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.load('scene/images/Boss.png')
        @flg = 1 #ボスさん 0:UP移動 1:DOWN移動
    end

    def update
        self.draw
        if @flg == 1
            self.y += 5
        elsif @flg == 0
            self.y -= 5
        end
    end

    def hit
        @flg = 1
    end

    def hit_tile
        @flg = 0
    end

    def hit_p
        #ボスのHPを減らす
    end
end
