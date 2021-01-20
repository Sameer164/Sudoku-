class Tile

    attr_accessor :given
    def initialize(val)
        @value = val
        if val == 0
            @given = false
        else
            @given = true
        end
    end

    def to_s
        return @value
    end

    def rep(n)
        if n == 0
            @value = 0
            return
        end
        @value = n
        @given = true
    end

end