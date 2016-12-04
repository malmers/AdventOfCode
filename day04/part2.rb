# Advent of Code - Day four

class Advent
  attr_accessor :invalid

  def rot(string, rotations)
    letters = string.each_char.map do |letter|
      letter = ((((letter.ord - 97) + rotations) % 26) + 97).chr
    end
    letters.join
  end

  def initialize
    input = File.read('input')
    input = input.split("\n")
    input.map! do |rooms|
      parts = rooms.split(/\[/)
      # parts[0] = parts[0].split "-"
      parts[0].split "-"
    end

    input.each do |i|
      rot = i[-1].to_i
      i = i[0...-1]
      i.map! { |e| rot(e, rot) }
      puts "#{i} #{rot}"
    end
  end
end

puts "Sum:"
Advent.new
