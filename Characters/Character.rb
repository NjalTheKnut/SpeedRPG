class Character
    def initialize(name, race, _class, alignment, str, dex, con, int, wis, cha)
        @level = 1
        @exp = 0
        @levelEXP = {_1:300,_2:900,_3:2700,_4:6500}
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
    end

    def to_s
        "\tName: #{@name}   Class: #{@_class}(#{@level})
        Race: #{@race}  Alignment: #{@alignment} EXP: #{@exp}
        STR: #{@str}
        DEX: #{@dex}
        CON: #{@con}
        INT: #{@int}
        WIS: #{@wis}
        CHA: #{@cha}"
    end

    def addLevels(num)
        @level += num
    end

    def addEXP(num)
        @exp += num
        if @exp >= @levelEXP[:"_#{@level}"]
            self.addLevels(1)
    end
end

c = Character.new('Randwulf','High Elf','Paladin','Neutral Good',15,12,10,15,12,14)
puts c
c.addEXP(300)
puts c
c.addEXP(300)
puts c
c.addEXP(300)
puts c
c.addEXP(300)
puts c
c.addEXP(300)
puts c
c.addEXP(300)
puts c
c.addEXP(300)
puts c
c.addEXP(300)
puts c
c.addEXP(300)
puts c

end