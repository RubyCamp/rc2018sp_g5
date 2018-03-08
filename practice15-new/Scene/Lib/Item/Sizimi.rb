class Sizimi < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.load("Scene/images/sizimi.png").set_color_key(C_WHITE)#Image.new(32,32).box_fill(0,0,32,32,C_BLACK)
        
        @speed = 5
    end

    def update
        self.draw
        self.x -= @speed
        if self.x < 0
            self.vanish
        end
    end

    def hit
        self.vanish
    end
end
