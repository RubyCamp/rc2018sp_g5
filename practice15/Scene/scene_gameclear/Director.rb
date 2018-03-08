module Gameclear
    class Director
        def initialize
            #Font
            @font_title = Font.new(30,'MSゴシック')
            @img = Image.new(800,600,C_WHITE)
        end

        def play
            Window.draw(0,0,@img,-1)#背景描画
            Window.draw_font(200,100,'ゲームクリアー！',@font_title,:color=>[0,0,0])
            Window.draw_font(200,200,'エスケープキーで終わる',@font_title,:color=>[0,0,0])

        end
    end
end
