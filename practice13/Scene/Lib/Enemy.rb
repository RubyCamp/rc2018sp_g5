class Enemy < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.load('Scene/images/enemy.png')
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
