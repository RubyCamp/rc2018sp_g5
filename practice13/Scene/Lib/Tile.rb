class Tile < Sprite
    def initialize
      self.image = Image.new(1000,200,[160,82,45])
      self.x = 0
      self.y = 400
      @speed = 5
    end
    def update
      self.x -= @speed
      self.draw
      self.x = 800 if self.x < -1000
    end
end
