class Character
  @@roster = {}
  @@count = 0
  attr_accessor :name, :race, :_class, :level
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
  @@levelEXP = { _2: 300, _3: 900, _4: 2700, _5: 6500, _6: 14000, _7: 23000, _8: 34000, _9: 48000, _10: 64000, _11: 85000, _12: 100000,
     _13: 120000, _14: 140000, _15: 165000, _16: 195000, _17: 225000, _18: 265000, _19: 305000, _20: 355000 }
  def setLevel(exp)
    case exp
    when (0...300)
      @level = 1
    when (300...900)
      @level = 2
    when (900...2700)
      @level = 3
    when (2700...6500)
      @level = 4
    when (6500...14000)
      @level = 5
    when (14000...23000)
      @level = 6
    when (23000...34000)
      @level = 7
    when (34000...48000)
      @level = 8
    when(48000...64000)
      @level = 9
    when(64000...85000)
      @level = 10
    when(85000...100000)
      @level = 11
    when(100000...120000)
      @level = 12
    when(120000...140000)
      @level = 13
    when(140000...165000)
      @level = 14
    when(165000...195000)
      @level = 15
    when(195000...225000)
      @level = 16
    when(225000...265000)
      @level = 17
    when(265000...305000)
      @level = 18
    when(305000...355000)
      @level = 19
    when exp >= 355000
      @level = 20
    end
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
      setLevel(exp)
      # while @exp >= nextLvlEXP()
      #   addLevels(1)
      #   break if @level == 20
      # end
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
    # if num > @exp
    #   temp = num - @exp
    #   addEXP(temp)
    # elsif num < @exp
    #   temp = @exp - num
    #   removeEXP(temp)
    # end
    @exp = num
    self.setLevel(@exp)
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
    bit = false
    loop do
      names.each do |x|
        puts x
      end
      msg = "Please enter a character name from the list: "
      puts msg
      input = gets.chomp
      if names.include?(input)
        c = roster[input]
        puts c
        msg = "Please select an option: 
        1) Back to List
        2) Edit Current"
        puts msg
        choice = gets.to_i()
        case choice
        when 1
          break
        when 2
          msg = "Please select an option: 
          1) Set EXP"
          puts msg
          choice = gets.to_i()
          case choice
          when 1
            msg = "EXP: "
            puts msg
            exp = gets.to_i()
            c.setEXP(exp)
          end
        end
      else
        msg = "Please enter the name of an existing character."
        puts msg
      end
    end
  end

  def self.menu()
    welcome = 'Welcome to SpeedRPG Characters!'
    puts welcome
    options = "Please select an option:
    1) Create a New Character
    2) View/Edit an Existing Character
    3)  Quit"
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