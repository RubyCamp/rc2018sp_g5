class Senser_Math
  def initialize
    @flag = 0
    @frm = 0
    @i = 0
    @data = []
  end

  def light(open_light,close_light,board)
    #光センサー計算
    median = ((open_light - close_light) / 2) + close_light
       if median < board
         "open"
       else
         "close"
       end
  end

  def sw(board)
    #p fram
    if board == 1
      "ON"
    else
      "OFF"
    end
  end

  def sw_puch(board)
    #p @flag
    #p board
    if board == 1 && @flag == 0
      retrun_data = "ON"
      @flag = 1
    elsif board == 1 && @flag == 1#長押しマン
      retrun_data = "ON_NAGA"
    elsif board == 0 && @flag == 1
      @flag = 0
      retrun_data = "OFF_NAGA"
    else
      retrun_data = "OFF"
    end

    return retrun_data
  end

  def oto_puch(board)
    #p @flag
    #p board



    if board > 450
      retrun_data = "ON"
    else
      retrun_data = "OFF"
    end


    return retrun_data
  end
  # module_function :light
  # module_function :sw
  # module_function :sw_puch
end
