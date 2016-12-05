# Advent of Code - Day five
require 'digest/md5'

class Advent
  attr_accessor :code

  def find_hash(input, step)
    while true do
      hash = Digest::MD5.hexdigest(input + step.to_s)
      if hash[0..4].each_char.all? { |e| e == "0" }
        return hash, step
      end
      step += 1
    end
  end

  def update_code(position, value)
    if position =~ /[0-7]/
      position = position.to_i
      if @code[position] == nil
        @code[position] = value
      end
    end
    @code.all? { |e| e != nil }
  end

  def initialize
    b = 0
    @code = Array.new(8) { |i| nil }
    input = File.read('input')
    while true do
      (a, b) = find_hash(input, b)
      break if update_code(a[5], a[6])
      b += 1
    end
    @code = @code.join
    puts "#{@code}"
  end
end

puts "Code:"
Advent.new
