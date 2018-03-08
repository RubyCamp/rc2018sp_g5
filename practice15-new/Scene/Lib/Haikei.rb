#ゲーム画面の背景を表示するクラス
#当たり判定はありません
class Haikei

  attr_accessor :kumo_x,:tatemono_x

  def initialize(kumo=nil,tatemono=nil)
    @haikei_aozora=Image.load('scene/images/aozora.png')

    @haikei_kumo=Image.load('scene/images/kumo.png')
    #@haikei_kumo.set_color_key(C_BLACK) #うまく反応しないため保留
    @kumo_x=kumo

    @haikei_tatemono=Image.load('scene/images/tatemono.png')
    @tatemono_x=tatemono

  end

  def draw
    Window.draw(0,0,@haikei_aozora)

    Window.draw(@kumo_x,0,@haikei_kumo)

    Window.draw(@tatemono_x,300,@haikei_tatemono)

  end
  def move
    @kumo_x += -10
    @kumo_x=Window.width if @kumo_x <= 0-300

    @tatemono_x += -20
    @tatemono_x=Window.width if @tatemono_x <= 0-300
  end
end
