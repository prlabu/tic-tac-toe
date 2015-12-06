require 'fileutils'


class Player
	attr_accessor :name

	def initialize (name)
		@name = name
	end

end

def player_exists? (name)
		$player_array.any? { |a_name| a_name == name  }
end

class Game



end




def end_game (usrput)
	usrput == "Quit" ? true : false
end


def get_input
	input  = gets.chomp
	input
end


def isvalid? (entry)
	if entry == "Quit" 
		return true
	elsif entry == "New Game"
		return true
	elsif entry == "Print Players"
		return true
	elsif entry == "New Player"
		return true
	else 
		return false
	end
end

def start_screen_print
	puts "Welcome to Tic Tac Toe!"
	puts "Type one of the following: \n 'New Game' \n 'New Player' \n 'Print Players' \n 'Quit' "
end






$player_array = ["Ray", "Rob", "Rick"]


usrput = ""


until usrput == "Quit"
	

	puts "\n\n"
	start_screen_print
	usrput = get_input
	puts "\n\n"

	until isvalid? (usrput) do
		puts "The entry was not valid "
		start_screen_print
		usrput = get_input
		puts "\n\n"
	end

	case usrput

	when "New Game"
		puts "Let's play a new game! \n"


	when "Print Players"
		puts "Let's print players \n"
		$player_array.each do |name|
			puts name + "\n"
		end

	when "Quit"
		puts "Hasta luego \n \n \n \n"

	when "New Player"
		puts "Let's create a new player \n"
		puts "What would you like the name to be?"
		usrput = get_input

		while player_exists? (usrput)
		  	puts "The name already exists! Try again: "
		  	usrput = get_input
		end  
		
		$player_array << usrput


		puts "The full list of players: "
		$player_array.each do |name|
			puts name + "\n"
		end

		new_file_name =  'playerFile-#{usrput}.txt'
		FileUtils.touch(new_file_name)
		File.open(new_file_name, "w") do |io|  
			io.puts "Name: #{usrput}"
		end




	end
end



















