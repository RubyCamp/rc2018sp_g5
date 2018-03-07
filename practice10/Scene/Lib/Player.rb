class Player < Sprite
    def initialize
        super
        self.x = 0
        self.y = 0
        self.image = Image.new(32,32,C_RED)
        @speed = 5
        @flg = 0
    end
    def update
        self.x += Input.x * @speed
        if @flg == 0
        self.y += Input.y * @speed
        end
        if Input.y == -1
          @flg = 0
        end
        self.draw
    end
    def hit
        self.y = 368
        @flg = 1
    end
end
