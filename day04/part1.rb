# Advent of Code - Day four

class Advent
  attr_accessor :invalid

  def initialize
    input = File.read('input')
    input = input.split("\n")
    input.map! do |rooms|
      parts = rooms.split(/-|\[/)
      parts[-1] = parts[-1].chomp "]"
      words = parts[0...-2].reduce { |a, b| a + b }.chars.sort
      count = Hash.new(0)
      count = words.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
      count = count.sort { |(a1, b1), (a2, b2)| b1 == b2 ? a1 <=> a2 : b2 <=> b1 }
      count.map! { |a, b| a }
      count = count.join
      [count, parts[-2], parts[-1]]
    end

    input.select! do |room|
      room[0][0..4] == room[-1]
    end

    input.map! do |room|
      room[1]
    end

    input = input.reduce 0 do |sum, room|
      sum + room.to_i
    end
    puts "#{input}"
  end
end

puts "Sum:"
Advent.new
