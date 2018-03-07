class Boss < Sprite
    def initialize(x,y)
        super
        self.x = x
        self.y = y
        self.image = Image.new(100,100,C_BLUE)
    end

    def update
        self.draw
    end
end
