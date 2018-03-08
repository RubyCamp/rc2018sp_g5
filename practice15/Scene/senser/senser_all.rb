class Senser_all
  def initialize(board)
    @board = board
  end

  def draw
    data = @board.analog_read(0)
    #p data
  end

  def light_now_getter
    @board.analog_read(0)
  end

  def distance_value_getter #距離センサの値を読む
    @board.analog_read(4) #距離センサーはA3に挿す
  end


end
