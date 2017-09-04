class Bottles
  def song
    verses(99, 0)
  end

  def verses(from_verse, to_verse)
    from_verse.downto(to_verse).map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumberCreator.create_bottle_number(number)
    next_bottle_number = bottle_number.successor

    "#{bottle_number} ".capitalize + "of beer on the wall, " +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " + "#{next_bottle_number} of beer on the wall.\n"
  end
end

class BottleNumberCreator
  def self.create_bottle_number(number)
    case number
    when 6
      BottleNumberSix.new
    when 1
      BottleNumberOne.new
    when 0
      BottleNumberZero.new
    else
      BottleNumber.new(number)
    end
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
    'bottles'
  end

  def quantity
    number.to_s
  end

  def successor
    BottleNumberCreator.create_bottle_number(number - 1)
  end

  def action
    "Take one down and pass it around"
  end
end

class BottleNumberZero < BottleNumber
  def initialize()
    super(0)
  end

  def successor
    BottleNumberCreator.create_bottle_number(99)
  end

  def action
    'Go to the store and buy some more'
  end

  def quantity
    'no more'
  end
end

class BottleNumberOne < BottleNumber
  def initialize
    super(1)
  end

  def action
    "Take it down and pass it around"
  end

  def container
    "bottle"
  end
end

class BottleNumberSix < BottleNumber
  def initialize()
    super(6)
  end

  def container
    'six-pack'
  end

  def quantity
    '1'
  end
end
