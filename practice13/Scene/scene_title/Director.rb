module Title
  class Director
    def initialize(board)
      #Font
      @font_title = Font.new(30,'MSゴシック')
      @senser_all = Senser_all.new(board)
      @flag = 0

      @title = Image.load('Scene/images/title.png')#タイトルの画像

    end

    def play

      Window.draw(100,80,@title)#タイトルを表示
      Window.draw_font(200,350,'盗まれたRubyを取り返そう！！',@font_title,:color=>[0,0,0])

      if Input.key_push?(K_SPACE)
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
