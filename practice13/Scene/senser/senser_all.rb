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



end
