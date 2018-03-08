module Gameover
    class Director
        def initialize
            #Font
            @font_title = Font.new(30,'MSゴシック')
            @gameover = Image.load('Scene/images/gameover.png')#タイトルの画像

        end

        def play
          Window.draw(90,100,@gameover)#タイトルを表示
          Window.draw_font(200,350,'ボタンを押して終了',@font_title,:color=>[0,0,0])

        end
    end
end
