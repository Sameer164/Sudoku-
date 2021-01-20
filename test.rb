require "byebug"

class Array
    def quick_sort
        return self.dup if self.length == 1

        pivot_el = [self.first]
        left = self.drop(1).select { |ele| ele < self.first}
        right = self.drop(1).select { |ele| ele >= self.first }

        return left.quick_sort + pivot_el + right.quick_sort
    end
end

debugger
print [2, -1, 4, 6, 3].quick_sort