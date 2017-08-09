class Bottles
  def song
    verses(99, 0)
  end

  def verses(*numbers)
    numbers.first.downto(numbers.last).to_a.map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    case number
      when 0
       last_verse
      else
        regular_verse(number)
    end
  end


  def last_verse
    <<-Verse
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
Verse
  end
  
  def regular_verse(number)
    <<-Verse
#{bottle_phrase(number)} of beer on the wall, #{bottle_phrase(number)} of beer.
#{take_down_phrase((number == 1))} and pass it around, #{bottle_phrase(number - 1)} of beer on the wall.
    Verse
  end

  def bottle_phrase(number)
    return "#{number} bottle#{'s' if number > 1}" if number > 0
     "no more bottles"
  end

  def take_down_phrase(last_beer = true)
    "Take #{last_beer ? 'it' : 'one'} down"
  end
end