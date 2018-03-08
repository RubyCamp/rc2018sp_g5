class Senser_all
  def initialize(board)
    @board = board
    @frm = [0,0,0,0]
  end

  def draw
    data = @board.analog_read(0)
    #p data
  end

  def light_now_getter
    # @frm[1] += 1
    # if @frm[1] > 20
       data = @board.analog_read(0)
    #   @frm[1] = 0
    # else
    #   data = 0
    # end

    return data
  end

  def distance_value_getter #距離センサの値を読む
    @board.analog_read(4) #距離センサーはA3に挿す
  end

  def sw_now_getter
    # @frm[2] += 1
    # if @frm[2] > 20
       data = @board.digital_read(2)
    #   @frm[2] = 0
    # else
    #   data = 0
    # end

    #data = @board.digital_read(2)

    return data
  end

  def oto_now_getter
    # @frm[3] += 1
    # if @frm[3] > 20
       data = @board.analog_read(1)
    #   @frm[3] = 0
    # else
    #   data = 0
    # end

    return data
  end


end
