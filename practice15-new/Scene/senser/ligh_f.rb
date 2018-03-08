module Ligh_f
  def main(open_light,close_light,board)
    #光センサー計算
    median = ((open_light - close_light) / 2) + close_light
       if median < board
         "open"
       else
         "close"
       end
  end
  module_function :main
end
