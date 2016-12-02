require "matrix"

# Advent of Code
# Solution based on linear algebra

puts "Enter input:"
input = gets
input = input.split(", ")

position = Vector[0, 0]
direction = Vector[0, 1]

input.each do |word|
  if word[0] == 'L'
    direction = Matrix[[0, -1],
                       [1, 0]] * direction
  else
    direction = Matrix[[0, 1],
                      [-1, 0]] * direction
  end

  position += direction * word[1..-1].to_i
end

print "Distance: "
puts position[0].abs + position[1].abs
