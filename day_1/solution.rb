class ElfFinder
  def initialize(calorie_list)
    @calorie_list = calorie_list
  end

  def with_most_calories_on(ranking = 1)
    calorie_list.map(&:chomp)
                .slice_when { |_entry, next_entry| next_entry.empty? }
                .map { |slice| slice.reject(&:empty?) }
                .map { |slice| slice.map(&:to_i) }
                .map(&:sum)
                .max(ranking)
                .sum
  end

  private

  attr_reader :calorie_list
end

calorie_list = File.open("puzzle_input.txt").readlines

# Part 1 - DEMO:
# calorie_list = File.open("test_input.txt").readlines
# puts ElfFinder.new(calorie_list).with_most_calories_on
# => 24_000 calories, Fourth Elf
puts ElfFinder.new(calorie_list).with_most_calories_on

# Part 2 - DEMO:
# calorie_list = File.open("test_input.txt").readlines
# puts ElfFinder.new(calorie_list).with_most_calories_on(3)
# => 45_000 (24_000 + 11_000 + 10_000)
puts ElfFinder.new(calorie_list).with_most_calories_on(3)
