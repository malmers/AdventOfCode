# Advent of Code - Day three
require "matrix"

class Advent
  attr_accessor :invalid

  def initialize
    input = File.read('input')
    input = input.split("\n")
    input = input.each_slice(3).to_a
    input.map! do |triangles|
      triangles.map! { |row| row.split(" ").map! { |a| a.to_i } }
      triangles = triangles.transpose
    end

    input = input.flatten 1

    puts input.size

    input.select! do |triangle|
      triangle.sort!
      triangle[0] + triangle[1] > triangle[2]
    end

    puts "#{input}"
    puts input.size
  end
end

puts "Valid triangles:"
Advent.new
