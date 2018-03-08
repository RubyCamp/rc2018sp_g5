#ジャンプするかを判定を返すモジュール

module Distance_senser

  def main(distance_value)
    if distance_value <= 300
      true
    else
      false
    end
  end

  module_function :main
end
