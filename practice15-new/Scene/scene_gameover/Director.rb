module Gameover
    class Director
        def initialize(board)
            #Font
            @font_title = Font.new(30,'MSゴシック')
            @senser_all = Senser_all.new(board)
            @senser = Senser_Math.new

            @haikei = Haikei.new#背景インスタンス
            @gameover = Image.load('Scene/images/gameover.png')#タイトルの画像

        end

        def play
          @haikei.kumo_x ||= Scene.kumo_x_getter
          @haikei.tatemono_x ||= Scene.tatemono_x_getter

          @haikei.draw#背景を描画

          Window.draw(90,100,@gameover)#タイトルを表示
          Window.draw_font(200,350,'ボタンを押して終了',@font_title,:color=>[0,0,0])

            # Window.draw_font(200,100,'ゲームオーバー！',@font_title)
            # Window.draw_font(200,200,'エスケープキーで終わる',@font_title)

            sw_data = @senser.sw_puch(@senser_all.sw_now_getter)

            if sw_data == "ON_NAGA"
              #break
              exit
            end

        end
    end
end
