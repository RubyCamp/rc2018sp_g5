module Gameover
    class Director
        def initialize(board)
            #Font
            @font_title = Font.new(30,'MSゴシック')
            @senser_all = Senser_all.new(board)
            @senser = Senser_Math.new
        end

        def play
            Window.draw_font(200,100,'ゲームオーバー！',@font_title)
            Window.draw_font(200,200,'エスケープキーで終わる',@font_title)

            sw_data = @senser.sw(@senser_all.sw_now_getter)

            if sw_data == "ON"
              #break
              exit
            end

        end
    end
end
