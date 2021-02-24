class Api::V1::BulletinsController < ApplicationController

     def index 
        bulletins = Bulletin.all 
        render json: bulletins
      end 
  
      def create 
        #binding.pry
        bulletin = board.bulletins.new(bulletin_params)
  
        if bulletin.save
          render json: board
        else 
          render json: {message: 'Bulletin data not found' }
        end
      end 
  
      def show 
        bulletin = Bulletin.find(params[:id])
        render json: bulletin
      end 
  
      def destroy 
        bulletin = Board.find(params[:id]) 
        bulletin.destroy
      end 
  
      private 
  
      def bulletin_params 
        params.require(:bulletin).permit(:title, :content, :board_id)
      end
  

end
