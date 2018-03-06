module Title
    class Director
        def initialize
            #Font
            @font_title = Font.new(30,'MSゴシック')
        end

        def play
            Window.draw_font(200,100,'せまりくる奴からにげろ！',@font_title)
            Window.draw_font(200,200,'スペースキーでスタート',@font_title)
            if Input.key_push?(K_SPACE)
                Scene.move_to(:game1)
            end
        end
    end
end
