# Advent of Code - Day five
require 'digest/md5'

class Advent

  def find_hash(input, step)
    while true do
      hash = Digest::MD5.hexdigest(input + step.to_s)
      if hash[0..4].each_char.all? { |e| e == "0" }
        return hash, step
      end
      step += 1
    end
  end

  def initialize
    b = 0
    input = File.read('input')
    8.times do
      (a, b) = find_hash(input, b)
      print a[5]
      b += 1
    end
  end
end

puts "Code:"
Advent.new
print "\n"
