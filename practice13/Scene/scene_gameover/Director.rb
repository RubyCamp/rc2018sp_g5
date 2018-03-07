module Gameover
    class Director
        def initialize
            #Font
            @font_title = Font.new(30,'MSゴシック')
        end

        def play
            Window.draw_font(200,100,'ゲームオーバー！',@font_title)
            Window.draw_font(200,200,'エスケープキーで終わる',@font_title)

        end
    end
end
