require 'ruby2d'
require './box'

# Set the window size
set background: "white", width: 1200, height: 800

# Create 40 empty boxes
$boxes = Array.new(40) { Box.new } 

update do
    clear # Clears canvas
    $boxes.each do |box|
        box.check_for_collision
        box.move
        box.draw
    end
end

show