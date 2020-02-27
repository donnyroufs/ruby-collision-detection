class Box 
    def initialize
        @x = rand(Window.width)
        @y = rand(Window.height)
        @x_velocity = (-5..5).to_a.sample 
        @y_velocity = (-5..5).to_a.sample 
        @color = Color.new('random')
    end

    def draw
        @square = Square.new(x: @x, y: @y, size: 15, color: @color)
    end

    def move
        @x = (@x + @x_velocity) % Window.width
        @y = (@y + @y_velocity) % Window.height
    end

    def check_for_collision
        if @square && collision_detected?
            @x_velocity = -@x_velocity
            @y_velocity = -@y_velocity
        end
    end

    def collision_detected?
        ($boxes - Array(self)).any? do |other_box|
            other_box.include?(@square)
        end
    end

    def include?(other_square)
        @square.contains?(other_square.x1, other_square.y1) ||
        @square.contains?(other_square.x2, other_square.y2) ||
        @square.contains?(other_square.x3, other_square.y3) ||
        @square.contains?(other_square.x4, other_square.y4) 
    end
end