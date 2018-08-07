class Character
    def initialize(name, race, _class, alignment, str, dex, con, int, wis, cha)
        @level = 1
        @exp = 0
        @levelEXP = {_2:300,_3:900,_4:2700,_5:6500,_6:14000,_7:23000,_8:34000,_9:48000,_10:64000,_11:85000,_12:100000,_13:120000,
            _14:140000,_15:165000,_16:195000,_17:225000,_18:265000,_19:305000,_20:355000}
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
        puts self
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

    def removeLevels(num)
        @level -= num
    end

    def nextLvlEXP()
        if @level == 1
            return 0
        elsif @level == 20
            return 355000
        else
            return @levelEXP[:"_#{@level+1}"]
        end
    end

    def prevLvlEXP()
        if @level == 1
            return 0
        elsif @level == 20
            return 355000
        else
            return @levelEXP[:"_#{@level}"]
        end
    end

    def addEXP(num)
        if @level == 20
            msg = "You are already at Max Level! (20)"
            puts msg
        else
            @exp += num
            while @exp >= self.nextLvlEXP()
                self.addLevels(1)
                break if @level == 20
            end
            puts self
        end
    end

    def removeEXP(num)
        if @level ==  1
            msg = "You are already at First Level! (1)"
            puts msg
        else
            @exp -= num
            while @exp < self.prevLvlEXP()
                self.removeLevels(1)
                break if @level == 1
            end
            puts self
        end
    end

    def setEXP(num)
        if num > @exp
            temp = num - @exp
            self.addEXP(temp)
        elsif num < @exp
            temp = @exp - num
            self.removeEXP(temp)
        end
    end

c = Character.new('Randwulf','High Elf','Paladin','Neutral Good',15,12,10,15,12,14)
c.addEXP(5000)
c.addEXP(350000)
c.addEXP(1)
c.removeEXP(305000)
c.removeEXP(50000)
c.removeEXP(1)
c.setEXP(865)
c.setEXP(900)
end