# Advent of Code - Day eight
require "matrix"

class Advent

  attr_accessor :display

  def rect(col, row)
    row.times do |i|
      col.times do |j|
        @display[i][j] = '#'
      end
    end
  end

  def rotate_x index
    row = @display[index]
    row.insert 0, row[-1]
    @display[index] = row[0...-1]
  end

  def rotate_y index
    @display = @display.transpose
    rotate_x index
    @display = @display.transpose
  end

  def initialize
    cols = 50
    rows = 6
    @display = Matrix.build rows, cols do |row, col|
      '.'
    end
    @display = @display.to_a
    input = File.read('input')
    input = input.split("\n")
    input.each do |row|
      split = row.split ' '
      case split[0]
      when "rect"
        a, b = split[1].split 'x'
        rect a.to_i, b.to_i
      when "rotate"
        a = split[2].scan(/(\d+)/)
        a = a.join.to_i
        b = split[4].to_i
        # puts "#{a} : #{b}"
        case split[1]
        when "row"
          b.times { rotate_x a }
        when "column"
          b.times { rotate_y a }
        end
      end
    end

    @display.each { |e| puts "#{e.join}" }

    @display = @display.flatten
    @display.select! do |a|
      a == '#'
    end
    puts "Lights: #{@display.size}"
  end
end

puts "Code:"
Advent.new
