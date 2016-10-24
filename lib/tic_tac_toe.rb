class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move( location, player)
    @board[location.to_i-1] = player
  end
  def position_taken?( location)
     !(@board[location].nil? || @board[location] == " ")
    end
    def valid_move?(input)
       input.to_i.between?(1,9) && !position_taken?( input.to_i-1)
      end
      def turn
         puts "Please enter 1-9:"
         input = gets.strip
          if !valid_move?( input)
             turn
           else
            move( input, current_player)
            display_board
           end
         end
         def current_player
            turn_count % 2 == 0 ? "X" : "O"
          end
          def turn_count
          else
            @board.count{|token| token == "X" || token == "O"}
           end
           def won?
              WIN_COMBINATIONS.detect do |item| @board[item[0]] == @board[item[1]] && @board[item[1]] == @board[item[2]] && position_taken?( item[0])
           end
          end
          def full?
             @board.all?{|token| token == "X" || token == "O"}
            end
            def draw?
              !won? && full?
             end
             def over?
               won? || draw?
              end
              def winner
                if winning_combo = won?
                   @board[winning_combo.first]
                 end
               end
               def play
                  while !over?
                    turn
                   end
                    if won?
                      puts "Congratulations #{winner}!"
                    else
                         puts "Cats Game!"
                     end
                    end



end
