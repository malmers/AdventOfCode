# Advent of Code - Day seven

class Advent

  def contain_abba?(string)
    return false if string.size < 4
    if string[0] == string[3] and string[1] == string[2] and string[0] != string[1]
      return true
    end
    return contain_abba? string[1..-1]
  end

  def initialize
    input = File.read('input')
    input = input.split("\n")
    input.select! do |row|
      nonets = row
      hypernets = row.scan(/\[(\w*)\]/)
      hypernets.map! { |e| e.first }
      hypernets.each do |hyper|
        nonets = nonets.gsub("[#{hyper}]", '.')
      end
      nonets = nonets.split '.'

      nonets.any? { |e| contain_abba? e } and
      hypernets.none? { |e| contain_abba? e }
    end
    puts "#{input.size}"
  end
end

puts "Code:"
Advent.new
