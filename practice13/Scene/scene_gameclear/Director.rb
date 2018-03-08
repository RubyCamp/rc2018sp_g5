module Gameclear
    class Director
        def initialize
            #Font
            @font_title = Font.new(30,'MSゴシック')
            @clear = Image.load('Scene/images/clear.png')#タイトルの画像

        end

        def play

            Window.draw(180,100,@clear)#タイトルを表示
            Window.draw_font(200,350,'ボタンを押して終了',@font_title,:color=>[0,0,0])
        end
    end
end
