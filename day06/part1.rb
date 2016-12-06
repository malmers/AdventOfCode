# Advent of Code - Day six

class Advent

  def initialize
    b = 0
    input = File.read('input')
    input = input.split("\n")
    input.map! { |e| e.each_char.to_a }
    input = input.transpose
    input.each do |row|
      u = row.uniq
      print u.max_by { |a| row.count a }
    end
  end
end

puts "Code:"
Advent.new
print "\n"
