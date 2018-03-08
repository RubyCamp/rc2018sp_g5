#encoding :Shift_JIS

class Enemy < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.load('Scene/images/enemy.png')
        @y_move = 5
    end

    def update
        self.draw
        self.x -= 10
        self.y += @y_move

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
    def shot_tile
        @y_move -= rand(5) + 1
    end
    def shot_sky
        @y_move += rand(5) + 1
    end
end
