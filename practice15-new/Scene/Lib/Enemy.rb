#encoding :Shift_JIS

class Enemy < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.load('Scene/images/enemy.png')
        @x_speed = 5
        @y_move = 8
    end

    def update
        self.draw
        self.x -= @x_speed
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
