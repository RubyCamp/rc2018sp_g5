require_relative '../Lib/Haikei'#背景クラスのファイルを読み込み

module Title
    class Director
        def initialize(board)
            #Font
            @font_title = Font.new(30,'MSゴシック')
            @senser_all = Senser_all.new(board)
            @flag = 0
            @senser = Senser_Math.new

            @haikei = Haikei.new(Window.width,Window.width)#背景インスタンス

            @title = Image.load('Scene/images/title.png')#タイトルの画像

        end

        def play
          @haikei.move#背景を動かす
          @haikei.draw#背景を描画

          Window.draw(100,80,@title)#タイトルを表示
          Window.draw_font(200,350,'盗まれたRubyを取り返そう！！',@font_title,:color=>[0,0,0])

           sw_data = @senser.sw(@senser_all.sw_now_getter)
           sw_puch_data = @senser.sw_puch(@senser_all.sw_now_getter)

           if sw_puch_data == "ON"
           #if Input.key_push?(K_SPACE)
             @flag += 1
           end

           if @flag == 0
             Window.draw_font(200,450,'コップをあけて',@font_title,:color=>[0,0,0])
             Window.draw_font(200,500,'ボタンを押してください',@font_title,:color=>[0,0,0])
             Scene.ligh_opent_setter(@senser_all.draw)
           elsif @flag == 1
             Window.draw_font(200,450,'コップをしめて',@font_title,:color=>[0,0,0])
             Window.draw_font(200,500,'ボタンでスタート',@font_title,:color=>[0,0,0])
             Scene.ligh_close_setter(@senser_all.draw)
           else
             Scene.kumo_x_setter(@haikei.kumo_x)
             Scene.tatemono_x_setter(@haikei.tatemono_x)

             Scene.move_to(:game1)
             BGM_SOUND.play
           end
              #Window.draw_font(200,100,'せまりくる奴からにげろ！',@font_title)
              #Window.draw_font(200,200,'スペースキーでスタート',@font_title)
            #if Input.key_push?(K_SPACE)
            #    Scene.move_to(:game1)
            #    BGM_SOUND.play
            #end



            #Scene.ligh_opent_setter(@senser_all.draw)
        end
    end
end
