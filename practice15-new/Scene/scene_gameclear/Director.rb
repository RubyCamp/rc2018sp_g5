module Gameclear
  class Director
    def initialize(board)
      #Font
      @font_title = Font.new(30,'MSゴシック')
      #@img = Image.new(800,600,C_WHITE) #旧白い背景
      @senser_all = Senser_all.new(board)
      @senser = Senser_Math.new

      @haikei = Haikei.new#背景インスタンス
      @clear = Image.load('Scene/images/clear.png')#タイトルの画像
      @playerruby = Image.load('Scene/images/player_ruby')#playerの画像

    end

    def play
      @haikei.kumo_x ||= Scene.kumo_x_getter
      @haikei.tatemono_x ||= Scene.tatemono_x_getter

      @haikei.draw#背景を描画
      Window.draw(180,100,@clear)#タイトルを表示
      Window.draw(360,300,@playerruby)#playerを表示
      Window.draw_font(200,450,'ボタンを押して終了',@font_title,:color=>[0,0,0])


      #Window.draw(0,0,@img,-1)#背景描画　旧白い背景
      # Window.draw_font(200,100,'ゲームクリアー！',@font_title,:color=>[0,0,0])
      # Window.draw_font(200,200,'エスケープキーで終わる',@font_title,:color=>[0,0,0])
      sw_data = @senser.sw_puch(@senser_all.sw_now_getter)
      if sw_data == "ON_NAGA"
        #break
        exit
      end


    end
  end
end
