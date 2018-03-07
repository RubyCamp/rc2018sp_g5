class Tile2 < Sprite
    def initialize
      self.image = Image.new(800,200,C_WHITE)
      self.x = 1000
      self.y = 400
      @speed = 5
    end
    def update
      self.x -= @speed
      self.draw
      self.x = 800 if self.x < -1000
    end
end
