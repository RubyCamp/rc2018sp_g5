class Sizimi < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.load("Scene/images/sizimi.png")
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
