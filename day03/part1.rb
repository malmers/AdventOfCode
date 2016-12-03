# Advent of Code - Day three

class Advent
  attr_accessor :invalid

  def initialize
    input = File.read('input')
    input = input.split("\n")
    input.select! do |triangle|
      parts = triangle.split(" ")
      parts.map! { |part| part.to_i }
      parts.sort!
      parts[0] + parts[1] > parts[2]
    end
    puts input.size
  end
end

puts "Valid triangles:"
Advent.new
