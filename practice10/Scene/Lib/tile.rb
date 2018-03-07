class Tile < Sprite
    def initialize
      self.image = Image.new(800,200,[160,82,45])
      self.x = 0
      self.y = 400
    end
    def update
      self.draw
    end
end
