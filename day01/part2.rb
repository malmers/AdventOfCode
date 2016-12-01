require "matrix"

# Advent of Code
# Solution based on linear algebra
def revisited
  puts "Enter input:"
  input = gets
  input = input.split(", ")

  position = Vector[0, 0]
  direction = Vector[0, 1]
  history = []

  input.each do |word|
    if word[0] == 'L'
      direction = Matrix[[0, -1],
                         [1, 0]] * direction
    else
      direction = Matrix[[0, 1],
                        [-1, 0]] * direction
    end

    diff = direction * word[1..-1].to_i

    diff[0].abs.times do ||
      position += direction
      if history.include? position
        return position
      end
      history << position
    end
    diff[1].abs.times do ||
      position += direction
      if history.include? position
        return position
      end
      history << position
    end
  end
end

position = revisited

print "First revisited location: "
puts position
puts position[0].abs + position[1].abs
