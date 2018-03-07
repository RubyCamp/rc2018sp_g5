class Enemy < Sprite
  def initialize
    self.image = Image.new(50,50,C_RED)
    self.x = 700
    self.y = 700
  end

  def update
    self.y += 5
    self.draw
  end
end
