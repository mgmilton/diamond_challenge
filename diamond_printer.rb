require "pry"
class DiamondPrinter
  attr_reader :first,
              :last

  attr_accessor :letters

  def initialize(letter_1, letter_2)
    @first = letter_1 < letter_2 ? letter_1 : letter_2
    @last = letter_2 > letter_1 ? letter_2 : letter_1
    @letters = get_letters
  end

  def get_letters
    letters = []
    temp = first
    until temp == last
      letters << temp
      temp = temp.next
    end
    letters << last
  end

  def print
    0.upto(letters.length*2) do |x|
      num2 = 1
      half = (letters.length / 2)
      string = (" " * (half-num2) + "#{letters[x]}")
      pr string
    end
  end

  def top_print
    to_print = []
    num2 = 1
    num3 = 0
    half = (letters.length / 2)
    letters.each_with_index do |letter, index|
      if index == 0
        to_print << " " * ((letters.length*2)-half) + "#{letter}"
      else
        to_print << " " * ((letters.length*2)-half) + "#{letter}" + (" " * num3 * 2) + "#{letter}"
      end
      half += 1
      num2 += 1
      num3 += 1
    end
    to_print
  end

  def bottom_print
    to_print = []
    num2 = 0
    num3 = letters.length
    half = (letters.length * 2) - 3
    letters.each_with_index do |letter, index|
      spot = letters.length - index - 1
      if index == 0
        next
      else
        to_print << " " * ((letters.length*2)-half) + "#{letters[spot]}" + (" " * num3 * 2) + "#{letters[spot]}"
      end
      half -= 1
      num2 += 1
      num3 -= 1
    end
    to_print
  end

  def printer
    top_print.each do |x|
      puts x
    end
    bottom_print.each do |x|
      puts x
    end
  end
end


d = DiamondPrinter.new("A", "F")
d.printer
