class Boss < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.load('scene/images/Boss.png')
        @flg = 1 #ボスさん 0:UP移動 1:DOWN移動
        @ruby_img = Image.load('scene/images/ruby.png')
        @ruby_img.set_color_key(C_WHITE)
    end

    def update
        Window.draw(self.x + 50,self.y - 15,@ruby_img,1)
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
