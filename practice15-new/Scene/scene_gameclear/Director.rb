module Gameclear
    class Director
        def initialize(board)
            #Font
            @font_title = Font.new(30,'MSゴシック')
            @img = Image.new(800,600,C_WHITE)
            @senser_all = Senser_all.new(board)
            @senser = Senser_Math.new
        end

        def play
            Window.draw(0,0,@img,-1)#背景描画
            Window.draw_font(200,100,'ゲームクリアー！',@font_title,:color=>[0,0,0])
            Window.draw_font(200,200,'エスケープキーで終わる',@font_title,:color=>[0,0,0])
            sw_data = @senser.sw_puch(@senser_all.sw_now_getter)
            p sw_data
            if sw_data == "ON_NAGA"
              #break
              exit
            end


        end
    end
end
