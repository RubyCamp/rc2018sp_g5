<<<<<<< HEAD
class BossLife
=======
class Bosslife
>>>>>>> 1364b718b92ac28965ec3f9bf7c7c70a7ba14e46
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
