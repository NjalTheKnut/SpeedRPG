class Character
    def initialize(name, race, str, dex, con, int, wis, cha)
        @name = name
        @race = race
        @str = str
        @dex = dex
        @con = con
        @int = int
        @wis = wis
        @cha = cha
    end

    def to_s
        "#{@name}
        \n#{@race}
        \n#{@str}
        \n#{@dex}
        \n#{@con}
        \n#{@int}
        \n#{@wis}
        \n#{@cha}"
    end
end

c = Character.new('Randwulf','High Elf',15,12,10,15,12,14)
puts c