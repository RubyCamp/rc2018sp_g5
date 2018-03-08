class BossLife
  attr_accessor :bosslife
    def initialize(bosslife)
       @bosslife = bosslife #ボスライフ
       @font = Font.new(30)  #font
       @img = Image.load('scene/images/life.png',0,0,30,30)
    end

    def update
      @life.times do |i|
          lx = i * 30
          Window.draw(lx,50,@img)
      end
       #ライフ 表示用フォント
       Window.draw_font(400,50,"BOSS LIFE:#{@bosslife}",@font)
    end
end
