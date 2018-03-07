require 'dxruby'

Window.width = 800
Window.height = 600
class Tile < Sprite
    def initialize
      self.image = Image.new(800,200,[160,82,45])
      self.x = 0
      self.y = 400
    end

    def play
      self.x -= 5
      self.draw
        if self.x < 768
          self.draw
        end
    end
end

tile = Tile.new
Window.loop do

tile.draw

end
