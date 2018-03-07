class BossLife
  attr_accessor :bosslife
    def initialize(bosslife)
        @bosslife = bosslife #ボスライフ
        @font = Font.new(30)  #font
    end

    def update
       #ライフ 表示用フォント
       Window.draw_font(400,50,"BOSS LIFE:#{@bosslife}",@font)
    end
end
