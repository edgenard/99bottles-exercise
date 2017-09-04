class Bottles
  def song
    verses(99, 0)
  end

  def verses(from_verse, to_verse)
    from_verse.downto(to_verse).map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.new(number)
    next_bottle_number = bottle_number.successor

    "#{bottle_number} ".capitalize + "of beer on the wall, " +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " + "#{next_bottle_number} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def container
    case number
    when 6
      'six-pack'
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def quantity
    case number
    when 6
      '1'
    when 0
      'no more'
    else
      number.to_s
    end
  end

  def successor
    if number == 0
      BottleNumber.new(99)
    else
      BottleNumber.new(number - 1)
    end
  end

  def action
    case number
    when 0
      'Go to the store and buy some more'
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    case number
    when 1
      'it'
    else
      'one'
    end
  end


end
