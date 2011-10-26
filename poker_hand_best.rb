file = File.new("poker_hands-sorted.txt", "r")
file_content = ""

# Read the file content into a string
while (line = file.gets)
  file_content += line
end

file.close

# From the content string above, only grab the lines that we need to sort
lines = file_content.split("\n")

to_be_sorted_lines = []

lines.each_index do |x|
  to_be_sorted_lines << lines[x] if (x % 3) == 0
end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
suites = ["Clubs", "Diamonds", "Hearts", "Spades"]

all_hands = []

# Construct all the hands
numbers.each do |n|
  suites.each do |s|
    all_hands << "#{n}#{s}"
  end
end

sorted = []

# Sort
to_be_sorted_lines.each do |l|
  hands = l.split(" ")
  sorted << hands.sort{ |x, y| all_hands.index(x) <=> all_hands.index(y) }.join(" ")
end

puts sorted