# Advent of Code - Day seven

class Advent

  def find_abas(string)
    abas = []
    while string.size > 2
      if string[0] == string[2] and string[0] != string[1]
        abas << string[0..2]
      end
      string = string[1..-1]
    end
    abas
  end

  def bab(string)
    string[1] + string[0] + string[1]
  end

  def initialize
    input = File.read('input')
    input = input.split("\n")
    input.select! do |row|
      nonets = row
      # puts "#{row}"
      hypernets = row.scan(/\[(\w*)\]/)
      hypernets.map! { |e| e.first }
      # puts "#{hypernets}"
      hypernets.each do |hyper|
        nonets = nonets.gsub("[#{hyper}]", '.')
      end
      nonets = nonets.split '.'

      hypernets.map! do |h|
        find_abas h
      end
      hypernets.flatten! 1

      nonets.map! do |n|
        find_abas n
      end
      nonets.flatten! 1

      nonets.any? { |e| hypernets.include? bab e }
    end
    puts "#{input.size}"
  end
end

puts "Code:"
Advent.new
print "\n"
