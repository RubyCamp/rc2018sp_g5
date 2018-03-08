class Sky < Sprite
    def initialize
        self.image = Image.new(800,100,C_RED)
        self.x = 0
        self.y = 0
    end

    def update
        self.draw
    end
end
