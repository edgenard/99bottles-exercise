class Bottles
  def verse(number)
    <<-Verse
#{bottle_phrase(number)} of beer on the wall, #{bottle_phrase(number)} of beer.
#{take_phrase(number - 1)} and pass it around, #{bottle_phrase(number - 1)} of beer on the wall.
    Verse
  end


  def first_line_of_verse

  end

  def second_line_of_verse

  end

  def bottle_phrase(number)
    return "#{number} bottles" if number > 1
    return "no more bottles" if number < 1
    "#{number} bottle"
  end

  def take_phrase(number)
    return "Take one down" if number >= 0
    return "Go to the store and buy some more, 99 bottles of beer on the wall." if number < 0
    "Take it down"
  end
end