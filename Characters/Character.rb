class Character
  @roster = []
  def initialize(name, race, _class, alignment, str, dex, con, int, wis, cha)
    @level = 1
    @exp = 0
    @levelEXP = { _2: 300, _3: 900, _4: 2700, _5: 6500, _6: 14_000, _7: 23_000, _8: 34_000, _9: 48_000, _10: 64_000, _11: 85_000, _12: 100_000, _13: 120_000,
    _14: 140_000, _15: 165_000, _16: 195_000, _17: 225_000, _18: 265_000, _19: 305_000, _20: 355_000 }
    @name = name
    @race = race
    @_class = _class
    @alignment = alignment
    @str = str
    @dex = dex
    @con = con
    @int = int
    @wis = wis
    @cha = cha
    #puts self
  end

  def to_s()
    "Name: #{@name}\tClass: #{@_class}(#{@level})
    \nRace: #{@race}\tAlignment: #{@alignment}\tEXP: #{@exp}
    \nSTR: #{@str}
    \nDEX: #{@dex}
    \nCON: #{@con}
    \nINT: #{@int}
    \nWIS: #{@wis}
    \nCHA: #{@cha}"
  end

  def addLevels(num)
    @level += num
  end

  def removeLevels(num)
    @level -= num
  end

  def nextLvlEXP()
    if @level == 1
      0
    elsif @level == 20
      355_000
    else
      @levelEXP[:"_#{@level + 1}"]
    end
  end

  def prevLvlEXP()
    if @level == 1
      0
    elsif @level == 20
      355_000
    else
      @levelEXP[:"_#{@level}"]
    end
  end

  def addEXP(num)
    if @level == 20
      msg = 'You are already at Max Level! (20)'
      puts msg
    else
      @exp += num
      while @exp >= nextLvlEXP()
        addLevels(1)
        break if @level == 20
      end
      puts self
    end
  end

  def removeEXP(num)
    if @level == 1
      msg = 'You are already at First Level! (1)'
      puts msg
    else
      @exp -= num
      while @exp < prevLvlEXP()
        removeLevels(1)
        break if @level == 1
      end
      puts self
    end
  end

  def setEXP(num)
    if num > @exp
      temp = num - @exp
      addEXP(temp)
    elsif num < @exp
      temp = @exp - num
      removeEXP(temp)
    end
  end

  def self.create()
    msg = 'Name: '
    print msg
    name = gets.chomp
    msg = "\nRace: "
    print msg
    race = gets.chomp
    msg = "\nClass: "
    print msg
    _class = gets.chomp
    msg = "\nAlignment: "
    print msg
    alignment = gets.chomp
    msg = "\nSTR: "
    print msg
    str = gets.chomp
    msg = "\nDEX: "
    print msg
    dex = gets.chomp
    msg = "\nCON: "
    print msg
    con = gets.chomp
    msg = "\nINT: "
    print msg
    int = gets.chomp
    msg = "\nWIS: "
    print msg
    wis = gets.chomp
    msg = "\nCHA: "
    print msg
    cha = gets.chomp
    Character.new(name, race, _class, alignment, str, dex, con, int, wis, cha)
  end

  def self.view()
    len = @roster.length()
    if len == 0
      msg = "There are no existing characters."
      puts msg
    else
      if len == 1
        msg = "There is currently only (#{len}) existing Character.  Enter '1' to view them."
        puts msg
      else
        msg = "There are currently (#{len}) existing characters.  Which should be opened? (Enter Number)"
        puts msg
      end
      n = gets.to_i()
      if n <= 0 || n > len
        msg = "Please enter a number between 1 and #{len}."
        puts msg
      else
        puts @roster[n-1]
      end
    end
  end

  def self.menu()
    welcome = 'Welcome to SpeedRPG Characters!'
    puts welcome
    options = "Please select an option:
    1) Create a New Character
    2) View/Edit an Existing Character
    3) Quit"
    bit = false
    loop do
      puts options
      choice = gets.to_i()
      case choice
      when 1
        c = Character.create()
        @roster.push(c)
      when 2
        view()
      when 3
        bit = true
      end
    
    
      break if bit == true
    end
    end

  c = Character.new('Randwulf','High Elf','Paladin','Neutral Good',15,12,10,15,12,14)
  @roster.push(c)
  menu()
end
