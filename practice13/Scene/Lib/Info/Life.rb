class Life
    attr_accessor :life
    def initialize
        @life = 3 #プレイヤーライフ
        @font = Font.new(30)  #font
    end

    def update
      #ライフ 表示用フォント
       Window.draw_font(10,50,"LIFE:#{@life}",@font)
    end
end
