class Enemy < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.new(32,32).box_fill(0,0,32,32,[0,0,255])
    end

    def update
        self.draw
        self.x -= 10

        if self.x < 0
            self.vanish
        end
    end

    def hit
        self.vanish
    end

    def shot
        self.vanish
    end
end
