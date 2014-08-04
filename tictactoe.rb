# ken mcfadden / Tealeaf Academy / August 2014
# Course 1
# Assignment : Ruby ticatactoe game.
#--------------------------------



def initialize_grid
  grid = {}
  (1..9).each {|position| grid[position] = ' ' } #init 9 squares
  grid
end

# find an empty square which will be blank.
def find_open_square(grid)
  grid.keys.select {|position| grid[position] == ' '} #  array of keys with blank value returned
end

def player_places_mark(grid)
  begin
    puts "Choose a position (from 1 to 9) to place a mark:"
    position = gets.chomp.to_i

      if grid[position]  != " "  # remind user if square is taken.
       puts "That square is taken...try another."
       next
      end

  end until find_open_square(grid).include?(position) # becomes true when open_square returns a blank square.
  grid[position] = 'X' 

end

def computer_places_mark(grid)
  position = find_open_square(grid).sample #pick one of the available.
  grid[position] = 'O'
end

def check_winner(grid)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if grid.values_at(*line).count('X') == 3
    return "Computer" if grid.values_at(*line).count('O') == 3
  end
  nil
end

def grid_full?(grid)
  find_open_square(grid) == []  
end

def display_winner(winner)
  puts "#{winner} won!"
end

def draw_grid(grid)
  system 'clear'
  puts
  puts "     |     |"
  puts "  #{grid[1]}  |  #{grid[2]}  |  #{grid[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{grid[4]}  |  #{grid[5]}  |  #{grid[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{grid[7]}  |  #{grid[8]}  |  #{grid[9]}"
  puts "     |     |"
  puts
end

# Main logic:
grid = initialize_grid
draw_grid(grid)

begin
  player_places_mark(grid)
  draw_grid(grid)
  computer_places_mark(grid)
  draw_grid(grid)
  winner = check_winner(grid)
end until winner || grid_full?(grid) #we play till we have a winner or grid full.

if winner
  display_winner(winner)
else
  puts "It's a draw."
end