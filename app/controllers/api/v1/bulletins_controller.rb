class Api::V1::BulletinsController < ApplicationController

     before_action :set_board

     def index 
        bulletins = Bulletin.all 
        render json: bulletins
      end 
  
      def create 
        #binding.pry
        @bulletin = @board.bulletins.new(bulletin_params)
  
        if @bulletin.save
          render json: @board
        else 
          render json: {message: 'Bulletin data not found' }
        end
      end 
  
      # def show 
      #   bulletin = Bulletin.find(params[:id])
      #   render json: bulletin
      # end 
  
      def destroy 
        #binding.pry
        @bulletin = Bulletin.find(params[:id]) 
        @board = Board.find(@bulletin.board_id)
        @bulletin.destroy
        render json: @board
      end 
  
      private 

      def set_board 
        @board = Board.find(params[:board_id]) 
      end
  
      def bulletin_params 
        params.require(:bulletin).permit(:title, :content, :board_id)
      end
  

end
