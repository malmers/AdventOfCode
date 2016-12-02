# Advent of Code - Day two

@x = 1
@y = 1

def within_bound
  @x+=1 if @x < 0
  @x-=1 if @x > 2
  @y+=1 if @y < 0
  @y-=1 if @y > 2
end

def print_code
  code = [[7,4,1],
          [8,5,2],
          [9,6,3]]
  puts "The code:"
  print code[@x][@y]
  print "\n"
end

def main
  puts "Enter input:"
  input = File.read('input')
  input = input.split("\n")

  input.each do |code|
    code.each_char do |direction|
      case direction
        when 'U' then @y+=1
        when 'D' then @y-=1
        when 'R' then @x+=1
        when 'L' then @x-=1
      end
      within_bound
    end
    print_code
  end
end

main
