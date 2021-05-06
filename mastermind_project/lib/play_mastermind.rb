require_relative "mastermind"

puts "Enter a size for the game: "
mastermind = Mastermind.new(gets.chomp.to_i)

until (mastermind.ask_user_for_guess) do
  puts "-------------------------"
end

puts "You win!"
