class ComputerPlayer
    def initialize(tiles)
        @tiles = tiles
    end

    def is_valid(arr)
        x, y, n = arr

        if n == 0
            return false
        end

        
        if @tiles[x][y].to_s == 0
            i = 0
            while i < @tiles[0].length
                if @tiles[x][i].to_s == n
                    return false
                end
                i += 1
            end
            j = 0
            while j < @tiles.length
                if @tiles[j][y].to_s == n 
                    return false
                end
                j += 1
            end
            x0 = (x / 3) * 3
            y0 = (y / 3) * 3
            (0..2).each do |num1|
                (0..2).each do |num2|
                    if @tiles[x0 + num1][y0 + num2].to_s == n 
                        return false
                    end
                end
            end
            return true 


        else
            return false
        end
        
    end

    def render
        puts 
        puts
        @tiles.each do |arr|
            nr = arr.map do |tile|
                if tile.given
                    tile.to_s
                else
                    "*"
                end
            end
            puts nr.join("   ")

        end
        puts
    end

    def solve 
        (0...@tiles.length).each do |num1|
            (0...@tiles[0].length).each do |num2|
                if @tiles[num1][num2].to_s == 0
                    (1..9).each do |n|
                        if is_valid([num1, num2, n])
                            @tiles[num1][num2].rep(n)
                            solve()
                            @tiles[num1][num2].rep(0)
                        end
                    end
                    return
                end
            end
        end

        
        render()
        return
        
    end

end