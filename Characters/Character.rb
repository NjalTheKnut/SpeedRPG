class Character
  @@roster = {}
  @@count = 0
  attr_accessor :name, :race, :_class, :level
  @@levelEXP = { _2: 300, _3: 900, _4: 2700, _5: 6500, _6: 14_000, _7: 23_000, _8: 34_000, _9: 48_000, _10: 64_000, _11: 85_000, _12: 100_000, _13: 120_000,
    _14: 140_000, _15: 165_000, _16: 195_000, _17: 225_000, _18: 265_000, _19: 305_000, _20: 355_000 }
  def initialize(name, race, _class, alignment, str, dex, con, int, wis, cha)
    @level = 1
    @exp = 0
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
    @@roster = @@roster.merge!("#{name}"=>self)
    @@count+=1
    #puts self
  end

  def self.get_count
    @@count
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

  def self.get_roster
    @@roster
  end

  def self.get_levelEXP
    @@levelEXP
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
      @@levelEXP[:"_#{@level + 1}"]
    end
  end

  def prevLvlEXP()
    if @level == 1
      0
    elsif @level == 20
      355_000
    else
      @@levelEXP[:"_#{@level}"]
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
    c = Character.new(name, race, _class, alignment, str, dex, con, int, wis, cha)
    #@@roster.each {|name| puts "#{self.name}=>#{self._class}"}
  end

  def self.view()
    roster = get_roster()
    names = roster.keys()
    names.each do |x|
      puts x
    end
    msg = "Please enter a character name from the list: "
    puts msg
    input = gets.chomp
    if names.include?(input)
      puts roster[input]
    else
      msg = "Please enter the name of an existing character."
      puts msg
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
      when 2
        view()
      when 3
        bit = true
      end
      break if bit == true
    end
  end

  c1 = Character.new('Randwulf','High Elf','Paladin','Neutral Good',15,12,10,15,12,14)
  c2 = Character.new('Bobo','Halfling','Rogue','True Neutral',8,15,12,15,12,8)
  c3 = Character.new('Haelan','High Elf','Cleric','Lawful Good',12,12,12,10,15,12)
#  @@roster = @@roster.merge!("#{c.name}"=>c)
  menu()
end
