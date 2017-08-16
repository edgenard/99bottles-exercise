class Bottles
  def song
    verses(99, 0)
  end

  def verses(from_verse, to_verse)
    from_verse.downto(to_verse).map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    Verse.new(number).verse
  end

end

class Verse
  attr_reader :number
  def initialize(number)
   @number = number
  end

  def verse
    case number
      when 0
        last_verse
      else
        regular_verse
    end
  end


  def last_verse
    <<-Verse
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    Verse
  end

  def regular_verse
    <<-Verse
#{bottle_phrase(number)} of beer on the wall, #{bottle_phrase(number)} of beer.
#{take_down_phrase((number == 1))} and pass it around, #{bottle_phrase(number - 1)} of beer on the wall.
    Verse
  end

  def bottle_phrase(bottle_number)
    case bottle_number
      when 6
        "1 six pack"
      when 1
        "#{bottle_number} bottle"
      when 0
        "no more bottles"
      else
        "#{bottle_number} bottles"
    end
  end

  def take_down_phrase(last_beer = true)
    "Take #{last_beer ? 'it' : 'one'} down"
  end
end
