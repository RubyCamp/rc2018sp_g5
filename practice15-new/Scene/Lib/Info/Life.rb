class Life
  attr_accessor :life
    def initialize(life)
       @life = life #プレイヤーライフ
       @font = Font.new(30)  #font
       @img = Image.load('scene/images/life.png',0,0,30,30)
    end

    def update
       @life.times do |i|
         lx = i * 30
         Window.draw(lx,50,@img)
       end
       #ライフ 表示用フォント
       #Window.draw_font(10,50,"LIFE:#{@life}",@font)
    end
end
