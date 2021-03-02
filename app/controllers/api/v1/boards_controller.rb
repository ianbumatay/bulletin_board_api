class Api::V1::BoardsController <ApplicationController  

    def index 
      boards = Board.all 
      render json: boards
    end 

    def create 
     # binding.pry
      board = Board.new(board_params)

      if board.save
        render json: board 
      else 
        render json: {message: 'Board data not found' }
      end
    end 

    def show 
      board = Board.find(params[:id])
      render json: board
    end 

    def destroy 
      
      board = Board.find(params[:id]) 
      board.destroy
    end 

    private 

    def board_params 
      params.require(:board).permit(:name)
    end

end