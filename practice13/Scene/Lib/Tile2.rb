class Tile2 < Sprite
    def initialize
      self.image = Image.new(1000,100,C_WHITE)
      self.x = 700
      self.y = 500
      @speed = 5
    end
    def update
      self.x -= @speed
      self.draw
      self.x = 800 if self.x < -1000
    end
end
