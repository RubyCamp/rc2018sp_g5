class PowerGage
    #ゲージの中身 端ｘ座標
    @@gage_content_x = 400
    def initialize
        #ゲージ位置
        @x = 100
        @y = 10
        #ゲージの外枠
        @gage_outline = Image.new(300,30).box(0,0,300,30,C_WHITE)
        #ゲージのフォントの位置
        @font_x = 10
        @font_y = 10
        #フォント
        @font = Font.new(30)
    end

    def self.getPowerGage
        @@gage_content_x
    end

    def self.setPowerGage(power)
        @@gage_content_x += power
    end

    def update
        #ゲージのフォント
        Window.draw_font(@font_x,@font_y,"Power",@font)
        #ゲージの外枠を表示
        Window.draw(@x,@y,@gage_outline)
        #ゲージの中身の表示
        Window.draw_box_fill(100,10,@@gage_content_x,39,C_WHITE)
    end
end
