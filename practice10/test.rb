require 'dxruby'

Window.width = 800
Window.height = 600

tile = Sprite.new(0,400,Image.new(800,200,C_WHITE))
skycol = Sprite.new(0,0,Image.new(800,100))

Window.loop do
  sky.draw
  tile.play
end
