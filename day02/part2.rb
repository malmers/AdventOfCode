# Advent of Code - Day two

class Advent
  Point = Struct.new(:x, :y)

  attr_accessor :invalid

  def within_bound?(point)
    return false if
      point.x < 0 || point.x > 4 ||
      point.y < 0 || point.y > 4
    not @invalid.include? point
  end

  def print_code(point)
    code = [['x', 'x', '5', 'x', 'x'],
            ['x', 'A', '6', '2', 'x'],
            ['D', 'B', '7', '3', '1'],
            ['x', 'C', '8', '4', 'x'],
            ['x', 'x', '9', 'x', 'x']]
    print code[point.x][point.y]
  end

  def initialize
    self.invalid = [Point.new(0,0),
                    Point.new(1,0),
                    Point.new(3,0),
                    Point.new(4,0),
                    Point.new(0,1),
                    Point.new(4,1),
                    Point.new(0,3),
                    Point.new(4,3),
                    Point.new(0,4),
                    Point.new(1,4),
                    Point.new(3,4),
                    Point.new(4,4)]
    input = File.read('input')
    input = input.split("\n")

    input.each do |code|
      point = Point.new(0, 2)
      code.each_char do |direction|
        x = point.x
        y = point.y
        case direction
          when 'U' then y+=1
          when 'D' then y-=1
          when 'R' then x+=1
          when 'L' then x-=1
        end
        if within_bound? Point.new(x, y)
          point.x = x
          point.y = y
        end
      end
      print_code point
    end
  end
end

puts "The code:"
Advent.new
print "\n"
