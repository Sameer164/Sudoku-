require_relative "./Tile.rb"
require_relative "./ComputerPlayer.rb"
require "byebug"

class Board
    

    def self.from_file(name)
        file = File.open(name)
        arr = file.read.split("\n")
        new_arr = Array.new(arr.length) {Array.new}
        new_arr.each_with_index do |sub_arr, index|
            a = arr[index].split("")
            a.each do |ele|
                sub_arr << ele
            end
        end
        file.close

        return new_arr


    end

    def initialize(grid)
        @grid = grid
        @tiles = @grid.map do |arr|
            nr = arr.map do |ele|
                temp = ele.to_i
                ele = Tile.new(temp)
            end
            nr
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


    def solved?
        @tiles.all? {|tile_arr| tile_arr.all? {|tile| tile.to_s != 0}}
    end

    def play 
        
        p = ComputerPlayer.new(@tiles)
        p.solve()
        
        
        
        # first = true
        # while !solved?
        #     if first
        #         self.render
        #     end
        #     inp_arr = gets.chomp.split(',')
        #     arr = inp_arr.map {|ele| ele.to_i}
        #     while !is_valid(arr)
        #         puts "Sorry, You can't put that number. Please type another number"
        #         inp_arr = gets.chomp.split(',')
        #         arr = inp_arr.map {|ele| ele.to_i}
        #     end

        #     @tiles[arr[0]][arr[1]].rep(arr[2])
        #     self.render
        #     first = false
 

        # end
    end
    

     
end

b = Board.new(Board.from_file('sudoku1.txt'))
b.play



