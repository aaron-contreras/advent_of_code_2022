class ElfFinder
  def initialize(calorie_list)
    @calorie_list = calorie_list
  end

  def carrying_most_calories
    calorie_list.map(&:chomp)
                .slice_when { |_entry, next_entry| next_entry.empty? }
                .map { |slice| slice.reject(&:empty?) }
                .map { |slice| slice.map(&:to_i) }
                .map(&:sum)
                .max
  end

  private

  attr_reader :calorie_list
end

# DEMO:
# calorie_list = File.open("test_input.txt").readlines
# puts ElfFinder.new(calorie_list).carrying_most_calories
# => 24_000 calories, Fourth Elf

calorie_list = File.open("puzzle_input.txt").readlines
puts ElfFinder.new(calorie_list).carrying_most_calories
